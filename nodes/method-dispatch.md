<!--stratified-action
{
  "created": 1789593893,
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
    },
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "Taking one catalog row and running its install or update through the matching method is the per-tool dispatch behavior the requirement defines.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "method-dispatch",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0017",
  "version": 1
}
-->

The capability that, given one catalog row, performs its install-or-update via the row's method: brew (install or upgrade the tap formula), installer-sh (curl the tool's own installer and pipe it to bash with the row's args), cargo-git (cargo install --git --force) or go (go install @latest); an unknown method fails the row loudly. Install and update converge here (re-run = latest, idempotent), and --dry-run prints each intended command instead. It [[install-experience|serves|The install experience is realized by dispatching each selected catalog row through its method.]] and [[macacfs-command-surface|serves|The update command, all or named, is realized by the same dispatch re-running each method to latest.]]. It is [[install-method-functions|accomplished-by|Dispatch selects among the per-method install functions.]] and [[homebrew-and-toolchains|accomplished-by|Every branch relies on the toolchains the prerequisite helpers provide, Homebrew for brew, cargo for cargo-git, go for go.]]. It [[never-start-services|conforms-to|Dispatch never invokes any tool's service or daemon start, only binary installs and upgrades.]].
