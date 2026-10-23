<!--stratified-action
{
  "accept": "Setting newproj.github=private makes a plain newproj create a private repo; an explicit --no-github overrides it.",
  "created": 1792789943,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-persistent-settings",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0093",
  "version": 1
}
-->

macacfs keeps a persistent key=value settings file (XDG config dir) managed by 'macacfs config get|set|unset|list', with newproj.github, newproj.ru and newproj.projects_dir honored by all newproj modes; precedence flag > env > config > default.
