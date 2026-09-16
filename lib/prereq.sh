#!/usr/bin/env bash
# lib/prereq.sh — ensure/install the toolchains the tools need.
# Realizes: homebrew-and-toolchains / toolchain-helpers-code.
#
# Checks each toolchain and INSTALLS the missing ones (not just reports).
# Homebrew is the root prerequisite and is installed first. Honors DRY_RUN.

# Space-separated list of things installed this run, for the report line.
PREREQ_INSTALLED=""

_have() { command -v "$1" >/dev/null 2>&1; }

_run() { # echo-under-dry-run wrapper
  if [ "${DRY_RUN:-0}" = 1 ]; then
    printf '    [dry-run] %s\n' "$*"
    return 0
  fi
  "$@"
}

ensure_homebrew() {
  if _have brew; then return 0; fi
  printf '  installing Homebrew (root prerequisite)...\n'
  if [ "${DRY_RUN:-0}" = 1 ]; then
    printf '    [dry-run] /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"\n'
    return 0
  fi
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || return 1
  # Put brew on PATH for the rest of this process (Apple Silicon vs Intel).
  if [ -x /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; fi
  PREREQ_INSTALLED="$PREREQ_INSTALLED homebrew"
}

_ensure_brew_pkg() { # cmd formula
  local cmd="$1" formula="$2"
  _have "$cmd" && return 0
  if [ "${DRY_RUN:-0}" = 1 ]; then
    printf '    [dry-run] brew install %s\n' "$formula"
    return 0
  fi
  printf '  installing %s (via brew)...\n' "$formula"
  brew install "$formula" || return 1
  PREREQ_INSTALLED="$PREREQ_INSTALLED $formula"
}

ensure_rust() {
  _have cargo && return 0
  printf '  installing Rust (rustup)...\n'
  if [ "${DRY_RUN:-0}" = 1 ]; then
    printf '    [dry-run] curl --proto =https --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y\n'
    return 0
  fi
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y || return 1
  # shellcheck disable=SC1091
  [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
  PREREQ_INSTALLED="${PREREQ_INSTALLED} rust"
}

ensure_go()   { _ensure_brew_pkg go go; }
ensure_uv()   { _ensure_brew_pkg uv uv; }
ensure_node() { _ensure_brew_pkg node node; }
ensure_git()  { _ensure_brew_pkg git git; }

# prereq_ensure <method1> <method2> ...
# BEST-EFFORT: attempts to install the toolchains implied by the methods in play.
# It never aborts the run — anything it cannot provide is WARNED about here, and
# any tool that genuinely needs a missing toolchain will fail loudly at its own
# step (no silent masking). Always returns 0.
prereq_ensure() {
  local methods=" $* " need_rust=0 need_go=0
  PREREQ_WARN=""
  printf 'Checking prerequisites...\n'
  ensure_homebrew || PREREQ_WARN="$PREREQ_WARN homebrew"
  ensure_git || PREREQ_WARN="$PREREQ_WARN git"

  case "$methods" in *" cargo-git "*) need_rust=1;; esac
  # installer-sh tools may build from Rust/Go/Node/Python source, so ensure the
  # common toolchains whenever any installer-sh tool is selected.
  case "$methods" in *" installer-sh "*) need_rust=1; need_go=1;; esac
  case "$methods" in *" go "*) need_go=1;; esac

  [ "$need_rust" = 1 ] && { ensure_rust || PREREQ_WARN="$PREREQ_WARN rust"; }
  [ "$need_go" = 1 ]   && { ensure_go   || PREREQ_WARN="$PREREQ_WARN go"; }
  case "$methods" in *" installer-sh "*)
    ensure_uv   || PREREQ_WARN="$PREREQ_WARN uv"
    ensure_node || PREREQ_WARN="$PREREQ_WARN node" ;;
  esac

  if [ -n "$PREREQ_INSTALLED" ]; then
    printf '  installed:%s\n' "$PREREQ_INSTALLED"
  elif [ -z "$PREREQ_WARN" ]; then
    printf '  all prerequisites already present.\n'
  fi
  if [ -n "$PREREQ_WARN" ]; then
    printf '  ⚠ could not provide:%s — tools needing these will fail loudly below.\n' "$PREREQ_WARN" >&2
  fi
  return 0
}
