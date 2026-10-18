<!--stratified-action
{
  "created": 1789593708,
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
      "dst": "install-experience",
      "reason": "The no-servers constraint is honored by the install experience.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-never-start-servers",
      "reason": "Because mcp_agent_mail, rust_proxy, and SRPS have daemon modes their installers may launch, this problem requires installing binaries only, as the requirement states.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "never-start-services",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0005",
  "version": 1
}
-->

Several suite tools (mcp_agent_mail, rust_proxy, SRPS) have daemon modes, and their installers or packages could launch them. macacfs must install or upgrade the BINARY only and never start any tool's server or daemon; the only thing it ever loads into launchd is its own update LaunchAgent, never a tool service. The problem is [[install-experience|accomplished-by|The install experience installs each tool by its catalogued method and never starts a tool's server, which is how this problem is answered.]]. It also [[shell-setup-experience|couples-with|Terminal setup must honor the same rule from a distance: it installs atuin without ever launching 'atuin daemon' and reloads tmux config only when a tmux server is already running, never starting one.]]
