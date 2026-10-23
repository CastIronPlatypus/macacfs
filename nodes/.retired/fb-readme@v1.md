<!--stratified-action
{
  "created": 1789594078,
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
      "dst": "selfupdate-code",
      "reason": "The README documents the distribution/bootstrap that self-update rests on.",
      "type": "serves"
    },
    {
      "dst": "fb-readme-impl",
      "reason": "The README bead is delivered by the actual README.md describing macacfs as a mini-ACFS for Mac with install, update, and self-update usage.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-public-github-repo",
      "reason": "The README frames macacfs plainly as a mini-ACFS-for-Mac with only its few functions, which the public-repo requirement explicitly calls for.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-readme",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "retire_reason": "README documents newproj and config",
  "retired_at": 1792790099,
  "status": "retired",
  "stratum": "file-boundaries",
  "uid": "n0047",
  "version": 1
}
-->

The README.md file boundary: the public repo's front page, framing macacfs plainly as a mini ACFS for Mac that does only its few things, and documenting the one-liner install, install/update/self-update/schedule usage, the terminal environment, per-method tool installs, prerequisites, the weekly schedule and failure escalation, and the file layout. Bead (docs). It [[selfupdate-code|serves|The README documents the public-repo distribution and one-liner bootstrap that self-update rests on.]] and is [[fb-readme-impl|accomplished-by|The actual README.md delivers this documentation bead.]].
