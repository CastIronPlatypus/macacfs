<!--stratified-action
{
  "created": 1792790032,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "classic CLI scaffold",
      "type": "validated-by"
    },
    {
      "dst": "newproj-engine",
      "reason": "The engine's classic main() realizes the one-shot scaffold.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "project-scaffold",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0102",
  "version": 1
}
-->

The capability to create a new project in one shot: validate the name, resolve and check the directory (new path or existing empty dir), git init -b main, write README, .gitignore, .ubsignore, run br init when available, write .claude/settings.local.json and the AGENTS.md template, then make the initial commit when a git identity exists — skipping each piece per --no-br/--no-claude/--no-agents and never removing anything on failure. It [[newproj-experience|serves|The classic one-shot scaffold is the core of what newproj creates.]]. It is accomplished by [[newproj-engine|accomplished-by|The engine's classic main() realizes the one-shot scaffold.]].
