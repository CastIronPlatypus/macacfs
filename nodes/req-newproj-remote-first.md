<!--stratified-action
{
  "accept": "With ru's LAYOUT=owner-repo, 'macacfs newproj demo --github --ru' calls gh repo create OWNER/demo (no --source), ru add OWNER/demo then ru sync OWNER/demo --clone-only, leaves AGENTS.md in <base>/OWNER/demo, and the repo's main holds the Initial commit; the reviewed plan's commands start gh-create, ru-add, ru-sync and end git-add, git-commit, git-push with no git-init.",
  "created": 1792869486,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-newproj-remote-first",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0307",
  "version": 1
}
-->

With --github, newproj creates the empty GitHub repo first, then clones it — with --ru by registering it with ru and letting ru clone it into its own configured layout path (the path is read back from ru), without --ru by gh repo clone into the project directory — then scaffolds the project inside the clone, then makes the initial commit and pushes it to main. With --ru a directory argument that is not ru's path is refused, and --github into an existing directory is refused, both before anything is created. All three modes (classic, wizard, reviewed bootstrap) follow this order.
