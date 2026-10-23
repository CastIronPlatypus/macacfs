#!/usr/bin/env bats
# req-newproj-follows-ru-layout: the default directory follows ru's LAYOUT.
load helper
setup() { common_setup; B="$T/projects"; export FAKE_RU_DIR="$B"; }
teardown() { common_teardown; }

resolve() { "$BASH4" -c "source '$REPO_ROOT/lib/newproj/newproj_remote.sh'; NEWPROJ_GITHUB_OWNER=${2:-}; newproj_default_project_dir '$1'"; }
plan_dir() { np --plan "$1" --preset first-project "${@:2}" | python3 -c 'import json,sys; print(json.load(sys.stdin)["project"]["directory"])'; }

@test "flat: classic, resolver and --plan agree on base/NAME" {
  export FAKE_RU_LAYOUT=flat
  [ "$(resolve demo)" = "$B/demo" ]
  [ "$(plan_dir demo)" = "$B/demo" ]
  run np demo --no-br; [ "$status" -eq 0 ]; [ -d "$B/demo/.git" ]
}

@test "owner-repo: base/OWNER/NAME everywhere (owner from gh login)" {
  export FAKE_RU_LAYOUT=owner-repo
  [ "$(resolve demo)" = "$B/fakeuser/demo" ]
  run np --plan demo --preset first-project   # planning writes nothing, so a missing owner folder is reported
  [ "$status" -ne 0 ]; [[ "$output" == *"parent directory does not exist"* ]]
  mkdir -p "$B/fakeuser"
  [ "$(plan_dir demo)" = "$B/fakeuser/demo" ]
}

@test "owner-repo: classic creates the owner folder" {
  export FAKE_RU_LAYOUT=owner-repo
  run np demo --no-br; [ "$status" -eq 0 ]; [ -d "$B/fakeuser/demo/.git" ]
}

@test "full: base/github.com/OWNER/NAME, --github-owner respected" {
  export FAKE_RU_LAYOUT=full
  [ "$(resolve demo myorg)" = "$B/github.com/myorg/demo" ]
  mkdir -p "$B/github.com/myorg"
  [ "$(plan_dir demo --github-owner myorg --github)" = "$B/github.com/myorg/demo" ]
  run np demo --no-br --github-owner myorg; [ "$status" -eq 0 ]; [ -d "$B/github.com/myorg/demo/.git" ]
}

@test "wizard default directory uses the same resolver" {
  export FAKE_RU_LAYOUT=owner-repo
  run "$BASH4" -c "source '$REPO_ROOT/lib/newproj/newproj_remote.sh'; source '$REPO_ROOT/lib/newproj/newproj_tui.sh' >/dev/null 2>&1; source '$REPO_ROOT/lib/newproj/newproj_screens/screen_directory.sh'; state_set project_name demo >/dev/null 2>&1; get_default_directory"
  [ "$output" = "$B/fakeuser/demo" ]
}

@test "ru absent: base/NAME from the fallback chain" {
  rm "$FAKEBIN/ru"
  MACACFS_PROJECTS_DIR="$T/mp" run resolve demo; [ "$output" = "$T/mp/demo" ]
  ACFS_PROJECTS_DIR="$T/ap" run resolve demo; [ "$output" = "$T/ap/demo" ]
  "$BASH4" "$REPO_ROOT/bin/macacfs" config set newproj.projects_dir "$T/cfg"
  run resolve demo; [ "$output" = "$T/cfg/demo" ]
}

@test "ru absent, nothing set: /data/projects if present else ~/Projects" {
  rm "$FAKEBIN/ru"
  run resolve demo
  if [ -d /data/projects ]; then [ "$output" = /data/projects/demo ]; else [ "$output" = "$HOME/Projects/demo" ]; fi
}

@test "env base override keeps ru's layout nesting" {
  export FAKE_RU_LAYOUT=owner-repo
  MACACFS_PROJECTS_DIR="$T/mp" run resolve demo; [ "$output" = "$T/mp/fakeuser/demo" ]
}

@test "unknown owner falls back to base/NAME" {
  export FAKE_RU_LAYOUT=owner-repo
  rm "$FAKEBIN/gh"
  [ "$(resolve demo)" = "$B/demo" ]
}

@test "an explicit directory always wins" {
  export FAKE_RU_LAYOUT=full
  run np demo "$T/explicit" --no-br; [ "$status" -eq 0 ]; [ -d "$T/explicit/.git" ]
  [ "$(plan_dir demo2 "$T/explicit2")" = "$T/explicit2" ]
}

@test "bash hands the resolved value to Python via NEWPROJ_DEFAULT_PROJECTS_DIR" {
  export FAKE_RU_LAYOUT=flat
  MACACFS_PROJECTS_DIR="$T/mp" ; mkdir -p "$T/mp"
  run env MACACFS_PROJECTS_DIR="$T/mp" bash -c 'true'
  [ "$(MACACFS_PROJECTS_DIR="$T/mp" plan_dir demo)" = "$T/mp/demo" ]
}
