<!--stratified-action
{
  "created": 1792790755,
  "edges": [
    {
      "dst": "req-prefer-homebrew",
      "reason": "brew-packaged tools are installed and upgraded through Homebrew",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-install-brew",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0205",
  "version": 1
}
-->

Brew install path: do_brew checks whether the formula (the ref's basename) is already listed; if so it runs brew upgrade, tolerating brew's non-zero 'already up to date' exit and then re-checking that the formula is still listed as the real result; otherwise it runs brew install on the full tap/formula ref. Under dry-run it only prints the intended install-or-upgrade. This flow [[fb-lib-methods|serves|The flow is realized by code in lib/methods.sh.]]. It is carried out step by step by [[fn-do-brew|accomplished-by|do_brew performs part of this flow.]].
