<!--stratified-action
{
  "accept": "'macacfs newproj x --tools ee,cm' leaves x with .ee/ee.db and .cass/; 'macacfs projinit DIR --status --json' reports each tool initialized/missing/unavailable; re-running projinit on an initialized project changes nothing; '--save-defaults' writes newproj.tools.",
  "created": 1794937205,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-per-project-tool-init",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0315",
  "version": 1
}
-->

macacfs can initialize the per-project parts of the flywheel tools (br beads, ee workspace + its agent hooks, cm repo-level .cass, ntm, slb, ms, ubs ignore file) in a project: newproj lets the user choose which in every mode (classic CLI flags, TUI wizard, Python reviewed plan), the chosen set can be saved as the default (config key newproj.tools), and 'macacfs projinit [DIR]' inspects an existing project and initializes only the desired tools that are not yet initialized, interactively (-i) or not. Each init is idempotent and uses the tool's own init/hook command.
