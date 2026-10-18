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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0001",
  "version": 1
}
-->

The problem of heterogeneous install paths: the 39 suite tools do not share one install route. Research found most ship their own install.sh, some publish Homebrew formulae, some are cargo crates or Go modules, PCR's installer has a non-standard name (install-post-compact-reminder.sh), and GIIL (node) and ASB (bash) are runtime-specific, so a naive single loop breaks on several of them and the core need is per-tool method dispatch from a catalog. As resolved today the catalog uses four methods: 15 brew (dicklesworthstone/tap, including SLB), 20 installer-sh (including PCR, GIIL, ASB and SRPS), 4 cargo-git (MS, RP, CAUT, JFP with --bin jfp), and go (no rows at present). It is [[install-experience|accomplished-by|The install experience is where per-tool method dispatch becomes observable as one command installing every tool its own way.]].
