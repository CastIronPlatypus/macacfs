<!--stratified-action
{
  "created": 1792790757,
  "edges": [
    {
      "dst": "req-macos-only",
      "reason": "catalogued Linux-only tools are skipped on macOS with a stated reason",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-install-skip",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0209",
  "version": 1
}
-->

Skip path: for a row whose method is skip, do_skip installs nothing, prints the reason held in the ref column, and sets RUN_STATUS=skip and RUN_NOTE to the reason so the report shows the row as skipped rather than ok, and install_and_verify_row omits the signature check. This flow [[fb-lib-methods|serves|The flow is realized by code in lib/methods.sh.]]. It is carried out step by step by [[fn-do-skip|accomplished-by|do_skip performs part of this flow.]]. Related flows: [[lf-isolated-run-report|flow|RUN_STATUS and RUN_NOTE carry the skip into the summary.]].
