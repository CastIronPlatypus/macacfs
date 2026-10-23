<!--stratified-action
{
  "created": 1792795283,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-newproj-remote-selection",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0230",
  "version": 1
}
-->

GitHub/ru selection: each remote flag is applied by newproj_remote_parse_flag (an invalid value exits 1). After parsing, newproj_remote_init_defaults fills what no flag set from env, then the setting, then off, and exports NEWPROJ_GITHUB, NEWPROJ_RU and NEWPROJ_GITHUB_OWNER. newproj_remote_owner resolves the owner from --github-owner or the gh login. The precedence is therefore flag > env > config > off in every mode. This flow [[fb-lib-newproj-remote|serves|The flow's code must live in fb-lib-newproj-remote's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-np-remote-parse-flag|accomplished-by|newproj_remote_parse_flag performs one step of this flow, so removing it would break the flow.]], [[fn-np-remote-init-defaults|accomplished-by|newproj_remote_init_defaults performs one step of this flow, so removing it would break the flow.]], [[fn-np-remote-active|accomplished-by|newproj_remote_active performs one step of this flow, so removing it would break the flow.]], [[fn-np-remote-owner|accomplished-by|newproj_remote_owner performs one step of this flow, so removing it would break the flow.]]. Related flows: [[lf-newproj-remote-preflight|flow|The resolved selection decides which preflight checks run.]].
