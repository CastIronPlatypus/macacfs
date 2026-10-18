<!--stratified-action
{
  "accept": "After 'macacfs install', codesign -v passes for every suite binary (cm, brenner, csctf, s2p, ntm ...) and each launches; the summary names every re-signed path; an unrepairable binary yields a \u274c row and non-zero exit.",
  "created": 1792285756,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-runnable-signatures",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0079",
  "version": 1
}
-->

Every Mach-O binary a tool install produces must pass macOS code-signature verification; any binary with an invalid signature is re-signed ad-hoc at install time, each re-sign is reported per tool in the summary, and a binary that cannot be repaired fails that tool.
