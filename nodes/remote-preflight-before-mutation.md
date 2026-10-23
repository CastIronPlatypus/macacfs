<!--stratified-action
{
  "created": 1792790001,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "remote failures must be caught before local creation",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-ru-optional",
      "reason": "ru failures are part of preflight",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-never-deletes",
      "reason": "post-preflight failures keep artifacts",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "remote-preflight-before-mutation",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0097",
  "version": 1
}
-->

Publishing to GitHub and registering with ru can fail for reasons unrelated to the local scaffold: gh not installed, gh not authenticated, the OWNER/NAME repo already exists, ru not installed, ru given no GitHub remote, or no git identity for the required initial commit. If these surface only after the project directory is populated, the user is left with a half-published project. Every such condition must be checked before the first local write, and any failure after that point must leave what exists in place and print how to finish by hand. The problem is [[newproj-experience|accomplished-by|The newproj experience promises that remote failures are detected up front and never delete anything.]]
