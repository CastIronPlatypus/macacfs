<!--stratified-action
{
  "created": 1792790681,
  "edges": [
    {
      "dst": "req-runnable-signatures",
      "reason": "every install is followed by a signature check",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-install-and-verify-row",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0145",
  "version": 1
}
-->

install_and_verify_row <row> creates the SIG_MARKER temp file, dispatches the row, runs sig_repair_row when the install succeeded and the row was not skipped, removes the marker, and returns the first failing code. Within the flow it [[lf-codesign-verify-repair|serves|install_and_verify_row is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-codesign|serves|install_and_verify_row is defined in lib/codesign.sh.]]. It [[fn-dispatch-row|calls|The install itself.]]; it [[fn-sig-repair-row|calls|The post-install signature check.]].
