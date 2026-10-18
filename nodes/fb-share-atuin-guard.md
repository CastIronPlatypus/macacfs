<!--stratified-action
{
  "created": 1789599737,
  "edges": [
    {
      "dst": "fb-share-atuin-guard-impl",
      "reason": "The atuin-guard bead is realized by share/atuin-guard.sh, the wrapper script that detects agent context and no-ops atuin history and hook calls.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "The requirement specifies atuin with an agent-safe shim, and atuin-guard.sh is that shim, preventing agent sessions from polluting history or hitting EPIPE.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-share-atuin-guard",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0073",
  "version": 1
}
-->

share/atuin-guard.sh — the agent-safe wrapper installed in front of the real atuin binary: detects agent context (env vars or parent process name via ps -o comm=) and no-ops 'atuin history start/end' and 'atuin hook' so agent sessions never pollute history or hit EPIPE; passes through for interactive use. Realizes [[shell-assets-code|serves]]. Bead.
