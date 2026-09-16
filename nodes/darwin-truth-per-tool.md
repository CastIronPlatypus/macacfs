<!--stratified-action
{
  "created": 1789593708,
  "edges": [
    {
      "dst": "install-experience",
      "reason": "Correct macOS installs are delivered through the install experience.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "darwin-truth-per-tool",
  "node_type": "problem",
  "obligations": [
    "r-install-all"
  ],
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0002",
  "version": 1
}
-->

Most installers branch on Darwin, but 3 (SRPS, GIIL, ASB) lack an explicit macOS branch — yet GIIL (node) and ASB (bash) still run on Mac, and SRPS is Linux-oriented. We must encode the VERIFIED per-tool truth rather than assume install.sh works everywhere. Accomplished by [[install-experience|accomplished-by]].
