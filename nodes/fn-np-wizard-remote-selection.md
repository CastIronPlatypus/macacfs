<!--stratified-action
{
  "created": 1792795335,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-wizard-remote-selection",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0281",
  "version": 1
}
-->

newproj_wizard_remote_selection maps the enable_github, enable_github_public and enable_ru checkboxes onto NEWPROJ_GITHUB and NEWPROJ_RU before preflight, publish and register. Within the flow it [[lf-newproj-wizard-remote|serves|newproj_wizard_remote_selection performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-screens|serves|newproj_wizard_remote_selection must stay defined in fb-lib-newproj-screens's file because its callers source that file.]], and its code is [[fb-lib-newproj-screens-impl|accomplished-by|The concrete code of newproj_wizard_remote_selection lives in the fb-lib-newproj-screens-impl implementation, so a change to it requires re-proving that node.]].
