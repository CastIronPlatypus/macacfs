<!--stratified-action
{
  "created": 1789599516,
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
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0059",
  "version": 1
}
-->

ACFS provisions not just tools but a whole terminal environment — a themed zsh (Oh My Zsh + Powerlevel10k + plugins), a modern-CLI bundle, and history/navigation helpers. On macOS that same environment must be reproducible without ACFS's Ubuntu/VPS machinery. This problem is accomplished by the [[shell-setup-experience|accomplished-by]] surface.
