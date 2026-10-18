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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0073",
  "version": 1
}
-->

The share/atuin-guard.sh file boundary: the agent-safe shim installed at ~/.local/bin/atuin in front of the real Homebrew atuin. It always no-ops 'atuin hook' (draining stdin so callers never hit EPIPE), no-ops 'atuin history start/end' when it detects agent context (agent env vars or the parent process name via ps -o comm=) so agent sessions never pollute history, and passes everything else through to the real binary. Bead. It [[shell-assets-code|serves|This file is one of the shell asset files the shell-assets code unit installs.]] and is [[fb-share-atuin-guard-impl|accomplished-by|share/atuin-guard.sh is the wrapper script that implements the detection and no-op behavior.]]. It [[fb-lib-shell|couples-with|lib/shell.sh substitutes this file's __REAL_ATUIN__ placeholder and identifies an installed shim by its marker comment, so those strings must match across both files.]].
