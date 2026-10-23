<!--stratified-action
{
  "created": 1792790705,
  "edges": [],
  "is_bead": false,
  "name": "fn-in-agent",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0197",
  "version": 1
}
-->

_in_agent returns true when an agent environment marker (CLAUDE_PROJECT_DIR, CODEX_THREAD_ID, CODEX_CI, AGENT_NAME) is set or the parent process basename is a known agent or runtime (claude, codex, cod, cc, node, bun, agy, antigravity, gemini, gmi). Within the flow it [[lf-atuin-shim-guard|serves|_in_agent is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-share-atuin-guard|serves|_in_agent is defined in share/atuin-guard.sh.]], and its code is [[fb-share-atuin-guard-impl|accomplished-by|The concrete code of _in_agent lives in the share/atuin-guard.sh implementation.]].
