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
  "retire_reason": "README documents skip rows (SRPS, RP), WA --no-verify, the MDWB Chrome for Testing hook, the LaunchAgent PATH captured from the scheduling shell, and the per-commit version bump.",
  "retired_at": 1792289681,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-readme-impl@v2",
  "uid": "n0058",
  "version": 3
}
-->

Implementation of README.md; it [[fb-readme|serves|The README.md file is the implementation artifact that satisfies the documentation bead.]]. Sections: the mini-ACFS-for-Mac scope, Install (the curl one-liner), Usage (install/update with optional TOOL selectors, self-update, schedule, list), Terminal environment (part of a full 'macacfs install', no separate shell command; refreshed by a full update), How it installs each tool (the per-method table, code-signature repair via non-strict codesign check and ad-hoc re-sign reported per tool, and no side-installs via brenner's skip flags), Prerequisites (toolchains plus minisign and flock), Weekly updates and failure escalation (including the LaunchAgent's own PATH, the Homebrew-bash shebang and the detached reload), Design notes, and Layout (incl. lib/codesign.sh). Its per-method table [[fb-manifest-tsv-impl|couples-with|The README lists which tools use each install method, a hand-maintained copy of the manifest's method column that must be updated whenever a row's method changes.]].
