<!--stratified-action
{
  "created": 1792790687,
  "edges": [],
  "is_bead": false,
  "name": "fn-ensure-uv",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0160",
  "version": 1
}
-->

ensure_uv brew-installs uv when missing. Within the flow it [[lf-prereq-ensure|serves|ensure_uv is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|ensure_uv is defined in lib/prereq.sh.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of ensure_uv lives in the lib/prereq.sh implementation.]]. It [[fn-ensure-brew-pkg|calls|Delegates to the brew package helper.]].
