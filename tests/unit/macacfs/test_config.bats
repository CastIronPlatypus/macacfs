#!/usr/bin/env bats
# lib/config.sh and the `macacfs config` verb.
load helper
setup() { common_setup; MAC="$REPO_ROOT/bin/macacfs"; }
teardown() { common_teardown; }

@test "list shows every key with its default" {
  run "$BASH4" "$MAC" config list
  [ "$status" -eq 0 ]
  [[ "$output" == *"newproj.github"*"off"*"default"* ]]
  [[ "$output" == *"newproj.ru"* ]]
  [[ "$output" == *"newproj.projects_dir"* ]]
}

@test "set/get/unset round-trip into the XDG file (mode 600)" {
  run "$BASH4" "$MAC" config set newproj.github private; [ "$status" -eq 0 ]
  run "$BASH4" "$MAC" config get newproj.github; [ "$output" = private ]
  grep -qx 'newproj.github=private' "$XDG_CONFIG_HOME/macacfs/config"
  [ "$(stat -f %Lp "$XDG_CONFIG_HOME/macacfs/config")" = 600 ]
  run "$BASH4" "$MAC" config set newproj.github public
  [ "$(grep -c '^newproj.github=' "$XDG_CONFIG_HOME/macacfs/config")" -eq 1 ]
  run "$BASH4" "$MAC" config unset newproj.github; [ "$status" -eq 0 ]
  run "$BASH4" "$MAC" config get newproj.github; [ "$output" = off ]
}

@test "values are validated" {
  run "$BASH4" "$MAC" config set newproj.github yes;  [ "$status" -ne 0 ]; [[ "$output" == *"off, private or public"* ]]
  run "$BASH4" "$MAC" config set newproj.ru maybe;    [ "$status" -ne 0 ]
  run "$BASH4" "$MAC" config set newproj.projects_dir relative/dir; [ "$status" -ne 0 ]
  run "$BASH4" "$MAC" config set newproj.projects_dir /abs/dir; [ "$status" -eq 0 ]
  [ ! -e "$XDG_CONFIG_HOME/macacfs/config.bad" ]
}

@test "unknown keys and subcommands are refused" {
  run "$BASH4" "$MAC" config set nope.key 1; [ "$status" -ne 0 ]; [[ "$output" == *"unknown key"* ]]
  run "$BASH4" "$MAC" config get nope.key;   [ "$status" -ne 0 ]
  run "$BASH4" "$MAC" config frobnicate;     [ "$status" -eq 2 ]
}

@test "env overrides the file" {
  "$BASH4" "$MAC" config set newproj.ru on
  MACACFS_NEWPROJ_RU=off run "$BASH4" "$MAC" config get newproj.ru
  [ "$output" = off ]
  MACACFS_NEWPROJ_RU=off run "$BASH4" "$MAC" config list
  [[ "$output" == *"env MACACFS_NEWPROJ_RU"* ]]
}

@test "config.sh works under /bin/bash 3.2" {
  run /bin/bash -c ". '$REPO_ROOT/lib/config.sh'; config_set newproj.ru on && config_effective newproj.ru"
  [ "$status" -eq 0 ]; [ "$output" = on ]
}
