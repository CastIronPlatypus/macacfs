#!/usr/bin/env bats
# The BASH_VERSINFO guard: newproj refuses macOS /bin/bash 3.2 cleanly.
load helper
setup() { common_setup; }
teardown() { common_teardown; }

@test "newproj.sh under /bin/bash 3.2 exits 1 with a clear message" {
  [ "$(/bin/bash -c 'echo ${BASH_VERSINFO[0]}')" -lt 4 ] || skip "/bin/bash is not 3.x"
  run /bin/bash "$NEWPROJ" demo "$T/demo"
  [ "$status" -eq 1 ]
  [[ "$output" == *"needs bash >= 4.3"* ]]
  [ ! -e "$T/demo" ]
}

@test "newproj.sh under Homebrew bash runs" {
  run "$BASH4" "$NEWPROJ" --help
  [ "$status" -eq 0 ]; [[ "$output" == *"macacfs newproj"* ]]
}

@test "macacfs newproj run by /bin/bash hands that bash to newproj, whose guard fires" {
  run /bin/bash "$REPO_ROOT/bin/macacfs" newproj demo "$T/demo"
  [ "$status" -eq 1 ]; [[ "$output" == *"needs bash >= 4.3"* ]]
  [ ! -e "$T/demo" ]
}
