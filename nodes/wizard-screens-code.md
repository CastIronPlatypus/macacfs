<!--stratified-action
{
  "created": 1792790073,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "wizard code",
      "type": "validated-by"
    },
    {
      "dst": "fb-lib-newproj-screens",
      "reason": "These files hold the wizard screens.",
      "type": "accomplished-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "wizard-screens-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0112",
  "version": 1
}
-->

Code unit: newproj_tui.sh (state, navigation, gum/plain inputs), newproj_screens.sh (screen registry, wizard loop) and the nine newproj_screens/screen_*.sh modules, with the features screen carrying GitHub and ru toggles defaulted from settings and the progress screen running publish/register steps after the local steps. It [[newproj-engine|serves|This code is the wizard part of the engine.]]. It is accomplished by [[fb-lib-newproj-screens|accomplished-by|These files hold the wizard screens.]].
