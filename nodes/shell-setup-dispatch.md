<!--stratified-action
{
  "created": 1789599605,
  "edges": [
    {
      "dst": "req-terminal-environment-parity",
      "reason": "Routing each catalog entry to brew, cask, the omz installer, git clones, zshrc writing, or tool installs is how every parity component gets provisioned on macOS.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-setup-dispatch",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0062",
  "version": 1
}
-->

Given the catalog, dispatch each provisioning action to the right macOS method: 'brew install/upgrade' for the bundle, 'brew install --cask' for the font, the official Oh My Zsh installer, git-clone for Powerlevel10k and plugins, writing the managed zshrc (with backup) and p10k preset, and installing atuin (behind the agent-safe shim), zoxide, lazygit, and ast-grep. It parallels method-dispatch but for shell components. Serves [[shell-setup-experience|serves]]; accomplished by [[shell-setup-functions|accomplished-by]].
