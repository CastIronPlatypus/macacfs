<!--stratified-action
{
  "created": 1792790703,
  "edges": [],
  "is_bead": false,
  "name": "fn-shell-astgrep",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0194",
  "version": 1
}
-->

shell_astgrep installs or upgrades the ast-grep formula. Within the flow it [[lf-shell-setup|serves|shell_astgrep is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_astgrep is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_astgrep lives in the lib/shell.sh implementation.]]. It [[fn-brew-pkg|calls|Formula install.]].
