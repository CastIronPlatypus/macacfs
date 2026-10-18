<!--stratified-action
{
  "created": 1789594076,
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
      "dst": "toolchain-helpers-code",
      "reason": "This file realizes the toolchain helpers.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-prereq-impl",
      "reason": "The prerequisite bead is realized by lib/prereq.sh, the script that ensures Homebrew and then the rust, go, uv, and node toolchains.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-prerequisite-autoinstall",
      "reason": "lib/prereq.sh installs missing Homebrew, rust, go, uv, and node and reports what it installed, meeting the install-not-just-report gate requirement.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-prereq",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-lib-prereq@v1",
  "uid": "n0041",
  "version": 2
}
-->

The lib/prereq.sh file boundary: the best-effort prerequisite gate that installs a missing Homebrew first, then git, and the toolchains implied by the selected methods (rust for cargo-git, go for go, and rust, go, uv, node, minisign and flock for installer-sh tools), reports what it installed, and warns about anything it could not provide without aborting the run. It [[toolchain-helpers-code|serves|This file holds the toolchain helper code unit.]] and is [[fb-lib-prereq-impl|accomplished-by|lib/prereq.sh ensures Homebrew and then the method-implied toolchains.]].
