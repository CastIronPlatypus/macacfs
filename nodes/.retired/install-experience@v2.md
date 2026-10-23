<!--stratified-action
{
  "created": 1789593836,
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
  "realized_at": "0.15.0",
  "retire_reason": "The catalog grows from 39 to 42 rows: GUM, GLOW and JQ are added as Homebrew-core brew rows for the newproj wizard (req-newproj-helper-tools).",
  "retired_at": 1792795224,
  "status": "retired",
  "stratum": "surface",
  "succeeds": "install-experience@v1",
  "uid": "n0012",
  "version": 2
}
-->

What the user sees on 'macacfs install [--dry-run] [TOOL...]': on macOS only, it resolves the selection (all 39 tools, or the named abbrs/clis, failing loud on an unknown one), checks and best-effort auto-installs missing toolchains first, then installs each tool by its catalogued method (Homebrew wherever dicklesworthstone/tap publishes a formula), never starting any tool's server or daemon. After each tool installs, every Mach-O binary it produced is checked with a non-strict codesign verification and any invalid one is re-signed ad-hoc, so a tool is only reported ok once its binaries carry a signature the kernel accepts. Output streams per-tool progress and ends in a ✅/❌ summary with a non-zero exit on any failure. It [[heterogeneous-install-methods|serves|One command installing each tool by its own method is the observable answer to the heterogeneous-install-paths problem.]], [[darwin-truth-per-tool|serves|Installing correctly on the Mac depends on the verified per-tool macOS truth encoded in the catalog.]], [[toolchain-prereqs-and-order|serves|The install flow triggers the prereq gate to provide missing toolchains before any tool builds.]], [[never-start-services|serves|The install experience installs binaries only and is the surface where the no-servers constraint is observable.]], and [[invalid-upstream-signatures|serves|Install is where upstream binaries with broken signatures are caught and repaired.]]. It is [[tool-catalog|accomplished-by|The catalog tells the install what to install and how.]], [[method-dispatch|accomplished-by|Each tool is installed by dispatching its catalogued method.]], [[prereq-autoinstaller|accomplished-by|Missing toolchains are auto-installed before tools build.]], and [[signature-repair|accomplished-by|Each tool install is followed by signature verification and repair.]]. On a full no-selector install it [[shell-setup-experience|precedes|bin/macacfs runs shell_run install right after the tool installs, so the terminal-environment setup follows in the same command.]].
