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
  "retire_reason": "The live run showed WA's installer needs minisign and PCR's needs flock, neither on stock macOS; the helpers now provide both for installer-sh tools.",
  "retired_at": 1792287075,
  "status": "retired",
  "stratum": "components",
  "uid": "n0032",
  "version": 1
}
-->

Code unit that ensures Homebrew then rust/go/uv/node, installing the missing. Realizes [[homebrew-and-toolchains|flow]]. Accomplished by [[fb-lib-prereq|accomplished-by]].
