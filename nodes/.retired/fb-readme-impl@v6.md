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
  "retire_reason": "documents the CLI path audit, a|b cli names, PI, and the DCG/CM agent hooks; layout lists lib/pathcheck.sh",
  "retired_at": 1792865455,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-readme-impl@v5",
  "uid": "n0058",
  "version": 6
}
-->

Implementation of README.md; it [[fb-readme|serves|The README.md file is the implementation artifact that satisfies the documentation bead.]]. Sections: the mini-ACFS-for-Mac scope, Install (the curl one-liner), Usage (install/update with optional TOOL selectors, self-update, schedule, list), New projects (macacfs newproj and its alias new: the classic, wizard and reviewed-bootstrap modes; --github/--no-github/--github-owner and --ru/--no-ru with preflight, initial commit, gh repo create, ru add and keep-local-on-failure; the ru-layout default directory and its fallbacks; ntm/tmux/agy only when present), Settings (macacfs config list/get/set/unset, the XDG key=value file, flag > env > file > off), Shell completions (zsh on fpath via the managed zshrc, bash sourced by hand), Terminal environment (part of a full 'macacfs install', no separate shell command; refreshed by a full update), How it installs each tool (the per-method table, code-signature repair via non-strict codesign check and ad-hoc re-sign reported per tool, no side-installs via brenner's skip flags, Linux-only SRPS and RP shown as skipped, WA's release-tagged installer (ft and FrankenTerm.app), and MDWB's Chrome for Testing hook), Prerequisites (toolchains plus minisign and flock, and newproj's gh/ru/br/python3 notes), Weekly updates and failure escalation (including the LaunchAgent PATH taken from the shell running macacfs schedule, the Homebrew-bash shebang and the detached reload), Versioning (patch number up by one per commit), Design notes, and Layout (incl. lib/codesign.sh and lib/hooks.sh). The opening list adds newproj and config as item 5 and restates the revised minimal scope (still no user provisioning, OS upgrades, service orchestration or phase runner). The method table gains a core-Homebrew row for GUM, GLOW and JQ, and Layout names the 42-tool catalog, lib/config.sh, lib/newproj/, share/completions/ and tests/. It describes [[fb-lib-newproj-core-impl|relates-to|The README's New projects section documents newproj's modes and flags.]] and [[fb-lib-config-impl|relates-to|The README's Settings section documents the config keys and precedence.]]. Its per-method table [[fb-manifest-tsv-impl|couples-with|The README lists which tools use each install method, a hand-maintained copy of the manifest's method column that must be updated whenever a row's method changes.]].
