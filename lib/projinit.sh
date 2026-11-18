#!/usr/bin/env bash
# lib/projinit.sh — per-project flywheel tool initialization.
# Realizes: projinit-code / fb-lib-projinit (project-tool-registry, projinit-dispatch).
#
# The registry lists every flywheel tool with a per-project part: how to tell
# it is already initialized in a directory, and the tool's own idempotent
# command to initialize it. 'macacfs projinit' brings an existing project up
# to a desired set; newproj calls projinit_apply for the set the user chose.
# Tools with nothing per-project (cass indexes globally) are not listed.
# Works under bash 3.2 (sourced by bin/macacfs and lib/newproj/newproj.sh).

# id|cli|marker (relative to the project dir)|description
projinit_registry() {
  cat <<'EOF'
br|br|.beads|Beads issue tracking (br init)
ee|ee|.ee/ee.db|Eidetic Engine workspace + its Claude Code/Codex recall hooks
cm|cm|.cass|CASS memory system repo-level .cass/ playbook
ntm|ntm|.ntm|NTM orchestration config (+ git hooks in a git repo)
slb|slb|.slb|SLB approval state + its project Claude Code guard hook
ms|ms|.ms|meta_skill local skill store
ubs|ubs|.ubsignore|Ultimate Bug Scanner ignore patterns
EOF
}

PROJINIT_DEFAULT_TOOLS="br,ee,cm,ubs"

projinit_ids() { projinit_registry | cut -d'|' -f1; }
_projinit_field() { projinit_registry | awk -F'|' -v k="$1" -v f="$2" '$1==k{print $f; exit}'; }
projinit_cli()    { _projinit_field "$1" 2; }
projinit_marker() { _projinit_field "$1" 3; }
projinit_desc()   { _projinit_field "$1" 4; }

# projinit_normalize LIST -> canonical comma list (registry order, deduped);
# rc 1 with a message on stderr for an unknown id. "" / none -> "".
projinit_normalize() {
  local raw="$1" id out="" bad=""
  [ "$raw" = none ] && raw=""
  for id in $(printf '%s' "$raw" | tr ',[:upper:]' ' [:lower:]'); do
    projinit_ids | grep -qxF -- "$id" || bad="${bad:+$bad }$id"
  done
  if [ -n "$bad" ]; then
    printf 'macacfs: unknown project tool(s): %s (known: %s)\n' "$bad" "$(projinit_ids | tr '\n' ' ')" >&2
    return 1
  fi
  for id in $(projinit_ids); do
    case ",$(printf '%s' "$raw" | tr '[:upper:] ' '[:lower:],')," in *",$id,"*) out="${out:+$out,}$id" ;; esac
  done
  printf '%s\n' "$out"
}

projinit_validate_list() { projinit_normalize "$1" >/dev/null; }

# Default desired set: env MACACFS_NEWPROJ_TOOLS > config newproj.tools > built-in.
# Under a test runner with nothing explicit the default is empty, so a test can
# never write the real user's agent settings through ee/slb hook installs.
projinit_default_tools() {
  if [ -n "${MACACFS_NEWPROJ_TOOLS+x}" ]; then projinit_normalize "$MACACFS_NEWPROJ_TOOLS"; return; fi
  local v
  if declare -f config_get_raw >/dev/null 2>&1 && v="$(config_get_raw newproj.tools)"; then
    projinit_normalize "$v"; return
  fi
  if [ -n "${BATS_TEST_NAME:-}" ] || [ -n "${ACFS_TEST_MODE:-}" ]; then printf '\n'; return; fi
  printf '%s\n' "$PROJINIT_DEFAULT_TOOLS"
}

projinit_save_defaults() {
  local list; list="$(projinit_normalize "$1")" || return 1
  declare -f config_set >/dev/null 2>&1 || { printf 'macacfs: config store not loaded\n' >&2; return 1; }
  config_set newproj.tools "${list:-none}" && printf 'saved newproj.tools=%s\n' "${list:-none}"
}

# projinit_state DIR ID -> initialized | missing | unavailable
projinit_state() {
  local dir="$1" id="$2"
  if [ -e "$dir/$(projinit_marker "$id")" ]; then echo initialized; return; fi
  if [ "$id" = ubs ] || command -v "$(projinit_cli "$id")" >/dev/null 2>&1; then echo missing; else echo unavailable; fi
}

_projinit_ubsignore() {
  cat > .ubsignore <<'EOF'
# UBS ignore globs (keep bug scanner focused on source code)
# Patterns are evaluated relative to the project root.

# Dependencies / vendored (never scan third-party code)
node_modules/
**/node_modules/

# Python virtual environments
.venv/
venv/
.tox/

# Build outputs (scan source, not artifacts)
dist/
build/
.next/
out/
target/
*.egg-info/

# Test artifacts
coverage/
.coverage
htmlcov/
.pytest_cache/
playwright-report/
test-results/

# IDE/Editor
.idea/
.vscode/

# Package manager caches
.npm/
.pnpm-store/
.yarn/
EOF
}

# _projinit_ignore PATTERN — in a git repo, make sure .gitignore lists PATTERN
# (local databases and keys must never be committed).
_projinit_ignore() {
  [ -d .git ] || return 0
  [ -f .gitignore ] && grep -qxF -- "$1" .gitignore && return 0
  { [ -s .gitignore ] && [ -n "$(tail -c1 .gitignore)" ] && echo; printf '%s\n' "$1"; } >> .gitignore
}

# The command(s) that initialize ID in the current directory, one per line
# (used verbatim by --dry-run and by projinit_init_one).
projinit_commands() {
  local id="$1" dir="$2"
  case "$id" in
    br)  echo "br init" ;;
    ee)  echo "ee init --workspace $dir$({ [ -e "$dir/AGENTS.md" ] || [ -e "$dir/CLAUDE.md" ]; } && echo ' --force')"
         echo "ee hook claude-code --install --workspace $dir"
         echo "add .ee/ to .gitignore (git repos)"
         if command -v codex >/dev/null 2>&1 || [ -d "$HOME/.codex" ]; then
           echo "ee hook codex --install --workspace $dir"
         fi ;;
    cm)  echo "cm init --repo --no-interactive" ;;
    ntm) if [ -d "$dir/.git" ]; then echo "ntm init --non-interactive $dir"
         else echo "ntm init --non-interactive --no-hooks $dir"; fi ;;
    slb) echo "slb init"; echo "slb hook install"; echo "add .slb/ to .gitignore (git repos)" ;;
    ms)  echo "ms init"; echo "add .ms/ to .gitignore (git repos)" ;;
    ubs) echo "write .ubsignore" ;;
  esac
}

# projinit_init_one DIR ID — run ID's init commands inside DIR.
projinit_init_one() {
  local dir="$1" id="$2"
  (
    cd "$dir" || exit 1
    case "$id" in
      br)  br init ;;
      ee)  # With agent guidance already present ee wants --force, which keeps those files unchanged.
           local force=""; { [ -e AGENTS.md ] || [ -e CLAUDE.md ]; } && force=--force
           ee init --workspace "$dir" $force >/dev/null || exit 1
           ee hook claude-code --install --workspace "$dir" >/dev/null || exit 1
           _projinit_ignore ".ee/"
           if command -v codex >/dev/null 2>&1 || [ -d "$HOME/.codex" ]; then
             ee hook codex --install --workspace "$dir" >/dev/null || exit 1
           fi ;;
      cm)  cm init --repo --no-interactive ;;
      ntm) if [ -d .git ]; then ntm init --non-interactive "$dir"; else ntm init --non-interactive --no-hooks "$dir"; fi ;;
      slb) slb init && slb hook install && _projinit_ignore ".slb/" ;;
      ms)  ms init && _projinit_ignore ".ms/" ;;
      ubs) _projinit_ubsignore ;;
      *)   exit 1 ;;
    esac
  )
}

_projinit_json_str() { printf '"%s"' "$(printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g')"; }

# projinit_status DIR [--json] — every registry tool's state in DIR.
projinit_status() {
  local dir="$1" json="${2:-}" id st first=1 desired
  desired=",$(projinit_default_tools 2>/dev/null),"
  if [ "$json" = --json ]; then
    printf '{"dir":%s,"tools":[' "$(_projinit_json_str "$dir")"
    for id in $(projinit_ids); do
      st="$(projinit_state "$dir" "$id")"
      [ $first -eq 1 ] || printf ','; first=0
      printf '{"id":"%s","cli":"%s","state":"%s","default":%s,"description":%s}' \
        "$id" "$(projinit_cli "$id")" "$st" "$(case "$desired" in *",$id,"*) echo true ;; *) echo false ;; esac)" \
        "$(_projinit_json_str "$(projinit_desc "$id")")"
    done
    printf ']}\n'
  else
    printf 'project: %s\n' "$dir"
    for id in $(projinit_ids); do
      printf '  %-4s %-12s %s\n' "$id" "$(projinit_state "$dir" "$id")" "$(projinit_desc "$id")"
    done
  fi
}

# projinit_apply DIR LIST [--dry-run] [--json] — initialize the tools in LIST
# that DIR lacks. Unavailable tools are reported (with an install hint) and do
# not fail; a failed init does. Sets PROJINIT_DONE (ids newly initialized).
projinit_apply() {
  local dir="$1" list="$2" mode="" json="" id st rc=0 res first=1
  shift 2
  for a in "$@"; do case "$a" in --dry-run) mode=dry ;; --json) json=1 ;; esac; done
  list="$(projinit_normalize "$list")" || return 2
  # Physical path: ee refuses workspace paths that traverse symlinks (/var -> /private/var).
  dir="$(cd "$dir" && pwd -P)" || return 1
  PROJINIT_DONE=""
  [ -n "$json" ] && printf '{"dir":%s,"results":[' "$(_projinit_json_str "$dir")"
  for id in $(printf '%s' "$list" | tr ',' ' '); do
    st="$(projinit_state "$dir" "$id")"
    case "$st" in
      initialized) res=already ;;
      unavailable) res=unavailable
        [ -n "$json" ] || printf '  - %-4s skipped: %s not installed (macacfs install %s)\n' "$id" "$(projinit_cli "$id")" "$(projinit_cli "$id")" ;;
      missing)
        if [ "$mode" = dry ]; then
          res=would-init
          [ -n "$json" ] || projinit_commands "$id" "$dir" | sed "s/^/  + $id: /"
        elif [ -n "$json" ]; then
          if projinit_init_one "$dir" "$id" >/dev/null 2>&1; then res=initialized; PROJINIT_DONE="${PROJINIT_DONE:+$PROJINIT_DONE,}$id"; else res=failed; rc=1; fi
        else
          printf '  > initializing %s\n' "$id"
          if projinit_init_one "$dir" "$id"; then res=initialized; PROJINIT_DONE="${PROJINIT_DONE:+$PROJINIT_DONE,}$id"
          else res=failed; rc=1; printf '  ! %s init failed\n' "$id" >&2; fi
        fi ;;
    esac
    if [ -n "$json" ]; then
      [ $first -eq 1 ] || printf ','; first=0
      printf '{"id":"%s","result":"%s"}' "$id" "$res"
    elif [ "$res" = already ]; then
      printf '  = %-4s already initialized\n' "$id"
    elif [ "$res" = initialized ]; then
      printf '  ✓ %-4s initialized\n' "$id"
    fi
  done
  [ -n "$json" ] && printf '],"ok":%s}\n' "$([ $rc -eq 0 ] && echo true || echo false)"
  return $rc
}

# projinit_choose DIR PRESELECTED -> chosen comma list on stdout (prompts on /dev/tty).
projinit_choose() {
  local dir="$1" pre=",$2," id label opts=() sel=() out="" line
  for id in $(projinit_ids); do
    label="$id — $(projinit_desc "$id") [$(projinit_state "$dir" "$id")]"
    opts+=("$label")
    case "$pre" in *",$id,"*) sel+=("$label") ;; esac
  done
  if command -v gum >/dev/null 2>&1; then
    local selarg=""; [ ${#sel[@]} -gt 0 ] && selarg="$(IFS=,; echo "${sel[*]}")"
    line="$(gum choose --no-limit --header "Tools to initialize in $dir (Space toggles, Enter confirms)" \
      ${selarg:+--selected="$selarg"} "${opts[@]}" < /dev/tty 2>/dev/tty)" || return 1
    while IFS= read -r l; do [ -n "$l" ] && out="${out:+$out,}${l%% *}"; done <<< "$line"
  else
    local i=1 ans
    for id in $(projinit_ids); do
      printf '  %d) [%s] %s\n' "$i" "$(case "$pre" in *",$id,"*) echo x ;; *) echo ' ' ;; esac)" "${opts[$((i-1))]}" > /dev/tty
      i=$((i+1))
    done
    printf 'Tool ids to initialize (comma list, Enter keeps [x]): ' > /dev/tty
    read -r ans < /dev/tty || return 1
    out="${ans:-$2}"
  fi
  projinit_normalize "$out"
}

projinit_usage() {
  cat <<EOF
Usage: macacfs projinit [DIR] [options]

Inspect a project and initialize the desired flywheel tools it does not have yet.
DIR defaults to the current directory.

Options:
  --tools LIST       comma list of tools to want (default: newproj.tools setting)
  --no-tools         want nothing (with --save-defaults: clear the default)
  -i, --interactive  choose the tools from a checklist
  --status           only report each tool's state
  --dry-run          print the commands that would run
  --json             machine-readable output (status or results)
  --save-defaults    also store the chosen set as newproj.tools
  -h, --help         this help

Tools:
$(projinit_registry | awk -F'|' '{printf "  %-4s %s\n", $1, $4}')
EOF
}

projinit_main() {
  local dir="" tools="" tools_set=0 interactive=0 status=0 dry=0 json=0 save=0
  while [ $# -gt 0 ]; do
    case "$1" in
      --tools) [ $# -ge 2 ] || { echo "macacfs projinit: --tools needs a value" >&2; return 2; }
               tools="$2"; tools_set=1; shift 2; continue ;;
      --tools=*) tools="${1#--tools=}"; tools_set=1 ;;
      --no-tools) tools=""; tools_set=1 ;;
      -i|--interactive) interactive=1 ;;
      --status) status=1 ;;
      --dry-run) dry=1 ;;
      --json) json=1 ;;
      --save-defaults) save=1 ;;
      -h|--help) projinit_usage; return 0 ;;
      -*) printf 'macacfs projinit: unknown option %s\n\n' "$1" >&2; projinit_usage >&2; return 2 ;;
      *) [ -z "$dir" ] || { echo "macacfs projinit: only one DIR" >&2; return 2; }; dir="$1" ;;
    esac
    shift
  done
  dir="${dir:-$PWD}"
  [ -d "$dir" ] || { printf 'macacfs projinit: not a directory: %s\n' "$dir" >&2; return 1; }
  dir="$(cd "$dir" && pwd -P)"
  if [ $status -eq 1 ]; then
    projinit_status "$dir" $([ $json -eq 1 ] && echo --json); return 0
  fi
  if [ $tools_set -eq 1 ]; then tools="$(projinit_normalize "$tools")" || return 2
  else tools="$(projinit_default_tools)" || return 2; fi
  if [ $interactive -eq 1 ]; then
    [ -t 0 ] || [ -r /dev/tty ] || { echo "macacfs projinit: -i needs a terminal" >&2; return 1; }
    tools="$(projinit_choose "$dir" "$tools")" || { echo "cancelled" >&2; return 130; }
  fi
  if [ $save -eq 1 ]; then projinit_save_defaults "$tools" >&2 || return 1; fi
  [ $json -eq 1 ] || printf 'projinit %s: %s\n' "$dir" "${tools:-(no tools)}"
  local args=()
  [ $dry -eq 1 ] && args+=(--dry-run)
  [ $json -eq 1 ] && args+=(--json)
  projinit_apply "$dir" "$tools" ${args[@]+"${args[@]}"}
}
