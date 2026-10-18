<!--stratified-action
{
  "created": 1789594075,
  "edges": [
    {
      "dst": "catalog-loader-code",
      "reason": "The manifest data is what the loader reads.",
      "type": "serves"
    },
    {
      "dst": "fb-manifest-tsv-impl",
      "reason": "The manifest bead is delivered by the actual share/manifest.tsv data file with its 39 tab-separated tool rows.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "Each manifest.tsv row carries a method column, which is the per-tool data the dispatcher uses to choose installer.sh, brew, cargo, go, npm, or bash.",
      "type": "validated-by"
    },
    {
      "dst": "req-install-whole-suite",
      "reason": "share/manifest.tsv lists all 39 suite tools with repo and CLI name, so it defines the complete set 'macacfs install' must put on PATH.",
      "type": "validated-by"
    },
    {
      "dst": "req-prefer-homebrew",
      "reason": "manifest.tsv marks MS and SRPS with the brew method, encoding the Homebrew preference for tools that publish a tap.",
      "type": "validated-by"
    },
    {
      "dst": "req-no-cross-tool-side-installs",
      "reason": "the manifest's per-row installer args are where bundled side-installs are switched off",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-manifest-tsv",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0039",
  "version": 1
}
-->

share/manifest.tsv — the 39-row catalog: abbr, repo, cli, method, extra. Encodes verified macOS truth incl. brew-preferred rows (MS, SRPS). Bead (data).
