<!--stratified-action
{
  "created": 1792790759,
  "edges": [
    {
      "dst": "req-terminal-environment-parity",
      "reason": "the Mac terminal gets the ACFS shell environment",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-shell-setup",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0213",
  "version": 1
}
-->

Terminal setup and refresh: shell_run first ensures Homebrew and git, then picks a step list: install runs the brew bundle, Nerd Font, Oh My Zsh, zsh plugins, Powerlevel10k with its preset, the managed zshrc, the tmux config, zoxide, lazygit, ast-grep and atuin with its agent-safe shim; refresh (used by a full update) runs only the brew-backed steps so shell config is not rewritten. Each step runs inside run_isolated (or directly under dry-run) and the summary is rendered. Every step is idempotent, backs up non-managed user files before replacing them, and never starts a server. This flow [[fb-lib-shell|serves|The flow is realized by code in lib/shell.sh.]]. It is carried out step by step by [[fn-sh-dry|accomplished-by|_sh_dry performs part of this flow.]], [[fn-sh-brew-prefix|accomplished-by|_sh_brew_prefix performs part of this flow.]], [[fn-brew-pkg|accomplished-by|_brew_pkg performs part of this flow.]], [[fn-sh-git-get|accomplished-by|_sh_git_get performs part of this flow.]], [[fn-shell-brew-bundle|accomplished-by|shell_brew_bundle performs part of this flow.]], [[fn-shell-font|accomplished-by|shell_font performs part of this flow.]], [[fn-shell-omz|accomplished-by|shell_omz performs part of this flow.]], [[fn-shell-powerlevel|accomplished-by|shell_p10k performs part of this flow.]], [[fn-shell-plugins|accomplished-by|shell_plugins performs part of this flow.]], [[fn-shell-zshrc|accomplished-by|shell_zshrc performs part of this flow.]], [[fn-shell-tmux|accomplished-by|shell_tmux performs part of this flow.]], [[fn-shell-zoxide|accomplished-by|shell_zoxide performs part of this flow.]], [[fn-shell-lazygit|accomplished-by|shell_lazygit performs part of this flow.]], [[fn-shell-astgrep|accomplished-by|shell_astgrep performs part of this flow.]], [[fn-shell-atuin|accomplished-by|shell_atuin performs part of this flow.]], [[fn-shell-run|accomplished-by|shell_run performs part of this flow.]]. Related flows: [[lf-prereq-ensure|flow|shell_run calls prereq_ensure brew first.]]; [[lf-isolated-run-report|flow|Each provisioning step is reported like a tool.]]; [[lf-atuin-shim-guard|flow|The atuin step installs the guard shim.]].
