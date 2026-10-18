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
      "dst": "install-experience",
      "reason": "Correct macOS installs are delivered through the install experience.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-install-whole-suite",
      "reason": "Recording verified per-tool macOS behavior, including SRPS, GIIL, and ASB lacking Darwin branches, is needed so all 39 tools actually install on a Mac.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "darwin-truth-per-tool",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0002",
  "version": 1
}
-->

The problem of per-tool macOS truth: most upstream installers branch on Darwin, but three (SRPS, GIIL, ASB) lack an explicit macOS branch, yet GIIL (node) and ASB (bash) still run on a Mac and SRPS is Linux-oriented, so macacfs must encode the verified per-tool install method and flags in its catalog rather than assume every install.sh works everywhere. It is [[install-experience|accomplished-by|The install experience delivers correct per-tool macOS installs driven by those verified catalog entries.]].
