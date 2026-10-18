<!--stratified-action
{
  "created": 1789593709,
  "edges": [
    {
      "dst": "run-report-surface",
      "reason": "Dry-run is shown through the run report.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "This problem states the dry-run must be threaded through every dispatch branch with no network installs or disk changes, which is the requirement's acceptance condition.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "dry-run-without-sideeffects",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0008",
  "version": 1
}
-->

A true dry-run must thread through every method and perform NO network installs or disk changes — printing intended actions only, enforced at each dispatch branch. Accomplished by [[run-report-surface|accomplished-by]].
