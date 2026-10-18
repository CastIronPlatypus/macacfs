<!--stratified-action
{
  "created": 1789594032,
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
  "status": "drafting",
  "stratum": "components",
  "uid": "n0033",
  "version": 1
}
-->

Code unit: run-one-isolated (capture rc+stderr), accumulate, render ✅/❌ table, compute aggregate exit. Realizes [[result-capture-and-summary|flow]]. Accomplished by [[fb-lib-report|accomplished-by]].
