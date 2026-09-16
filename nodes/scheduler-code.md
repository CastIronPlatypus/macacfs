<!--stratified-action
{
  "created": 1789594032,
  "edges": [
    {
      "dst": "schedule-state-and-plist",
      "reason": "This code realizes the state+plist scheduling subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-schedule",
      "reason": "The scheduler lives in lib/schedule.sh.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-plist-template",
      "reason": "The scheduler writes the plist template asset.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "scheduler-code",
  "node_type": "impl",
  "obligations": [
    "r-run-tracking"
  ],
  "status": "drafting",
  "stratum": "components",
  "uid": "n0034",
  "version": 1
}
-->

Code unit: state read/write, cadence calculator, and plist (re)writer + launchctl (re)load. Realizes [[schedule-state-and-plist|flow]]. Accomplished by [[fb-lib-schedule|accomplished-by]] and [[fb-plist-template|accomplished-by]].
