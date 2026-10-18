<!--stratified-action
{
  "accept": "No launchctl-load of tool services, no 'am serve', no daemon starts; code shows only build/install/update actions for tools.",
  "created": 1789593646,
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
  "legacy_id": "r-no-servers",
  "name": "req-never-start-servers",
  "node_type": "requirement",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0086",
  "version": 1
}
-->

Never start/run any servers or long-running services (e.g. mcp_agent_mail). Install and update binaries only.
