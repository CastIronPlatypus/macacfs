<!--stratified-action
{
  "created": 1792790701,
  "edges": [],
  "is_bead": false,
  "name": "fn-shell-zshrc",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0190",
  "version": 1
}
-->

shell_zshrc copies share/zshrc.mac.zsh to ~/.macacfs.zshrc, backs up an existing ~/.zshrc that lacks the managed marker, and writes a two-line managed ~/.zshrc that sources the body; under dry-run it prints. Within the flow it [[lf-shell-setup|serves|shell_zshrc is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_zshrc is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_zshrc lives in the lib/shell.sh implementation.]]. It [[fn-sh-dry|calls|Dry-run test.]].
