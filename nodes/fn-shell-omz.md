<!--stratified-action
{
  "created": 1792790700,
  "edges": [],
  "is_bead": false,
  "name": "fn-shell-omz",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0188",
  "version": 1
}
-->

shell_omz fast-forwards an existing ~/.oh-my-zsh checkout, or runs the Oh My Zsh installer unattended with RUNZSH=no, KEEP_ZSHRC=yes and CHSH=no; under dry-run it prints. Within the flow it [[lf-shell-setup|serves|shell_omz is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_omz is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_omz lives in the lib/shell.sh implementation.]]. It [[fn-sh-dry|calls|Dry-run test.]].
