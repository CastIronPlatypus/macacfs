<!--stratified-action
{
  "created": 1789593708,
  "edges": [
    {
      "dst": "install-experience",
      "reason": "The install experience is where per-tool method dispatch is made observable.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "Because the 39 tools split across install.sh, Homebrew, go, cargo, npm, and bash, a naive loop fails on about nine, which motivates per-tool method dispatch.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "heterogeneous-install-methods",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0001",
  "version": 1
}
-->

The 39 tools do NOT share one install path: ~31 have their own install.sh, MS+SRPS relate to Homebrew, SLB uses go, RP+CAUT are cargo crates, PCR's installer is renamed, GIIL is npm, ASB is bash. A naive loop breaks on ~9; the core need is per-tool method dispatch. Accomplished by [[install-experience|accomplished-by]].
