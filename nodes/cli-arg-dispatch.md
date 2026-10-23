<!--stratified-action
{
  "created": 1789593894,
  "disc_stamp": {
    "disc-callout-distal": "1.0.0",
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
  "edges": [
    {
      "dst": "macacfs-command-surface",
      "reason": "The closed command set the user sees is enforced by the argv dispatcher.",
      "type": "serves"
    },
    {
      "dst": "argv-and-usage",
      "reason": "The dispatcher is built on the argv/usage subsystem.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-minimal-scope",
      "reason": "Restricting argv to install, update, self-update, and schedule plus global flags is the code-level enforcement of the deliberately minimal feature set.",
      "type": "validated-by"
    },
    {
      "dst": "newproj-dispatch",
      "reason": "newproj argv is handed off to the newproj dispatcher",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "cli-arg-dispatch",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "succeeds": "cli-arg-dispatch@v1",
  "uid": "n0022",
  "version": 2
}
-->

The capability to route argv into exactly the closed verb set: the mutating verbs install, update, self-update, schedule, newproj (alias new) and config, the read-only list, version and help, and the internal _tick, with --dry-run as the only per-verb flag on install/update/self-update and --install/--uninstall/--status on schedule; newproj and config arguments are handed whole to their own parsers; anything else is rejected with an error and a non-zero exit. It [[macacfs-command-surface|serves|It enforces in code the deliberately small command surface the user sees.]] and is [[argv-and-usage|accomplished-by|The argv parsing and usage subsystem realizes this dispatch.]]. It is accomplished by [[newproj-dispatch|accomplished-by|newproj argv is handed off to the newproj dispatcher.]].
