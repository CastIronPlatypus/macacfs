<!--stratified-action
{
  "created": 1789594076,
  "edges": [
    {
      "dst": "reporter-code",
      "reason": "This file realizes the reporter.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-report-impl",
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-report",
  "node_type": "impl",
  "obligations": [
    "r-fail-loud",
    "r-dry-run"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0042",
  "version": 1
}
-->

lib/report.sh — run_isolated (capture rc+stderr), accumulate results, render ✅/❌ table, aggregate exit code. Bead.
