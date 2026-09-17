<!--stratified-action
{
  "created": 1789599605,
  "edges": [],
  "is_bead": false,
  "name": "shell-environment-catalog",
  "node_type": "unclassified",
  "obligations": [
    "r-terminal-env"
  ],
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0061",
  "version": 1
}
-->

The declarative source of truth for the terminal environment: the list of Homebrew formulae in the modern-CLI bundle, the casks (the Nerd Font), and which shell-UX components (omz, p10k, plugins) and standalone tools (atuin, zoxide, lazygit, ast-grep) to provision. It parallels the tool-catalog but for the shell environment rather than the 39 tools. Serves [[shell-setup-experience|serves]]; accomplished by [[shell-spec-store|accomplished-by]].
