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
      "reason": "The install.sh bootstrap bead is delivered by the actual install.sh file that performs the darwin check, clones the repo, and puts macacfs on PATH.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "Self-update reuses install.sh's clone-and-install path, so this bootstrap script is the mechanism that reinstalls macacfs from the freshly fetched repo.",
      "type": "validated-by"
    },
    {
      "dst": "req-public-github-repo",
      "reason": "install.sh is the curl-able one-liner served from the public GitHub repo, making it the entry point of the public distribution the requirement describes.",
      "type": "validated-by"
    },
    {
      "dst": "req-macos-only",
      "reason": "install.sh performs a darwin check before cloning or installing anything, so the one-liner bootstrap itself refuses to run off macOS.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-install-sh",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0046",
  "version": 1
}
-->

install.sh — the one-liner bootstrap: darwin check, clone repo, install macacfs onto PATH; reused by self-update. Bead.
