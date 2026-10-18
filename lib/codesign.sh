#!/usr/bin/env bash
# lib/codesign.sh — post-install code-signature verification + ad-hoc repair.
# Realizes: signature-repair-code / fb-lib-codesign.
#
# Some upstream release binaries (Bun `--compile` single-file executables, e.g.
# cm, brenner, csctf, s2p, ntm) ship with an invalidated signature, and macOS
# SIGKILLs them at launch (the shell just prints "killed"). After each tool
# installs, every Mach-O it produced is checked with `codesign -v --no-strict`
# (the hash/seal check the kernel enforces at launch; strict layout validation
# rejects runnable Bun binaries such as brenner 0.4.1); any that fail are
# re-signed ad-hoc and re-verified. Every re-sign is reported in the
# summary (never silent); a binary that cannot be repaired fails the tool.

SIG_MARKER=""

# Directories installers drop binaries into (non-brew methods).
_sig_scan_dirs() {
  printf '%s\n' "$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/go/bin" "/usr/local/bin" "/opt/homebrew/bin"
  if command -v go >/dev/null 2>&1; then printf '%s/bin\n' "$(go env GOPATH)"; fi
}

# Candidate files for one tool's install: anything written into a bin dir
# during the install, the brew formula's own files (bottles keep upstream
# mtimes, so -newer misses them), and the tool's CLI as it resolves on PATH.
_sig_candidates() { # row
  local row="$1" d p
  while IFS= read -r d; do
    [ -d "$d" ] || continue
    find "$d" -maxdepth 1 \( -type f -o -type l \) -newer "$SIG_MARKER" 2>/dev/null
  done < <(_sig_scan_dirs | sort -u)
  if [ "$(row_method "$row")" = brew ]; then
    brew list --formula "$(basename "$(row_ref "$row")")"
  fi
  if p="$(command -v "$(row_cli "$row")" 2>/dev/null)"; then printf '%s\n' "$p"; fi
}

# sig_repair_row <row> — verify (and if needed re-sign) every Mach-O the tool
# installed. Appends "re-signed <path>" to RUN_NOTE per repair. Returns non-zero
# if any binary still fails verification.
sig_repair_row() {
  local row="$1" f real mode bad=0 seen=$'\n'
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    real="$(realpath "$f" 2>/dev/null)" || continue
    case "$seen" in *$'\n'"$real"$'\n'*) continue ;; esac
    seen="$seen$real"$'\n'
    [ -f "$real" ] || continue
    file -b "$real" | grep -q 'Mach-O' || continue
    codesign -v --no-strict "$real" >/dev/null 2>&1 && continue
    printf '    ! invalid code signature: %s — re-signing ad-hoc\n' "$real"
    mode=""
    if [ ! -w "$real" ]; then
      mode="$(stat -f '%Lp' "$real")"
      chmod u+w "$real" || { printf 'macacfs: cannot make %s writable to re-sign it\n' "$real" >&2; bad=1; continue; }
    fi
    if codesign --force -s - "$real" && codesign -v --no-strict "$real"; then
      RUN_NOTE="${RUN_NOTE:+$RUN_NOTE; }re-signed $real"
    else
      printf 'macacfs: %s has an invalid code signature and re-signing failed\n' "$real" >&2
      bad=1
    fi
    if [ -n "$mode" ]; then chmod "$mode" "$real"; fi
  done < <(_sig_candidates "$row")
  return "$bad"
}

# install_and_verify_row <row> — install via the row's method, then verify and
# repair the signatures of what it installed.
install_and_verify_row() {
  local row="$1" rc
  SIG_MARKER="$(mktemp -t macacfs.sigmark.XXXXXX)"
  dispatch_row "$row"; rc=$?
  if [ "$rc" -eq 0 ] && [ "${RUN_STATUS:-}" != skip ]; then
    sig_repair_row "$row"; rc=$?
  fi
  rm -f "$SIG_MARKER"
  return "$rc"
}
