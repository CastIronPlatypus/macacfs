<!--stratified-action
{
  "created": 1792790704,
  "edges": [
    {
      "dst": "req-terminal-environment-parity",
      "reason": "it orchestrates every terminal-environment step",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-shell-run",
  "node_type": "impl",
  "retire_reason": "fix link to the powerlevel step node, renamed because the name gate rejected digits",
  "retired_at": 1792790724,
  "status": "retired",
  "stratum": "function-map",
  "uid": "n0196",
  "version": 1
}
-->

shell_run <install|refresh> ensures Homebrew, chooses the full or brew-only step list, initialises the report, runs each label:function step through run_isolated (or directly, recorded ok '(dry-run)', under dry-run), and returns report_render's verdict. Within the flow it [[lf-shell-setup|serves|shell_run is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_run is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_run lives in the lib/shell.sh implementation.]]. It [[fn-require-darwin|calls|Best-effort macOS check.]]; it [[fn-prereq-ensure|calls|Ensures Homebrew and git.]]; it [[fn-report-init|calls|Resets the summary.]]; it [[fn-run-isolated|calls|Runs each step.]]; it [[fn-report-add|calls|Records dry-run steps.]]; it [[fn-report-render|calls|Prints the summary.]]; it [[fn-sh-dry|calls|Dry-run test.]]; it [[fn-shell-brew-bundle|calls|Step brew-bundle.]]; it [[fn-shell-font|calls|Step nerd-font.]]; it [[fn-shell-omz|calls|Step oh-my-zsh (install only).]]; it [[fn-shell-plugins|calls|Step zsh-plugins (install only).]]; it [[fn-shell-p10k|calls|Step powerlevel10k (install only).]]; it [[fn-shell-zshrc|calls|Step managed-zshrc (install only).]]; it [[fn-shell-tmux|calls|Step tmux-config (install only).]]; it [[fn-shell-zoxide|calls|Step zoxide.]]; it [[fn-shell-lazygit|calls|Step lazygit.]]; it [[fn-shell-astgrep|calls|Step ast-grep.]]; it [[fn-shell-atuin|calls|Step atuin.]].
