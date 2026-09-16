<!--stratified-action
{
  "created": 1789593837,
  "edges": [
    {
      "dst": "fail-loud-aggregation",
      "reason": "The \u2705/\u274c summary and non-zero exit are how fail-loud aggregation surfaces to the observer.",
      "type": "serves"
    },
    {
      "dst": "dry-run-without-sideeffects",
      "reason": "Dry-run is observed through the same report showing intended (not executed) actions.",
      "type": "serves"
    },
    {
      "dst": "isolated-runner-reporter",
      "reason": "The report is produced by the isolated runner/reporter.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "run-report-surface",
  "node_type": "surface",
  "obligations": [
    "r-fail-loud",
    "r-dry-run"
  ],
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0014",
  "version": 1
}
-->

Every install/update run ends with a per-tool ✅/❌ table showing what succeeded and the captured error for what failed; the process exits non-zero if any tool failed (no silent swallowing). Under --dry-run nothing is installed and the same table shows only the intended action per tool. Accomplished by [[isolated-runner-reporter|accomplished-by]].
