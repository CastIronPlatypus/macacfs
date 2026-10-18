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
      "dst": "macacfs-command-surface",
      "reason": "The deliberately small command surface (install, update, self-update, schedule, list, version, help) is how scope stays contained to the allowed features.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-minimal-scope",
      "reason": "This problem names scope creep toward full ACFS as the main risk and demands every node trace to the allowed features (tools, terminal environment, weekly plist, manual update, self-update), mirroring the minimal-scope requirement.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "scope-containment",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0010",
  "version": 1
}
-->

The strongest risk is scope creep back toward full ACFS. The user constrained this to: install the tools, set up the macOS terminal environment (as part of a full install), install a weekly-update LaunchAgent plist, update tools manually via the CLI, and self-update — nothing else (no user provisioning, OS upgrade, service orchestration, phase runner). Every node must trace to one of those or be cut. The problem is [[macacfs-command-surface|accomplished-by|The deliberately small command surface (install, update, self-update, schedule, list, version, help) is how scope stays contained to the allowed features.]]
