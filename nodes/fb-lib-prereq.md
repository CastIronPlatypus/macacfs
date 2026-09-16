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
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-prereq",
  "node_type": "impl",
  "obligations": [
    "r-prereq-autoinstall"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0041",
  "version": 1
}
-->

lib/prereq.sh — ensure/install Homebrew then rust/go/uv/node; report what was installed. Bead.
