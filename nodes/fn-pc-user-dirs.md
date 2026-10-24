<!--stratified-action
{
  "created": 1792865411,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this function is part of the check",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-pc-user-dirs",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0301",
  "version": 1
}
-->

_pc_user_dirs prints the user bin dirs macacfs's own methods install into: ~/.local/bin, ~/.cargo/bin and ~/go/bin. Within the flow it [[lf-cli-path-audit|serves|It names the dirs.]]. It is defined in [[fb-lib-pathcheck|serves|Defined in lib/pathcheck.sh.]].
