<!--stratified-action
{
  "created": 1792790701,
  "edges": [],
  "is_bead": false,
  "name": "fn-shell-plugins",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0189",
  "version": 1
}
-->

shell_plugins clones or updates zsh-autosuggestions and zsh-syntax-highlighting into the Oh My Zsh custom plugins directory. Within the flow it [[lf-shell-setup|serves|shell_plugins is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_plugins is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_plugins lives in the lib/shell.sh implementation.]]. It [[fn-sh-git-get|calls|Clone or update each plugin.]].
