<!--stratified-action
{
  "created": 1789599516,
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
      "reason": "This problem identifies that ACFS provisions a whole themed zsh and modern-CLI environment that macOS must reproduce, which the parity requirement then specifies.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "terminal-environment-parity",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0059",
  "version": 1
}
-->

ACFS provisions not just tools but a whole terminal environment — a themed zsh (Oh My Zsh + Powerlevel10k + plugins) with a Nerd Font, a modern-CLI bundle, a tmux config tuned for agent workflows, and history/navigation helpers (atuin, zoxide, plus lazygit and ast-grep). On macOS that same environment must be reproducible through Homebrew and git without ACFS's Ubuntu/VPS machinery, must not clobber a user's existing zshrc or tmux config without backing it up, and must keep atuin's history hook from recording or breaking inside coding-agent shells. This problem is [[shell-setup-experience|accomplished-by|The terminal setup run by a full 'macacfs install' is the surface that reproduces this environment on the Mac.]]
