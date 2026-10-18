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
      "dst": "run-report-surface",
      "reason": "Fail-loud aggregation is surfaced by the run report.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-fail-loud",
      "reason": "Isolating each of the 39 steps, capturing exit code and stderr, and ending with a non-zero summary exit directly embodies the no-silent-failure requirement.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fail-loud-aggregation",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0007",
  "version": 1
}
-->

The problem of fail-loud aggregation: across 39 heterogeneous tool steps (and the shell-setup steps) a run must neither abort on the first failure nor silently swallow one, so each step runs isolated with its exit code and combined output captured, a failing step's last meaningful output lines are kept, and the run ends with a ✅/❌ summary and a non-zero exit if any step failed. It is [[run-report-surface|accomplished-by|The run report surface shows the per-step ✅/❌ summary and carries the non-zero exit to the observer.]].
