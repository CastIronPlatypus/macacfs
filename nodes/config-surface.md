<!--stratified-action
{
  "created": 1792789970,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "the observable settings interface",
      "type": "validated-by"
    },
    {
      "dst": "newproj-experience",
      "reason": "settings shown by config are newproj's defaults",
      "type": "relates-to"
    },
    {
      "dst": "settings-store",
      "reason": "The settings store backs everything the config verb shows and changes.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "config-surface",
  "node_type": "surface",
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0096",
  "version": 1
}
-->

What a user sees of persistent settings: 'macacfs config list' prints every known key with its effective value and source; 'macacfs config get KEY', 'set KEY VALUE' and 'unset KEY' manage a key=value file under the XDG config dir (~/.config/macacfs/config). Known keys are validated: newproj.github (off|private|public), newproj.ru (on|off), newproj.projects_dir (absolute path); unknown keys or bad values are rejected with a non-zero exit. It is reached through the config verb of the closed macacfs command surface, and [[newproj-experience|serves|newproj reads these settings as its defaults.]]. It relates to [[newproj-experience|relates-to|settings shown by config are newproj's defaults.]]. It is accomplished by [[settings-store|accomplished-by|The settings store backs everything the config verb shows and changes.]].
