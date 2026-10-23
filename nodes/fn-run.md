<!--stratified-action
{
  "created": 1792790685,
  "edges": [
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "it prints instead of executing under dry-run",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-run",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0155",
  "version": 1
}
-->

_run <cmd...> is prereq.sh's dry-run wrapper: it prints '[dry-run] <cmd>' when DRY_RUN=1, otherwise executes the command. Within the flow it [[lf-prereq-ensure|serves|_run is one of the functions that carries out this flow.]], and [[lf-dry-run-propagation|serves|_run is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|_run is defined in lib/prereq.sh.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of _run lives in the lib/prereq.sh implementation.]].
