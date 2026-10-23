<!--stratified-action
{
  "created": 1792795284,
  "edges": [
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-newproj-projects-dir",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0231",
  "version": 1
}
-->

Default project directory: an explicit DIR always wins. Otherwise newproj_projects_dir picks the base (MACACFS_PROJECTS_DIR, ACFS_PROJECTS_DIR, the setting, ru's PROJECTS_DIR from 'ru config', /data/projects if present, ~/Projects). newproj_default_project_dir nests NAME under it per ru's LAYOUT (flat, owner-repo, full) and the owner, and newproj_ensure_layout_parent creates the owner folders beneath an existing base. The same base and layout reach Python as NEWPROJ_DEFAULT_PROJECTS_DIR and NEWPROJ_RU_LAYOUT. This flow [[fb-lib-newproj-remote|serves|The flow's code must live in fb-lib-newproj-remote's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-np-ru-config|accomplished-by|newproj_ru_config performs one step of this flow, so removing it would break the flow.]], [[fn-np-ru-layout|accomplished-by|newproj_ru_layout performs one step of this flow, so removing it would break the flow.]], [[fn-np-projects-dir|accomplished-by|newproj_projects_dir performs one step of this flow, so removing it would break the flow.]], [[fn-np-default-project-dir|accomplished-by|newproj_default_project_dir performs one step of this flow, so removing it would break the flow.]], [[fn-np-layout-parent-creatable|accomplished-by|newproj_layout_parent_creatable performs one step of this flow, so removing it would break the flow.]], [[fn-np-ensure-layout-parent|accomplished-by|newproj_ensure_layout_parent performs one step of this flow, so removing it would break the flow.]]. Related flows: [[lf-newproj-reviewed-remote|flow|The Python default_project_dir consumes the exported base and layout, so --plan proposes the same path as classic.]].
