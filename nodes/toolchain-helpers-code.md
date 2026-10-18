<!--stratified-action
{
  "created": 1789594032,
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
  "status": "drafting",
  "stratum": "components",
  "succeeds": "toolchain-helpers-code@v1",
  "uid": "n0032",
  "version": 2
}
-->

Code unit that ensures Homebrew then rust/go/uv/node, plus the installer-level tools minisign (WA's installer verifies release signatures with it) and flock (PCR's installer serializes with it) when installer-sh tools are selected, installing whatever is missing via brew. Realizes [[homebrew-and-toolchains|flow]]. Accomplished by [[fb-lib-prereq|accomplished-by]].
