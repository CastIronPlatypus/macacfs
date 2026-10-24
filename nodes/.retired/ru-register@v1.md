<!--stratified-action
{
  "created": 1792790035,
  "edges": [
    {
      "dst": "req-newproj-ru-optional",
      "reason": "ru registration",
      "type": "validated-by"
    },
    {
      "dst": "remote-integration",
      "reason": "The remote integration subsystem realizes ru registration.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "ru-register",
  "node_type": "unclassified",
  "retire_reason": "ru now registers the repo by name and clones it into its layout path before scaffolding",
  "retired_at": 1792869543,
  "status": "retired",
  "stratum": "capabilities",
  "uid": "n0106",
  "version": 1
}
-->

The capability to preflight ru (installed, and a GitHub remote will exist) then run 'ru add --from-cwd' (with --private for private repos) from the project root and confirm the repo is listed, reporting but never undoing anything on failure. It [[newproj-experience|serves|Registering with ru is an optional part of the newproj experience.]]. It is accomplished by [[remote-integration|accomplished-by|The remote integration subsystem realizes ru registration.]].
