<!--stratified-action
{
  "accept": "After 'macacfs install DCG CM', dcg doctor reports the Claude Code and OpenCode hooks OK and the Codex hook registered (trusted after Codex's approval prompt), cm hook status shows the claude user hook installed, and a second run changes nothing.",
  "created": 1792865287,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-agent-hooks-registered",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0284",
  "version": 1
}
-->

Tools whose value depends on agent integration are registered with the installed coding agents at install time, idempotently, using the tool's own install command where it has one: dcg's PreToolUse guard for Claude Code, OpenCode and Codex; cm's user-level Claude Code SessionEnd reflection hook. Existing agent config is preserved and backed up before macacfs edits it directly; no service is started.
