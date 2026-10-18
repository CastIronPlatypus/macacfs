<!--stratified-action
{
  "created": 1789593836,
  "edges": [
    {
      "dst": "stateful-schedule-escalation",
      "reason": "The weekly/nightly/2pm cadence the user observes is the direct expression of the stateful escalation logic.",
      "type": "serves"
    },
    {
      "dst": "launchd-scheduler-state",
      "reason": "The observed cadence is produced by the scheduler+state capability.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "The installed LaunchAgent runs updates weekly by default, which is the baseline cadence the weekly-LaunchAgent requirement specifies.",
      "type": "validated-by"
    },
    {
      "dst": "req-failure-retry-escalation",
      "reason": "The user observes weekly runs that drop to nightly after a failure and to 2pm-daily after three, returning to weekly on success, matching the requirement.",
      "type": "validated-by"
    },
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "The scheduled behavior includes recording the last run's time and success or failure in a readable form, directly fulfilling run tracking.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "scheduled-update-behavior",
  "node_type": "surface",
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0013",
  "version": 1
}
-->

What the user observes from the installed LaunchAgent: updates run weekly by default; if a run fails it retries nightly until it succeeds; after 3 straight nightly failures it moves to a 2pm-daily attempt until success, then returns to weekly. The last run's time and success/failure are recorded and readable. Accomplished by [[launchd-scheduler-state|accomplished-by]].
