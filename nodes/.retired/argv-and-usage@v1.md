<!--stratified-action
{
  "created": 1789593935,
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
      "dst": "cli-arg-dispatch",
      "reason": "The argv dispatcher is built on this parser/usage subsystem.",
      "type": "serves"
    },
    {
      "dst": "argv-code",
      "reason": "The argv subsystem is realized by the argv code.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-minimal-scope",
      "reason": "Argument parsing admits only the closed verb+flag set and rejects anything else, so no ACFS-style provisioning or phase-runner command can ever be invoked.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "argv-and-usage",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "retire_reason": "verb set gains newproj/new and config",
  "retired_at": 1792790050,
  "status": "retired",
  "stratum": "subsystems",
  "uid": "n0029",
  "version": 1
}
-->

The argument-parsing and usage/help subsystem of bin/macacfs: main() matches the first argv word against the closed verb set (install, update, self-update, schedule, list, version, help, plus the internal _tick fired by the LaunchAgent), parse_dry_run splits --dry-run from tool selectors, schedule accepts only --install/--uninstall/--status, and any unknown verb or schedule option prints a clear error (plus usage for verbs) and exits 2; usage() renders the help text with the live catalog count. It [[cli-arg-dispatch|serves|The argv dispatcher routes each verb using the closed verb+flag set this subsystem parses and validates.]] and is [[argv-code|accomplished-by|The main/usage/parse_dry_run functions in bin/macacfs realize this parser and help text.]].
