<!--stratified-action
{
  "created": 1789594077,
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
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-plist-template@v1",
  "uid": "n0044",
  "version": 2
}
-->

share/macacfs.plist.template — LaunchAgent template with placeholders for program path, StartCalendarInterval and PATH (EnvironmentVariables, so the tick sees brew/cargo/go instead of launchd's bare /usr/bin:/bin), plus AbandonProcessGroup so the tick's detached reload helper survives the job exiting. Bead (asset).
