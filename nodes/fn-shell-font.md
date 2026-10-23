<!--stratified-action
{
  "created": 1792790700,
  "edges": [],
  "is_bead": false,
  "name": "fn-shell-font",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0187",
  "version": 1
}
-->

shell_font installs or upgrades the font-meslo-lg-nerd-font cask. Within the flow it [[lf-shell-setup|serves|shell_font is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_font is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_font lives in the lib/shell.sh implementation.]]. It [[fn-brew-pkg|calls|Cask install.]].
