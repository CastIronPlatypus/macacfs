<!--stratified-action
{
  "created": 1792790050,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "the ported acfs newproj engine",
      "type": "validated-by"
    },
    {
      "dst": "project-scaffold",
      "reason": "The engine's classic main() realizes the one-shot scaffold.",
      "type": "serves"
    },
    {
      "dst": "interactive-wizard",
      "reason": "The engine's TUI framework and screens realize the wizard.",
      "type": "serves"
    },
    {
      "dst": "reviewed-bootstrap",
      "reason": "The engine's embedded Python realizes the reviewed bootstrap.",
      "type": "serves"
    },
    {
      "dst": "newproj-cli-code",
      "reason": "This code is the classic-mode and launcher part of the engine.",
      "type": "accomplished-by"
    },
    {
      "dst": "wizard-screens-code",
      "reason": "This code is the wizard part of the engine.",
      "type": "accomplished-by"
    },
    {
      "dst": "bootstrap-py-code",
      "reason": "This code is the reviewed-bootstrap part of the engine.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-tests-newproj",
      "reason": "The test suite verifies the engine.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "newproj-engine",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0108",
  "version": 1
}
-->

The newproj engine subsystem: the acfs newproj modules ported verbatim then replumbed for macOS — the entry script with its classic main(), embedded Python bootstrap and interactive launcher; the error/recovery helpers; logging; tech-stack detection; the AGENTS.md section generator; the TUI framework and the nine screen modules — all executed under Homebrew bash with BSD-portable find/date calls and the shared projects-dir resolver. It [[newproj-dispatch|serves|The engine is where the dispatcher sends each mode.]].
