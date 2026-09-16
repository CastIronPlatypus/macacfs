<!--stratified-action
{
  "created": 1789593893,
  "edges": [
    {
      "dst": "install-experience",
      "reason": "The install experience is realized by dispatching each catalog row through its method.",
      "type": "serves"
    },
    {
      "dst": "macacfs-command-surface",
      "reason": "The update command (all/named) is realized by the same dispatch re-running methods to latest.",
      "type": "serves"
    },
    {
      "dst": "install-method-functions",
      "reason": "Dispatch selects among the per-method functions.",
      "type": "accomplished-by"
    },
    {
      "dst": "homebrew-and-toolchains",
      "reason": "The brew branch of dispatch relies on the Homebrew helper.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "method-dispatch",
  "node_type": "unclassified",
  "obligations": [
    "r-method-dispatch"
  ],
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0017",
  "version": 1
}
-->

Given one catalog row, perform its install-or-update via the correct method: the tool's own install.sh (curl|bash), brew install/upgrade, cargo install --git --force, go install, or bash installer. Install and update converge here (re-run = idempotent). Honors --dry-run, and never invokes any service start ([[never-start-services|flow]]). Accomplished by [[install-method-functions|accomplished-by]] and [[homebrew-and-toolchains|accomplished-by]].
