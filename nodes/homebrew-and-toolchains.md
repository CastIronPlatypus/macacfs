<!--stratified-action
{
  "created": 1789593935,
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
      "dst": "prereq-autoinstaller",
      "reason": "The prereq gate is implemented by these brew/toolchain ensure helpers.",
      "type": "serves"
    },
    {
      "dst": "method-dispatch",
      "reason": "The brew install/upgrade branch of dispatch relies on the Homebrew helper.",
      "type": "serves"
    },
    {
      "dst": "toolchain-helpers-code",
      "reason": "The toolchain subsystem is realized by the helper code.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-prerequisite-autoinstall",
      "reason": "These helpers install Homebrew and then rustup, go, uv, and node via brew when absent, delivering the gate that installs missing toolchains rather than reporting.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "homebrew-and-toolchains",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0025",
  "version": 1
}
-->

The prerequisite subsystem: helpers that ensure Homebrew (the root prerequisite, via its official non-interactive installer) and git, then the toolchains the selected methods imply, Rust via rustup and go, uv, node, minisign and flock via brew, each a no-op when already present, dry-run-aware, reporting what it installed and warning (without aborting) about what it could not provide. It [[prereq-autoinstaller|serves|The prereq gate capability is implemented by these Homebrew and toolchain ensure helpers.]] and [[method-dispatch|serves|The brew branch of method dispatch and the cargo/go/installer-sh branches all rely on the toolchains these helpers provide.]], it [[install-method-functions|precedes|run_tools calls prereq_ensure for the selected methods before any install method function runs, so toolchains are in place first.]], and it is [[toolchain-helpers-code|accomplished-by|The toolchain helper code in lib/prereq.sh realizes this subsystem.]].
