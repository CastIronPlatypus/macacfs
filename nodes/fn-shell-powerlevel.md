<!--stratified-action
{
  "created": 1792790715,
  "edges": [],
  "is_bead": false,
  "name": "fn-shell-powerlevel",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0198",
  "version": 1
}
-->

shell_p10k clones or updates Powerlevel10k into the Oh My Zsh custom themes directory and copies share/p10k.zsh to ~/.p10k.zsh. Within the flow it [[lf-shell-setup|serves|shell_p10k is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_p10k is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_p10k lives in the lib/shell.sh implementation.]]. It [[fn-sh-git-get|calls|Clone or update the theme.]]; it [[fn-sh-dry|calls|Dry-run test.]].
