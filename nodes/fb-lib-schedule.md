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
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-schedule",
  "node_type": "impl",
  "obligations": [
    "r-run-tracking",
    "r-retry-escalation",
    "r-weekly-plist"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0043",
  "version": 1
}
-->

lib/schedule.sh — state read/write (last-run,status,consec-fails), cadence calc (weekly/nightly/2pm), plist writer + launchctl reload; the tick entrypoint the LaunchAgent calls. Bead.
