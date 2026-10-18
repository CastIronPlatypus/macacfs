<!--stratified-action
{
  "created": 1792285757,
  "edges": [
    {
      "dst": "req-runnable-signatures",
      "reason": "macOS SIGKILLs a binary with an invalid signature, so this problem is why install must verify and repair signatures",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "invalid-upstream-signatures",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0080",
  "version": 1
}
-->

Several suite tools (cm, brenner, csctf, s2p, ntm) ship as Bun --compile single-file executables whose embedded signature is invalidated by the payload appended after signing; the Homebrew bottle and the release asset are byte-identical and both fail codesign -v. macOS kills such a binary at launch, so the shell prints only 'killed'. Installing upstream bytes as-is therefore yields tools that cannot run. Accomplished by [[install-experience|accomplished-by|the install experience is where each installed binary is verified and repaired before the run reports success]].
