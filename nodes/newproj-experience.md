<!--stratified-action
{
  "created": 1792789968,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this is the user-visible newproj experience",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-github-optional",
      "reason": "--github is part of the experience",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-ru-optional",
      "reason": "--ru is part of the experience",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-never-deletes",
      "reason": "failures leave artifacts and say so",
      "type": "validated-by"
    },
    {
      "dst": "remote-preflight-before-mutation",
      "reason": "newproj's behavior is what solves the remote-preflight-before-mutation problem",
      "type": "serves"
    },
    {
      "dst": "bash4-on-macos",
      "reason": "newproj's behavior is what solves the bash4-on-macos problem",
      "type": "serves"
    },
    {
      "dst": "projects-dir-resolution",
      "reason": "newproj's behavior is what solves the projects-dir-resolution problem",
      "type": "serves"
    },
    {
      "dst": "plan-review-covers-remote-effects",
      "reason": "newproj's behavior is what solves the plan-review-covers-remote-effects problem",
      "type": "serves"
    },
    {
      "dst": "newproj-dispatch",
      "reason": "Routing every newproj invocation to the right mode is how the whole newproj experience is delivered.",
      "type": "accomplished-by"
    },
    {
      "dst": "project-scaffold",
      "reason": "The classic one-shot scaffold is the core of what newproj creates.",
      "type": "accomplished-by"
    },
    {
      "dst": "interactive-wizard",
      "reason": "The wizard is the guided way to reach the same scaffold.",
      "type": "accomplished-by"
    },
    {
      "dst": "reviewed-bootstrap",
      "reason": "The reviewed bootstrap is the deterministic plan-then-apply mode of newproj.",
      "type": "accomplished-by"
    },
    {
      "dst": "github-publish",
      "reason": "Publishing to GitHub is an optional part of the newproj experience.",
      "type": "accomplished-by"
    },
    {
      "dst": "ru-register",
      "reason": "Registering with ru is an optional part of the newproj experience.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-readme",
      "reason": "documented in README",
      "type": "relates-to"
    },
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "the experience's default dir",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "newproj-experience",
  "node_type": "surface",
  "status": "drafting",
  "stratum": "surface",
  "succeeds": "newproj-experience@v1",
  "uid": "n0095",
  "version": 2
}
-->

What a user sees when running 'macacfs newproj' (alias 'new'): the classic one-shot form 'macacfs newproj NAME [DIR] [--no-br] [--no-claude] [--no-agents]' that creates a git repo, README, .gitignore, .ubsignore, beads, Claude settings and an AGENTS.md template and commits; the interactive wizard '-i' with nine screens (welcome, name, directory, tech stack, features, AGENTS.md preview, confirmation, progress, success) whose success screen can open a shell, Claude Code or an NTM workspace; and the reviewed bootstrap '--plan/--apply/--guided' that prints a JSON plan, applies it exactly with checkpointed resume, and optionally wires Agent Mail. Across all modes '--github[=private|public]' publishes the project to GitHub and '--ru' registers it with ru, defaulting from the persistent settings; the default directory follows ru's configured PROJECTS_DIR and LAYOUT (flat, owner-repo or full) when ru is installed, and an explicit directory always wins. It [[macacfs-command-surface|serves|newproj is one of the verbs on the closed command surface.]].
