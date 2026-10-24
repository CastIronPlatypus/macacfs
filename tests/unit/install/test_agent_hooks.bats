#!/usr/bin/env bats
# lib/hooks.sh post-install hooks, with fake dcg / cm / codex / opencode.
setup() {
  ROOT="$(cd "$BATS_TEST_DIRNAME/../../.." && pwd)"
  T="$(mktemp -d)"; export HOME="$T/home"; mkdir -p "$HOME/.codex" "$T/bin"
  cat > "$T/bin/dcg" <<SH
#!/bin/sh
echo "dcg \$*" >> "$T/dcg.log"
SH
  cat > "$T/bin/cm" <<SH
#!/bin/sh
echo "cm \$*" >> "$T/cm.log"
if [ "\$1 \$2" = "hook status" ]; then [ -e "$T/cm.installed" ] && echo "claude  user     installed  x" || echo "claude  user     not installed  x"; fi
if [ "\$1 \$2" = "hook install" ]; then touch "$T/cm.installed"; fi
SH
  printf '#!/bin/sh\n' > "$T/bin/codex"; printf '#!/bin/sh\n' > "$T/bin/opencode"
  chmod +x "$T"/bin/*
  export PATH="$T/bin:/opt/homebrew/bin:/usr/bin:/bin"
  export MACACFS_HOME="$ROOT" RAW_BASE=x
  # shellcheck source=/dev/null
  . "$ROOT/lib/hooks.sh"
}
teardown() { rm -rf "$T"; }

@test "DCG: registers Claude Code, OpenCode and Codex, keeping other Codex hooks" {
  printf '{"hooks":{"Stop":[{"hooks":[{"type":"command","command":"x.sh"}]}]}}' > "$HOME/.codex/hooks.json"
  RUN_NOTE=""; post_install_DCG
  grep -qx "dcg install --quiet" "$T/dcg.log"
  grep -qx "dcg install --opencode --quiet" "$T/dcg.log"
  python3 - "$HOME/.codex/hooks.json" "$T/bin/dcg" <<'PY'
import json, sys
d = json.load(open(sys.argv[1]))
g = d["hooks"]["PreToolUse"][0]
assert g["matcher"] == "Bash" and g["hooks"][0]["command"] == sys.argv[2], g
assert d["hooks"]["Stop"][0]["hooks"][0]["command"] == "x.sh"
PY
  ls "$HOME"/.codex/hooks.json.bak.* >/dev/null
  [[ "$RUN_NOTE" == *"Claude Code"*"OpenCode"*"Codex (approve"* ]]
}

@test "DCG: Codex registration is idempotent" {
  RUN_NOTE=""; post_install_DCG; first="$(cat "$HOME/.codex/hooks.json")"
  RUN_NOTE=""; post_install_DCG
  [ "$(cat "$HOME/.codex/hooks.json")" = "$first" ]
  [[ "$RUN_NOTE" == *"and Codex" ]]
}

@test "CM: installs the global hook once, then is a no-op" {
  RUN_NOTE=""; post_install_CM
  grep -qx "cm hook install --global" "$T/cm.log"
  RUN_NOTE=""; post_install_CM
  [ "$(grep -c 'hook install' "$T/cm.log")" -eq 1 ]
  [[ "$RUN_NOTE" == *"already installed"* ]]
}

@test "a failing registration fails the hook" {
  printf '#!/bin/sh\nexit 3\n' > "$T/bin/dcg"
  run post_install_DCG
  [ "$status" -eq 1 ]; [[ "$output" == *"dcg install (Claude Code hook) failed"* ]]
}
