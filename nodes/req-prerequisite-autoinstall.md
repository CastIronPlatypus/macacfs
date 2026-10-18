<!--stratified-action
{
  "accept": "On a Mac missing e.g. go, running macacfs installs go before the tools that need it; gate reports what it installed.",
  "created": 1789593646,
  "disc_stamp": {
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "legacy_id": "r-prereq-autoinstall",
  "name": "req-prerequisite-autoinstall",
  "node_type": "requirement",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0088",
  "version": 1
}
-->

Prerequisite gate checks for the toolchains the selected tools need (Homebrew, git, rust/cargo, go, uv, node, plus minisign and flock for installers that verify or serialize with them; curl is assumed from macOS) and INSTALLS any that are missing, not just reports them.
