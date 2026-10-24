<!--stratified-action
{
  "created": 1792790035,
  "edges": [
    {
      "dst": "req-newproj-ru-optional",
      "reason": "ru registration",
      "type": "validated-by"
    },
    {
      "dst": "remote-integration",
      "reason": "The remote integration subsystem realizes ru registration.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "ru-register",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "succeeds": "ru-register@v1",
  "uid": "n0106",
  "version": 2
}
-->

The capability to preflight ru (installed, a GitHub remote will exist, and any explicit directory equals ru's layout path) and then, right after the empty GitHub repo is created, register it with 'ru add OWNER/NAME --non-interactive' (with --private for private repos) and have ru clone it with 'ru sync OWNER/NAME --clone-only', reading the clone's path back from 'ru list --json' so newproj sets the project up exactly where ru keeps it. A later registration step is a no-op once the repo is listed. Failures are reported with the ru command to finish, never undone. It [[newproj-experience|serves|Registering with ru is an optional part of the newproj experience.]] and meets [[req-newproj-follows-ru-layout|validated-by|ru itself chooses the directory, so the project always follows ru's configured layout.]] and [[req-newproj-remote-first|validated-by|ru clones the repo before newproj scaffolds it.]]. It is accomplished by [[remote-integration|accomplished-by|The remote integration subsystem realizes ru registration.]].
