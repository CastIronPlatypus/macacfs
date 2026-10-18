<!--stratified-action
{
  "created": 1789599667,
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
      "reason": "The share/ data files declare the brew bundle and ship the zshrc, p10k preset, and atuin shim that the parity requirement lists as deliverables.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-spec-store",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0063",
  "version": 1
}
-->

The share/ files that hold the terminal environment's data and shipped configs: the brew-bundle list (formulae only; the font cask is installed separately), the mac-adapted zshrc body, the Powerlevel10k preset, the ACFS tmux config, and the atuin agent-safe shim script (the only one with logic, installed with its real-atuin path filled in). They are copied or rendered as-is by the provisioning functions; the installing logic lives elsewhere. The store [[shell-environment-catalog|serves|These files are the stored content of the terminal-environment catalog.]] and is [[shell-assets-code|accomplished-by|The concrete share/ asset files realize this store.]]
