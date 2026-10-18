<!--stratified-action
{
  "created": 1789602259,
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
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0077",
  "version": 1
}
-->

share/tmux.conf — the ACFS tmux configuration (Ctrl-a prefix, mouse, 50k scrollback, vim-style panes/copy, base-index 1, top status bar, detach-on-destroy off + monitor-activity on for agent/NTM workflows, sources ~/.tmux.conf.local). Installed to ~/.tmux.conf with backup. Realizes [[shell-assets-code|serves]]. Bead.
