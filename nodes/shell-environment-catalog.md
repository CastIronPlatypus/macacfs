<!--stratified-action
{
  "created": 1789599605,
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
      "reason": "This declarative catalog enumerates the brew formulae, font cask, zsh components, and standalone tools that together constitute the ACFS-parity terminal.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-environment-catalog",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "succeeds": "shell-environment-catalog@v1",
  "uid": "n0061",
  "version": 2
}
-->

The source of truth for what the terminal environment contains. Only the modern-CLI Homebrew bundle is a data file (15 formulae: ripgrep, fd, bat, eza, lsd, dust, btop, neovim, tmux, fzf, direnv, jq, gh, git-lfs, rsync); the rest — the Nerd Font cask, the shell-UX components (Oh My Zsh, Powerlevel10k with its preset, the two zsh plugins, the managed zshrc, the tmux config) and the standalone tools (atuin with its shim, zoxide, lazygit, ast-grep) — is fixed by the step lists in the shell setup code, alongside the shipped config assets. It covers the shell environment only, separate from the 42-row tool manifest. It [[shell-setup-experience|serves|Shell setup provisions exactly what this catalog enumerates.]] and is [[shell-spec-store|accomplished-by|The bundle manifest and shipped config assets that make up this catalog are held by the shell-spec store.]]
