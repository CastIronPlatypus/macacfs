<!--stratified-action
{
  "created": 1789594077,
  "edges": [
    {
      "dst": "selfupdate-code",
      "reason": "The bootstrap installer shares the fetch-and-install path with self-update.",
      "type": "serves"
    },
    {
      "dst": "fb-install-sh-impl",
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-install-sh",
  "node_type": "impl",
  "obligations": [
    "r-self-update",
    "r-github-repo",
    "r-macos-only"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0046",
  "version": 1
}
-->

install.sh — the one-liner bootstrap: darwin check, clone repo, install macacfs onto PATH; reused by self-update. Bead.
