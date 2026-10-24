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
  "succeeds": "github-publish@v1",
  "uid": "n0105",
  "version": 2
}
-->

The capability to preflight gh (installed, authenticated, owner resolved, OWNER/NAME free, git identity present, and the target directory not yet existing) before anything local or remote is written, then — remote-first — create the empty repo with 'gh repo create OWNER/NAME --private|--public', clone it (through ru when ru registration is selected, else gh repo clone into the project directory), let newproj scaffold the project inside that clone, and finally make the initial commit and push it to main, scanning files bound for a public repo for personal data before the push. On failure it stops, prints what already exists and how to finish by hand, and never deletes. It [[newproj-experience|serves|Publishing to GitHub is an optional part of the newproj experience.]] and meets [[req-newproj-remote-first|validated-by|The repo is created and cloned before any project file is written.]]. It is accomplished by [[remote-integration|accomplished-by|The remote integration subsystem realizes GitHub publishing.]].
