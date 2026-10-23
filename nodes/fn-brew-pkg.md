<!--stratified-action
{
  "created": 1792790698,
  "edges": [
    {
      "dst": "req-prefer-homebrew",
      "reason": "terminal tools come from Homebrew formulae and casks",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-brew-pkg",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0184",
  "version": 1
}
-->

_brew_pkg <formula|cask> <name> upgrades the package when brew lists it (tolerating a non-zero 'up to date' and then confirming it is listed) or installs it otherwise, adding --cask for casks; under dry-run it prints. Within the flow it [[lf-shell-setup|serves|_brew_pkg is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|_brew_pkg is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of _brew_pkg lives in the lib/shell.sh implementation.]]. It [[fn-sh-dry|calls|Dry-run test.]].
