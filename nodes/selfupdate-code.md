<!--stratified-action
{
  "created": 1789594032,
  "edges": [
    {
      "dst": "repo-fetch-replace",
      "reason": "This code realizes the fetch-and-replace subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-selfupdate",
      "reason": "The self-update code lives in lib/selfupdate.sh.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-install-sh",
      "reason": "The bootstrap installer shares the fetch/install path.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-readme",
      "reason": "The README documents distribution/bootstrap.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "This code unit performs the repo fetch and atomic replacement of the installed CLI and manifest, so 'macacfs self-update' yields the latest version.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "selfupdate-code",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0035",
  "version": 1
}
-->

Code unit that fetches the public repo and atomically replaces the installed CLI + manifest. Realizes [[repo-fetch-replace|flow]]. Accomplished by [[fb-lib-selfupdate|accomplished-by]], [[fb-install-sh|accomplished-by]], and [[fb-readme|accomplished-by]].
