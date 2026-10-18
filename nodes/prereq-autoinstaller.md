<!--stratified-action
{
  "created": 1789593894,
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
      "dst": "install-experience",
      "reason": "The install experience must auto-install missing toolchains before building tools.",
      "type": "serves"
    },
    {
      "dst": "homebrew-and-toolchains",
      "reason": "The prereq gate is implemented by the brew/toolchain helpers.",
      "type": "accomplished-by"
    },
    {
      "dst": "shell-setup-experience",
      "reason": "Shell setup reuses the prerequisite auto-installer to ensure Homebrew is present before the brew bundle and casks install.",
      "type": "serves"
    },
    {
      "dst": "req-prerequisite-autoinstall",
      "reason": "Installing Homebrew first, then rust, go, uv, and node, and reporting what was installed before source builds run satisfies the auto-install gate.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "prereq-autoinstaller",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0018",
  "version": 1
}
-->

Before any tool is installed, ensure the toolchains the selected methods need exist, INSTALLING the missing ones rather than just reporting them: Homebrew first (the root prerequisite) and git always; rust when any cargo-git or installer-sh tool is selected; go when any go or installer-sh tool is selected; and uv, node, minisign and flock when any installer-sh tool is selected. It is best-effort: it reports what it installed, warns loudly about anything it could not provide, and never aborts the run, leaving any tool that truly needs a missing toolchain to fail loudly at its own step. It [[install-experience|serves|The install experience runs this gate first so missing toolchains are provided before any tool installs or builds.]] and [[shell-setup-experience|serves|Shell setup reuses the gate (with just the brew method) to ensure Homebrew and git are present before the brew bundle and casks install.]]. It is [[homebrew-and-toolchains|accomplished-by|The gate is implemented by the Homebrew and toolchain ensure-helpers in lib/prereq.sh.]]. It [[scheduled-update-behavior|couples-with|The LaunchAgent bakes brew, cargo and go bin dirs into its PATH; without that, this gate would not see the existing toolchains under launchd and would try to reinstall them on every scheduled run.]]
