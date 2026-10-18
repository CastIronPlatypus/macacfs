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
      "dst": "fb-share-tmux-conf",
      "reason": "The share/tmux.conf file is the implementation asset that fulfills the ACFS tmux configuration bead.",
      "type": "serves"
    }
  ],
  "impl_path": "share/tmux.conf",
  "is_bead": true,
  "name": "fb-share-tmux-conf-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": null,
  "status": "drafting",
  "stratum": "implementation",
  "uid": "n0078",
  "version": 1
}
-->

Implementation of share/tmux.conf; it [[fb-share-tmux-conf|serves|The share/tmux.conf file is the implementation asset that fulfills the ACFS tmux configuration bead.]]. The ACFS tmux configuration tuned for NTM and agent workflows: mouse on, tmux-256color with truecolor and cursor-shape overrides, allow-passthrough guarded to tmux 3.3+, 1-based window/pane indexes with renumbering, 50000-line scrollback, 10ms escape time, focus events, a Ctrl-a prefix, prefix+r reload of ~/.tmux.conf, and path-preserving | and - splits, among the rest of the ACFS settings. Its first-line header [[fb-lib-shell-impl|couples-with|shell_tmux greps an existing ~/.tmux.conf for the 'macacfs tmux configuration' phrase in this header to decide whether to back it up, so that phrase must stay in this file.]].
