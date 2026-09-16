<!--stratified-action
{
  "created": 1789593793,
  "edges": [
    {
      "dst": "scope-containment",
      "reason": "The limited, closed command set is exactly what keeps the tool from growing back into full ACFS \u2014 scope is enforced at the surface.",
      "type": "serves"
    },
    {
      "dst": "update-equals-reinstall-idempotency",
      "reason": "The install/update commands are the surface where re-run-to-latest idempotency is exercised.",
      "type": "serves"
    },
    {
      "dst": "cli-arg-dispatch",
      "reason": "The closed command set is enforced by the argv dispatcher.",
      "type": "accomplished-by"
    },
    {
      "dst": "method-dispatch",
      "reason": "install/update commands are realized by method dispatch.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "macacfs-command-surface",
  "node_type": "surface",
  "obligations": [
    "r-scope-min"
  ],
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0011",
  "version": 1
}
-->

The only things an observer can invoke: 'macacfs install [TOOL...]', 'macacfs update [TOOL...]', 'macacfs self-update', 'macacfs schedule [--install|--uninstall|--status]', plus global flags --dry-run, --list, --version, --help. There is intentionally NO user-provisioning, OS-upgrade, service-start, or phase-runner command — the limited surface IS how scope containment ([[scope-containment]]) is enforced, and it carries the manual per-tool/all update contract ([[update-equals-reinstall-idempotency]]). Accomplished by [[cli-arg-dispatch|accomplished-by]] and [[method-dispatch|accomplished-by]].
