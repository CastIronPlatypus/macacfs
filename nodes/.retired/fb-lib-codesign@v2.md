<!--stratified-action
{
  "bound_at": "0.15.0",
  "created": 1792285759,
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
      "reason": "lib/codesign.sh is the file that verifies and re-signs installed binaries",
      "type": "validated-by"
    }
  ],
  "impl_path": "lib/codesign.sh",
  "is_bead": true,
  "name": "fb-lib-codesign",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "retire_reason": "install_and_verify_row no longer runs signature repair for rows the dispatcher marked skipped.",
  "retired_at": 1792289523,
  "status": "retired",
  "stratum": "file-boundaries",
  "succeeds": "fb-lib-codesign@v1",
  "uid": "n0084",
  "version": 2
}
-->

The lib/codesign.sh file boundary: install_and_verify_row (drop a mktemp marker, dispatch_row, then sig_repair_row on success), sig_repair_row (dedupe candidates by realpath, keep only Mach-O files, verify with codesign -v --no-strict, re-sign failures ad-hoc with codesign --force -s - after temporarily making read-only files writable, re-verify, and fail the tool if any binary stays invalid) and the candidate collector (files newer than the marker in the user/brew bin dirs plus GOPATH/bin, the brew formula's own files, and the tool's CLI as resolved on PATH). run_tools calls it for every tool so no installed binary is left with a signature the kernel would reject. It [[signature-repair-code|serves|This file realizes the signature-repair code unit.]]. Each repair is appended to RUN_NOTE, which [[fb-lib-report|couples-with|run_isolated in lib/report.sh resets the RUN_NOTE global before the step and records it as the ✅ row's note, so the re-sign report only surfaces if both files keep that shared variable name and contract.]].
