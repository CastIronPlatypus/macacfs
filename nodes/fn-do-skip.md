<!--stratified-action
{
  "created": 1792790684,
  "edges": [
    {
      "dst": "req-macos-only",
      "reason": "Linux-only tools are skipped with their reason",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-do-skip",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0152",
  "version": 1
}
-->

do_skip <reason> prints 'skipped: <reason>' and sets RUN_STATUS=skip and RUN_NOTE=<reason>, installing nothing. Within the flow it [[lf-install-skip|serves|do_skip is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-methods|serves|do_skip is defined in lib/methods.sh.]], and its code is [[fb-lib-methods-impl|accomplished-by|The concrete code of do_skip lives in the lib/methods.sh implementation.]].
