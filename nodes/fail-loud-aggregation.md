<!--stratified-action
{
  "created": 1789593709,
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
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0007",
  "version": 1
}
-->

Across 39 heterogeneous steps we must NOT abort on first failure nor silently swallow one. Each tool runs isolated, capturing exit code + stderr; the run ends with a ✅/❌ summary and non-zero exit if any failed. Accomplished by [[run-report-surface|accomplished-by]].
