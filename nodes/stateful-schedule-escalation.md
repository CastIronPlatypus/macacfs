<!--stratified-action
{
  "created": 1789593709,
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
      "reason": "The escalation cadence is what the scheduled behavior expresses.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-failure-retry-escalation",
      "reason": "Since launchd is stateless but the weekly-nightly-2pm cadence is stateful, this problem forces a persisted state file that rewrites the schedule, as the requirement needs.",
      "type": "validated-by"
    },
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "The escalation can only work from a persisted record of the last run's time, outcome and consecutive-failure count, which is exactly the run tracking the requirement asks for.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "stateful-schedule-escalation",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0006",
  "version": 1
}
-->

launchd is stateless but the required cadence is stateful: weekly normally; after a failed run nightly until success; once 3 consecutive runs have failed, daily at 2pm until success; then back to weekly. This forces a persisted run-state file (last run, status, consecutive failures, cadence) and a job that rewrites its own LaunchAgent schedule after every run — and, because unloading a job from inside its own run kills that run, the reload has to happen from a detached helper. The problem is [[scheduled-update-behavior|accomplished-by|The scheduled LaunchAgent's weekly/nightly/2pm behavior is the expression that answers this escalation problem.]]
