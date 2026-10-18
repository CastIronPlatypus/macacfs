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
      "reason": "collects a tool's installed binaries and runs codesign verify/re-sign over them",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "signature-verify-and-resign",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "succeeds": "signature-verify-and-resign@v1",
  "uid": "n0082",
  "version": 2
}
-->

Collect one tool's candidate binaries — files written into the bin dirs (~/.local/bin, ~/.cargo/bin, GOPATH/bin, /usr/local/bin, /opt/homebrew/bin) during its install, the brew formula's own files, and its CLI as resolved on PATH — dedupe by real path, keep Mach-O files, and verify each with codesign -v --no-strict: the hash/seal check the kernel enforces at launch, not strict layout validation (which rejects runnable Bun binaries like brenner 0.4.1). Failures are re-signed with codesign --force -s - (temporarily making read-only Cellar files writable) and re-verified the same way. Serves [[signature-repair|serves|this subsystem is the mechanism behind the signature-repair capability]]. Accomplished by [[signature-repair-code|accomplished-by|the subsystem is realized by the signature-repair code unit]].
