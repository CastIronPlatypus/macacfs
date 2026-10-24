<!--stratified-action
{
  "created": 1792865410,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this function is part of the check",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-pc-same-tool",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0299",
  "version": 1
}
-->

_pc_same_tool <a> <b> runs each binary's --version under a 5-second alarm with stdin closed and succeeds when the first word of the first line is the same non-empty program name (br 0.4.0 and br 0.7.6 match; tclsh's pt and process_triage's pt do not). Within the flow it [[lf-cli-path-audit|serves|It tells stale copies from foreign programs.]]. It is defined in [[fb-lib-pathcheck|serves|Defined in lib/pathcheck.sh.]].
