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
    }
  ],
  "is_bead": false,
  "name": "toolchain-helpers-code",
  "node_type": "impl",
  "obligations": [
    "r-prereq-autoinstall"
  ],
  "status": "drafting",
  "stratum": "components",
  "uid": "n0032",
  "version": 1
}
-->

Code unit that ensures Homebrew then rust/go/uv/node, installing the missing. Realizes [[homebrew-and-toolchains|flow]]. Accomplished by [[fb-lib-prereq|accomplished-by]].
