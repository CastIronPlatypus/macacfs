<!--stratified-action
{
  "created": 1792790698,
  "edges": [],
  "is_bead": false,
  "name": "fn-sh-brew-prefix",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0183",
  "version": 1
}
-->

_sh_brew_prefix prints brew --prefix, falling back to /opt/homebrew. Within the flow it [[lf-shell-setup|serves|_sh_brew_prefix is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|_sh_brew_prefix is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of _sh_brew_prefix lives in the lib/shell.sh implementation.]].
