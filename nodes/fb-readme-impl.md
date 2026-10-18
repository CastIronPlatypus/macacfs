<!--stratified-action
{
  "created": 1789594982,
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
  "realized_at": "0.14.0",
  "realized_fp": "1789594970:4254",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-readme-impl@v2",
  "uid": "n0058",
  "version": 3
}
-->

Implementation of fb-readme: `README.md` — mini-ACFS for Mac: scope, install/usage, terminal environment, per-method install table, code-signature repair (non-strict codesign check, ad-hoc re-sign, reported per tool), no side-installs (brenner skip flags), prerequisites (toolchains plus minisign and flock), weekly updates and failure escalation (including the LaunchAgent's own PATH, the Homebrew-bash shebang and the detached reload), design notes, and layout (incl. lib/codesign.sh).
