<!--stratified-action
{
  "created": 1789599737,
  "edges": [
    {
      "dst": "fb-share-atuin-guard-impl",
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-share-atuin-guard",
  "node_type": "impl",
  "obligations": [
    "r-terminal-env"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0073",
  "version": 1
}
-->

share/atuin-guard.sh — the agent-safe wrapper installed in front of the real atuin binary: detects agent context (env vars or parent process name via ps -o comm=) and no-ops 'atuin history start/end' and 'atuin hook' so agent sessions never pollute history or hit EPIPE; passes through for interactive use. Realizes [[shell-assets-code|serves]]. Bead.
