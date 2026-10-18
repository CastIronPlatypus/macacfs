<!--stratified-action
{
  "created": 1789593935,
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
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0029",
  "version": 1
}
-->

Argument parsing and usage/help text that admit only the closed verb+flag set and reject unknown input with a clear error. Underpins [[cli-arg-dispatch|flow]]. Accomplished by [[argv-code|accomplished-by]].
