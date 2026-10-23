<!--stratified-action
{
  "created": 1792790095,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "wizard screen files",
      "type": "validated-by"
    },
    {
      "dst": "fb-lib-newproj-core",
      "reason": "screens source newproj_tui.sh/errors/logging/agents from core and share the WIZARD_STATE keys",
      "type": "relates-to"
    }
  ],
  "in_progress": false,
  "is_bead": true,
  "name": "fb-lib-newproj-screens",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0117",
  "version": 1
}
-->

The lib/newproj/ screens file boundary: newproj_screens.sh and newproj_screens/screen_{welcome,project_name,directory,tech_stack,features,agents_preview,confirmation,progress,success}.sh. Bead (code). It [[wizard-screens-code|serves|These files hold the wizard screens.]]. It relates to [[fb-lib-newproj-core|relates-to|screens source newproj_tui.sh/errors/logging/agents from core and share the WIZARD_STATE keys.]].
