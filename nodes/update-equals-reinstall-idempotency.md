<!--stratified-action
{
  "created": 1789593708,
  "edges": [
    {
      "dst": "macacfs-command-surface",
      "reason": "The install/update commands are where re-run-to-latest idempotency is exercised.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-manual-cli-update",
      "reason": "Manual update re-runs each tool's latest-installing method, so idempotent in-place upgrades are what make 'macacfs update' for all or named tools safe.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "update-equals-reinstall-idempotency",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0004",
  "version": 1
}
-->

Update is 're-run the tool's own latest-installing method', so install and update largely share a code path. Risk: re-running must upgrade in place idempotently without duplicate shims or broken PATH; each method's install location must be known and stable. Accomplished by [[macacfs-command-surface|accomplished-by]].
