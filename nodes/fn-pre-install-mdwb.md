<!--stratified-action
{
  "created": 1792790681,
  "edges": [
    {
      "dst": "req-install-whole-suite",
      "reason": "it lets MDWB's Linux-oriented installer succeed on a Mac",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-pre-install-mdwb",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0146",
  "version": 1
}
-->

pre_install_MDWB <row> resolves the Chrome for Testing build MDWB will test (CFT_VERSION, else ~/markdown_web_browser/.env, else the pinned build scraped from the upstream installer), validates its four-part form, maps uname -m to mac-arm64 or mac-x64, downloads and unzips that build into ~/.cache/mdwb/cft/<build>, checks the executable, and sets HOOK_ENV=(CFT_VERSION, CFT_EXECUTABLE) and HOOK_EXTRA_ARGS=(--dir ~/markdown_web_browser); each failure prints a reason and returns 1. Within the flow it [[lf-pre-install-hook|serves|pre_install_MDWB is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-hooks|serves|pre_install_MDWB is defined in lib/hooks.sh.]].
