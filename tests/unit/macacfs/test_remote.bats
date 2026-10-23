#!/usr/bin/env bats
# GitHub/ru integration with fake gh and ru on PATH.
load helper
setup() { common_setup; P="$T/projects/demo"; }
teardown() { common_teardown; }

nothing_created() { [ ! -e "$P" ] && ! grep -q 'repo create' "$T/gh.log" 2>/dev/null; }

@test "gh missing: preflight fails, nothing created" {
  rm "$FAKEBIN/gh"
  run np demo "$P" --no-br --github
  [ "$status" -eq 1 ]; [[ "$output" == *"gh (GitHub CLI) is not installed"* ]]
  nothing_created
}

@test "gh unauthenticated: preflight fails, nothing created" {
  FAKE_GH=unauth run np demo "$P" --no-br --github
  [ "$status" -eq 1 ]; [[ "$output" == *"not authenticated"*"gh auth login"* ]]
  nothing_created
}

@test "name taken: preflight fails, nothing created" {
  FAKE_GH=taken run np demo "$P" --no-br --github
  [ "$status" -eq 1 ]; [[ "$output" == *"fakeuser/demo already exists"* ]]
  nothing_created
}

@test "ru missing with --ru: preflight fails, nothing created" {
  rm "$FAKEBIN/ru"
  run np demo "$P" --no-br --github --ru
  [ "$status" -eq 1 ]; [[ "$output" == *"ru is not installed"* ]]
  nothing_created
}

@test "--ru without --github: preflight fails, nothing created" {
  run np demo "$P" --no-br --ru
  [ "$status" -eq 1 ]; [[ "$output" == *"--ru needs a GitHub remote"* ]]
  [ ! -e "$P" ]
}

@test "no git identity: preflight fails, nothing created" {
  : > "$GIT_CONFIG_GLOBAL"
  run np demo "$P" --no-br --github
  [ "$status" -eq 1 ]; [[ "$output" == *"user.name/user.email"* ]]
  nothing_created
}

@test "gh create fails: local project kept, manual command printed, no retry" {
  FAKE_GH=createfail run np demo "$P" --no-br --github --ru
  [ "$status" -eq 1 ]
  [[ "$output" == *"local project is intact"* ]]
  [[ "$output" == *"gh repo create fakeuser/demo --private --source=. --remote=origin --push"* ]]
  [ -d "$P/.git" ]; git -C "$P" rev-parse -q --verify HEAD
  [ "$(grep -c 'repo create' "$T/gh.log")" -eq 1 ]
  ! grep -q '^ru add' "$T/ru.log" 2>/dev/null
}

@test "ru add fails: repo and project kept, ru command printed" {
  FAKE_RU=addfail run np demo "$P" --no-br --github --ru
  [ "$status" -eq 1 ]
  [[ "$output" == *"ru registration failed"* ]]
  [[ "$output" == *"ru add --from-cwd --private"* ]]
  [ -d "$T/remote.git" ]; [ -d "$P/.git" ]
}

@test "success: commit, gh create (private), ru add --private, verified by ru list" {
  run np demo "$P" --no-br --github --ru
  [ "$status" -eq 0 ]
  grep -q 'gh repo create fakeuser/demo --private --source=. --remote=origin --push' "$T/gh.log"
  grep -q 'ru add --from-cwd --non-interactive --private' "$T/ru.log"
  grep -q 'ru list' "$T/ru.log"
  [ "$(git -C "$P" log --format=%s)" = "Initial commit" ]
  [[ "$output" == *"https://github.com/fakeuser/demo"* ]]
}

@test "--github=public and --github-owner ORG" {
  run np demo "$P" --no-br --github=public --github-owner myorg
  [ "$status" -eq 0 ]
  grep -q 'gh repo create myorg/demo --public' "$T/gh.log"
}

@test "precedence: config turns GitHub on" {
  "$BASH4" "$REPO_ROOT/bin/macacfs" config set newproj.github private
  run np demo "$P" --no-br
  [ "$status" -eq 0 ]; grep -q 'repo create fakeuser/demo --private' "$T/gh.log"
}

@test "precedence: env beats config" {
  "$BASH4" "$REPO_ROOT/bin/macacfs" config set newproj.github private
  MACACFS_NEWPROJ_GITHUB=off run np demo "$P" --no-br
  [ "$status" -eq 0 ]; ! grep -q 'repo create' "$T/gh.log" 2>/dev/null
}

@test "precedence: flag beats env and config" {
  "$BASH4" "$REPO_ROOT/bin/macacfs" config set newproj.github private
  MACACFS_NEWPROJ_GITHUB=private run np demo "$P" --no-br --no-github
  [ "$status" -eq 0 ]; ! grep -q 'repo create' "$T/gh.log" 2>/dev/null
  rm -rf "$P"
  MACACFS_NEWPROJ_GITHUB=off run np demo "$P" --no-br --github=public
  grep -q 'repo create fakeuser/demo --public' "$T/gh.log"
}

@test "default off: no gh calls at all" {
  run np demo "$P" --no-br
  [ "$status" -eq 0 ]; [ ! -s "$T/gh.log" ]
}

@test "bad --github value is refused" {
  run np demo "$P" --github=internal
  [ "$status" -eq 1 ]; [ ! -e "$P" ]
}

@test "reviewed --plan records remote effects and commands" {
  run np --plan demo "$P" --preset first-project --github --ru
  [ "$status" -eq 0 ]
  echo "$output" | python3 -c '
import json,sys; p=json.load(sys.stdin)
ids=[c["id"] for c in p["commands"]]
assert {"git-commit","gh-create","ru-add"} <= set(ids), ids
assert p["effects"]["network"] and p["effects"]["commit"] and p["effects"]["push"]
c=[c for c in p["commands"] if c["id"]=="git-commit"][0]["argv"]
assert "user.name=Test User" in c and "user.email=test@example.com" in c
assert p["remote"]=={"github":"private","owner":"fakeuser","ru":True,"identity":{"name":"Test User","email":"test@example.com"}}'
}

@test "reviewed --plan: --ru without --github is refused" {
  run np --plan demo "$P" --preset first-project --ru
  [ "$status" -ne 0 ]; [[ "$output" == *"--ru needs a GitHub remote"* ]]
}

@test "reviewed --apply runs commit, gh create and ru add, and --resume is idempotent" {
  np --plan demo "$P" --preset first-project --github --ru > "$T/plan.json"
  run np --apply "$T/plan.json" --yes
  [ "$status" -eq 0 ]
  grep -q 'repo create fakeuser/demo --private' "$T/gh.log"
  grep -q '^ru add --from-cwd' "$T/ru.log"
  run np --apply "$T/plan.json" --yes --resume
  [ "$status" -eq 0 ]
  [ "$(grep -c 'repo create' "$T/gh.log")" -eq 1 ]
}

@test "reviewed --apply: name taken at apply time writes nothing" {
  np --plan demo "$P" --preset first-project --github > "$T/plan.json"
  FAKE_GH=taken run np --apply "$T/plan.json" --yes
  [ "$status" -ne 0 ]; [[ "$output" == *"already exists"* ]]
  [ ! -e "$P" ]
}
