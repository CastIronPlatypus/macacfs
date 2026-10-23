<!--stratified-action
{
  "created": 1792790754,
  "edges": [
    {
      "dst": "req-prerequisite-autoinstall",
      "reason": "missing toolchains are installed, not merely reported",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-prereq-ensure",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0203",
  "version": 1
}
-->

Prerequisite check: prereq_ensure receives the methods in play and, best-effort, always ensures Homebrew (via its official non-interactive installer, then brew shellenv for the running process) and git; cargo-git or installer-sh rows add Rust via rustup, go or installer-sh rows add Go, and installer-sh rows add uv, node, minisign and flock, each brew-installed only when its command is missing. Anything installed is listed; anything it could not provide is warned on stderr, and it always returns 0 so the tool that truly needs it fails loudly at its own step. This flow [[fb-lib-prereq|serves|The flow is realized by code in lib/prereq.sh.]]. It is carried out step by step by [[fn-have|accomplished-by|_have performs part of this flow.]], [[fn-run|accomplished-by|_run performs part of this flow.]], [[fn-ensure-homebrew|accomplished-by|ensure_homebrew performs part of this flow.]], [[fn-ensure-brew-pkg|accomplished-by|_ensure_brew_pkg performs part of this flow.]], [[fn-ensure-rust|accomplished-by|ensure_rust performs part of this flow.]], [[fn-ensure-go|accomplished-by|ensure_go performs part of this flow.]], [[fn-ensure-uv|accomplished-by|ensure_uv performs part of this flow.]], [[fn-ensure-node|accomplished-by|ensure_node performs part of this flow.]], [[fn-ensure-git|accomplished-by|ensure_git performs part of this flow.]], [[fn-ensure-minisign|accomplished-by|ensure_minisign performs part of this flow.]], [[fn-ensure-flock|accomplished-by|ensure_flock performs part of this flow.]], [[fn-prereq-ensure|accomplished-by|prereq_ensure performs part of this flow.]]. Related flows: [[lf-method-dispatch|flow|Toolchains must be present before the method functions run.]].
