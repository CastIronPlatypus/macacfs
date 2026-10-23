<!--stratified-action
{
  "created": 1792790756,
  "edges": [
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "cargo-git tools are built from their git repo",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-install-cargo-git",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0207",
  "version": 1
}
-->

Cargo-from-git path: do_cargo_git runs cargo install --git <ref> --force plus any extra row args (for example --bin), through the _m_run dry-run wrapper; --force makes a rerun rebuild the latest commit, so install equals update. This flow [[fb-lib-methods|serves|The flow is realized by code in lib/methods.sh.]]. It is carried out step by step by [[fn-m-run|accomplished-by|_m_run performs part of this flow.]], [[fn-do-cargo-git|accomplished-by|do_cargo_git performs part of this flow.]].
