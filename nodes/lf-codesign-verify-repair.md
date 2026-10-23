<!--stratified-action
{
  "created": 1792790758,
  "edges": [
    {
      "dst": "req-runnable-signatures",
      "reason": "every installed Mach-O must pass the kernel's signature check",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-codesign-verify-repair",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0211",
  "version": 1
}
-->

Signature verify-and-repair: install_and_verify_row creates a timestamp marker file, dispatches the row, and, when the install succeeded and was not a skip, gathers candidates (files newer than the marker in the known bin directories, the brew formula's files, and the tool's CLI as resolved on PATH), de-duplicates them by real path, keeps only Mach-O files, and checks each with codesign -v --no-strict; a failing binary is made writable if needed, re-signed ad-hoc, re-verified, its mode restored, and 're-signed <path>' appended to RUN_NOTE; a binary that still fails makes the tool fail. The marker is always removed. This flow [[fb-lib-codesign|serves|The flow is realized by code in lib/codesign.sh.]]. It is carried out step by step by [[fn-sig-scan-dirs|accomplished-by|_sig_scan_dirs performs part of this flow.]], [[fn-sig-candidates|accomplished-by|_sig_candidates performs part of this flow.]], [[fn-sig-repair-row|accomplished-by|sig_repair_row performs part of this flow.]], [[fn-install-and-verify-row|accomplished-by|install_and_verify_row performs part of this flow.]]. Related flows: [[lf-method-dispatch|flow|The install itself is dispatch_row.]]; [[lf-isolated-run-report|flow|Re-sign notes and failures flow into the summary via RUN_NOTE and the return code.]].
