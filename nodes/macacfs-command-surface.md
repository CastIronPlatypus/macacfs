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
      "reason": "The limited, closed command set is exactly what keeps the tool from growing back into full ACFS \u2014 scope is enforced at the surface.",
      "type": "serves"
    },
    {
      "dst": "update-equals-reinstall-idempotency",
      "reason": "The install/update commands are the surface where re-run-to-latest idempotency is exercised.",
      "type": "serves"
    },
    {
      "dst": "cli-arg-dispatch",
      "reason": "The closed command set is enforced by the argv dispatcher.",
      "type": "accomplished-by"
    },
    {
      "dst": "method-dispatch",
      "reason": "install/update commands are realized by method dispatch.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-minimal-scope",
      "reason": "The command surface intentionally omits user-provisioning, OS-upgrade, service-start, and phase-runner commands, so the limited verb set is how scope is contained.",
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
    }
  ],
  "is_bead": false,
  "name": "macacfs-command-surface",
  "node_type": "surface",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "surface",
  "succeeds": "macacfs-command-surface@v2",
  "uid": "n0011",
  "version": 3
}
-->

The only things an observer can invoke: 'macacfs install [--dry-run] [TOOL...]', which with no TOOL installs BOTH the 39 tools AND the terminal environment (omz/p10k/plugins/tmux/font, the modern-CLI brew bundle, atuin(+shim)/zoxide/lazygit/ast-grep) in one command, and with TOOLs installs only those; 'macacfs update [--dry-run] [TOOL...]' (a full update also brew-upgrades the shell bundle); 'macacfs self-update [--dry-run]'; 'macacfs schedule [--install|--uninstall|--status]'; and the read-only 'macacfs list', 'version' (-v/--version) and 'help' (-h/--help). TOOL is an abbr or cli name, case-insensitive. There is NO standalone shell command; terminal setup happens under install. There is intentionally NO user-provisioning, OS-upgrade, service-start, or phase-runner command: the limited surface [[scope-containment|serves|The closed command set is exactly what keeps macacfs from growing back into full ACFS, so scope containment is enforced at the surface.]] and it [[update-equals-reinstall-idempotency|serves|The install and update commands are the surface where re-run-to-latest idempotency and the manual per-tool/all update contract are exercised.]]. It is [[cli-arg-dispatch|accomplished-by|The argv dispatcher enforces the closed command set.]], [[method-dispatch|accomplished-by|install and update are realized by per-tool method dispatch.]], and [[shell-setup-dispatch|accomplished-by|The terminal-environment part of a full install and update is realized by the shell-setup dispatcher.]].
