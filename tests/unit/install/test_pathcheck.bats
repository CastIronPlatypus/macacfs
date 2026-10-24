#!/usr/bin/env bats
# lib/pathcheck.sh: the CLI on PATH must be the copy macacfs installed.
setup() {
  ROOT="$(cd "$BATS_TEST_DIRNAME/../../.." && pwd)"
  T="$(mktemp -d)"
  mkdir -p "$T/home/.local/bin" "$T/brew/bin" "$T/other" "$T/front"
  export HOME="$T/home" MACACFS_SHADOW_DIR="$T/shadow"
  export MACACFS_HOME="$ROOT" MACACFS_MANIFEST="$ROOT/share/manifest.tsv"
  # shellcheck source=/dev/null
  . "$ROOT/lib/catalog.sh"; . "$ROOT/lib/pathcheck.sh"
  brew() { [ "$1" = --prefix ] && echo "$T/brew"; }
  export PATH="$T/home/.local/bin:$T/brew/bin:$T/other:/usr/bin:/bin"
}
teardown() { rm -rf "$T"; }

mk() { printf '#!/bin/sh\necho "%s"\n' "$2" > "$1"; chmod +x "$1"; }
row() { printf '%s\t%s\t%s\t%s\t%s\t-' "$1" x "$2" "$3" "$4"; }

@test "stale copy of the same tool in a user dir is moved aside, not deleted" {
  mk "$T/home/.local/bin/foo" "foo 0.1.0"; mk "$T/brew/bin/foo" "foo 0.9.0"
  RUN_NOTE=""; path_audit_row "$(row FOO foo brew x/foo)"
  [ "$(command -v foo)" = "$T/brew/bin/foo" ]
  [ ! -e "$T/home/.local/bin/foo" ]
  ls "$MACACFS_SHADOW_DIR"/foo.* >/dev/null
  [[ "$RUN_NOTE" == *"moved stale $T/home/.local/bin/foo"* ]]
}

@test "a different program ahead on PATH fails the tool and is left alone" {
  mk "$T/front/foo" "other 1"; mk "$T/brew/bin/foo" "foo 0.9.0"
  PATH="$T/front:$PATH"
  RUN_NOTE=""; run path_audit_row "$(row FOO foo brew x/foo)"
  [ "$status" -eq 1 ]; [[ "$output" == *'"foo" runs'*"not the copy FOO installed"* ]]
  [ -e "$T/front/foo" ]
}

@test "a same-name program later on PATH is only noted" {
  SIG_MARKER="$(mktemp)"; sleep 1
  mk "$T/home/.local/bin/bar" "bar 2.0"; mk "$T/other/bar" "tclsh bar"
  RUN_NOTE=""; path_audit_row "$(row BAR bar installer-sh install.sh)"
  [[ "$RUN_NOTE" == "also on PATH (later): $T/other/bar" ]]
  rm -f "$SIG_MARKER"
}

@test "a|b cli names: the first one on PATH wins, else the first listed" {
  mk "$T/other/bar" "bar 1"
  [ "$(row_cli_resolved "$(row ZZ 'nope|bar' installer-sh install.sh)")" = bar ]
  [ "$(row_cli_resolved "$(row ZZ 'nope|gone' installer-sh install.sh)")" = nope ]
}

@test "CLI missing from PATH after install fails the tool" {
  run path_audit_row "$(row FOO foo brew x/foo)"
  [ "$status" -eq 1 ]; [[ "$output" == *'"foo" is not on PATH'* ]]
}

@test "manifest: PI is checked as pi-rust|pi and keeps an existing pi" {
  r="$(catalog_row PI)"
  [ "$(row_cli "$r")" = "pi-rust|pi" ]
  [[ "$(row_args "$r")" == *"--keep-existing-pi"* ]]
}
