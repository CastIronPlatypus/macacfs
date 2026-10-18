<!--stratified-action
{
  "created": 1789594982,
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
      "dst": "fb-plist-template",
      "reason": "The share/macacfs.plist.template file is the concrete asset fulfilling the LaunchAgent template bead.",
      "type": "serves"
    }
  ],
  "impl_path": "share/macacfs.plist.template",
  "is_bead": true,
  "name": "fb-plist-template-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594654:569",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-plist-template-impl@v1",
  "uid": "n0055",
  "version": 2
}
-->

Implementation of share/macacfs.plist.template; it [[fb-plist-template|serves|The share/macacfs.plist.template file is the concrete asset fulfilling the LaunchAgent template bead.]]. The template plist holds Label=__LABEL__, ProgramArguments [__PROGRAM__, _tick], EnvironmentVariables PATH=__PATH__, a bare __CALENDAR__ line replaced by the cadence's StartCalendarInterval block, StandardOutPath __STDOUT__ and StandardErrorPath __STDERR__, RunAtLoad false, ProcessType Background, and AbandonProcessGroup true so the tick's detached reload helper survives the tick exiting. Its placeholders [[fb-lib-schedule-impl|couples-with|schedule_write_plist substitutes exactly these six tokens and depends on AbandonProcessGroup for its nohup'd reload, so the template and the renderer must change together.]].
