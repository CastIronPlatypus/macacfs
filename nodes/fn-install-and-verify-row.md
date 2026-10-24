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
  "succeeds": "fn-install-and-verify-row@v1",
  "uid": "n0145",
  "version": 2
}
-->

install_and_verify_row <row> creates the SIG_MARKER temp file, dispatches the row and, when the install succeeded and the row was not skipped, runs sig_repair_row, then path_audit_row, then post_install_<ABBR> if lib/hooks.sh defines one, each only if the previous step passed; it removes the marker and returns the first failing code. Within the flow it [[lf-codesign-verify-repair|serves|install_and_verify_row is one of the functions that carries out this flow.]] and it starts [[lf-cli-path-audit|serves|It hands off to the path audit after the signature check.]] and [[lf-post-install-hook|serves|It runs the post-install hook last.]]. It is defined in the file boundary it [[fb-lib-codesign|serves|install_and_verify_row is defined in lib/codesign.sh.]]. It [[fn-dispatch-row|calls|The install itself.]]; it [[fn-sig-repair-row|calls|The post-install signature check.]]; it [[fn-path-audit-row|calls|The post-install CLI path audit.]]; it [[fn-post-install-dcg|calls|Through the post_install_<ABBR> lookup, for DCG.]] and [[fn-post-install-cm|calls|Through the post_install_<ABBR> lookup, for CM.]].
