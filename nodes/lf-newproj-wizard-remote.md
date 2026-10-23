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
  "uid": "n0236",
  "version": 1
}
-->

Wizard with GitHub/ru: the features screen's GitHub, public and ru checkboxes start from the resolved selection, and the directory screen proposes the ru-layout default, accepting a missing owner folder. On confirm, run_creation maps the checkboxes through newproj_wizard_remote_selection and preflights before creating anything. The publish_github step, the only wizard step that commits, and the register_ru step then run, and any failure is shown on the progress screen. This flow [[fb-lib-newproj-screens|serves|The flow's code must live in fb-lib-newproj-screens's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-np-wizard-remote-selection|accomplished-by|newproj_wizard_remote_selection performs one step of this flow, so removing it would break the flow.]]. Related flows: [[lf-newproj-projects-dir|flow|The directory screen's default comes from this resolver.]]; [[lf-newproj-remote-preflight|flow|run_creation preflights first.]]; [[lf-newproj-remote-publish|flow|The two new steps call the publish and register functions.]].
