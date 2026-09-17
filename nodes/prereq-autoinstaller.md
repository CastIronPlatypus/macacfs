<!--stratified-action
{
  "created": 1789593894,
  "edges": [
    {
      "dst": "install-experience",
      "reason": "The install experience must auto-install missing toolchains before building tools.",
      "type": "serves"
    },
    {
      "dst": "homebrew-and-toolchains",
      "reason": "The prereq gate is implemented by the brew/toolchain helpers.",
      "type": "accomplished-by"
    },
    {
      "dst": "shell-setup-experience",
      "reason": "Shell setup reuses the prerequisite auto-installer to ensure Homebrew is present before the brew bundle and casks install.",
      "type": "serves"
    }
  ],
  "is_bead": false,
  "name": "prereq-autoinstaller",
  "node_type": "unclassified",
  "obligations": [
    "r-prereq-autoinstall"
  ],
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0018",
  "version": 1
}
-->

Ensure the toolchains exist, installing the missing ones: Homebrew first, then rust/go/uv/node. Best-effort and reports what it installed; runs before source-built tools in [[install-experience|flow]]. Accomplished by [[homebrew-and-toolchains|accomplished-by]].
