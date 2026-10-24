#!/usr/bin/env bash
# lib/hooks.sh — per-tool pre-install hooks, run by dispatch_row before a
# tool's install method. A hook is a function named pre_install_<ABBR>; it may
# set HOOK_ENV (VAR=value words for the installer's environment) and
# HOOK_EXTRA_ARGS (extra installer args). A failing hook fails the tool.
# Realizes: tool-install-hooks / fb-lib-hooks.

# MDWB (markdown_web_browser): its installer only fetches Chrome for Testing on
# Linux x86_64, then its self-test fails on a Mac without the exact build. So
# always download the build MDWB will test — without looking at what is already
# installed — and hand the installer CFT_VERSION/CFT_EXECUTABLE for it. Also pin
# --dir: the installer's default is ./markdown_web_browser under whatever
# directory macacfs happens to run from.
pre_install_MDWB() {
  local dir="$HOME/markdown_web_browser" build arch cache zip app
  # The build MDWB tests: CFT_VERSION from the environment, else its .env, else
  # the installer's verified pin.
  build="${CFT_VERSION:-}"
  if [ -z "$build" ] && [ -f "$dir/.env" ]; then
    build="$(sed -n 's/^CFT_VERSION=//p' "$dir/.env" | tail -n 1)"
  fi
  if [ -z "$build" ]; then
    build="$(curl -fsSL "$RAW_BASE/markdown_web_browser/main/install.sh" | sed -n 's/^readonly CFT_PINNED_BUILD="\(.*\)"$/\1/p')"
  fi
  build="${build#chrome-}"
  case "$build" in
    *.*.*.*) : ;;
    *) printf 'macacfs: could not determine the Chrome for Testing build MDWB tests (got "%s")\n' "$build" >&2; return 1 ;;
  esac
  case "$(uname -m)" in
    arm64) arch=mac-arm64 ;;
    x86_64) arch=mac-x64 ;;
    *) printf 'macacfs: no Chrome for Testing build for %s\n' "$(uname -m)" >&2; return 1 ;;
  esac
  cache="$HOME/.cache/mdwb/cft/$build"
  zip="$(mktemp -t macacfs.cft.XXXXXX)"
  printf '    downloading Chrome for Testing %s (%s)\n' "$build" "$arch"
  curl -fL "https://storage.googleapis.com/chrome-for-testing-public/$build/$arch/chrome-$arch.zip" -o "$zip" \
    || { rm -f "$zip"; printf 'macacfs: Chrome for Testing %s download failed\n' "$build" >&2; return 1; }
  rm -rf "$cache/chrome-$arch"
  mkdir -p "$cache"
  unzip -q -o "$zip" -d "$cache" || { rm -f "$zip"; printf 'macacfs: could not unpack Chrome for Testing %s\n' "$build" >&2; return 1; }
  rm -f "$zip"
  app="$cache/chrome-$arch/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing"
  [ -x "$app" ] || { printf 'macacfs: Chrome for Testing executable missing after unpack: %s\n' "$app" >&2; return 1; }
  HOOK_ENV=("CFT_VERSION=$build" "CFT_EXECUTABLE=$app")
  HOOK_EXTRA_ARGS=(--dir "$dir")
}

# ── post-install hooks ──────────────────────────────────────────────────────
# post_install_<ABBR> runs after a tool installed, its signatures verified and
# its CLI resolved to the installed copy (install_and_verify_row). Used to
# register a tool with the coding agents, so it is in effect, not just present.
# Each step is idempotent (re-running install = updating) and only edits agent
# config through the tool's own installer command; none starts a service.
# A failure fails the tool, with the tool's own error in the summary.

# _ph_note <text> — append a note to this tool's summary row.
_ph_note() { RUN_NOTE="${RUN_NOTE:+$RUN_NOTE; }$1"; }

# DCG (destructive_command_guard): register its PreToolUse guard with Claude
# Code (user level), and with OpenCode when OpenCode is installed. Without
# this dcg is installed but guards nothing.
post_install_DCG() {
  local dcg
  dcg="$(command -v dcg)" || { printf 'macacfs: dcg not on PATH after install\n' >&2; return 1; }
  "$dcg" install --quiet || { printf 'macacfs: dcg install (Claude Code hook) failed\n' >&2; return 1; }
  _ph_note "dcg guard registered for Claude Code"
  if command -v opencode >/dev/null 2>&1; then
    "$dcg" install --opencode --quiet || { printf 'macacfs: dcg install --opencode failed\n' >&2; return 1; }
    _ph_note "and OpenCode"
  fi
  if command -v codex >/dev/null 2>&1 || [ -d "$HOME/.codex" ]; then
    _ph_dcg_codex "$dcg" || return 1
  fi
}

# _ph_dcg_codex <dcg-path> — register dcg in ~/.codex/hooks.json the way dcg's
# own install.sh does (dcg's CLI has no Codex option): one PreToolUse group
# matching Bash whose command is the quoted dcg path, placed first. Other hooks
# are kept; the file is backed up before it changes; already-registered is a
# no-op. Codex asks once, on its next start, to approve the new hook.
_ph_dcg_codex() {
  local out
  out="$(python3 -I - "$1" "$HOME/.codex/hooks.json" <<'PY'
import json, os, shlex, shutil, sys, time
dcg, path = sys.argv[1], sys.argv[2]
def is_dcg(c):
    try: w = shlex.split(c) if isinstance(c, str) and c else []
    except ValueError: return False
    return bool(w) and os.path.basename(w[0]) == "dcg"
data = {}
if os.path.exists(path):
    with open(path) as f:
        data = json.load(f)
if not isinstance(data, dict): raise SystemExit("hooks.json is not a JSON object")
hooks = data.setdefault("hooks", {})
groups = hooks.setdefault("PreToolUse", [])
for g in groups:
    if isinstance(g, dict) and any(isinstance(h, dict) and is_dcg(h.get("command")) for h in g.get("hooks", [])):
        print("already"); raise SystemExit(0)
groups.insert(0, {"matcher": "Bash", "hooks": [{"type": "command", "command": shlex.quote(dcg)}]})
os.makedirs(os.path.dirname(path), exist_ok=True)
if os.path.exists(path):
    shutil.copy2(path, path + ".bak." + time.strftime("%Y%m%d%H%M%S"))
tmp = path + ".macacfs.tmp"
with open(tmp, "w") as f:
    json.dump(data, f, indent=2); f.write("\n")
os.replace(tmp, path)
print("added")
PY
)" || { printf 'macacfs: could not register dcg in ~/.codex/hooks.json\n' >&2; return 1; }
  case "$out" in
    added) _ph_note "and Codex (approve the hook on Codex's next start)" ;;
    *)     _ph_note "and Codex" ;;
  esac
}

# CM (cass_memory_system): install its user-level Claude Code SessionEnd hook
# so every finished session is reflected into memory, not only manual runs.
post_install_CM() {
  if cm hook status 2>/dev/null | grep -Eq '^claude +user +installed'; then
    _ph_note "cm reflection hook already installed (Claude Code)"
    return 0
  fi
  cm hook install --global || { printf 'macacfs: cm hook install --global failed\n' >&2; return 1; }
  _ph_note "cm reflection hook installed (Claude Code)"
}
