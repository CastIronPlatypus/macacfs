<!--stratified-action
{
  "accept": "'macacfs list' shows GUM, GLOW and JQ as brew rows; 'macacfs install --dry-run gum glow jq' plans three brew installs; re-running 'macacfs install gum glow jq' on a machine that already has them exits 0 with three ok rows.",
  "created": 1792795223,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-newproj-helper-tools",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0227",
  "version": 1
}
-->

macacfs install also installs gum, glow and jq, the third-party command-line tools that the newproj wizard uses: gum draws the TUI, glow previews AGENTS.md and jq parses NTM's JSON. They are added as Homebrew-core brew rows in share/manifest.tsv, following the existing manifest conventions and methods, so a full install or update (and 'macacfs install gum glow jq') installs or upgrades them like any other row.
