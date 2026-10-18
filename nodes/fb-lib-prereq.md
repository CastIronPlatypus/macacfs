<!--stratified-action
{
  "created": 1789594076,
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
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-lib-prereq@v1",
  "uid": "n0041",
  "version": 2
}
-->

lib/prereq.sh — ensure/install Homebrew then rust/go/uv/node, and minisign + flock for installer-sh tools; report what was installed. Bead.
