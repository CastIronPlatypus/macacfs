<!--stratified-action
{
  "created": 1789593708,
  "edges": [
    {
      "dst": "install-experience",
      "reason": "The install experience is where per-tool method dispatch is made observable.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "heterogeneous-install-methods",
  "node_type": "problem",
  "obligations": [
    "r-method-dispatch"
  ],
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0001",
  "version": 1
}
-->

The 39 tools do NOT share one install path: ~31 have their own install.sh, MS+SRPS relate to Homebrew, SLB uses go, RP+CAUT are cargo crates, PCR's installer is renamed, GIIL is npm, ASB is bash. A naive loop breaks on ~9; the core need is per-tool method dispatch. Accomplished by [[install-experience|accomplished-by]].
