<!--stratified-action
{
  "accept": "With a fake ru reporting each layout, the default directory is PROJECTS_DIR/NAME, PROJECTS_DIR/OWNER/NAME and PROJECTS_DIR/github.com/OWNER/NAME respectively in classic, wizard-default and --plan modes; with ru absent it is base/NAME; an explicit DIR is used verbatim.",
  "created": 1792790409,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-newproj-follows-ru-layout",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0122",
  "version": 1
}
-->

newproj's default project directory follows ru's current configuration, obtained by asking ru (ru config, which prints its resolved PROJECTS_DIR and LAYOUT): flat -> PROJECTS_DIR/NAME, owner-repo -> PROJECTS_DIR/OWNER/NAME, full -> PROJECTS_DIR/github.com/OWNER/NAME. MACACFS_PROJECTS_DIR / ACFS_PROJECTS_DIR / the newproj.projects_dir setting override only the base directory. When ru is absent, its layout cannot be read, or the layout needs an owner that cannot be determined, newproj falls back to the plain resolver (base/NAME). An explicit directory argument always wins. All three newproj modes behave identically.
