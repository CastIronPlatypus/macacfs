<!--stratified-action
{
  "created": 1789593708,
  "edges": [
    {
      "dst": "install-experience",
      "reason": "The no-servers constraint is honored by the install experience.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "never-start-services",
  "node_type": "problem",
  "obligations": [
    "r-no-servers"
  ],
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0005",
  "version": 1
}
-->

Several tools (mcp_agent_mail, rust_proxy, SRPS) have daemon modes and their installers may try to launch them. We must install/upgrade the BINARY only and never start a tool's service. Accomplished by [[install-experience|accomplished-by]].
