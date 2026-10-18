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
      "reason": "The self-update bead is delivered by lib/selfupdate.sh, which fetches the public repo into cache and atomically swaps the installed files.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "lib/selfupdate.sh re-downloads the repo and atomically replaces the installed CLI, libs, and manifest, which is the self-update behavior required.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-selfupdate",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0045",
  "version": 1
}
-->

lib/selfupdate.sh — fetch the public repo into cache, atomically replace installed CLI + libs + manifest. Bead.
