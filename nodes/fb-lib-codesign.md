<!--stratified-action
{
  "bound_at": "0.15.0",
  "created": 1792285759,
  "edges": [
    {
      "dst": "req-runnable-signatures",
      "reason": "lib/codesign.sh is the file that verifies and re-signs installed binaries",
      "type": "validated-by"
    }
  ],
  "impl_path": "lib/codesign.sh",
  "is_bead": true,
  "name": "fb-lib-codesign",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0084",
  "version": 1
}
-->

lib/codesign.sh — install_and_verify_row, sig_repair_row and the candidate collector; called by run_tools for every tool so no installed binary is left with an invalid signature. Serves [[signature-repair-code|serves|this file realizes the signature-repair code unit]]. Bead.
