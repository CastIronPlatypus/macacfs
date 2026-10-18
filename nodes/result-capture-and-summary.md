<!--stratified-action
{
  "created": 1789593935,
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
      "dst": "isolated-runner-reporter",
      "reason": "The runner/reporter is built from isolated-step capture plus the summary renderer.",
      "type": "serves"
    },
    {
      "dst": "reporter-code",
      "reason": "The capture/summary subsystem is realized by the reporter code.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-fail-loud",
      "reason": "Logging each step's rc and stderr to a temp file and computing an aggregate exit ensures failed tools surface with error output instead of vanishing.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "result-capture-and-summary",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0026",
  "version": 1
}
-->

Run each step isolated (combined output captured to a temp log, rc kept, the batch never aborted), accumulate a per-step ok/fail result with a short message (the step's note on success, its last meaningful output lines on failure), and render the ✅/❌ summary table with ok/failed/total counts, returning a non-zero aggregate exit if any step failed. Under dry-run steps are not isolated; each is recorded ok '(dry-run)' and the same renderer prints them. It [[isolated-runner-reporter|serves|The runner/reporter capability is built from this isolated-step capture plus the summary renderer.]] and is [[reporter-code|accomplished-by|The capture-and-summary subsystem is realized by the reporter code in lib/report.sh.]]
