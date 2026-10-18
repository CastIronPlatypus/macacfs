<!--stratified-action
{
  "created": 1789593709,
  "edges": [
    {
      "dst": "macacfs-command-surface",
      "reason": "TEST: is accomplished-by the ladder edge that clears leaf-not-bead?",
      "type": "accomplished-by"
    },
    {
      "dst": "req-minimal-scope",
      "reason": "This problem names scope creep toward full ACFS as the main risk and demands every node trace to the four allowed features, mirroring the minimal-scope requirement.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "scope-containment",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0010",
  "version": 1
}
-->

The strongest risk is scope creep back toward full ACFS. The user constrained this to: install tools, install a weekly-update plist, manual update CLI, and self-update — nothing else (no user provisioning, OS upgrade, service orchestration, phase runner). Every node must trace to one of those or be cut. Accomplished by [[macacfs-command-surface|accomplished-by]].
