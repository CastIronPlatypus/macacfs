<!--stratified-action
{
  "accept": "On a Mac missing e.g. go, running macacfs installs go before the tools that need it; gate reports what it installed.",
  "created": 1789593646,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "legacy_id": "r-prereq-autoinstall",
  "name": "req-prerequisite-autoinstall",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0088",
  "version": 1
}
-->

Prerequisite gate checks for required toolchains (git, curl, Homebrew, rust/cargo, go, uv, node/bun) and INSTALLS any that are missing, not just reports them.
