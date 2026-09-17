#!/usr/bin/env bash
# share/atuin-guard.sh — macacfs agent-safe atuin shim.
# Realizes: fb-share-atuin-guard. Installed by lib/shell.sh (shell_atuin) in front
# of the real atuin on ~/.local/bin, with __REAL_ATUIN__ substituted at install time.
#
# Why: atuin installs a shell hook that records EVERY command. Inside a coding
# agent's shell that (1) floods your history with agent-run commands and (2) can
# throw EPIPE from the `atuin hook` stdin read. This shim detects agent context
# and no-ops history recording + the hook there, while passing straight through
# for real interactive use.
set -euo pipefail

real_atuin_bin="${ATUIN_REAL_BIN:-__REAL_ATUIN__}"
if [ ! -x "$real_atuin_bin" ]; then
  echo "atuin shim: real atuin binary not found at $real_atuin_bin" >&2
  exit 127
fi

# agent hook integration disabled by macacfs: drain stdin so callers never see EPIPE.
if [ "${1:-}" = "hook" ]; then
  cat >/dev/null 2>&1 || true
  exit 0
fi

_in_agent() {
  # Explicit agent env markers.
  if [ -n "${CLAUDE_PROJECT_DIR:-}${CODEX_THREAD_ID:-}${CODEX_CI:-}${AGENT_NAME:-}" ]; then
    return 0
  fi
  # Parent process name (BSD ps: comm= may be a full path — strip to basename).
  local p
  p="$(ps -o comm= -p "${PPID:-0}" 2>/dev/null || true)"
  p="${p##*/}"
  case "$p" in
    claude|codex|cod|cc|node|bun|agy|antigravity|gemini|gmi) return 0 ;;
    *) return 1 ;;
  esac
}

# Suppress history capture inside agent sessions; leave interactive use untouched.
if [ "${1:-}" = "history" ] && { [ "${2:-}" = "start" ] || [ "${2:-}" = "end" ]; } && _in_agent; then
  exit 0
fi

exec "$real_atuin_bin" "$@"
