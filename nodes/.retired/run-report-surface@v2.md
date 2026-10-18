<!--stratified-action
{
  "created": 1789593837,
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
    },
    {
      "dst": "req-runnable-signatures",
      "reason": "the summary names each re-signed binary so signature repair is reported, never silent",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "run-report-surface",
  "node_type": "surface",
  "realized_at": "0.15.0",
  "retire_reason": "The summary now has a third status: skipped tools (Linux-only rows) appear with their reason and do not fail the run.",
  "retired_at": 1792289523,
  "status": "retired",
  "stratum": "surface",
  "succeeds": "run-report-surface@v1",
  "uid": "n0014",
  "version": 2
}
-->

Every install/update run ends with a per-tool ✅/❌ summary table (with ok/failed/total counts) showing what succeeded and the captured error for what failed; the process exits non-zero if any tool failed (no silent swallowing). A full no-selector install or update prints a second table of the same shape for the terminal-environment steps. A ✅ row also carries any note its step recorded — e.g. 're-signed <path>' for each binary whose invalid code signature was repaired — so a repair is visible, never silent. Under --dry-run nothing is installed: each intended command is printed as a [dry-run] line and every table row reads '(dry-run)'. This surface [[fail-loud-aggregation|serves|The ✅/❌ summary and non-zero exit are how fail-loud aggregation surfaces to the observer.]] and [[dry-run-without-sideeffects|serves|Dry-run is observed through the same report, showing intended rather than executed actions.]]. It is [[isolated-runner-reporter|accomplished-by|The report is produced by the isolated runner/reporter.]]. It [[signature-repair|couples-with|The 're-signed <path>' notes on ✅ rows are written from a distance by signature repair into the shared run note, so the report's content depends on that capability's note format.]]
