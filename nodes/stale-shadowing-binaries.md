<!--stratified-action
{
  "created": 1792865297,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this is the failure the requirement exists to prevent",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "stale-shadowing-binaries",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0285",
  "version": 1
}
-->

The problem of shadowing binaries: an install can succeed while typing the tool's name still runs something else. An earlier install method leaves an older copy in a user bin dir that precedes Homebrew on PATH (br 0.4.0 in ~/.local/bin hid Homebrew's br 0.7.6), or a different program shares the name (tcl-tk ships a pt in /opt/homebrew/bin; the TypeScript pi coding agent ships a pi via npm and bun). Signature checks and a successful installer exit do not catch this; only resolving the CLI on PATH and comparing it to the installed copy does. It is [[install-experience|accomplished-by|The install experience is where each tool's CLI is resolved and compared to what was installed before the row reports ok.]].
