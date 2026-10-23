<!--stratified-action
{
  "created": 1792790699,
  "edges": [],
  "is_bead": false,
  "name": "fn-sh-git-get",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0185",
  "version": 1
}
-->

_sh_git_get <url> <dir> [clone-flags...] fast-forwards an existing checkout (ignoring pull errors) or clones the repo with the given flags; under dry-run it prints. Within the flow it [[lf-shell-setup|serves|_sh_git_get is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|_sh_git_get is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of _sh_git_get lives in the lib/shell.sh implementation.]]. It [[fn-sh-dry|calls|Dry-run test.]].
