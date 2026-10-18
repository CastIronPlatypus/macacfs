<!--stratified-action
{
  "created": 1789593708,
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0004",
  "version": 1
}
-->

Update is 're-run the tool's own latest-installing method', so install and update share one code path (only the mode label differs): brew installs or upgrades, installer-sh re-runs the repo's installer, cargo-git reinstalls with --force, and go installs @latest. Risk: re-running must upgrade in place idempotently — no duplicate shims, no repeated backups of files macacfs itself wrote, no broken PATH — so each method's install location must be known and stable and each managed file must be recognizable as macacfs's own. The problem is [[macacfs-command-surface|accomplished-by|The install and update commands run the same latest-installing engine, which is where this re-run-to-latest idempotency is exercised.]]
