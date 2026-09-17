<!--stratified-action
{
  "created": 1789599667,
  "edges": [],
  "is_bead": false,
  "name": "shell-spec-store",
  "node_type": "unclassified",
  "obligations": [
    "r-terminal-env"
  ],
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0063",
  "version": 1
}
-->

The share/ data files that declare the terminal environment: the brew-bundle list (formulae + casks), the mac-adapted zshrc, the p10k preset, and the atuin agent-safe shim script. Read by the catalog capability; contains no logic, only declarative data + shipped config assets. Serves [[shell-environment-catalog|serves]]; accomplished by [[shell-assets-code|accomplished-by]].
