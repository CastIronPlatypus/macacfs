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
    },
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "this problem is exactly the ru-layout requirement",
      "type": "validated-by"
    },
    {
      "dst": "ru-layout-paths",
      "reason": "Computing ru-layout paths is how the directory-resolution problem is solved.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "projects-dir-resolution",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "succeeds": "projects-dir-resolution@v1",
  "uid": "n0099",
  "version": 2
}
-->

acfs defaults new projects to /data/projects/NAME, an Ubuntu VPS convention. On a Mac that path may not exist, and the user's repos are managed by ru, whose configured PROJECTS_DIR and LAYOUT (flat, owner-repo or full) decide where a repo lives. Hard-coding any one nesting would put new projects where ru does not look, so ru later clones a second copy. The default must therefore be computed from ru's own resolved configuration (asked from ru, not parsed from its file), with MACACFS_PROJECTS_DIR, ACFS_PROJECTS_DIR or the newproj.projects_dir setting overriding only the base, a plain base/NAME fallback when ru is absent or its layout is unreadable or needs an unknown owner, identical results in bash and in the Python bootstrap, and an explicit directory argument always winning. The problem is [[newproj-experience|accomplished-by|newproj's default directory follows this resolution order.]]
