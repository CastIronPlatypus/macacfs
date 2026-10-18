<!--stratified-action
{
  "created": 1789594033,
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
      "dst": "argv-and-usage",
      "reason": "This code realizes the argv/usage subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-bin-macacfs",
      "reason": "The argv/dispatch code lives in bin/macacfs.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-minimal-scope",
      "reason": "The argv parser code hard-codes the small verb set and errors on unknown input, enforcing in code that macacfs exposes only install, update, self-update, and schedule.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "argv-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0036",
  "version": 1
}
-->

Code unit in bin/macacfs that parses argv and dispatches: main() case-matches the verb (install, update, self-update, schedule, list, version, help, internal _tick), calls require_darwin for the mutating verbs, uses parse_dry_run to separate --dry-run from TOOL selectors, routes to run_tools / shell_run / selfupdate_run / schedule_* / catalog_rows, and rejects unknown verbs or schedule options on stderr with exit 2; usage() prints the help text. It [[argv-and-usage|serves|This code realizes the argv/usage subsystem's closed verb+flag parsing and help text.]] and is [[fb-bin-macacfs|accomplished-by|The main, usage and parse_dry_run functions live in the bin/macacfs file.]]. The internal _tick verb [[fb-plist-template|couples-with|The plist template hard-codes _tick as the second ProgramArguments string, so renaming the verb here silently breaks every scheduled run.]].
