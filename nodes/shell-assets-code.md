<!--stratified-action
{
  "created": 1789599679,
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
      "dst": "req-terminal-environment-parity",
      "reason": "The shipped share/ assets, namely brew bundle, zshrc, p10k preset, tmux config, and atuin shim, are the config files parity setup installs.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-assets-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "succeeds": "shell-assets-code@v1",
  "uid": "n0066",
  "version": 2
}
-->

The shipped share/ assets terminal setup installs: the modern-CLI brew-bundle manifest (15 formulae), the mac-adapted zshrc body (installed to ~/.macacfs.zshrc behind a managed ~/.zshrc loader), the Powerlevel10k lean preset (copied to ~/.p10k.zsh), the ACFS tmux config (installed to ~/.tmux.conf), and the atuin agent-safe shim template (its __REAL_ATUIN__ placeholder filled at install time). It [[shell-spec-store|serves|These files are the stored terminal-environment spec that the shell-spec store holds.]] and is [[fb-share-shell-bundle|accomplished-by|share/shell-bundle.tsv carries the modern-CLI Homebrew bundle.]], [[fb-share-zshrc-mac|accomplished-by|share/zshrc.mac.zsh carries the managed zshrc body.]], [[fb-share-powerlevel-preset|accomplished-by|share/p10k.zsh carries the pre-baked Powerlevel10k preset.]], [[fb-share-tmux-conf|accomplished-by|share/tmux.conf carries the ACFS tmux configuration.]], and [[fb-share-atuin-guard|accomplished-by|share/atuin-guard.sh carries the agent-safe atuin shim template.]]. It [[shell-fns-code|couples-with|The installers decide whether to back up an existing file by grepping for marker text these assets carry ('macacfs tmux configuration', 'agent hook integration disabled by macacfs') and substitute the shim's __REAL_ATUIN__ placeholder, so editing that text silently changes backup or shim behavior.]]
