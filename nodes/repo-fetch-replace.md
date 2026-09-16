<!--stratified-action
{
  "created": 1789593935,
  "edges": [
    {
      "dst": "self-update-capability",
      "reason": "Self-update is realized by fetching the repo and atomically replacing the installed CLI.",
      "type": "serves"
    },
    {
      "dst": "selfupdate-code",
      "reason": "The fetch/replace subsystem is realized by the self-update code.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "repo-fetch-replace",
  "node_type": "unclassified",
  "obligations": [
    "r-self-update"
  ],
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0028",
  "version": 1
}
-->

Fetch the public repo (git clone/pull) and atomically replace the installed macacfs script + libs + manifest. Underpins [[self-update-capability|flow]] and is the payload of the bootstrap install.sh. Accomplished by [[selfupdate-code|accomplished-by]].
