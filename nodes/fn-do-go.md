<!--stratified-action
{
  "created": 1792790683,
  "edges": [],
  "is_bead": false,
  "name": "fn-do-go",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0151",
  "version": 1
}
-->

do_go <module> appends @latest when the module has no version and runs go install on it. Within the flow it [[lf-install-go|serves|do_go is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-methods|serves|do_go is defined in lib/methods.sh.]], and its code is [[fb-lib-methods-impl|accomplished-by|The concrete code of do_go lives in the lib/methods.sh implementation.]]. It [[fn-m-run|calls|Execution goes through the dry-run wrapper.]].
