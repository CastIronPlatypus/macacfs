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
  "retire_reason": "run_isolated records a step's RUN_NOTE on ok rows and the renderer prints it, carrying re-sign notes into the summary.",
  "retired_at": 1792285815,
  "status": "retired",
  "stratum": "implementation",
  "uid": "n0053",
  "version": 1
}
-->

Implementation of fb-lib-report: `lib/report.sh`
