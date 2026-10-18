<!--stratified-action
{
  "created": 1789594075,
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
      "reason": "Each manifest.tsv row carries a method column (brew, installer-sh, cargo-git or go), which is the per-tool data the dispatcher uses to choose the install method.",
      "type": "validated-by"
    },
    {
      "dst": "req-install-whole-suite",
      "reason": "share/manifest.tsv lists all 39 suite tools with repo and CLI name, so it defines the complete set 'macacfs install' must put on PATH.",
      "type": "validated-by"
    },
    {
      "dst": "req-prefer-homebrew",
      "reason": "manifest.tsv uses the brew method for all 15 tools that dicklesworthstone/tap publishes, encoding the Homebrew preference (MS and SRPS, named in the requirement, are currently cargo-git and installer-sh).",
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0039",
  "version": 1
}
-->

The share/manifest.tsv file boundary: the 39-row tool catalog, one tab-separated row per tool with abbr, repo, cli, method, ref and args columns, encoding the verified per-tool macOS install method. Homebrew is used for the 15 tools that dicklesworthstone/tap publishes (NTM, MAIL, UBS, BV, CASS, CM, SLB, DCG, BR, CAAM, RU, RCH, XF, TRU, EE); MS is currently cargo-git and SRPS installer-sh, not brew. Per-row installer args switch off bundled side-installs (BRENNER's --skip-ntm --skip-cass --skip-cm). Bead (data). It [[catalog-loader-code|serves|The manifest data is what the catalog loader code reads.]] and is [[fb-manifest-tsv-impl|accomplished-by|The actual share/manifest.tsv data file with its 39 tab-separated tool rows delivers this bead.]]. Its columns [[fb-lib-catalog|couples-with|lib/catalog.sh indexes these six columns by fixed position, so the column order is a cross-file contract.]], and its method values [[fb-lib-methods|couples-with|Each row's method must be one of the four names dispatch_row recognizes (brew, installer-sh, cargo-git, go), with ref/args shaped for that method.]].
