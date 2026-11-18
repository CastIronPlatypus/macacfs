<!--stratified-action
{
  "created": 1794937245,
  "edges": [
    {
      "dst": "req-per-project-tool-init",
      "reason": "it is the single definition of which tools can be initialized per project and how",
      "type": "validated-by"
    },
    {
      "dst": "projinit-dispatch",
      "reason": "projinit asks the registry for each tool's state and initializer",
      "type": "serves"
    },
    {
      "dst": "newproj-dispatch",
      "reason": "newproj initializes its chosen tools through the registry",
      "type": "serves"
    }
  ],
  "is_bead": false,
  "name": "project-tool-registry",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0317",
  "version": 1
}
-->

The project tool registry: one table of the flywheel tools that have a per-project part, each with an id, its CLI, a one-line description, a detector and an initializer that run inside a project directory. br: detected by .beads/, initialized by 'br init'. ee: detected by .ee/ee.db, initialized by 'ee init --workspace DIR' then 'ee hook claude-code --install' (user-level Claude Code hooks, idempotent) and, when Codex is present, 'ee hook codex --install --workspace DIR' (project .codex/hooks.json). cm: detected by .cass/, initialized by 'cm init --repo --no-interactive'. ntm: detected by .ntm/, initialized by 'ntm init --non-interactive DIR' (its git hooks only when DIR is a git repo, else --no-hooks). slb: detected by .slb/, initialized by 'slb init' then 'slb hook install' (project .claude/settings.json). ms: detected by .ms/, initialized by 'ms init'. ubs: detected by .ubsignore, initialized by writing the standard ignore file. Tools without a per-project part (cass, which indexes globally) are not in the table. A tool whose CLI is not on PATH is 'unavailable'. Every initializer is idempotent and runs only the tool's own command, never starts a service. It [[projinit-dispatch|serves|projinit asks the registry for each tool's state and initializer.]] and [[newproj-dispatch|serves|newproj initializes its chosen tools through the same registry after scaffolding.]]. It is [[projinit-code|accomplished-by|the registry is the table and functions in lib/projinit.sh.]].
