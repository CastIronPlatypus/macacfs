<!--stratified-action
{
  "created": 1789594033,
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
  "status": "drafting",
  "stratum": "components",
  "uid": "n0036",
  "version": 1
}
-->

Code unit: parse argv into the closed verb+flag set, dispatch to subcommands, print usage; reject unknown input. Realizes [[cli-arg-dispatch|flow]]. Accomplished by [[fb-bin-macacfs|accomplished-by]].
