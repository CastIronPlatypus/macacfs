<!--stratified-action
{
  "created": 1789594076,
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
      "dst": "reporter-code",
      "reason": "This file realizes the reporter.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-report-impl",
      "reason": "The reporter bead is delivered by lib/report.sh, which implements run_isolated, result accumulation, the summary table, and aggregate exit code.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-fail-loud",
      "reason": "lib/report.sh captures each tool's rc and stderr, renders failures as \u274c rows, and returns a non-zero aggregate exit, so failures are never swallowed.",
      "type": "validated-by"
    },
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "lib/report.sh renders the same table under --dry-run listing only intended actions, providing the 'prints what it would do' half of the requirement.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-report",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0042",
  "version": 1
}
-->

The lib/report.sh file boundary: run_isolated (run one step with its rc and combined output captured, recording ok with any RUN_NOTE or fail with the error tail), the result accumulator, and report_render (the ✅/❌ summary table with counts and a non-zero return if any step failed); under --dry-run callers record each step as ok '(dry-run)' and the same table is rendered. It [[reporter-code|serves|This file holds the reporter code unit.]] and is [[fb-lib-report-impl|accomplished-by|lib/report.sh implements run_isolated, result accumulation, the summary table, and the aggregate exit code.]].
