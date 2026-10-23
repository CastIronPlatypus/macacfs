<!--stratified-action
{
  "created": 1792790687,
  "edges": [],
  "is_bead": false,
  "name": "fn-ensure-go",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0159",
  "version": 1
}
-->

ensure_go brew-installs go when the go command is missing. Within the flow it [[lf-prereq-ensure|serves|ensure_go is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|ensure_go is defined in lib/prereq.sh.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of ensure_go lives in the lib/prereq.sh implementation.]]. It [[fn-ensure-brew-pkg|calls|Delegates to the brew package helper.]].
