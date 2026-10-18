#!/usr/bin/env bash
# lib/schedule.sh — LaunchAgent install + run-state + failure-driven cadence.
# Realizes: schedule-state-and-plist / scheduler-code.
#
# Cadence policy (r-retry-escalation):
#   success                    -> weekly   (Sunday 03:00)
#   any failure                -> nightly  (daily 03:00) until it succeeds
#   >= 3 consecutive failures  -> daily2pm (daily 14:00) until it succeeds
# The state file records last run + status + consecutive failures, and every
# tick rewrites the plist's StartCalendarInterval to match the current cadence.

LABEL="com.macacfs.update"
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/macacfs"
STATE_FILE="$STATE_DIR/state.env"
LOG_DIR="$STATE_DIR/logs"

_sched_ensure_dirs() { mkdir -p "$STATE_DIR" "$LOG_DIR" "$HOME/Library/LaunchAgents"; }

# --- state -----------------------------------------------------------------
state_load() {
  MACACFS_LAST_RUN=""; MACACFS_LAST_STATUS="never"; MACACFS_CONSEC_FAILS=0; MACACFS_CADENCE="weekly"
  # shellcheck disable=SC1090
  [ -f "$STATE_FILE" ] && . "$STATE_FILE"
}

state_save() {
  _sched_ensure_dirs
  cat >"$STATE_FILE" <<EOF
MACACFS_LAST_RUN="$1"
MACACFS_LAST_STATUS="$2"
MACACFS_CONSEC_FAILS=$3
MACACFS_CADENCE="$4"
EOF
}

# --- cadence ---------------------------------------------------------------
# Emit the <key>StartCalendarInterval</key> block for a cadence.
cadence_calendar() {
  case "$1" in
    weekly)   cat <<'X'
  <key>StartCalendarInterval</key>
  <dict>
    <key>Weekday</key><integer>0</integer>
    <key>Hour</key><integer>3</integer>
    <key>Minute</key><integer>0</integer>
  </dict>
X
      ;;
    nightly)  cat <<'X'
  <key>StartCalendarInterval</key>
  <dict>
    <key>Hour</key><integer>3</integer>
    <key>Minute</key><integer>0</integer>
  </dict>
X
      ;;
    daily2pm) cat <<'X'
  <key>StartCalendarInterval</key>
  <dict>
    <key>Hour</key><integer>14</integer>
    <key>Minute</key><integer>0</integer>
  </dict>
X
      ;;
    *) return 1 ;;
  esac
}

# --- plist -----------------------------------------------------------------
schedule_write_plist() { # cadence
  local cadence="$1" cal prog tmpl out err line path
  _sched_ensure_dirs
  path="$(schedule_path)" || return 1
  prog="$MACACFS_HOME/bin/macacfs"
  tmpl="$MACACFS_HOME/share/macacfs.plist.template"
  out="$LOG_DIR/update.out.log"; err="$LOG_DIR/update.err.log"
  cal="$(cadence_calendar "$cadence")" || { printf 'macacfs: bad cadence %s\n' "$cadence" >&2; return 1; }
  # Render line by line: splice the calendar block, substitute placeholders.
  : >"$PLIST"
  while IFS= read -r line || [ -n "$line" ]; do
    if [ "$line" = "__CALENDAR__" ] || case "$line" in *__CALENDAR__*) true;; *) false;; esac; then
      printf '%s\n' "$cal" >>"$PLIST"
      continue
    fi
    line="${line//__PROGRAM__/$prog}"
    line="${line//__LABEL__/$LABEL}"
    line="${line//__STDOUT__/$out}"
    line="${line//__STDERR__/$err}"
    line="${line//__PATH__/$path}"
    printf '%s\n' "$line" >>"$PLIST"
  done <"$tmpl"
}

# The PATH the LaunchAgent runs with. launchd's default is /usr/bin:/bin:/usr/sbin:/sbin,
# where brew, cargo, go, uv and node are invisible (prereq would try to reinstall
# them) — so bake in the PATH of the shell running `macacfs schedule`, which
# carries everything it sees (nvm's node included). A tick rewrites the plist
# with its own PATH, which is that same baked value, so it stays stable.
schedule_path() {
  local prefix
  prefix="$(brew --prefix 2>/dev/null)" || { printf 'macacfs: brew is not on PATH; run macacfs schedule from your normal shell\n' >&2; return 1; }
  case ":$PATH:" in
    *":$prefix/bin:"*) printf '%s' "$PATH" ;;
    *) printf 'macacfs: %s/bin is not on PATH; run macacfs schedule from your normal shell\n' "$prefix" >&2; return 1 ;;
  esac
}

schedule_reload() {
  launchctl unload -w "$PLIST" >/dev/null 2>&1 || true
  launchctl load -w "$PLIST"
}

schedule_install() {
  state_load
  schedule_write_plist "${MACACFS_CADENCE:-weekly}" || return 1
  schedule_reload || { printf 'macacfs: failed to load LaunchAgent\n' >&2; return 1; }
  printf 'Scheduled: %s (%s). Plist: %s\n' "$LABEL" "${MACACFS_CADENCE:-weekly}" "$PLIST"
}

schedule_uninstall() {
  launchctl unload -w "$PLIST" >/dev/null 2>&1 || true
  rm -f "$PLIST"
  printf 'Unscheduled: removed %s\n' "$PLIST"
}

schedule_status() {
  state_load
  printf 'LaunchAgent : %s\n' "$LABEL"
  # Capture-then-test avoids a pipefail+SIGPIPE false negative from `grep -q`.
  local listed; listed="$(launchctl list 2>/dev/null | grep -F "$LABEL" || true)"
  if [ -n "$listed" ]; then
    printf 'Loaded      : yes\n'
  else
    printf 'Loaded      : no\n'
  fi
  printf 'Cadence     : %s\n' "$MACACFS_CADENCE"
  printf 'Last run    : %s\n' "${MACACFS_LAST_RUN:-never}"
  printf 'Last status : %s\n' "$MACACFS_LAST_STATUS"
  printf 'Consec fails: %s\n' "$MACACFS_CONSEC_FAILS"
  printf 'Plist       : %s\n' "$PLIST"
}

# schedule_tick — the entrypoint launchd fires. Runs a full update, records the
# outcome, recomputes cadence, and rewrites+reloads the plist accordingly.
schedule_tick() {
  _sched_ensure_dirs
  state_load
  local now rc cadence fails
  now="$(date '+%Y-%m-%dT%H:%M:%S%z')"
  if "$MACACFS_HOME/bin/macacfs" update; then
    rc=0; fails=0; cadence=weekly
  else
    rc=$?
    fails=$(( ${MACACFS_CONSEC_FAILS:-0} + 1 ))
    if [ "$fails" -ge 3 ]; then cadence=daily2pm; else cadence=nightly; fi
  fi
  if [ "$rc" -eq 0 ]; then
    state_save "$now" ok "$fails" "$cadence"
  else
    state_save "$now" fail "$fails" "$cadence"
  fi
  if schedule_write_plist "$cadence"; then
    # Reload from a detached helper, never inline: unloading this job from inside
    # its own tick kills the tick before `load` runs, leaving the agent unloaded.
    # The plist's AbandonProcessGroup keeps the helper alive after the tick exits.
    nohup /bin/sh -c 'sleep 5; launchctl unload -w "$1" >/dev/null 2>&1; launchctl load -w "$1" || echo "macacfs: failed to reload LaunchAgent $1" >&2' _ "$PLIST" >>"$LOG_DIR/update.err.log" 2>&1 &
  else
    printf 'macacfs: failed to rewrite LaunchAgent plist for cadence %s\n' "$cadence" >&2
    [ "$rc" -eq 0 ] && rc=1
  fi
  return "$rc"
}
