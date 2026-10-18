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
      "reason": "macOS SIGKILLs a binary with an invalid signature, so this problem is why install must verify and repair signatures",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "invalid-upstream-signatures",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0080",
  "version": 1
}
-->

The problem of invalid upstream signatures: several suite tools (cm, brenner, csctf, s2p, ntm) ship as Bun --compile single-file executables whose embedded signature is invalidated by the payload appended after signing; the Homebrew bottle and the release asset are byte-identical and both fail codesign verification. macOS SIGKILLs such a binary at launch, so the shell prints only 'killed', and installing upstream bytes as-is yields tools that cannot run. The check that matters is the hash/seal check the kernel enforces (codesign -v --no-strict); strict layout validation also rejects some Bun binaries that do run (e.g. brenner 0.4.1), so it is not the right test. It is [[install-experience|accomplished-by|The install experience is where each installed binary is verified and repaired before the run reports success.]].
