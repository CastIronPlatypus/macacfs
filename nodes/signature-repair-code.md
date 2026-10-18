<!--stratified-action
{
  "created": 1792285758,
  "disc_stamp": {
    "disc-callout-distal": "1.0.0",
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
  "edges": [
    {
      "dst": "req-runnable-signatures",
      "reason": "the code unit that wraps each tool install with signature verification and repair",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "signature-repair-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0083",
  "version": 1
}
-->

Code unit in lib/codesign.sh: install_and_verify_row drops a temp mtime marker, dispatches the row's method, and on success runs sig_repair_row; _sig_candidates collects files written into the bin dirs (~/.local/bin, ~/.cargo/bin, ~/go/bin and GOPATH/bin, /usr/local/bin, /opt/homebrew/bin) since the marker, plus the brew formula's own files and the tool's CLI as it resolves on PATH; sig_repair_row de-duplicates by real path, skips non-Mach-O files, checks each with codesign -v --no-strict, and re-signs any failure ad-hoc (temporarily making it writable), re-verifies, appends 're-signed <path>' to RUN_NOTE, and returns non-zero if any binary stays invalid. It [[signature-verify-and-resign|serves|This code realizes the verify-and-resign subsystem.]] and is [[fb-lib-codesign|accomplished-by|The code unit lives in lib/codesign.sh.]]. It [[method-fns-code|calls|install_and_verify_row calls dispatch_row to perform the actual install before verifying signatures.]] and [[reporter-code|couples-with|Its re-sign notes reach the summary only through the global RUN_NOTE that run_isolated resets and records.]]
