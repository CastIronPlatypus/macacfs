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
# ref = installer path within the repo, fetched from main; or
# @latest-release/<path> to fetch the installer published with the repo's
# latest GitHub release (for repos whose main installer is ahead of their
# releases). args = optional flags for the installer.
do_installer_sh() { # repo ref args...
  local repo="$1" ref="$2"; shift 2
  local path="$ref" tag=main url
  case "$ref" in @latest-release/*) path="${ref#@latest-release/}"; tag="<latest-release>" ;; esac
  if [ "${DRY_RUN:-0}" = 1 ]; then
    printf '    [dry-run] curl -fsSL %s | bash%s\n' "$RAW_BASE/$repo/$tag/$path" "${*:+ -s -- $*}"
    return 0
  fi
  if [ "$tag" = "<latest-release>" ]; then
    tag="$(curl -fsSL "https://api.github.com/repos/Dicklesworthstone/$repo/releases/latest" \
      | grep -m1 '"tag_name"' | sed -E 's/.*"tag_name": *"([^"]+)".*/\1/')"
    [ -n "$tag" ] || { printf 'macacfs: could not resolve the latest release of %s\n' "$repo" >&2; return 1; }
    printf '    using the installer from %s %s\n' "$repo" "$tag"
  fi
  url="$RAW_BASE/$repo/$tag/$path"
  # HOOK_ENV (set by a pre-install hook) is applied to the installer only.
  if [ "$#" -gt 0 ]; then
    curl -fsSL "$url" | env ${HOOK_ENV[@]+"${HOOK_ENV[@]}"} bash -s -- "$@"
  else
    curl -fsSL "$url" | env ${HOOK_ENV[@]+"${HOOK_ENV[@]}"} bash
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

# skip: a catalogued tool that cannot run on macOS. ref = the reason. Nothing is
# installed; the row is reported as skipped (with the reason), never as ok.
do_skip() { # reason
  printf '    skipped: %s\n' "$1"
  RUN_STATUS=skip
  RUN_NOTE="$1"
}

# dispatch <row> — run the tool's pre-install hook (lib/hooks.sh, if it defines
# pre_install_<ABBR>), then pick the method from the row and run it. A hook may
# set HOOK_ENV (VAR=value words for the installer's environment) and
# HOOK_EXTRA_ARGS (extra installer args). Returns the hook's or method's rc.
dispatch_row() {
  local row="$1" abbr method repo ref args
  abbr="$(row_abbr "$row")"
  method="$(row_method "$row")"; repo="$(row_repo "$row")"
  ref="$(row_ref "$row")";       args="$(row_args "$row")"
  HOOK_ENV=(); HOOK_EXTRA_ARGS=()
  if [ "$method" != skip ] && declare -F "pre_install_$abbr" >/dev/null; then
    if [ "${DRY_RUN:-0}" = 1 ]; then
      printf '    [dry-run] pre_install_%s\n' "$abbr"
    else
      "pre_install_$abbr" "$row" || return $?
    fi
  fi
  case "$method" in
    skip)         do_skip "$ref" ;;
    brew)         do_brew "$ref" ;;
    installer-sh) # shellcheck disable=SC2086
                  do_installer_sh "$repo" "$ref" $args ${HOOK_EXTRA_ARGS[@]+"${HOOK_EXTRA_ARGS[@]}"} ;;
    cargo-git)    # shellcheck disable=SC2086
                  do_cargo_git "$ref" $args ;;
    go)           do_go "$ref" ;;
    *)            printf 'macacfs: unknown method "%s" for %s\n' "$method" "$(row_abbr "$row")" >&2
                  return 2 ;;
  esac
}

# Per-tool pre-install hooks (pre_install_<ABBR>) called by dispatch_row.
# shellcheck source=/dev/null
. "$MACACFS_HOME/lib/hooks.sh"
