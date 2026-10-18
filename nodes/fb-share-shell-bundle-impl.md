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
      "dst": "fb-share-shell-bundle",
      "reason": "The share/shell-bundle.tsv file is the concrete data artifact fulfilling the modern-CLI bundle bead.",
      "type": "serves"
    }
  ],
  "impl_path": "share/shell-bundle.tsv",
  "is_bead": true,
  "name": "fb-share-shell-bundle-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": null,
  "status": "drafting",
  "stratum": "implementation",
  "uid": "n0070",
  "version": 1
}
-->

Implementation of share/shell-bundle.tsv; it [[fb-share-shell-bundle|serves|The share/shell-bundle.tsv file is the concrete data artifact fulfilling the modern-CLI bundle bead.]]. A commented header documents the kind/name/provides tab-separated columns, followed by 15 'formula' rows: ripgrep, fd, bat, eza, lsd, dust, btop, neovim, tmux, fzf, direnv, jq, gh, git-lfs and rsync (the Nerd Font cask is installed separately by shell_font; provides is for logging only). Its columns [[fb-lib-shell-impl|couples-with|shell_brew_bundle reads this file with IFS=tab as kind, name, provides and passes kind to _brew_pkg, so the column order and the formula/cask kind values are a contract with lib/shell.sh.]].
