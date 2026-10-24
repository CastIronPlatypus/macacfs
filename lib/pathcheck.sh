#!/usr/bin/env bash
# lib/pathcheck.sh — post-install check that a tool's CLI, as it resolves on
# PATH, is the copy macacfs just installed.
# Realizes: pathcheck-code / fb-lib-pathcheck.
#
# Installing a tool is not enough if typing its name runs something else:
#   - a stale older copy left in a user bin dir by an earlier install method
#     (br 0.4.0 in ~/.local/bin hiding Homebrew's br 0.7.6);
#   - a different program with the same name (tcl-tk's pt, the TypeScript pi);
#   - a tool whose installer picked another name (pi_agent_rust installs as
#     pi-rust when a TypeScript pi already exists).
# The manifest's cli column may list alternatives as a|b (first match wins).
# A stale copy of the same tool in a user bin dir is moved aside (never
# deleted) to $MACACFS_SHADOW_DIR; a different program ahead on PATH fails the
# tool with a fix hint; a same-name program later on PATH is only noted.

MACACFS_SHADOW_DIR="${MACACFS_SHADOW_DIR:-${XDG_STATE_HOME:-$HOME/.local/state}/macacfs/shadowed}"

# The user bin dirs macacfs's own methods install into. Only files here are
# ever moved aside, and only when they are an older copy of the same tool.
_pc_user_dirs() {
  printf '%s\n' "$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/go/bin"
}

_pc_in_user_dir() { # path
  local d
  while IFS= read -r d; do
    case "$1" in "$d"/*) return 0 ;; esac
  done < <(_pc_user_dirs)
  return 1
}

# Every distinct copy of <name> on PATH, in PATH order, as "<path>\t<realpath>".
_pc_path_hits() { # name
  local d f real seen=$'\n' IFS=:
  for d in $PATH; do
    [ -n "$d" ] || continue
    f="$d/$1"
    [ -x "$f" ] && [ ! -d "$f" ] || continue
    real="$(realpath "$f" 2>/dev/null)" || continue
    case "$seen" in *$'\n'"$real"$'\n'*) continue ;; esac
    seen="$seen$real"$'\n'
    printf '%s\t%s\n' "$f" "$real"
  done
}

# row_cli_resolved <row> — the CLI name to use for this row: the first of the
# row's a|b alternatives that is on PATH, else the first alternative.
row_cli_resolved() {
  local alts c IFS='|'
  alts="$(row_cli "$1")"
  for c in $alts; do
    if command -v "$c" >/dev/null 2>&1; then printf '%s' "$c"; return 0; fi
  done
  printf '%s' "${alts%%|*}"
}

# The real path of the copy this row's method installed, or empty if unknown.
# brew: the formula's own bin entry. Other methods: the newest copy of the CLI
# written into a user bin dir since $SIG_MARKER.
_pc_installed_copy() { # row cli
  local row="$1" cli="$2" f d
  if [ "$(row_method "$row")" = brew ]; then
    f="$(brew --prefix "$(basename "$(row_ref "$row")")" 2>/dev/null)/bin/$cli"
    [ -x "$f" ] && { realpath "$f"; return 0; }
    return 0
  fi
  [ -n "${SIG_MARKER:-}" ] || return 0
  while IFS= read -r d; do
    f="$d/$cli"
    if [ -x "$f" ] && [ "$f" -nt "$SIG_MARKER" ]; then realpath "$f"; return 0; fi
  done < <(_pc_user_dirs; printf '%s\n' /usr/local/bin "$(brew --prefix 2>/dev/null)/bin")
}

# _pc_same_tool <a> <b> — true when two binaries are copies of one tool: their
# --version output names the same program (first word), or one is ours.
_pc_same_tool() {
  local va vb
  va="$(perl -e 'alarm 5; exec @ARGV' "$1" --version </dev/null 2>/dev/null | head -n 1 | awk '{print $1}')"
  vb="$(perl -e 'alarm 5; exec @ARGV' "$2" --version </dev/null 2>/dev/null | head -n 1 | awk '{print $1}')"
  [ -n "$va" ] && [ "$va" = "$vb" ]
}

# _pc_quarantine <path> — move a stale copy aside; prints the new location.
_pc_quarantine() {
  local dest
  mkdir -p "$MACACFS_SHADOW_DIR" || return 1
  dest="$MACACFS_SHADOW_DIR/$(basename "$1").$(date +%Y%m%d%H%M%S)"
  mv "$1" "$dest" || return 1
  printf '%s' "$dest"
}

# path_audit_row <row> — make sure the row's CLI resolves to the installed
# copy. Appends notes to RUN_NOTE; returns non-zero when the user would still
# run the wrong program.
path_audit_row() {
  local row="$1" cli want first_path first_real path real dest note bad=0 i=0
  cli="$(row_cli_resolved "$row")"
  want="$(_pc_installed_copy "$row" "$cli")"
  while IFS=$'\t' read -r path real; do
    i=$((i+1))
    if [ "$i" -eq 1 ]; then first_path="$path"; first_real="$real"; fi
  done < <(_pc_path_hits "$cli")
  if [ "$i" -eq 0 ]; then
    printf 'macacfs: %s installed but "%s" is not on PATH\n' "$(row_abbr "$row")" "$cli" >&2
    return 1
  fi
  [ -n "$want" ] || want="$first_real"

  # Something other than the installed copy comes first on PATH.
  while [ "$first_real" != "$want" ]; do
    if _pc_in_user_dir "$first_path" && [ ! -L "$first_path" ] && _pc_same_tool "$first_path" "$want"; then
      printf '    ! stale %s shadows the installed copy: %s\n' "$cli" "$first_path"
      dest="$(_pc_quarantine "$first_path")" || { printf 'macacfs: could not move stale %s aside\n' "$first_path" >&2; return 1; }
      RUN_NOTE="${RUN_NOTE:+$RUN_NOTE; }moved stale $first_path to $dest"
      hash -r 2>/dev/null
      first_path=""; first_real=""
      while IFS=$'\t' read -r path real; do first_path="$path"; first_real="$real"; break; done < <(_pc_path_hits "$cli")
      [ -n "$first_real" ] || { printf 'macacfs: no %s left on PATH after moving the stale copy\n' "$cli" >&2; return 1; }
    else
      printf 'macacfs: "%s" runs %s, not the copy %s installed (%s); put %s earlier on PATH or remove the other one\n' \
        "$cli" "$first_path" "$(row_abbr "$row")" "$want" "$(dirname "$want")" >&2
      bad=1
      break
    fi
  done

  # Other programs with the same name later on PATH: harmless now, worth knowing.
  i=0
  while IFS=$'\t' read -r path real; do
    i=$((i+1))
    [ "$i" -eq 1 ] && continue
    [ "$real" = "$want" ] && continue
    note="also on PATH (later): $path"
    RUN_NOTE="${RUN_NOTE:+$RUN_NOTE; }$note"
  done < <(_pc_path_hits "$cli")
  return "$bad"
}
