<!--stratified-action
{
  "created": 1792865313,
  "edges": [
    {
      "dst": "req-agent-hooks-registered",
      "reason": "this capability is the requirement's mechanism",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "agent-hook-setup",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0288",
  "version": 1
}
-->

After a tool installs, verifies and resolves, run its post-install hook (post_install_<ABBR>) to register it with the coding agents so it is in effect, not just present: dcg's guard via 'dcg install' for Claude Code and 'dcg install --opencode' when OpenCode is installed, and in ~/.codex/hooks.json for Codex (backed up, other hooks kept, placed first, as dcg's own installer does); cm's reflection hook via 'cm hook install --global'. Every step is idempotent, adds a note to the tool's row, starts no service, and a failure fails the tool. It [[install-experience|serves|Install leaves guard and memory tools wired into the agents.]] and is [[agent-setup-code|accomplished-by|The post-install hooks in lib/hooks.sh realize it.]]. It respects [[never-start-services|couples-with|Registering hooks only edits agent config; nothing is launched.]]
