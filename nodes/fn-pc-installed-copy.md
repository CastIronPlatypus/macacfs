<!--stratified-action
{
  "created": 1792865409,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this function is part of the check",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-pc-installed-copy",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0297",
  "version": 1
}
-->

_pc_installed_copy <row> <cli> prints the real path of the copy the row's method installed: for brew, $(brew --prefix <formula>)/bin/<cli>; otherwise the first copy in the user dirs, /usr/local/bin or Homebrew's bin that is newer than SIG_MARKER; nothing when unknown. Within the flow it [[lf-cli-path-audit|serves|It finds the target copy.]]. It is defined in [[fb-lib-pathcheck|serves|Defined in lib/pathcheck.sh.]]. It [[fn-pc-user-dirs|calls|For the dirs to search.]] and [[fn-row-method|calls|To branch on the method.]].
