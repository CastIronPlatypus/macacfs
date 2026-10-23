<!--stratified-action
{
  "created": 1789599736,
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
      "dst": "fb-share-zshrc-mac",
      "reason": "The share/zshrc.mac.zsh file is the concrete asset fulfilling the mac-adapted managed zshrc bead.",
      "type": "serves"
    }
  ],
  "impl_path": "share/zshrc.mac.zsh",
  "is_bead": true,
  "name": "fb-share-zshrc-mac-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": null,
  "retire_reason": "share/zshrc.mac.zsh puts share/completions on fpath before Oh My Zsh runs compinit, so 'macacfs <TAB>' completes.",
  "retired_at": 1792795251,
  "status": "retired",
  "stratum": "implementation",
  "uid": "n0072",
  "version": 1
}
-->

Implementation of share/zshrc.mac.zsh; it [[fb-share-zshrc-mac|serves|The share/zshrc.mac.zsh file is the concrete asset fulfilling the mac-adapted managed zshrc bead.]]. The zsh body installed to ~/.macacfs.zshrc: evaluates brew shellenv for Apple Silicon or Intel, puts ~/.local/bin first on PATH, loads Oh My Zsh with the powerlevel10k theme and the git, zsh-autosuggestions and zsh-syntax-highlighting plugins, sources ~/.p10k.zsh when present, defines modern-CLI aliases only when each tool exists (eza for ls/ll/tree, bat for cat, btop for top, nvim for vim, lazygit as lg), and initializes zoxide and atuin. The ~/.local/bin-first ordering [[fb-share-atuin-guard-impl|couples-with|The agent-safe atuin shim only intercepts atuin calls because this file puts ~/.local/bin ahead of Homebrew's bin on PATH; reordering PATH here silently bypasses the shim.]].
