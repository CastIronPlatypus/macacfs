<!--stratified-action
{
  "created": 1789594032,
  "edges": [
    {
      "dst": "install-method-functions",
      "reason": "These functions realize the install-method-functions subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-methods",
      "reason": "TEST2: parent accomplished-by its file-bead child.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "This code unit holds the per-method functions and the dispatcher that selects one by the row's method field, realizing per-tool dispatch.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "method-fns-code",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0031",
  "version": 1
}
-->

Code unit holding the per-method functions and the dispatcher that picks one by a row's method field; each is idempotent and dry-run-aware. Realizes [[install-method-functions|flow]]. Accomplished by [[fb-lib-methods|accomplished-by]].
