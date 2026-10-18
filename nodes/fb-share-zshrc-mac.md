<!--stratified-action
{
  "created": 1789599736,
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
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0071",
  "version": 1
}
-->

share/zshrc.mac.zsh — the mac-adapted managed zshrc: sources oh-my-zsh with the powerlevel10k theme + autosuggestions/syntax-highlighting plugins, brew shellenv/PATH, modern-CLI aliases, and inits zoxide/atuin. Installed as a loader with the prior ~/.zshrc backed up. Realizes [[shell-assets-code|serves]]. Bead.
