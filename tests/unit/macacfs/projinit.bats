#!/usr/bin/env bats
# lib/projinit.sh, 'macacfs projinit', and newproj --tools threading.
# Fake br/ee/cm/ntm/slb/ms on a shadow PATH create each tool's marker and log
# their argv, so no real tool or real agent settings are touched.
load helper

mk_tool_fakes() {
  local t
  for t in br ee cm ntm slb ms; do
    cat > "$FAKEBIN/$t" <<'FAKE'
#!/bin/bash
t="$(basename "$0")"
echo "$t $*" >> "$T/tools.log"
[ "${FAKE_FAIL:-}" = "$t" ] && { echo "$t: boom" >&2; exit 1; }
case "$t $1" in
  "br init")  mkdir -p .beads ;;
  "ee init")  mkdir -p .ee && : > .ee/ee.db ;;
  "cm init")  mkdir -p .cass ;;
  "ntm init") mkdir -p .ntm ;;
  "slb init") mkdir -p .slb ;;
  "ms init")  mkdir -p .ms ;;
esac
exit 0
FAKE
    chmod +x "$FAKEBIN/$t"
  done
}

setup() {
  common_setup; mk_tool_fakes
  MAC="$REPO_ROOT/bin/macacfs"
  P="$T/proj"; mkdir -p "$P"
}
teardown() { common_teardown; }

pi() { "$BASH4" "$MAC" projinit "$@"; }

@test "status reports initialized / missing / unavailable" {
  mkdir -p "$P/.beads"; rm "$FAKEBIN/ms"
  run pi "$P" --status; [ "$status" -eq 0 ]
  [[ "$output" == *"br   initialized"* ]]
  [[ "$output" == *"ee   missing"* ]]
  [[ "$output" == *"ms   unavailable"* ]]
}

@test "status --json lists every registry tool" {
  run pi "$P" --status --json; [ "$status" -eq 0 ]
  printf '%s' "$output" | python3 -c 'import json,sys; d=json.load(sys.stdin); assert [t["id"] for t in d["tools"]]==["br","ee","cm","ntm","slb","ms","ubs"], d; assert all(t["state"] in ("initialized","missing","unavailable") for t in d["tools"])'
}

@test "initializes only missing desired tools, second run is a no-op" {
  mkdir -p "$P/.beads"
  run pi "$P" --tools br,ee,cm,ubs; [ "$status" -eq 0 ]
  [ -f "$P/.ee/ee.db" ]; [ -d "$P/.cass" ]; [ -f "$P/.ubsignore" ]
  ! grep -q '^br init' "$T/tools.log"
  grep -q '^ee hook claude-code --install' "$T/tools.log"
  : > "$T/tools.log"
  run pi "$P" --tools br,ee,cm,ubs; [ "$status" -eq 0 ]
  [[ "$output" == *"ee   already initialized"* ]]
  [ ! -s "$T/tools.log" ]
}

@test "unavailable tool is skipped, a failed init fails" {
  rm "$FAKEBIN/ntm"
  run pi "$P" --tools ntm,cm; [ "$status" -eq 0 ]; [[ "$output" == *"ntm  skipped"* ]]
  FAKE_FAIL=ms run pi "$P" --tools ms; [ "$status" -eq 1 ]
}

@test "--json results and --dry-run changes nothing" {
  run pi "$P" --tools ee --dry-run; [ "$status" -eq 0 ]; [[ "$output" == *"ee: ee init --workspace"* ]]
  [ ! -e "$P/.ee" ]
  run pi "$P" --tools cm --json; [ "$status" -eq 0 ]
  printf '%s' "$output" | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d["ok"] and d["results"]==[{"id":"cm","result":"initialized"}], d'
}

@test "git repo: local tool state is added to .gitignore once" {
  git -C "$P" init -q
  run pi "$P" --tools ee,slb,ms; [ "$status" -eq 0 ]
  run pi "$P" --tools ee,slb,ms --dry-run
  [ "$(grep -cxF '.ee/' "$P/.gitignore")" -eq 1 ]; grep -qxF '.slb/' "$P/.gitignore"; grep -qxF '.ms/' "$P/.gitignore"
}

@test "unknown tool ids are rejected" {
  run pi "$P" --tools ee,bogus; [ "$status" -eq 2 ]; [[ "$output" == *"unknown project tool"* ]]
  run "$BASH4" "$MAC" config set newproj.tools ee,bogus; [ "$status" -ne 0 ]
}

@test "--save-defaults writes newproj.tools; default drives the next run" {
  run pi "$P" --tools cm,ms --save-defaults; [ "$status" -eq 0 ]
  grep -qx 'newproj.tools=cm,ms' "$XDG_CONFIG_HOME/macacfs/config"
  unset MACACFS_NEWPROJ_TOOLS
  P2="$T/p2"; mkdir -p "$P2"
  run pi "$P2"; [ "$status" -eq 0 ]; [ -d "$P2/.cass" ]; [ -d "$P2/.ms" ]; [ ! -e "$P2/.ee" ]
}

@test "newproj --tools initializes exactly the chosen set" {
  run np demo "$T/demo" --tools ee,cm; [ "$status" -eq 0 ]
  [ -f "$T/demo/.ee/ee.db" ]; [ -d "$T/demo/.cass" ]; [ ! -e "$T/demo/.beads" ]; [ ! -e "$T/demo/.ubsignore" ]
  git -C "$T/demo" ls-files | grep -q '^.cass' || true
  ! git -C "$T/demo" ls-files | grep -q '^.ee/'
}

@test "newproj --no-tools initializes nothing; --no-br drops br" {
  run np demo "$T/d1" --no-tools; [ "$status" -eq 0 ]; [ ! -e "$T/d1/.beads" ]; [ ! -e "$T/d1/.ubsignore" ]
  run np demo "$T/d2" --tools br,cm --no-br; [ "$status" -eq 0 ]; [ ! -e "$T/d2/.beads" ]; [ -d "$T/d2/.cass" ]
}

@test "newproj --save-defaults stores the set" {
  run np demo "$T/d3" --tools ntm --save-defaults; [ "$status" -eq 0 ]
  grep -qx 'newproj.tools=ntm' "$XDG_CONFIG_HOME/macacfs/config"
}

@test "reviewed plan carries a tools-init command" {
  run "$BASH4" "$NEWPROJ" --plan demo "$T/rp" --preset first-project --tools ee,cm
  [ "$status" -eq 0 ]
  printf '%s' "$output" | python3 -c 'import json,sys; p=json.load(sys.stdin); c=[c for c in p["commands"] if c["id"]=="tools-init"][0]; assert c["argv"][1:]==["projinit",p["project"]["directory"],"--tools","ee,cm"], c; assert p["effects"]["global_settings"] is True'
  run "$BASH4" "$NEWPROJ" --plan demo "$T/rp2" --preset first-project --no-tools
  printf '%s' "$output" | python3 -c 'import json,sys; p=json.load(sys.stdin); assert "tools" not in p and all(c["id"]!="tools-init" for c in p["commands"])'
}
