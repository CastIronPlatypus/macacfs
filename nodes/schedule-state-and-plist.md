<!--stratified-action
{
  "created": 1789593935,
  "edges": [
    {
      "dst": "launchd-scheduler-state",
      "reason": "The scheduler capability is realized by the state file, cadence calc, and plist writer.",
      "type": "serves"
    },
    {
      "dst": "scheduler-code",
      "reason": "The scheduling subsystem is realized by the scheduler code.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "schedule-state-and-plist",
  "node_type": "unclassified",
  "obligations": [
    "r-run-tracking"
  ],
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0027",
  "version": 1
}
-->

A state file (last-run time, status, consecutive_failures) with read/write helpers; a cadence calculator mapping state to a StartCalendarInterval (weekly/nightly/2pm-daily); and a plist writer + launchctl reload. Underpins [[launchd-scheduler-state|flow]]. Accomplished by [[scheduler-code|accomplished-by]].
