#!/usr/bin/env bash
# lib/report.sh — isolated per-tool execution + fail-loud summary.
# Realizes: result-capture-and-summary / reporter-code.
#
# Fail-loud contract (Jeff's global rules 1 & 14): a step failing NEVER aborts
# the batch and is NEVER silently swallowed. Every failure lands in the summary
# with its captured error, and the overall exit code is non-zero if any failed.

# Parallel result arrays (bash 3.2 compatible — no associative arrays).
_R_ABBR=(); _R_STATUS=(); _R_MSG=()

report_init() { _R_ABBR=(); _R_STATUS=(); _R_MSG=(); }

report_add() { # abbr status msg
  _R_ABBR+=("$1"); _R_STATUS+=("$2"); _R_MSG+=("$3")
}

# run_isolated <abbr> <label> <cmd...>
# Runs cmd, capturing combined output to a temp log. On success records the
# step's RUN_STATUS (default ok; do_skip sets skip) with any RUN_NOTE it set
# (e.g. "re-signed <path>", or a skip reason);
# on failure records the last meaningful line of stderr/stdout. Returns cmd rc.
run_isolated() {
  local abbr="$1" label="$2"; shift 2
  local log rc tail
  log="$(mktemp -t "macacfs.${abbr}.XXXXXX")"
  printf '  → %s (%s)\n' "$abbr" "$label"
  RUN_NOTE=""; RUN_STATUS=""
  if "$@" >"$log" 2>&1; then
    rc=0
    report_add "$abbr" "${RUN_STATUS:-ok}" "$RUN_NOTE"
  else
    rc=$?
    tail="$(grep -viE '^\s*$' "$log" | tail -n 3 | tr '\n' ' ' | cut -c1-300)"
    [ -z "$tail" ] && tail="exit $rc (no output)"
    report_add "$abbr" fail "$tail"
    printf '    ✗ failed (rc=%s): %s\n' "$rc" "$tail" >&2
  fi
  rm -f "$log"
  return "$rc"
}

# report_render — print the ✅/⏭/❌ table. Returns non-zero if any tool failed
# (skipped tools are not failures).
report_render() {
  local i n=${#_R_ABBR[@]} fails=0 skips=0
  printf '\n──────── macacfs summary ────────\n'
  for ((i=0; i<n; i++)); do
    if [ "${_R_STATUS[$i]}" = ok ]; then
      if [ -n "${_R_MSG[$i]}" ]; then
        printf '  ✅ %-8s %s\n' "${_R_ABBR[$i]}" "${_R_MSG[$i]}"
      else
        printf '  ✅ %s\n' "${_R_ABBR[$i]}"
      fi
    elif [ "${_R_STATUS[$i]}" = skip ]; then
      printf '  ⏭  %-8s skipped: %s\n' "${_R_ABBR[$i]}" "${_R_MSG[$i]}"
      skips=$((skips+1))
    else
      printf '  ❌ %-8s %s\n' "${_R_ABBR[$i]}" "${_R_MSG[$i]}"
      fails=$((fails+1))
    fi
  done
  printf '─────────────────────────────────\n'
  printf '  %d ok, %d skipped, %d failed, %d total\n\n' "$((n-fails-skips))" "$skips" "$fails" "$n"
  [ "$fails" -eq 0 ]
}
