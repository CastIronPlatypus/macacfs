<!--stratified-action
{
  "created": 1789593935,
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
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0026",
  "version": 1
}
-->

Run-one-step-isolated (capture rc + stderr to a temp log), accumulate results, and a renderer that prints the ✅/❌ table and computes the aggregate exit code. Underpins [[isolated-runner-reporter|flow]]; the same renderer prints the dry-run plan. Accomplished by [[reporter-code|accomplished-by]].
