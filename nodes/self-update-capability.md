<!--stratified-action
{
  "created": 1789593894,
  "edges": [
    {
      "dst": "bootstrap-and-self-update",
      "reason": "The one-liner install and self-update command are realized by this fetch-and-replace capability.",
      "type": "serves"
    },
    {
      "dst": "repo-fetch-replace",
      "reason": "Self-update is realized by fetch-and-replace.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "Fetching the public repo and atomically replacing the installed CLI, via the same path as install.sh, is the capability that delivers self-update.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "self-update-capability",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0021",
  "version": 1
}
-->

Fetch the public repo and atomically replace the installed macacfs CLI with the latest; the same path the one-liner install.sh uses initially. Backs [[bootstrap-and-self-update|flow]]. Accomplished by [[repo-fetch-replace|accomplished-by]].
