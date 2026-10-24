<!--stratified-action
{
  "created": 1792795287,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-newproj-wizard-remote",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "succeeds": "lf-newproj-wizard-remote@v1",
  "uid": "n0236",
  "version": 2
}
-->

Wizard with GitHub/ru: the features screen's GitHub, public and ru checkboxes start from the resolved selection, and the directory screen proposes the ru-layout default, accepting a missing owner folder. On confirm, run_creation maps the checkboxes through newproj_wizard_remote_selection and preflights (with the chosen directory) before creating anything. With GitHub the first step is clone_github instead of create_dir: it runs the remote-first clone flow, requires a fresh clone, and moves project_dir, CREATION_PROJECT_DIR and WIZARD_PROJECT_ROOT to ru's path when ru chose another one; init_git then finds the clone's .git. The later steps write files inside the clone, publish_github commits and pushes, and register_ru confirms the registration, with any failure shown on the progress screen. This flow [[fb-lib-newproj-screens|serves|The flow's code lives in lib/newproj/newproj_screens/.]]. It is carried out step by step by [[fn-np-wizard-remote-selection|accomplished-by|newproj_wizard_remote_selection maps the checkboxes.]]. Related flows: [[lf-newproj-projects-dir|flow|The directory screen's default comes from this resolver.]]; [[lf-newproj-remote-preflight|flow|run_creation preflights first.]]; [[lf-newproj-remote-clone|flow|clone_github runs the clone flow.]]; [[lf-newproj-remote-publish|flow|publish_github and register_ru finish it.]].
