<!--stratified-action
{
  "accept": "Feature set maps only to those items (install/update/self-update/schedule/newproj/config); none of the ACFS VPS machinery is present.",
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
  "status": "drafting",
  "stratum": "intent",
  "succeeds": "req-minimal-scope@v1",
  "uid": "n0091",
  "version": 2
}
-->

Minimal scope: install tools, set up the macOS terminal environment, install a weekly-update plist, manual update via CLI, self-update, plus the explicitly requested project bootstrap (macacfs newproj, ported from acfs newproj, with optional GitHub publish and ru registration) and a small persistent settings store (macacfs config). Still not a full ACFS port (no user provisioning, OS upgrade, service orchestration, phase runner).
