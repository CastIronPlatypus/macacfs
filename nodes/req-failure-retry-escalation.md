<!--stratified-action
{
  "accept": "Simulated failure states drive the schedule: fail->nightly; 3 fails->2pm daily; success->back to weekly.",
  "created": 1789593647,
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
  "legacy_id": "r-retry-escalation",
  "name": "req-failure-retry-escalation",
  "node_type": "requirement",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0089",
  "version": 1
}
-->

If a scheduled run fails, retry nightly (03:00) until success; once 3 consecutive scheduled runs have failed, switch to daily 2pm attempts until success, then return to weekly.
