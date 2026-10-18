<!--stratified-action
{
  "created": 1789593894,
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
    }
  ],
  "is_bead": false,
  "name": "cli-arg-dispatch",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0022",
  "version": 1
}
-->

Parse argv into exactly the closed verb set (install, update, self-update, schedule) plus global flags, rejecting anything else. Enforces the deliberately small [[macacfs-command-surface|flow]] in code. Accomplished by [[argv-and-usage|accomplished-by]].
