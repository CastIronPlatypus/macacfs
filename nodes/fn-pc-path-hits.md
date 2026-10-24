<!--stratified-action
{
  "created": 1792865409,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this function is part of the check",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-pc-path-hits",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0298",
  "version": 1
}
-->

_pc_path_hits <name> walks PATH in order and prints '<path><TAB><realpath>' for each executable named <name>, skipping directories and any real path already seen. Within the flow it [[lf-cli-path-audit|serves|It lists what PATH resolves.]]. It is defined in [[fb-lib-pathcheck|serves|Defined in lib/pathcheck.sh.]].
