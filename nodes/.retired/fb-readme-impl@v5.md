<!--stratified-action
{
  "created": 1789594982,
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
      "dst": "fb-readme",
      "reason": "The README.md file is the implementation artifact that satisfies the documentation bead.",
      "type": "serves"
    }
  ],
  "impl_path": "README.md",
  "is_bead": true,
  "name": "fb-readme-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594970:4254",
  "retire_reason": "README documents newproj (three modes, GitHub/ru, ru-layout directory), macacfs config, completions, gum/glow/jq, newproj prereq notes, the 42-tool catalog and the revised minimal scope.",
  "retired_at": 1792794746,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-readme-impl@v4",
  "uid": "n0058",
  "version": 5
}
-->

Implementation of README.md; it [[fb-readme|serves|The README.md file is the implementation artifact that satisfies the documentation bead.]]. Sections: the mini-ACFS-for-Mac scope, Install (the curl one-liner), Usage (install/update with optional TOOL selectors, self-update, schedule, list), Terminal environment (part of a full 'macacfs install', no separate shell command; refreshed by a full update), How it installs each tool (the per-method table, code-signature repair via non-strict codesign check and ad-hoc re-sign reported per tool, no side-installs via brenner's skip flags, Linux-only SRPS and RP shown as skipped, WA's release-tagged installer (ft and FrankenTerm.app), and MDWB's Chrome for Testing hook), Prerequisites (toolchains plus minisign and flock), Weekly updates and failure escalation (including the LaunchAgent PATH taken from the shell running macacfs schedule, the Homebrew-bash shebang and the detached reload), Versioning (patch number up by one per commit), Design notes, and Layout (incl. lib/codesign.sh and lib/hooks.sh). Its per-method table [[fb-manifest-tsv-impl|couples-with|The README lists which tools use each install method, a hand-maintained copy of the manifest's method column that must be updated whenever a row's method changes.]].
