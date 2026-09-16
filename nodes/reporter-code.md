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
    }
  ],
  "is_bead": false,
  "name": "reporter-code",
  "node_type": "impl",
  "obligations": [
    "r-fail-loud"
  ],
  "status": "drafting",
  "stratum": "components",
  "uid": "n0033",
  "version": 1
}
-->

Code unit: run-one-isolated (capture rc+stderr), accumulate, render ✅/❌ table, compute aggregate exit. Realizes [[result-capture-and-summary|flow]]. Accomplished by [[fb-lib-report|accomplished-by]].
