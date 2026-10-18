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
  "retire_reason": "--no-verify did not help: frankenterm's main installer refuses v0.15.1's single-binary archive. The WA row now uses the installer published with the latest release, drops --no-verify, and names its real CLI, ft.",
  "retired_at": 1792290107,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-manifest-tsv-impl@v2",
  "uid": "n0050",
  "version": 3
}
-->

Implementation of share/manifest.tsv; it [[fb-manifest-tsv|serves|The share/manifest.tsv file is the implementation artifact that satisfies the 39-row catalog bead.]]. A commented header documents the columns and method values, followed by 39 tab-separated tool rows (abbr, repo, cli, method, ref, args, with '-' for no args): 15 brew rows from dicklesworthstone/tap, 19 installer-sh rows, 3 cargo-git rows and 2 skip rows (no go rows at present). The skip rows, SRPS and RP, carry their Linux-only reason in the ref column (apt-get/ananicy-cpp/sudo; iptables/ipset and Linux socket APIs). The BRENNER row passes --skip-ntm --skip-cass --skip-cm so brenner's installer does not drop pinned older ntm/cass/cm copies into ~/.local/bin ahead of the Homebrew-installed NTM, CASS and CM rows, and the WA row passes --no-verify because frankenterm's latest release is not minisign-signed (its SHA-256 is still checked and signature repair still runs afterwards). Its column order [[fb-lib-catalog-impl|couples-with|lib/catalog.sh reads these six columns by fixed awk position, so the column order here is a contract with its row accessors.]].
