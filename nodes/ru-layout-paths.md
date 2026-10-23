<!--stratified-action
{
  "created": 1792790411,
  "edges": [
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "compute paths the way ru does",
      "type": "validated-by"
    },
    {
      "dst": "remote-integration",
      "reason": "realized by the remote-integration subsystem",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "ru-layout-paths",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0123",
  "version": 1
}
-->

The capability to ask ru for its resolved configuration ('ru config', which prints PROJECTS_DIR= and LAYOUT= lines), map a project NAME to the path ru would use for OWNER/NAME on github.com under that layout — flat: base/NAME, owner-repo: base/OWNER/NAME, full: base/github.com/OWNER/NAME — with env/setting base overrides, the owner from --github-owner or the gh login, and a base/NAME fallback whenever ru, its layout or a needed owner is unavailable; exported to the Python bootstrap as NEWPROJ_DEFAULT_PROJECTS_DIR and NEWPROJ_RU_LAYOUT. It [[projects-dir-resolution|serves|Computing ru-layout paths is how the directory-resolution problem is solved.]]. It is accomplished by [[remote-integration|accomplished-by|realized by the remote-integration subsystem.]].
