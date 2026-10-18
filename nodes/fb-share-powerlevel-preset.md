<!--stratified-action
{
  "created": 1789599829,
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
      "dst": "fb-share-powerlevel-preset-impl",
      "reason": "The p10k preset bead is delivered by share/p10k.zsh, the pre-baked Powerlevel10k config copied to ~/.p10k.zsh.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "Shipping a pre-baked p10k.zsh lets Powerlevel10k come up configured without the wizard, completing the themed-zsh part of terminal parity.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-share-powerlevel-preset",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0075",
  "version": 1
}
-->

The share/p10k.zsh file boundary: a pre-baked Lean-style Powerlevel10k configuration that shell_p10k copies to ~/.p10k.zsh so the first login skips the configuration wizard. Bead. It [[shell-assets-code|serves|This preset is one of the shell asset files the shell-assets code unit installs.]] and is [[fb-share-powerlevel-preset-impl|accomplished-by|share/p10k.zsh is the pre-baked Powerlevel10k config copied to ~/.p10k.zsh.]]. It [[fb-share-zshrc-mac|couples-with|The managed zshrc is what sources ~/.p10k.zsh and selects the powerlevel10k theme, so this preset depends on that file's load path.]].
