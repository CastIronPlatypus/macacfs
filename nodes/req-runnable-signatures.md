<!--stratified-action
{
  "accept": "After 'macacfs install', codesign -v passes for every suite binary (cm, brenner, csctf, s2p, ntm ...) and each launches; the summary names every re-signed path; an unrepairable binary yields a \u274c row and non-zero exit.",
  "created": 1792285756,
  "disc_stamp": {
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-runnable-signatures",
  "node_type": "requirement",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0079",
  "version": 1
}
-->

Every Mach-O binary a tool install produces must pass macOS code-signature verification; any binary with an invalid signature is re-signed ad-hoc at install time, each re-sign is reported per tool in the summary, and a binary that cannot be repaired fails that tool.
