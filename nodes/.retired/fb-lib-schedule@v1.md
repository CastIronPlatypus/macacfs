<!--stratified-action
{
  "created": 1789594077,
  "edges": [
    {
      "dst": "scheduler-code",
      "reason": "This file realizes the scheduler code.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-schedule-impl",
      "reason": "The scheduling bead is realized by lib/schedule.sh, holding state I/O, cadence calculation, plist writing, and the LaunchAgent tick entrypoint.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "lib/schedule.sh reads and writes the state file holding last-run time and status, which is the recorded run history the requirement asks for.",
      "type": "validated-by"
    },
    {
      "dst": "req-failure-retry-escalation",
      "reason": "lib/schedule.sh tracks consecutive failures and computes weekly, nightly, or 2pm cadence from them, implementing the retry-then-escalate schedule.",
      "type": "validated-by"
    },
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "lib/schedule.sh writes the LaunchAgent plist and reloads it via launchctl with a weekly default cadence, installing the required weekly updater.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-schedule",
  "node_type": "impl",
  "retire_reason": "The scheduler builds the LaunchAgent PATH and reloads the plist from a detached helper; the inline unload killed the tick and left the agent unloaded since 2026-09-20.",
  "retired_at": 1792285883,
  "status": "retired",
  "stratum": "file-boundaries",
  "uid": "n0043",
  "version": 1
}
-->

lib/schedule.sh — state read/write (last-run,status,consec-fails), cadence calc (weekly/nightly/2pm), plist writer + launchctl reload; the tick entrypoint the LaunchAgent calls. Bead.
