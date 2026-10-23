<!--stratified-action
{
  "created": 1792790758,
  "edges": [
    {
      "dst": "req-install-whole-suite",
      "reason": "a hook adapts a tool whose upstream installer cannot finish on a Mac",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-pre-install-hook",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0210",
  "version": 1
}
-->

Pre-install hook path, today only for MDWB: pre_install_MDWB determines the Chrome for Testing build MDWB will test (CFT_VERSION from the environment, else from ~/markdown_web_browser/.env, else the installer's pinned build), validates it, picks mac-arm64 or mac-x64, downloads and unpacks that build into ~/.cache/mdwb/cft/<build>, checks the executable exists, and hands the installer CFT_VERSION and CFT_EXECUTABLE through HOOK_ENV and --dir ~/markdown_web_browser through HOOK_EXTRA_ARGS; any failure returns non-zero and fails the tool. This flow [[fb-lib-hooks|serves|The flow is realized by code in lib/hooks.sh.]]. It is carried out step by step by [[fn-pre-install-mdwb|accomplished-by|pre_install_MDWB performs part of this flow.]]. Related flows: [[lf-install-installer-sh|flow|The hook's outputs are applied when the installer runs.]].
