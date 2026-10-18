<!--stratified-action
{
  "created": 1789593836,
  "disc_stamp": {
    "disc-callout-distal": "1.0.0",
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0013",
  "version": 1
}
-->

What the user observes from 'macacfs schedule' (install by default; --uninstall, --status): a com.macacfs.update LaunchAgent in ~/Library/LaunchAgents that runs a full 'macacfs update' (all tools plus the terminal-environment brew refresh) weekly, Sunday 03:00, by default; if a run fails it retries nightly at 03:00 until it succeeds; once 3 consecutive runs have failed it moves to a daily 14:00 attempt until success, then returns to weekly. The last run's time, its ok/fail status, the consecutive-failure count and the current cadence are recorded and shown by 'macacfs schedule --status', and run output goes to log files under the macacfs state dir. This behavior [[stateful-schedule-escalation|serves|The weekly/nightly/2pm cadence the user observes is the direct expression of the stateful escalation logic.]] and is [[launchd-scheduler-state|accomplished-by|The observed cadence and recorded state are produced by the scheduler and state capability.]]
