<!--stratified-action
{
  "created": 1789593793,
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
      "dst": "scope-containment",
      "reason": "Because the command set is closed, a new ACFS-style verb cannot appear without changing this surface, which is what keeps macacfs from growing back into full ACFS.",
      "type": "serves"
    },
    {
      "dst": "update-equals-reinstall-idempotency",
      "reason": "The install and update commands must converge on the same re-run-to-latest result, otherwise re-running install would not be a safe update.",
      "type": "serves"
    },
    {
      "dst": "cli-arg-dispatch",
      "reason": "The argv dispatcher enforces the closed command set: any verb not listed here exits 2 with an error, so adding a verb requires changing that dispatcher.",
      "type": "accomplished-by"
    },
    {
      "dst": "method-dispatch",
      "reason": "install and update run each selected row through its manifest method, so a row with an unknown method fails that tool loudly instead of being skipped.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-minimal-scope",
      "reason": "Running 'macacfs help' lists exactly install, update, self-update, schedule, newproj, projinit, config, list, version and help, and any other verb (e.g. 'macacfs provision') exits 2, so the requirement's closed feature set is checkable directly on this surface.",
      "type": "validated-by"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "Terminal-environment setup is exposed through 'macacfs install' and refreshed by a full 'macacfs update', making the command surface the user's path to parity.",
      "type": "validated-by"
    },
    {
      "dst": "req-manual-cli-update",
      "reason": "'macacfs update' with no tools updates everything and 'macacfs update BR NTM' updates just those, which is the observable manual all-or-named update the requirement specifies.",
      "type": "validated-by"
    },
    {
      "dst": "req-persistent-settings",
      "reason": "'macacfs config list|get|set|unset' is on this surface, so without it a user could not set newproj.github=private and see the next plain newproj create a private repo.",
      "type": "validated-by"
    },
    {
      "dst": "projinit-dispatch",
      "reason": "If the projinit capability were removed, 'macacfs projinit DIR --tools ee' would leave DIR without .ee/ee.db and '--status --json' would report nothing, because it alone resolves the desired set, reads each tool's state from the registry and runs the missing inits",
      "type": "accomplished-by"
    },
    {
      "dst": "req-per-project-tool-init",
      "reason": "Running 'macacfs projinit DIR --tools ee' on a DIR without .ee/ creates .ee/ and installs the Claude Code hook, and a second run reports 'already' and changes nothing, so the requirement's idempotent per-project init is checkable directly on this surface.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "macacfs-command-surface",
  "node_type": "surface",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "surface",
  "succeeds": "macacfs-command-surface@v5",
  "uid": "n0011",
  "version": 6
}
-->

The only things an observer can invoke: 'macacfs install [--dry-run] [TOOL...]', which with no TOOL installs BOTH the 42 catalog tools (the 39 suite tools plus gum, glow and jq) AND the terminal environment (omz/p10k/plugins/tmux/font, the modern-CLI brew bundle, atuin(+shim)/zoxide/lazygit/ast-grep) in one command, and with TOOLs installs only those; 'macacfs update [--dry-run] [TOOL...]' (a full update also brew-upgrades the shell bundle); 'macacfs self-update [--dry-run]'; 'macacfs schedule [--install|--uninstall|--status]'; 'macacfs newproj' (alias 'new') — the acfs project bootstrap in all three modes plus optional GitHub publish and ru registration, and a choice of which flywheel tools to initialize in the project (--tools LIST / --no-tools, defaulting to the newproj.tools setting, with --save-defaults to store the choice); 'macacfs projinit [DIR] [--tools LIST] [-i] [--status] [--json] [--dry-run] [--save-defaults]' — inspect an existing project and initialize only the desired flywheel tools it does not have yet; 'macacfs config get|set|unset|list' — the persistent settings store; and the read-only 'macacfs list', 'version' (-v/--version) and 'help' (-h/--help). TOOL is an abbr or cli name, case-insensitive. There is NO standalone shell command; terminal setup happens under install. There is intentionally NO user-provisioning, OS-upgrade, service-start, or phase-runner command: the limited surface [[scope-containment|serves|Because the command set is closed, a new ACFS-style verb cannot appear without changing this surface, which is what keeps macacfs from growing back into full ACFS.]] and it [[update-equals-reinstall-idempotency|serves|The install and update commands must converge on the same re-run-to-latest result, otherwise re-running install would not be a safe update.]]. It is [[cli-arg-dispatch|accomplished-by|The argv dispatcher enforces the closed command set: any verb not listed here exits 2 with an error, so adding a verb requires changing that dispatcher.]], [[method-dispatch|accomplished-by|install and update run each selected row through its manifest method, so a row with an unknown method fails that tool loudly instead of being skipped.]], [[projinit-dispatch|accomplished-by|If the projinit capability were removed, 'macacfs projinit DIR --tools ee' would leave DIR without .ee/ee.db and '--status --json' would report nothing, because it alone resolves the desired set, reads each tool's state from the registry and runs the missing inits.]], and [[shell-setup-dispatch|accomplished-by|Only a full install (no TOOL) runs the shell-setup install mode and only a full update runs its refresh mode, so 'macacfs install BR' never touches ~/.zshrc.]].
