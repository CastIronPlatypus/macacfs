<!--stratified-action
{
  "created": 1792790756,
  "edges": [
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "installer-sh tools run the upstream repo's own installer",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-install-installer-sh",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0206",
  "version": 1
}
-->

Upstream-installer path: do_installer_sh builds the raw.githubusercontent.com URL for the Dicklesworthstone repo's installer at main, or, for an @latest-release/<path> ref, first asks the GitHub releases API for the latest tag (failing loud if none resolves); it then pipes the script into bash under env HOOK_ENV, passing the row's args plus HOOK_EXTRA_ARGS through bash -s --. Because the installer always fetches the latest release, running it again is the update. This flow [[fb-lib-methods|serves|The flow is realized by code in lib/methods.sh.]]. It is carried out step by step by [[fn-do-installer-sh|accomplished-by|do_installer_sh performs part of this flow.]]. Related flows: [[lf-pre-install-hook|relates-to|The hook's HOOK_ENV and HOOK_EXTRA_ARGS are consumed only here.]].
