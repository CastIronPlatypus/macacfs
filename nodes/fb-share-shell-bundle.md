<!--stratified-action
{
  "created": 1789599736,
  "edges": [
    {
      "dst": "fb-share-shell-bundle-impl",
      "reason": "The shell-bundle bead is realized by share/shell-bundle.tsv, listing brew formulae like ripgrep, fd, bat, eza and the Meslo Nerd Font cask.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "shell-bundle.tsv declares the modern-CLI Homebrew bundle and Nerd Font cask that the parity requirement lists among required terminal components.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-share-shell-bundle",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0069",
  "version": 1
}
-->

share/shell-bundle.tsv — declarative rows for the modern-CLI environment: brew formulae (ripgrep, fd, bat, eza, lsd, dust, btop, neovim, tmux, fzf, direnv, jq, gh, git-lfs, rsync) and casks (font-meslo-lg-nerd-font), each tagged formula|cask. Read by the catalog. Realizes [[shell-assets-code|serves]]. Bead.
