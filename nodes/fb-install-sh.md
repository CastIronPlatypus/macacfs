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
      "reason": "install.sh lays down the git checkout at ~/.macacfs that self-update later fast-forwards, and re-running it on an existing checkout pulls the latest, so the bootstrap is the first half of the ACFS-style self-update pattern.",
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0046",
  "version": 1
}
-->

The install.sh file boundary: the curl-able one-liner bootstrap that refuses non-Darwin hosts, requires git, clones (or fast-forwards) the public repo into ~/.macacfs, and links bin/macacfs onto ~/.local/bin. It does not call lib/selfupdate.sh nor is it called by it; the two carry parallel fetch logic. It [[selfupdate-code|serves|The bootstrap installer is the initial-install half of the fetch-and-install mechanism whose update half is the self-update code.]] and is [[fb-install-sh-impl|accomplished-by|The concrete install.sh performs the darwin check, clones the repo, and puts macacfs on PATH.]]. It [[fb-lib-selfupdate|couples-with|Both files hard-code the same default MACACFS_REPO_URL and assume the checkout lives at MACACFS_HOME, so changing the repo location or install prefix in one without the other breaks self-update.]].
