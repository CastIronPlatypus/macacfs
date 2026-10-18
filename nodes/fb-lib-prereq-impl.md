<!--stratified-action
{
  "created": 1789594981,
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
      "dst": "fb-lib-prereq",
      "reason": "The lib/prereq.sh source file is the implementation satisfying the toolchain-prerequisite bead.",
      "type": "serves"
    }
  ],
  "impl_path": "lib/prereq.sh",
  "is_bead": true,
  "name": "fb-lib-prereq-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594932:3794",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-lib-prereq-impl@v1",
  "uid": "n0052",
  "version": 2
}
-->

Implementation of lib/prereq.sh; it [[fb-lib-prereq|serves|The lib/prereq.sh source file is the implementation satisfying the toolchain-prerequisite bead.]]. It defines ensure_homebrew (non-interactive official installer, then brew shellenv for Apple Silicon or Intel), ensure_git, ensure_go/uv/node, ensure_minisign and ensure_flock (brew formulas via _ensure_brew_pkg), ensure_rust (rustup, then sourcing ~/.cargo/env), all DRY_RUN-aware, and prereq_ensure, which always ensures Homebrew and git, adds rust for cargo-git, go for go, and rust, go, uv, node, minisign and flock whenever any installer-sh tool is selected, reports what it installed, warns loudly on stderr about anything it could not provide, and always returns 0 so each dependent tool fails loudly at its own step. Its method matching [[fb-manifest-tsv-impl|couples-with|prereq_ensure pattern-matches the literal method names cargo-git, installer-sh and go from the manifest's method column, so renaming a method there silently drops its toolchain.]].
