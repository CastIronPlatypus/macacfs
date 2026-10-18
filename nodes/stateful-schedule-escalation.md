<!--stratified-action
{
  "created": 1789593709,
  "edges": [
    {
      "dst": "scheduled-update-behavior",
      "reason": "The escalation cadence is what the scheduled behavior expresses.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-failure-retry-escalation",
      "reason": "Since launchd is stateless but the weekly-nightly-2pm cadence is stateful, this problem forces a persisted state file that rewrites the schedule, as the requirement needs.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "stateful-schedule-escalation",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0006",
  "version": 1
}
-->

launchd is stateless but the required cadence is stateful: weekly; on failure nightly until success; after 3 straight failures 2pm-daily until success; then back to weekly. This forces a persisted run-state file that rewrites its own LaunchAgent schedule each run. Accomplished by [[scheduled-update-behavior|accomplished-by]].
