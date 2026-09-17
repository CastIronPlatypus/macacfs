<!--stratified-action
{
  "created": 1789599668,
  "edges": [],
  "is_bead": false,
  "name": "shell-setup-functions",
  "node_type": "unclassified",
  "obligations": [
    "r-terminal-env"
  ],
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0064",
  "version": 1
}
-->

The lib/shell.sh functions that perform each provisioning action (brew bundle install/upgrade, cask font, omz installer, p10k + plugin git clones, managed-zshrc write with backup, atuin+shim, zoxide, lazygit, ast-grep), each honoring dry-run and returning a clear status. Serves [[shell-setup-dispatch|serves]]; accomplished by [[shell-fns-code|accomplished-by]].
