<!--stratified-action
{
  "created": 1789602259,
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
      "dst": "fb-share-tmux-conf-impl",
      "reason": "The tmux-config bead is delivered by share/tmux.conf, the ACFS configuration with Ctrl-a prefix, mouse, 50k scrollback, and agent-friendly settings.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "share/tmux.conf is the ACFS tmux config installed to ~/.tmux.conf with backup, satisfying the requirement's tmux-config component.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-share-tmux-conf",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0077",
  "version": 1
}
-->

The share/tmux.conf file boundary: the ACFS tmux configuration (Ctrl-a prefix, mouse, 50k scrollback, vim-style pane navigation and vi copy mode, base-index 1, top status bar, detach-on-destroy off and monitor-activity on for agent/NTM workflows, and an optional ~/.tmux.conf.local include), installed to ~/.tmux.conf by shell_tmux with any non-macacfs file backed up first. Bead. It [[shell-assets-code|serves|This config is one of the shell asset files the shell-assets code unit installs.]] and is [[fb-share-tmux-conf-impl|accomplished-by|share/tmux.conf is the concrete ACFS tmux configuration file.]]. Its header [[fb-lib-shell|couples-with|lib/shell.sh recognizes an already-managed ~/.tmux.conf by the 'macacfs tmux configuration' phrase in this file's header, so removing it would make every re-install back up and replace the config again.]].
