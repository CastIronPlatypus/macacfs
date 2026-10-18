<!--stratified-action
{
  "created": 1789594981,
  "edges": [
    {
      "dst": "fb-lib-report",
      "reason": "The lib/report.sh file is the concrete implementation that fulfills the isolated-runner and summary reporter bead.",
      "type": "serves"
    }
  ],
  "impl_path": "lib/report.sh",
  "is_bead": true,
  "name": "fb-lib-report-impl",
  "node_type": "impl",
  "realized_at": "0.14.0",
  "realized_fp": "1789594593:1999",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-lib-report-impl@v1",
  "uid": "n0053",
  "version": 2
}
-->

Implementation of fb-lib-report: `lib/report.sh` — run_isolated resets RUN_NOTE, runs the step with output captured, and records ok with the step's RUN_NOTE (e.g. 're-signed <path>') or fail with the captured error tail; report_render prints ✅ rows with their note when present, ❌ rows with the error, and returns non-zero if any failed.
