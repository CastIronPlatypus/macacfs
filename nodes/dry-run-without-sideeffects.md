<!--stratified-action
{
  "created": 1789593709,
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0008",
  "version": 1
}
-->

The problem of a true dry-run: --dry-run must thread (as the exported DRY_RUN flag) through every install method, prerequisite installer, shell-setup step and self-update path, so each one prints its intended action instead of performing any network install or disk change, and the run still ends in a summary that marks each step as dry-run. It is [[run-report-surface|accomplished-by|The run report surface is where the printed intended actions and the dry-run summary are shown to the observer.]].
