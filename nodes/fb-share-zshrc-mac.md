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
      "dst": "fb-share-zshrc-mac-impl",
      "reason": "The managed-zshrc bead is realized by share/zshrc.mac.zsh, which sources oh-my-zsh with p10k, plugins, brew shellenv, aliases, and zoxide/atuin init.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "zshrc.mac.zsh is the mac-adapted managed zshrc installed with the prior ~/.zshrc backed up, a named component of the parity requirement.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-share-zshrc-mac",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0071",
  "version": 1
}
-->

The share/zshrc.mac.zsh file boundary: the mac-adapted managed zshrc body, copied to ~/.macacfs.zshrc and sourced by a marker-tagged ~/.zshrc loader (with any prior non-managed ~/.zshrc backed up); it sets brew shellenv and a ~/.local/bin-first PATH, loads oh-my-zsh with the powerlevel10k theme and git/autosuggestions/syntax-highlighting plugins, sources ~/.p10k.zsh, adds modern-CLI aliases, and inits zoxide and atuin. Bead. It [[shell-assets-code|serves|This zshrc is one of the shell asset files the shell-assets code unit installs.]] and is [[fb-share-zshrc-mac-impl|accomplished-by|share/zshrc.mac.zsh is the concrete zsh body file.]]. It [[fb-share-powerlevel-preset|couples-with|This file sources ~/.p10k.zsh, the path the p10k preset is copied to, so the preset's install path and this source line must agree.]], and its PATH order [[fb-share-atuin-guard|couples-with|Putting ~/.local/bin first is what lets the atuin shim shadow Homebrew's atuin.]].
