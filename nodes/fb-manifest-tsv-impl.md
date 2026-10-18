<!--stratified-action
{
  "created": 1789594981,
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
      "dst": "fb-manifest-tsv",
      "reason": "The share/manifest.tsv file is the implementation artifact that satisfies the 39-row catalog bead.",
      "type": "serves"
    }
  ],
  "impl_path": "share/manifest.tsv",
  "is_bead": true,
  "name": "fb-manifest-tsv-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594559:3123",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-manifest-tsv-impl@v1",
  "uid": "n0050",
  "version": 2
}
-->

Implementation of share/manifest.tsv; it [[fb-manifest-tsv|serves|The share/manifest.tsv file is the implementation artifact that satisfies the 39-row catalog bead.]]. A commented header documents the columns and method values, followed by 39 tab-separated tool rows (abbr, repo, cli, method, ref, args, with '-' for no args): 15 brew rows from dicklesworthstone/tap, 20 installer-sh rows and 4 cargo-git rows (no go rows at present). The BRENNER row passes --skip-ntm --skip-cass --skip-cm so brenner's installer does not drop pinned older ntm/cass/cm copies into ~/.local/bin ahead of the Homebrew-installed NTM, CASS and CM rows. Its column order [[fb-lib-catalog-impl|couples-with|lib/catalog.sh reads these six columns by fixed awk position, so the column order here is a contract with its row accessors.]].
