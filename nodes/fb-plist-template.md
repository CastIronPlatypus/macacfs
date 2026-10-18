<!--stratified-action
{
  "created": 1789594077,
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
      "dst": "scheduler-code",
      "reason": "The plist template is the asset the scheduler writes/loads.",
      "type": "serves"
    },
    {
      "dst": "fb-plist-template-impl",
      "reason": "The plist-template bead is realized by share/macacfs.plist.template, the file with placeholders for program path and StartCalendarInterval.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "The plist template is the LaunchAgent skeleton that gets filled with the weekly StartCalendarInterval and installed into ~/Library/LaunchAgents.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-plist-template",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-plist-template@v1",
  "uid": "n0044",
  "version": 2
}
-->

The share/macacfs.plist.template file boundary: the LaunchAgent skeleton with placeholders for the label, program path, StartCalendarInterval block, log paths and PATH (in EnvironmentVariables, so the tick sees brew/cargo/go instead of launchd's bare /usr/bin:/bin), plus AbandonProcessGroup so the tick's detached reload helper survives the job exiting. Bead (asset). It [[scheduler-code|serves|The plist template is the asset the scheduler code renders and loads.]] and is [[fb-plist-template-impl|accomplished-by|share/macacfs.plist.template is the concrete file holding those placeholders.]]. Its tokens [[fb-lib-schedule|couples-with|lib/schedule.sh substitutes exactly these placeholder names when rendering, so renaming one here leaves a literal token in the installed plist.]], and its ProgramArguments [[fb-bin-macacfs|couples-with|The template invokes bin/macacfs with the internal _tick verb, which must remain a recognized verb in the entrypoint.]].
