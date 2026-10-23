<!--stratified-action
{
  "created": 1792790761,
  "edges": [
    {
      "dst": "req-self-update",
      "reason": "the one-liner bootstrap is also the fallback update path",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-bootstrap",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0216",
  "version": 1
}
-->

Bootstrap one-liner: install.sh refuses non-macOS hosts and hosts without git, ensures ~/.local/bin, fast-forwards an existing ~/.macacfs checkout or clones a fresh one, marks bin/macacfs executable and symlinks it into ~/.local/bin, then warns if that directory is not on PATH and prints the next commands. This flow [[fb-install-sh|serves|The flow is realized by code in install.sh.]], and with no functions of its own it is [[fb-install-sh-impl|accomplished-by|install.sh is a straight-line script, so its implementation node carries the flow directly.]]. Related flows: [[lf-cli-dispatch|flow|The symlink it creates is what _resolve_dir follows back to the install home.]].
