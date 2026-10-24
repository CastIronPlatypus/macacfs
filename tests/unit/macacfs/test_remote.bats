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

@test "gh create fails: nothing is created, no clone, no ru, no retry" {
  FAKE_GH=createfail run np demo "$P" --no-br --github --ru
  [ "$status" -eq 1 ]
  [[ "$output" == *"gh repo create fakeuser/demo failed — nothing was created"* ]]
  [ ! -e "$P" ]
  [ "$(grep -c 'repo create' "$T/gh.log")" -eq 1 ]
  ! grep -qE '^ru (add|sync)' "$T/ru.log" 2>/dev/null
}

@test "ru add fails: GitHub repo exists, nothing local, ru command printed" {
  FAKE_RU=addfail run np demo "$P" --no-br --github --ru
  [ "$status" -eq 1 ]
  [[ "$output" == *"ru add fakeuser/demo failed"* ]]
  [[ "$output" == *"ru add fakeuser/demo --private; ru sync fakeuser/demo"* ]]
  [ -d "$T/remotes/fakeuser/demo.git" ]; [ ! -e "$P" ]
}

@test "ru sync fails: repo exists and is registered, ru sync printed" {
  FAKE_RU=syncfail run np demo "$P" --no-br --github --ru
  [ "$status" -eq 1 ]; [[ "$output" == *"Finish by hand: ru sync fakeuser/demo"* ]]
  [ ! -e "$P" ]
}

@test "success: gh create (empty) -> ru add + ru sync -> scaffold in the clone -> commit + push" {
  run np demo --no-br --github --ru
  [ "$status" -eq 0 ]
  # order: the repo is created and cloned before any project file exists
  grep -qx 'gh repo create fakeuser/demo --private' "$T/gh.log"
  ! grep -q -- '--source=.' "$T/gh.log"
  [ "$(sed -n 1p "$T/ru.log" | cut -d' ' -f1-3)" != "ru add --from-cwd" ]
  grep -qx 'ru add fakeuser/demo --non-interactive --private' "$T/ru.log"
  grep -qx 'ru sync fakeuser/demo --clone-only --non-interactive' "$T/ru.log"
  [ "$(grep -n '^ru add' "$T/ru.log" | cut -d: -f1)" -lt "$(grep -n '^ru sync' "$T/ru.log" | cut -d: -f1)" ]
  # the project is the clone, at ru's path, and its first commit is on GitHub's main
  [ "$(git -C "$P" remote get-url origin)" = "$T/remotes/fakeuser/demo.git" ]
  [ -f "$P/AGENTS.md" ]; [ -f "$P/README.md" ]
  [ "$(git -C "$T/remotes/fakeuser/demo.git" log --format=%s main)" = "Initial commit" ]
  [ "$(grep -c '^fakeuser/demo$' "$T/ru.repos")" -eq 1 ]
  [[ "$output" == *"https://github.com/fakeuser/demo"* ]]
}

@test "owner-repo layout: ru clones into base/OWNER/NAME and newproj sets it up there" {
  FAKE_RU_LAYOUT=owner-repo run np demo --no-br --github --ru
  [ "$status" -eq 0 ]
  [ -f "$T/projects/fakeuser/demo/AGENTS.md" ]; [ ! -e "$T/projects/demo" ]
  [ "$(git -C "$T/remotes/fakeuser/demo.git" log --format=%s main)" = "Initial commit" ]
}

@test "--ru with a directory that is not ru's path is refused before anything is created" {
  run np demo "$T/elsewhere/demo" --no-br --github --ru
  [ "$status" -eq 1 ]; [[ "$output" == *"ru clones the repo into its own layout path"* ]]
  [ ! -s "$T/gh.log" ] || ! grep -q 'repo create' "$T/gh.log"
  [ ! -e "$T/elsewhere" ]
}

@test "--github without --ru: gh repo clone into the directory, then scaffold and push" {
  run np demo "$T/elsewhere/demo" --no-br --github
  [ "$status" -eq 0 ]
  grep -qx "gh repo clone fakeuser/demo $T/elsewhere/demo -- -q" "$T/gh.log"
  [ -f "$T/elsewhere/demo/AGENTS.md" ]
  [ "$(git -C "$T/remotes/fakeuser/demo.git" log --format=%s main)" = "Initial commit" ]
  [ ! -s "$T/ru.repos" ]
}

@test "--github into an existing directory is refused before the repo is created" {
  mkdir -p "$P"
  run np demo "$P" --no-br --github
  [ "$status" -eq 1 ]; [[ "$output" == *"already exists"* ]]
  ! grep -q 'repo create' "$T/gh.log" 2>/dev/null
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

@test "reviewed --plan records the remote-first commands and effects" {
  run np --plan demo "$P" --preset first-project --github --ru
  [ "$status" -eq 0 ]
  echo "$output" | python3 -c '
import json,sys; p=json.load(sys.stdin)
ids=[c["id"] for c in p["commands"]]
assert ids[:3]==["gh-create","ru-add","ru-sync"], ids
assert ids[-3:]==["git-add","git-commit","git-push"], ids
assert "git-init" not in ids, ids
assert [c["argv"] for c in p["commands"]][0]==["gh","repo","create","fakeuser/demo","--private"]
assert p["effects"]["network"] and p["effects"]["commit"] and p["effects"]["push"]
c=[c for c in p["commands"] if c["id"]=="git-commit"][0]["argv"]
assert "user.name=Test User" in c and "user.email=test@example.com" in c
assert p["remote"]=={"github":"private","owner":"fakeuser","ru":True,"identity":{"name":"Test User","email":"test@example.com"}}'
}

@test "reviewed --plan: --ru without --github is refused" {
  run np --plan demo "$P" --preset first-project --ru
  [ "$status" -ne 0 ]; [[ "$output" == *"--ru needs a GitHub remote"* ]]
}

@test "reviewed --apply: create, ru clone, files in the clone, push; --resume is idempotent" {
  np --plan demo "$P" --preset first-project --github --ru > "$T/plan.json"
  run np --apply "$T/plan.json" --yes
  [ "$status" -eq 0 ]
  grep -qx 'gh repo create fakeuser/demo --private' "$T/gh.log"
  grep -qx 'ru sync fakeuser/demo --clone-only --non-interactive' "$T/ru.log"
  [ "$(git -C "$P" remote get-url origin)" = "$T/remotes/fakeuser/demo.git" ]
  [ -f "$P/AGENTS.md" ]
  [ "$(git -C "$T/remotes/fakeuser/demo.git" log --format=%s main)" = "Initial commit" ]
  run np --apply "$T/plan.json" --yes --resume
  [ "$status" -eq 0 ]
  [ "$(grep -c 'repo create' "$T/gh.log")" -eq 1 ]
}

@test "reviewed --plan: --ru with a directory that is not ru's path is refused" {
  mkdir -p "$T/elsewhere"
  run np --plan demo "$T/elsewhere/demo" --preset first-project --github --ru
  [ "$status" -ne 0 ]; [[ "$output" == *"ru clones the repo into its own layout path"* ]]
}

@test "reviewed --apply: name taken at apply time writes nothing" {
  np --plan demo "$P" --preset first-project --github > "$T/plan.json"
  FAKE_GH=taken run np --apply "$T/plan.json" --yes
  [ "$status" -ne 0 ]; [[ "$output" == *"already exists"* ]]
  [ ! -e "$P" ]
}
