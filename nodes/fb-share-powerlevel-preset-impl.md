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
      "dst": "fb-share-powerlevel-preset",
      "reason": "The share/p10k.zsh file is the implementation asset that fulfills the Powerlevel10k preset bead.",
      "type": "serves"
    }
  ],
  "impl_path": "share/p10k.zsh",
  "is_bead": true,
  "name": "fb-share-powerlevel-preset-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": null,
  "status": "drafting",
  "stratum": "implementation",
  "uid": "n0076",
  "version": 1
}
-->

Implementation of share/p10k.zsh; it [[fb-share-powerlevel-preset|serves|The share/p10k.zsh file is the implementation asset that fulfills the Powerlevel10k preset bead.]]. It is the ACFS Powerlevel10k configuration in the Lean style (based on the official p10k-lean.zsh with ACFS-friendly defaults), copied verbatim to ~/.p10k.zsh by shell_p10k so the p10k configuration wizard never runs on first login. It [[fb-share-zshrc-mac-impl|couples-with|The managed zshrc sets ZSH_THEME to powerlevel10k and sources ~/.p10k.zsh, so this preset only takes effect while that zshrc keeps loading it from that path.]].
