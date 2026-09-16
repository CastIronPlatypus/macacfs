#!/usr/bin/env bash
# lib/methods.sh — per-tool install/update method functions + dispatcher.
# Realizes: install-method-functions / method-fns-code.
#
# Install and update converge here: every method installs the LATEST, so
# re-running = updating (idempotent). Each honors DRY_RUN. NONE of these ever
# start a tool's server/daemon — install/upgrade the binary only (rule r-no-servers).

RAW_BASE="https://raw.githubusercontent.com/Dicklesworthstone"

_m_run() { # echo under dry-run, else execute
  if [ "${DRY_RUN:-0}" = 1 ]; then
    printf '    [dry-run] %s\n' "$*"
    return 0
  fi
  "$@"
}

# brew: install if missing, upgrade if present. ref = tap/formula.
do_brew() { # ref args...
  local ref="$1"
  if [ "${DRY_RUN:-0}" = 1 ]; then
    printf '    [dry-run] brew install-or-upgrade %s\n' "$ref"
    return 0
  fi
  if brew list --versions "$(basename "$ref")" >/dev/null 2>&1; then
    brew upgrade "$ref" 2>&1 || true   # 'up to date' returns non-zero on some brews
    brew list --versions "$(basename "$ref")" >/dev/null 2>&1
  else
    brew install "$ref"
  fi
}

# installer-sh: run the repo's own installer (installs latest = updates too).
# ref = installer path within the repo; args = optional flags for the installer.
do_installer_sh() { # repo ref args...
  local repo="$1" ref="$2"; shift 2
  local url="$RAW_BASE/$repo/main/$ref"
  if [ "${DRY_RUN:-0}" = 1 ]; then
    printf '    [dry-run] curl -fsSL %s | bash%s\n' "$url" "${*:+ -s -- $*}"
    return 0
  fi
  if [ "$#" -gt 0 ]; then
    curl -fsSL "$url" | bash -s -- "$@"
  else
    curl -fsSL "$url" | bash
  fi
}

# cargo-git: install/update a crate straight from its git repo.
# ref = git URL; args = optional extra flags (e.g. --bin jfp).
do_cargo_git() { # ref args...
  local ref="$1"; shift
  _m_run cargo install --git "$ref" --force "$@"
}

# go: install/update a Go module binary. ref = module path (with or without @latest).
do_go() { # ref
  local ref="$1"
  case "$ref" in *@*) : ;; *) ref="$ref@latest";; esac
  _m_run go install "$ref"
}

# dispatch <row> — pick the method from the row and run it. Returns method rc.
dispatch_row() {
  local row="$1" method repo ref args
  method="$(row_method "$row")"; repo="$(row_repo "$row")"
  ref="$(row_ref "$row")";       args="$(row_args "$row")"
  case "$method" in
    brew)         do_brew "$ref" ;;
    installer-sh) # shellcheck disable=SC2086
                  do_installer_sh "$repo" "$ref" $args ;;
    cargo-git)    # shellcheck disable=SC2086
                  do_cargo_git "$ref" $args ;;
    go)           do_go "$ref" ;;
    *)            printf 'macacfs: unknown method "%s" for %s\n' "$method" "$(row_abbr "$row")" >&2
                  return 2 ;;
  esac
}
