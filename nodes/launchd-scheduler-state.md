<!--stratified-action
{
  "created": 1789593894,
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
      "dst": "scheduled-update-behavior",
      "reason": "The weekly/nightly/2pm behavior and last-run status are produced by the scheduler+state capability.",
      "type": "serves"
    },
    {
      "dst": "schedule-state-and-plist",
      "reason": "The scheduler is realized by state + plist subsystem.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-failure-retry-escalation",
      "reason": "Persisting consecutive failures and rewriting the plist's StartCalendarInterval to weekly, nightly, or 2pm-daily on each fire implements the escalation policy.",
      "type": "validated-by"
    },
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "The capability persists last-run timestamp, status and consecutive failures in the state file after every fire, which is the run tracking the requirement asks for.",
      "type": "validated-by"
    },
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "The capability installs the com.macacfs.update LaunchAgent plist into ~/Library/LaunchAgents with weekly as its normal cadence.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "launchd-scheduler-state",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0020",
  "version": 1
}
-->

The capability that owns the LaunchAgent: install, uninstall and report status of the com.macacfs.update plist, persist run-state (last run, status, consecutive failures, cadence), and on each fire run a full update, compute the next cadence (weekly on success, nightly after a failure, daily 2pm after 3+ consecutive failures), rewrite the plist's StartCalendarInterval, and reload it from a detached helper so the job stays loaded. It [[scheduled-update-behavior|serves|The weekly/nightly/2pm behavior and last-run status the user observes are produced by this scheduler and state capability.]] and is [[schedule-state-and-plist|accomplished-by|The state-file and plist-rendering subsystem realizes this scheduler.]].
