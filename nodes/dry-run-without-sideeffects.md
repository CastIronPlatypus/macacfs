<!--stratified-action
{
  "created": 1789593709,
  "edges": [
    {
      "dst": "run-report-surface",
      "reason": "Dry-run is shown through the run report.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "dry-run-without-sideeffects",
  "node_type": "problem",
  "obligations": [
    "r-dry-run"
  ],
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0008",
  "version": 1
}
-->

A true dry-run must thread through every method and perform NO network installs or disk changes — printing intended actions only, enforced at each dispatch branch. Accomplished by [[run-report-surface|accomplished-by]].
