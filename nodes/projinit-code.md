<!--stratified-action
{
  "created": 1794937265,
  "edges": [
    {
      "dst": "req-per-project-tool-init",
      "reason": "this code is the registry and the projinit command",
      "type": "validated-by"
    },
    {
      "dst": "project-tool-registry",
      "reason": "this code realizes the registry",
      "type": "serves"
    },
    {
      "dst": "fb-lib-projinit",
      "reason": "this code lives in lib/projinit.sh",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "projinit-code",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0318",
  "version": 1
}
-->

Code unit: lib/projinit.sh — projinit_registry (id|cli|description rows), projinit_detect_<id> and projinit_init_<id> per tool, projinit_validate_list, projinit_status (one line or JSON object per tool: initialized/missing/unavailable), projinit_apply DIR LIST (initialize the missing, report per-tool result), projinit_choose (gum choose --no-limit checklist with text fallback) and projinit_main (argument parsing for DIR, --tools, -i, --status, --json, --dry-run, --save-defaults). Sourced by bin/macacfs for the projinit verb and by newproj.sh for its tools step. It [[project-tool-registry|serves|the registry is realized by this file's table and functions.]]. It is [[fb-lib-projinit|accomplished-by|this code lives in lib/projinit.sh.]].
