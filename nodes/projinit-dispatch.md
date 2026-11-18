<!--stratified-action
{
  "created": 1794937226,
  "edges": [
    {
      "dst": "req-per-project-tool-init",
      "reason": "projinit is the command that brings an existing project's tool set up to the desired one",
      "type": "validated-by"
    },
    {
      "dst": "macacfs-command-surface",
      "reason": "If projinit-dispatch were removed, 'macacfs projinit' would exit 2 as an unknown verb and an existing project could never gain its missing ee/cm/br setup, so the surface's projinit entry depends on this capability",
      "type": "serves"
    }
  ],
  "is_bead": false,
  "name": "projinit-dispatch",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0316",
  "version": 1
}
-->

The capability to take 'macacfs projinit [DIR] [--tools LIST] [-i] [--status] [--json] [--dry-run] [--save-defaults]' and bring one project's per-project flywheel tool setup up to the desired set. DIR defaults to the current directory and must be an existing directory. The desired set is --tools if given, else the newproj.tools setting (flag > env > config > default); -i shows a gum checklist (text fallback) preselected with that set and each tool's current state. For every desired tool it asks the registry whether the tool is already initialized there; initialized tools are left alone, tools whose CLI is missing are reported unavailable (with the 'macacfs install' hint) and do not fail the run unless all requested tools fail, and the rest are initialized with the tool's own idempotent init command. --status only reports, --dry-run prints the commands, --json emits one machine-readable result per tool (used by the dashboard), and --save-defaults also stores the chosen set as newproj.tools. Exit 0 when every desired available tool ends initialized, 1 otherwise. It [[macacfs-command-surface|serves|If projinit-dispatch were removed, 'macacfs projinit' would exit 2 as an unknown verb and an existing project could never gain its missing ee/cm/br setup, so the surface's projinit entry depends on this capability.]]. It is [[project-tool-registry|accomplished-by|the registry knows how to detect and initialize each tool in a directory.]] and [[config-store|accomplished-by|the default desired set and --save-defaults go through the config store.]].
