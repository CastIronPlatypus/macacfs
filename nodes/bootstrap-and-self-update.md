<!--stratified-action
{
  "created": 1789593837,
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
      "dst": "self-update-bootstrap",
      "reason": "The one-liner install and self-update command are the observable form of the bootstrap/self-update mechanism.",
      "type": "serves"
    },
    {
      "dst": "self-update-capability",
      "reason": "One-liner install and self-update are realized by the self-update capability.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "Running 'macacfs self-update' re-fetches the public repo and replaces the installed CLI, which is exactly the observable self-update behavior the requirement specifies.",
      "type": "validated-by"
    },
    {
      "dst": "req-public-github-repo",
      "reason": "The curl install.sh one-liner and self-update both fetch from the public GitHub repo, so that published repo with its README is the distribution surface this behavior depends on.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "bootstrap-and-self-update",
  "node_type": "surface",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0015",
  "version": 1
}
-->

The observable bootstrap and self-update behavior: an observer runs the one-liner (curl -fsSL .../install.sh | bash), which on macOS clones the public CastIronPlatypus/macacfs repo into ~/.macacfs (or fast-forwards an existing checkout), symlinks ~/.local/bin/macacfs to it, and prints a PATH hint if ~/.local/bin is not on PATH; later, 'macacfs self-update' (or --self-update, honoring --dry-run) fast-forwards that checkout, or re-clones and swaps it in when it is not a git checkout, and prints the new VERSION. It [[self-update-bootstrap|serves|The one-liner install and self-update command are the observable form of the bootstrap/self-update problem.]] and is [[self-update-capability|accomplished-by|The self-update capability realizes the one-liner install and the self-update verb.]].
