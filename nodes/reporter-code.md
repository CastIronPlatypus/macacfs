<!--stratified-action
{
  "created": 1789594032,
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
      "dst": "result-capture-and-summary",
      "reason": "This code realizes the capture-and-summary subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-report",
      "reason": "The reporter lives in lib/report.sh.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-fail-loud",
      "reason": "This code unit captures rc and stderr per tool, renders the \u2705/\u274c table, and computes the aggregate exit, so a forced failure yields non-zero.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "reporter-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0033",
  "version": 1
}
-->

Code unit: run_isolated runs one step with its combined output captured to a temp log; on success it records ok plus any RUN_NOTE the step set, on failure it records the last three meaningful output lines (or 'exit N (no output)') and echoes a ✗ line, returning the step's rc without aborting the batch. Results accumulate in bash-3.2-safe parallel arrays (report_init / report_add), and report_render prints the ✅/❌ summary table with ok/failed/total counts, returning non-zero if any step failed. It [[result-capture-and-summary|serves|This code realizes the capture-and-summary subsystem.]] and is [[fb-lib-report|accomplished-by|The reporter lives in lib/report.sh.]]. It [[signature-repair-code|couples-with|run_isolated resets and later reads the global RUN_NOTE that sig_repair_row appends 're-signed <path>' to, which is how every re-sign reaches the summary.]] and [[shell-fns-code|couples-with|shell_run reuses report_init, run_isolated and report_render for its own per-step summary, so changes to the reporter's contract change the terminal-setup output too.]]
