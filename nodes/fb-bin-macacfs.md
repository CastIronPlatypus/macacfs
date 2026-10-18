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
      "reason": "The bin/macacfs entrypoint bead is realized by its concrete implementation, which wires install/update/self-update/schedule dispatch and pins the Homebrew bash shebang.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-minimal-scope",
      "reason": "The entrypoint dispatches only install, update, self-update, and schedule, so its closed verb set is where minimal scope is concretely held in the shipped file.",
      "type": "validated-by"
    },
    {
      "dst": "req-manual-cli-update",
      "reason": "bin/macacfs dispatches the 'update' verb with optional tool selectors, giving users the manual all-tools or named-tools update the requirement demands.",
      "type": "validated-by"
    },
    {
      "dst": "req-macos-only",
      "reason": "The entrypoint enforces the macOS-only check before dispatching, so the requirement's refusal on non-darwin hosts is implemented in bin/macacfs.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-bin-macacfs",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0037",
  "version": 1
}
-->

bin/macacfs — the entrypoint: sources the libs, parses argv into the closed verb+flag set, dispatches install/update/self-update/schedule, enforces macOS-only. Bead.
