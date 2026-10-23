<!--stratified-action
{
  "created": 1792790699,
  "edges": [],
  "is_bead": false,
  "name": "fn-shell-brew-bundle",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0186",
  "version": 1
}
-->

shell_brew_bundle reads share/shell-bundle.tsv (kind, name, provides), skipping comments and blanks, installs or upgrades each entry, and returns 1 if the file is missing or any entry failed. Within the flow it [[lf-shell-setup|serves|shell_brew_bundle is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_brew_bundle is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_brew_bundle lives in the lib/shell.sh implementation.]]. It [[fn-brew-pkg|calls|Each bundle entry.]].
