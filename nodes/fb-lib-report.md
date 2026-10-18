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
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0042",
  "version": 1
}
-->

lib/report.sh — run_isolated (capture rc+stderr), accumulate results, render ✅/❌ table, aggregate exit code. Bead.
