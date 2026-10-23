<!--stratified-action
{
  "created": 1789594075,
  "disc_stamp": {
    "disc-callout-distal": "1.0.0",
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-bin-macacfs@v1",
  "uid": "n0037",
  "version": 2
}
-->

The bin/macacfs file boundary: the CLI entrypoint that resolves its install home through the ~/.local/bin symlink, sources the lib/*.sh modules (including lib/config.sh), parses argv into the closed verb+flag set, runs require_darwin before install/update/self-update/schedule/newproj/_tick, and dispatches each verb (with run_tools as the shared install/update engine, exec of lib/newproj/newproj.sh under the same Homebrew bash for newproj/new, and config_main for config). It [[argv-code|serves|This entrypoint file holds the argv/dispatch code unit.]] and is [[fb-bin-macacfs-impl|accomplished-by|The concrete bin/macacfs implementation wires the dispatch and pins the Homebrew bash shebang.]]. It [[fb-plist-template|couples-with|The LaunchAgent plist invokes this file by absolute path with the _tick verb under a baked PATH, so the file location, the _tick verb and the Homebrew-bash shebang must stay in agreement with the template.]].
