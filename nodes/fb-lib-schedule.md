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
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-lib-schedule@v1",
  "uid": "n0043",
  "version": 2
}
-->

lib/schedule.sh — state read/write (last-run,status,consec-fails), cadence calc (weekly/nightly/2pm), plist writer (with the toolchain PATH) + launchctl reload; the tick entrypoint the LaunchAgent calls, which reloads its own job only from a detached helper so the agent stays loaded. Bead.
