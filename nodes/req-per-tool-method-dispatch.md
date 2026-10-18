<!--stratified-action
{
  "accept": "Each manifest row names exactly one of brew, installer-sh, cargo-git, go; the dispatcher handles those four and fails loud on any other method; installing a sample of each method the catalog uses (brew, installer-sh, cargo-git) succeeds on the Mac.",
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
  "legacy_id": "r-method-dispatch",
  "name": "req-per-tool-method-dispatch",
  "node_type": "requirement",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0085",
  "version": 1
}
-->

Per-tool install/update dispatch across 4 methods: brew (Homebrew tap formula, install-or-upgrade), installer-sh (the repo's own installer via curl|bash, with optional flags), cargo-git (cargo install --git --force), and go (go install <module>@latest).
