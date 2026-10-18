<!--stratified-action
{
  "created": 1789594981,
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
  "realized_at": "0.14.0",
  "realized_fp": "1789594932:3794",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-lib-prereq-impl@v1",
  "uid": "n0052",
  "version": 2
}
-->

Implementation of fb-lib-prereq: `lib/prereq.sh` — ensure_homebrew, ensure_git, ensure_rust, ensure_go/uv/node, ensure_minisign and ensure_flock (brew formulas), and prereq_ensure, which picks the set from the selected methods (installer-sh pulls rust, go, uv, node, minisign, flock), reports what it installed and warns loudly about anything it could not provide.
