<!--stratified-action
{
  "created": 1792289564,
  "edges": [
    {
      "dst": "req-install-whole-suite",
      "reason": "hooks make tools whose own installers fall short on macOS (MDWB) install completely",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "tool-install-hooks",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0086",
  "version": 1
}
-->

Code unit of per-tool pre-install hooks: a function pre_install_<ABBR> that dispatch_row runs before the tool's install method, which may set HOOK_ENV (environment for the installer) and HOOK_EXTRA_ARGS (extra installer args) and fails the tool if it fails. pre_install_MDWB always downloads the Chrome for Testing build MDWB will test (CFT_VERSION from the environment, else MDWB's .env, else the installer's CFT_PINNED_BUILD) for this Mac's arch from storage.googleapis.com into ~/.cache/mdwb/cft/<build>/, without checking what is already installed, then hands the installer CFT_VERSION and CFT_EXECUTABLE (the .app's binary) and --dir ~/markdown_web_browser. It [[install-method-functions|serves|Hooks extend the install-method subsystem for tools whose own installers fall short on macOS.]] and is [[fb-lib-hooks|accomplished-by|The hooks live in lib/hooks.sh.]]. MDWB's settings resolve CFT_VERSION/CFT_EXECUTABLE from the process environment ahead of its .env, so the hook [[method-fns-code|couples-with|do_installer_sh applies HOOK_ENV to the installer only, which is how the hook's Chrome path reaches MDWB's self-test.]].
