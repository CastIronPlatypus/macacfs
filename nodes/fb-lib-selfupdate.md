<!--stratified-action
{
  "created": 1789594077,
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
      "dst": "selfupdate-code",
      "reason": "This file realizes the self-update code.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-selfupdate-impl",
      "reason": "The self-update bead is delivered by lib/selfupdate.sh, which fast-forwards the checkout or clones the public repo into a temp dir and swaps the installed tree into place.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "lib/selfupdate.sh re-downloads the repo and atomically replaces the installed CLI, libs, and manifest, which is the self-update behavior required.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-selfupdate",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0045",
  "version": 1
}
-->

The lib/selfupdate.sh file boundary: selfupdate_run, which updates the whole MACACFS_HOME tree (CLI, libs, share/ manifest and assets) from the public repo, by git pull --ff-only when it is a checkout or by shallow-cloning into a temp dir and swapping it into place (old tree moved aside, new moved in, backup preserved on failure) when it is not; there is no persistent cache. It [[selfupdate-code|serves|This file holds the self-update code unit.]] and is [[fb-lib-selfupdate-impl|accomplished-by|lib/selfupdate.sh performs the fast-forward or temp-clone-and-swap of the installed tree.]]. Its repo default [[fb-install-sh|couples-with|install.sh and this file each hard-code the default MACACFS_REPO_URL and the ~/.macacfs checkout layout, so bootstrap and self-update must agree on both.]].
