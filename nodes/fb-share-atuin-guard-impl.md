<!--stratified-action
{
  "created": 1789599737,
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
      "dst": "fb-share-atuin-guard",
      "reason": "The share/atuin-guard.sh file is the concrete implementation of the agent-safe atuin wrapper bead.",
      "type": "serves"
    }
  ],
  "impl_path": "share/atuin-guard.sh",
  "is_bead": true,
  "name": "fb-share-atuin-guard-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": null,
  "status": "drafting",
  "stratum": "implementation",
  "uid": "n0074",
  "version": 1
}
-->

Implementation of share/atuin-guard.sh; it [[fb-share-atuin-guard|serves|The share/atuin-guard.sh file is the concrete implementation of the agent-safe atuin wrapper bead.]]. The bash shim resolves the real binary from ATUIN_REAL_BIN or the install-time __REAL_ATUIN__ substitution (exit 127 if it is not executable); always drains stdin and exits 0 for 'atuin hook' (the marker comment 'agent hook integration disabled by macacfs' sits on that branch), so callers never see EPIPE; no-ops 'history start' and 'history end' when it detects an agent context (CLAUDE_PROJECT_DIR, CODEX_THREAD_ID, CODEX_CI or AGENT_NAME set, or a parent process named claude, codex, cod, cc, node, bun, agy, antigravity, gemini or gmi); and otherwise execs the real atuin unchanged. Its placeholder and marker [[fb-lib-shell-impl|couples-with|shell_atuin seds __REAL_ATUIN__ into this file and greps for the marker comment to recognize an installed shim, so both strings are a contract with lib/shell.sh.]].
