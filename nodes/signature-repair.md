<!--stratified-action
{
  "created": 1792285757,
  "edges": [
    {
      "dst": "req-runnable-signatures",
      "reason": "this capability verifies and re-signs every binary a tool install produced",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "signature-repair",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0081",
  "version": 1
}
-->

After each tool installs, verify the code signature of every Mach-O it produced and re-sign any invalid one ad-hoc, re-verifying afterwards; each re-sign becomes a note on that tool's summary row and an unrepairable binary fails the tool (fail loud, never silent). Serves [[install-experience|serves|install only reports a tool ok once its binaries can actually launch]]. Accomplished by [[signature-verify-and-resign|accomplished-by|the capability is realized by the candidate-collection plus verify/re-sign subsystem]].
