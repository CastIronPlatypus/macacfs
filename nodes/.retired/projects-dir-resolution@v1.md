<!--stratified-action
{
  "created": 1792790002,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "the default project directory must suit macOS and ru",
      "type": "validated-by"
    },
    {
      "dst": "req-persistent-settings",
      "reason": "newproj.projects_dir setting feeds the resolver",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "projects-dir-resolution",
  "node_type": "problem",
  "retire_reason": "user decision: follow ru's configured layout instead of hard-coding owner nesting",
  "retired_at": 1792790409,
  "status": "retired",
  "stratum": "problem",
  "uid": "n0099",
  "version": 1
}
-->

acfs defaults new projects to /data/projects/NAME, an Ubuntu VPS convention. On a Mac that path may not exist, while ru's owner-repo layout expects PROJECTS_DIR/OWNER/REPO. The default must resolve from MACACFS_PROJECTS_DIR, ACFS_PROJECTS_DIR, the newproj.projects_dir setting, ru's PROJECTS_DIR, an existing /data/projects, then ~/Projects — identically in bash and in the Python bootstrap — and nest under the GitHub owner when --github or --ru is in effect, while an explicit directory argument always wins. The problem is [[newproj-experience|accomplished-by|newproj's default directory follows this resolution order.]]
