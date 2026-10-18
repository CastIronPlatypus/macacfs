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
    },
    {
      "dst": "req-install-whole-suite",
      "reason": "'macacfs install' installs all 39 tools or a named subset using each one's correct method, the observable outcome the whole-suite requirement checks.",
      "type": "validated-by"
    },
    {
      "dst": "req-prefer-homebrew",
      "reason": "During install the user sees Homebrew chosen wherever a tool has a tap, which is the observable form of the prefer-Homebrew requirement.",
      "type": "validated-by"
    },
    {
      "dst": "req-prerequisite-autoinstall",
      "reason": "'macacfs install' first verifies and auto-installs missing toolchains before tool installs, matching the requirement that the gate installs prerequisites.",
      "type": "validated-by"
    },
    {
      "dst": "req-never-start-servers",
      "reason": "The install experience explicitly never starts any tool's server or daemon, which is what the never-start-servers requirement verifies.",
      "type": "validated-by"
    },
    {
      "dst": "req-macos-only",
      "reason": "The install experience is designed around Homebrew and macOS-specific per-tool methods, with no apt, systemctl, or VPS provisioning steps involved.",
      "type": "validated-by"
    },
    {
      "dst": "req-runnable-signatures",
      "reason": "install only counts a tool installed once its binaries pass codesign verification, re-signing invalid ones",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "install-experience",
  "node_type": "surface",
  "status": "drafting",
  "stratum": "surface",
  "succeeds": "install-experience@v1",
  "uid": "n0012",
  "version": 2
}
-->

What the user sees on 'macacfs install': it verifies/auto-installs missing toolchains first, then installs all 39 tools (or the named subset), preferring Homebrew where a tap exists, using each tool's correct method, and NEVER starting any tool's server/daemon. After each tool installs, every binary it produced is checked for a valid code signature and any invalid one is re-signed ad-hoc, so a tool is only reported ok once it can actually launch. Output streams per-tool progress and ends in a summary. Serves [[invalid-upstream-signatures|serves|install is where upstream binaries with broken signatures are caught and repaired]]. Accomplished by [[tool-catalog|accomplished-by]], [[method-dispatch|accomplished-by]], [[prereq-autoinstaller|accomplished-by]], and [[signature-repair|accomplished-by|each tool install is followed by signature verification and repair]].
