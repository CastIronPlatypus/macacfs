<!--stratified-action
{
  "created": 1789593837,
  "edges": [
    {
      "dst": "self-update-bootstrap",
      "reason": "The one-liner install and self-update command are the observable form of the bootstrap/self-update mechanism.",
      "type": "serves"
    },
    {
      "dst": "self-update-capability",
      "reason": "One-liner install and self-update are realized by the self-update capability.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "bootstrap-and-self-update",
  "node_type": "surface",
  "obligations": [
    "r-self-update",
    "r-github-repo"
  ],
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0015",
  "version": 1
}
-->

An observer installs macacfs with a one-liner (curl the repo's install.sh | bash) which places the 'macacfs' CLI on PATH, and later runs 'macacfs self-update' to re-fetch the public repo and replace the installed CLI with the latest. The public GitHub repo + simple README is the distribution surface this rests on. Accomplished by [[self-update-capability|accomplished-by]].
