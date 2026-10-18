<!--stratified-action
{
  "created": 1789593894,
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
    }
  ],
  "is_bead": false,
  "name": "launchd-scheduler-state",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0020",
  "version": 1
}
-->

Owns the LaunchAgent: install/uninstall the plist, persist run-state (last run, status, consecutive failures), and on each fire compute the next cadence (weekly/nightly/2pm-daily) rewriting the plist's StartCalendarInterval. Backs [[scheduled-update-behavior|flow]]. Accomplished by [[schedule-state-and-plist|accomplished-by]].
