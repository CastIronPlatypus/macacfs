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
    },
    {
      "dst": "req-fail-loud",
      "reason": "Every run ends with a per-tool \u2705/\u274c table including captured errors and a non-zero exit on any failure, which is what fail-loud acceptance checks.",
      "type": "validated-by"
    },
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "Under --dry-run the end-of-run table shows only each tool's intended action and nothing is installed, the user-visible proof of side-effect-free dry-run.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "run-report-surface",
  "node_type": "surface",
  "retire_reason": "The summary now names every binary that was re-signed, so a signature repair is visible rather than silent.",
  "retired_at": 1792285815,
  "status": "retired",
  "stratum": "surface",
  "uid": "n0014",
  "version": 1
}
-->

Every install/update run ends with a per-tool ✅/❌ table showing what succeeded and the captured error for what failed; the process exits non-zero if any tool failed (no silent swallowing). Under --dry-run nothing is installed and the same table shows only the intended action per tool. Accomplished by [[isolated-runner-reporter|accomplished-by]].
