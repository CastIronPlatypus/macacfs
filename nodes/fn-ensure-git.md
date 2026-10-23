<!--stratified-action
{
  "created": 1792790688,
  "edges": [],
  "is_bead": false,
  "name": "fn-ensure-git",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0162",
  "version": 1
}
-->

ensure_git brew-installs git when missing. Within the flow it [[lf-prereq-ensure|serves|ensure_git is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|ensure_git is defined in lib/prereq.sh.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of ensure_git lives in the lib/prereq.sh implementation.]]. It [[fn-ensure-brew-pkg|calls|Delegates to the brew package helper.]].
