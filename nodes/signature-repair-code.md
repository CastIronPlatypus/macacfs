<!--stratified-action
{
  "created": 1792285758,
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
  "status": "drafting",
  "stratum": "components",
  "uid": "n0083",
  "version": 1
}
-->

Code unit: install_and_verify_row (marker, dispatch the row's method, then repair), sig_repair_row (verify, re-sign, re-verify, append a 're-signed <path>' RUN_NOTE, fail on unrepairable) and the candidate collector. Serves [[signature-verify-and-resign|serves|this code realizes the verify-and-resign subsystem]]. Accomplished by [[fb-lib-codesign|accomplished-by|the code unit lives in lib/codesign.sh]].
