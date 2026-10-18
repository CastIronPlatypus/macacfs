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
      "reason": "Installing all/any tools requires the catalog as the list and per-tool method source.",
      "type": "serves"
    },
    {
      "dst": "manifest-store",
      "reason": "The catalog capability is backed by the manifest store.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-install-whole-suite",
      "reason": "As the single source of truth with one row per tool for all 39, the catalog defines exactly which CLIs install must place on PATH.",
      "type": "validated-by"
    },
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "Each catalog row names the one method (and its ref and args) the dispatcher runs for that tool.",
      "type": "validated-by"
    },
    {
      "dst": "req-prefer-homebrew",
      "reason": "The catalog is where Homebrew is chosen: every tool with a dicklesworthstone/tap formula has a brew row.",
      "type": "validated-by"
    },
    {
      "dst": "req-no-cross-tool-side-installs",
      "reason": "The args column carries brenner's --skip-ntm --skip-cass --skip-cm so its installer does not side-install other suite tools.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "tool-catalog",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0016",
  "version": 1
}
-->

The single source of truth for the suite: one row per tool — abbr, repo, cli name, install METHOD (brew, installer-sh, cargo-git or go), ref (tap formula, installer path, git URL or module) and optional args — for all 39 tools, encoding the verified macOS install path for each (15 via the dicklesworthstone tap, 4 via cargo-git, 20 via their own installers; none currently via go). It resolves selectors (abbr or cli, case-insensitive, failing loud on an unknown one) and backs 'macacfs list'. It [[install-experience|serves|Installing all or any tools requires the catalog as the list and the per-tool method source.]] and is [[manifest-store|accomplished-by|The catalog capability is backed by the manifest store.]]. It [[cli-arg-dispatch|couples-with|The TOOL selectors the CLI accepts are exactly the abbr and cli columns of this catalog, so renaming a row's abbr or cli changes what the CLI recognizes.]]
