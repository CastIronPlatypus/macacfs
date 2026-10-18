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
  "succeeds": "fb-lib-report-impl@v2",
  "uid": "n0053",
  "version": 3
}
-->

Implementation of lib/report.sh; it [[fb-lib-report|serves|The lib/report.sh file is the concrete implementation that fulfills the isolated-runner and summary reporter bead.]]. It keeps bash-3.2-compatible parallel result arrays (report_init, report_add); run_isolated prints the step line, resets RUN_NOTE and RUN_STATUS, runs the step with combined output captured to a mktemp log, and on success records the step's RUN_STATUS (default ok; skip when do_skip ran) with its RUN_NOTE (e.g. 're-signed <path>' or the skip reason), or on failure records fail with the last three non-blank output lines (cut to 300 chars, or 'exit N (no output)') also echoed to stderr, then returns the step's rc; report_render prints ✅ rows with their note when present, ⏭ rows as 'skipped: <reason>', and ❌ rows with the error, an ok/skipped/failed/total count line, and returns non-zero only if any failed. RUN_NOTE and RUN_STATUS [[fb-lib-codesign|couples-with|sig_repair_row in lib/codesign.sh appends its re-sign notes to the same RUN_NOTE global that run_isolated resets and reads, and install_and_verify_row reads RUN_STATUS to skip repair, so the shared variable names are an implicit contract between the files.]] and RUN_STATUS is also set by [[fb-lib-methods-impl|couples-with|do_skip in lib/methods.sh sets RUN_STATUS=skip and RUN_NOTE to the reason, which run_isolated records as the row's status and note.]].
