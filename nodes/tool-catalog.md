<!--stratified-action
{
  "created": 1789593893,
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
    }
  ],
  "is_bead": false,
  "name": "tool-catalog",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0016",
  "version": 1
}
-->

The single source of truth: one row per tool — abbr, repo, cli name, install METHOD, verify — for all 39 tools. Every other capability reads it. Encodes the verified per-tool macOS truth so [[install-experience|flow]] picks the right path. Accomplished by [[manifest-store|accomplished-by]].
