<!--stratified-action
{
  "accept": "With a stale br 0.4.0 in ~/.local/bin and Homebrew's br installed, 'macacfs install BR' moves the stale copy to ~/.local/state/macacfs/shadowed and 'br --version' then reports the Homebrew version; PI is verified as pi-rust when a TypeScript pi exists; a foreign same-name binary ahead on PATH yields a failed row.",
  "created": 1792865286,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-cli-resolves-to-installed-copy",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0283",
  "version": 1
}
-->

After a tool installs, typing its CLI name must run the copy macacfs just installed. A stale older copy of the same tool in a user bin dir (~/.local/bin, ~/.cargo/bin, ~/go/bin) is moved aside, never deleted; a different program ahead on PATH fails the tool with a fix hint; same-name programs later on PATH are noted on the summary row. A tool whose installer may use another name is checked under every listed name.
