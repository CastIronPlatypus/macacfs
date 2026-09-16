<!--stratified-action
{
  "created": 1789594075,
  "edges": [
    {
      "dst": "argv-code",
      "reason": "The entrypoint file realizes the argv/dispatch code unit.",
      "type": "serves"
    },
    {
      "dst": "fb-bin-macacfs-impl",
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-bin-macacfs",
  "node_type": "impl",
  "obligations": [
    "r-scope-min",
    "r-cli-update",
    "r-macos-only"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0037",
  "version": 1
}
-->

bin/macacfs — the entrypoint: sources the libs, parses argv into the closed verb+flag set, dispatches install/update/self-update/schedule, enforces macOS-only. Bead.
