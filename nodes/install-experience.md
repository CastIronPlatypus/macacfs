<!--stratified-action
{
  "created": 1789593836,
  "edges": [
    {
      "dst": "heterogeneous-install-methods",
      "reason": "The install experience is where the per-tool method dispatch is made observable \u2014 one command, right method per tool.",
      "type": "serves"
    },
    {
      "dst": "darwin-truth-per-tool",
      "reason": "Installing correctly on the Mac depends on the encoded per-tool macOS truth (brew vs source vs node/bash).",
      "type": "serves"
    },
    {
      "dst": "toolchain-prereqs-and-order",
      "reason": "The install flow is what triggers the prereq gate to install missing toolchains in the right order before building tools.",
      "type": "serves"
    },
    {
      "dst": "never-start-services",
      "reason": "The install experience must install binaries only and is the surface where the no-servers constraint is enforced.",
      "type": "serves"
    },
    {
      "dst": "tool-catalog",
      "reason": "The install experience needs the catalog to know what/how to install.",
      "type": "accomplished-by"
    },
    {
      "dst": "method-dispatch",
      "reason": "Each tool is installed by dispatching its method.",
      "type": "accomplished-by"
    },
    {
      "dst": "prereq-autoinstaller",
      "reason": "Missing toolchains are auto-installed before tools build.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "install-experience",
  "node_type": "surface",
  "obligations": [
    "r-install-all",
    "r-prefer-brew",
    "r-prereq-autoinstall",
    "r-no-servers",
    "r-macos-only"
  ],
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0012",
  "version": 1
}
-->

What the user sees on 'macacfs install': it verifies/auto-installs missing toolchains first, then installs all 39 tools (or the named subset), preferring Homebrew where a tap exists, using each tool's correct method, and NEVER starting any tool's server/daemon. Output streams per-tool progress and ends in a summary. Accomplished by [[tool-catalog|accomplished-by]], [[method-dispatch|accomplished-by]], and [[prereq-autoinstaller|accomplished-by]].
