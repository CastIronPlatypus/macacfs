<!--stratified-action
{
  "created": 1792795316,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-parse-flag",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0251",
  "version": 1
}
-->

newproj_remote_parse_flag applies one of --github, --gh, --github=private|public|off, --gh-private, --gh-public, --no-github, --github-owner=ORG (validated as a GitHub login), --ru or --no-ru, returning 1 for a non-remote flag and 2 for an invalid value so main exits instead of guessing. Within the flow it [[lf-newproj-remote-selection|serves|newproj_remote_parse_flag performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_parse_flag must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_parse_flag lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]].
