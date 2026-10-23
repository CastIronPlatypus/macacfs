<!--stratified-action
{
  "created": 1792790034,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "gh-based publish",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-never-deletes",
      "reason": "publish failures keep the local project",
      "type": "validated-by"
    },
    {
      "dst": "remote-integration",
      "reason": "The remote integration subsystem realizes GitHub publishing.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "github-publish",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0105",
  "version": 1
}
-->

The capability to preflight gh (installed, authenticated, owner resolved, OWNER/NAME free, git identity present) before any local write, then after the local project exists run 'gh repo create OWNER/NAME --private|--public --source=. --remote=origin --push', scanning files bound for a public repo for personal data first, and on failure keep everything and print the manual commands. It [[newproj-experience|serves|Publishing to GitHub is an optional part of the newproj experience.]]. It is accomplished by [[remote-integration|accomplished-by|The remote integration subsystem realizes GitHub publishing.]].
