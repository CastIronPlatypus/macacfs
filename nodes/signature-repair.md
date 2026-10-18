<!--stratified-action
{
  "created": 1792285757,
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
      "reason": "this capability verifies and re-signs every binary a tool install produced",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "signature-repair",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0081",
  "version": 1
}
-->

After each tool installs or updates (every real run of install or update; skipped under --dry-run), verify the code signature of every Mach-O it produced with the non-strict check the kernel enforces at launch, and re-sign any invalid one ad-hoc, re-verifying afterwards; each re-sign becomes a 're-signed <path>' note on that tool's ✅ summary row and an unrepairable binary fails the tool (fail loud, never silent). It [[install-experience|serves|Install only reports a tool ok once its binaries carry a signature macOS will launch.]] and is [[signature-verify-and-resign|accomplished-by|The capability is realized by the candidate-collection plus verify/re-sign subsystem.]]. It [[run-report-surface|couples-with|The re-sign notes it records surface as text on the run report's ✅ rows, so its note format is part of what the user reads.]]
