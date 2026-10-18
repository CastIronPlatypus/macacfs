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
  "retire_reason": "The LaunchAgent template now carries a PATH and AbandonProcessGroup: launchd's bare PATH hid brew/cargo/go, and the tick's self-reload needs a helper that outlives the job.",
  "retired_at": 1792285882,
  "status": "retired",
  "stratum": "file-boundaries",
  "uid": "n0044",
  "version": 1
}
-->

share/macacfs.plist.template — LaunchAgent template with placeholders for program path and StartCalendarInterval. Bead (asset).
