<!--stratified-action
{
  "created": 1789594981,
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
  "realized_at": "0.14.0",
  "realized_fp": "1789594559:3123",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-manifest-tsv-impl@v1",
  "uid": "n0050",
  "version": 2
}
-->

Implementation of fb-manifest-tsv: `share/manifest.tsv` — the 39 tab-separated tool rows (abbr, repo, cli, method, ref, args). The BRENNER row passes --skip-ntm --skip-cass --skip-cm so brenner's installer does not drop pinned older ntm/cass/cm copies into ~/.local/bin ahead of the Homebrew-installed NTM, CASS and CM rows.
