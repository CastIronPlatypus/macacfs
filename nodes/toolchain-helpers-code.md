<!--stratified-action
{
  "created": 1789594032,
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
      "dst": "homebrew-and-toolchains",
      "reason": "This code realizes the Homebrew/toolchain subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-prereq",
      "reason": "The toolchain helpers live in lib/prereq.sh.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-prerequisite-autoinstall",
      "reason": "This code unit ensures Homebrew and then installs whichever of rust, go, uv, and node are missing, implementing the installing prerequisite gate.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "toolchain-helpers-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "succeeds": "toolchain-helpers-code@v1",
  "uid": "n0032",
  "version": 2
}
-->

Code unit in lib/prereq.sh: ensure_homebrew runs the official Homebrew installer non-interactively when brew is absent and puts brew on PATH for the rest of the process; ensure_rust runs rustup when cargo is absent and sources ~/.cargo/env; ensure_git, ensure_go, ensure_uv, ensure_node, ensure_minisign (WA's installer verifies release signatures with it) and ensure_flock (PCR's installer serializes with it) each brew-install their formula when the command is missing. prereq_ensure maps the selected methods to which helpers to run, records what it installed, warns on stderr about anything it could not provide, and always returns 0. Each helper honors dry-run. It [[homebrew-and-toolchains|serves|This code realizes the Homebrew and toolchain subsystem.]] and is [[fb-lib-prereq|accomplished-by|The toolchain helpers live in lib/prereq.sh.]]
