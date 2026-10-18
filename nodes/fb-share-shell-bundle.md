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
      "dst": "fb-share-shell-bundle-impl",
      "reason": "The shell-bundle bead is realized by share/shell-bundle.tsv, listing the 15 modern-CLI brew formulae such as ripgrep, fd, bat and eza.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "shell-bundle.tsv declares the modern-CLI Homebrew bundle that the parity requirement lists among required terminal components (the Nerd Font cask is installed separately by shell_font).",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-share-shell-bundle",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0069",
  "version": 1
}
-->

The share/shell-bundle.tsv file boundary: declarative tab-separated rows for the modern-CLI Homebrew bundle, currently 15 formulae (ripgrep, fd, bat, eza, lsd, dust, btop, neovim, tmux, fzf, direnv, jq, gh, git-lfs, rsync), each tagged with a formula|cask kind; the Meslo Nerd Font cask is not in this file but installed by shell_font. It is read by shell_brew_bundle in lib/shell.sh, not by the tool catalog. Bead. It [[shell-assets-code|serves|This bundle is one of the shell asset files the shell-assets code unit consumes.]] and is [[fb-share-shell-bundle-impl|accomplished-by|share/shell-bundle.tsv is the concrete data file listing the bundle's formulae.]]. Its columns [[fb-lib-shell|couples-with|lib/shell.sh parses this file positionally as kind, name, provides, so the column layout is a cross-file contract.]].
