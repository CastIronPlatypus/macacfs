<!--stratified-action
{
  "created": 1792790681,
  "edges": [
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "it prints instead of executing under dry-run",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-m-run",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0147",
  "version": 1
}
-->

_m_run <cmd...> prints '[dry-run] <cmd>' and returns 0 when DRY_RUN=1, otherwise executes the command. Within the flow it [[lf-dry-run-propagation|serves|_m_run is one of the functions that carries out this flow.]], and [[lf-install-cargo-git|serves|_m_run is one of the functions that carries out this flow.]], and [[lf-install-go|serves|_m_run is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-methods|serves|_m_run is defined in lib/methods.sh.]], and its code is [[fb-lib-methods-impl|accomplished-by|The concrete code of _m_run lives in the lib/methods.sh implementation.]].
