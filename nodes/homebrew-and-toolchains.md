<!--stratified-action
{
  "created": 1789593935,
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
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0025",
  "version": 1
}
-->

Helpers that ensure/install Homebrew (root prerequisite) then the language toolchains (rustup/cargo, go, uv, node) via brew, each a no-op if present. Underpins [[prereq-autoinstaller|flow]] and the brew branch of [[install-method-functions|flow]]. Accomplished by [[toolchain-helpers-code|accomplished-by]].
