<!--stratified-action
{
  "created": 1789594981,
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
      "dst": "fb-lib-report",
      "reason": "The lib/report.sh file is the concrete implementation that fulfills the isolated-runner and summary reporter bead.",
      "type": "serves"
    }
  ],
  "impl_path": "lib/report.sh",
  "is_bead": true,
  "name": "fb-lib-report-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594593:1999",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-lib-report-impl@v1",
  "uid": "n0053",
  "version": 2
}
-->

Implementation of lib/report.sh; it [[fb-lib-report|serves|The lib/report.sh file is the concrete implementation that fulfills the isolated-runner and summary reporter bead.]]. It keeps bash-3.2-compatible parallel result arrays (report_init, report_add); run_isolated prints the step line, resets RUN_NOTE, runs the step with combined output captured to a mktemp log, and records ok with the step's RUN_NOTE (e.g. 're-signed <path>') or fail with the last three non-blank output lines (cut to 300 chars, or 'exit N (no output)') also echoed to stderr, then returns the step's rc; report_render prints ✅ rows with their note when present and ❌ rows with the error, an ok/failed/total count line, and returns non-zero if any failed. RUN_NOTE [[fb-lib-codesign|couples-with|sig_repair_row in lib/codesign.sh appends its re-sign notes to the same RUN_NOTE global that run_isolated resets and reads, so the shared variable name is an implicit contract between the two files.]].
