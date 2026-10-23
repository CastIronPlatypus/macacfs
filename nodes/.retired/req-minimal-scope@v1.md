<!--stratified-action
{
  "accept": "Feature set maps only to those items; none of the ACFS VPS machinery is present.",
  "created": 1789593648,
  "disc_stamp": {
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
  "edges": [],
  "is_bead": false,
  "kind": "constraint",
  "legacy_id": "r-scope-min",
  "name": "req-minimal-scope",
  "node_type": "requirement",
  "realized_at": "0.15.0",
  "retire_reason": "User explicitly requested macacfs newproj (project bootstrap ported from acfs) plus persistent settings; scope widens to admit them",
  "retired_at": 1792789931,
  "status": "retired",
  "stratum": "intent",
  "uid": "n0091",
  "version": 1
}
-->

Minimal scope: install tools, set up the macOS terminal environment, install a weekly-update plist, manual update via CLI, and self-update. Not a full ACFS port (no user provisioning, OS upgrade, service orchestration, phase runner).
