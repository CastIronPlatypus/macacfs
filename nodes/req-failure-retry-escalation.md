<!--stratified-action
{
  "accept": "Simulated failure states drive the schedule: fail->nightly; 3 fails->2pm daily; success->back to weekly.",
  "created": 1789593647,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "legacy_id": "r-retry-escalation",
  "name": "req-failure-retry-escalation",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0089",
  "version": 1
}
-->

If a scheduled run fails, retry the next night nightly until success; after 3 consecutive nightly failures switch to daily 2pm attempts until success, then return to weekly.
