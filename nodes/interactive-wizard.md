<!--stratified-action
{
  "created": 1792790033,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "TUI wizard",
      "type": "validated-by"
    },
    {
      "dst": "newproj-engine",
      "reason": "The engine's TUI framework and screens realize the wizard.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "interactive-wizard",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0103",
  "version": 1
}
-->

The capability to walk a user through nine terminal screens (welcome, name, directory, tech stack with auto-detection, features including GitHub and ru toggles, AGENTS.md preview/edit, confirmation, progress with retry, success with shell/Claude/NTM launch) using gum when present and plain reads otherwise, then publishing to GitHub and registering with ru when selected. It [[newproj-experience|serves|The wizard is the guided way to reach the same scaffold.]]. It is accomplished by [[newproj-engine|accomplished-by|The engine's TUI framework and screens realize the wizard.]].
