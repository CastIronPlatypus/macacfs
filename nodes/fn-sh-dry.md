<!--stratified-action
{
  "created": 1792790698,
  "edges": [
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "it is the shell provisioning steps' dry-run test",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-sh-dry",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0182",
  "version": 1
}
-->

_sh_dry returns true when DRY_RUN=1. Within the flow it [[lf-shell-setup|serves|_sh_dry is one of the functions that carries out this flow.]], and [[lf-dry-run-propagation|serves|_sh_dry is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|_sh_dry is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of _sh_dry lives in the lib/shell.sh implementation.]].
