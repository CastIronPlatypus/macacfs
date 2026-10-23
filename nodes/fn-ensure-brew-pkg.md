<!--stratified-action
{
  "created": 1792790686,
  "edges": [],
  "is_bead": false,
  "name": "fn-ensure-brew-pkg",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0157",
  "version": 1
}
-->

_ensure_brew_pkg <cmd> <formula> returns when the command exists, otherwise brew-installs the formula and records it in PREREQ_INSTALLED; under dry-run it prints. Within the flow it [[lf-prereq-ensure|serves|_ensure_brew_pkg is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|_ensure_brew_pkg is defined in lib/prereq.sh.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of _ensure_brew_pkg lives in the lib/prereq.sh implementation.]]. It [[fn-have|calls|Checks the command first.]].
