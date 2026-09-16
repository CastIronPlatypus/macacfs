<!--stratified-action
{
  "created": 1789594077,
  "edges": [
    {
      "dst": "selfupdate-code",
      "reason": "This file realizes the self-update code.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-selfupdate-impl",
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-selfupdate",
  "node_type": "impl",
  "obligations": [
    "r-self-update"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0045",
  "version": 1
}
-->

lib/selfupdate.sh — fetch the public repo into cache, atomically replace installed CLI + libs + manifest. Bead.
