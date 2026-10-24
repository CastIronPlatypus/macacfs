<!--stratified-action
{
  "created": 1792865408,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this function is part of the check",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-pc-quarantine",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0296",
  "version": 1
}
-->

_pc_quarantine <path> creates MACACFS_SHADOW_DIR and moves the file there as <name>.<YYYYmmddHHMMSS>, printing the new path; it never deletes. Within the flow it [[lf-cli-path-audit|serves|It moves stale copies aside.]]. It is defined in [[fb-lib-pathcheck|serves|Defined in lib/pathcheck.sh.]].
