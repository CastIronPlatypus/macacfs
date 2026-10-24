<!--stratified-action
{
  "created": 1792865298,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "a tool installed under another name must still be checked under the name it actually has",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "alternate-cli-names",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0286",
  "version": 1
}
-->

The problem of alternate CLI names: some installers choose the command name at install time. pi_agent_rust installs as pi-rust when a TypeScript pi already exists (and as pi otherwise), so checking the catalogue's single cli name verifies the wrong program and reports a working install as the other tool. The catalogue must be able to list a tool's possible names, first match wins, and the installer must be told non-interactively to keep the existing pi. It is [[tool-catalog|accomplished-by|The catalogue's cli column carries the a|b alternatives every consumer resolves through row_cli_resolved.]].
