<!--stratified-action
{
  "created": 1792790757,
  "edges": [
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "go tools are installed as Go module binaries",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-install-go",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0208",
  "version": 1
}
-->

Go-module path: do_go appends @latest to the module ref when it carries no version and runs go install through the _m_run dry-run wrapper. This flow [[fb-lib-methods|serves|The flow is realized by code in lib/methods.sh.]]. It is carried out step by step by [[fn-m-run|accomplished-by|_m_run performs part of this flow.]], [[fn-do-go|accomplished-by|do_go performs part of this flow.]].
