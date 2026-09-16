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
    }
  ],
  "is_bead": false,
  "name": "argv-code",
  "node_type": "impl",
  "obligations": [
    "r-scope-min"
  ],
  "status": "drafting",
  "stratum": "components",
  "uid": "n0036",
  "version": 1
}
-->

Code unit: parse argv into the closed verb+flag set, dispatch to subcommands, print usage; reject unknown input. Realizes [[cli-arg-dispatch|flow]]. Accomplished by [[fb-bin-macacfs|accomplished-by]].
