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
    }
  ],
  "is_bead": false,
  "name": "method-fns-code",
  "node_type": "impl",
  "obligations": [
    "r-method-dispatch"
  ],
  "status": "drafting",
  "stratum": "components",
  "uid": "n0031",
  "version": 1
}
-->

Code unit holding the per-method functions and the dispatcher that picks one by a row's method field; each is idempotent and dry-run-aware. Realizes [[install-method-functions|flow]]. Accomplished by [[fb-lib-methods|accomplished-by]].
