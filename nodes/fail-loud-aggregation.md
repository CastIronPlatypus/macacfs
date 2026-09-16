<!--stratified-action
{
  "created": 1789593709,
  "edges": [
    {
      "dst": "run-report-surface",
      "reason": "Fail-loud aggregation is surfaced by the run report.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "fail-loud-aggregation",
  "node_type": "problem",
  "obligations": [
    "r-fail-loud"
  ],
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0007",
  "version": 1
}
-->

Across 39 heterogeneous steps we must NOT abort on first failure nor silently swallow one. Each tool runs isolated, capturing exit code + stderr; the run ends with a ✅/❌ summary and non-zero exit if any failed. Accomplished by [[run-report-surface|accomplished-by]].
