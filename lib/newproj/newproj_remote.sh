#!/usr/bin/env bash
# lib/newproj/newproj_remote.sh — macacfs additions to acfs newproj:
# projects-dir resolution, optional GitHub publish (gh) and ru registration.
# Realizes: remote-code / fb-lib-newproj-remote.
#
# Contract (shared by the classic CLI, the wizard and — via exported env — the
# Python reviewed bootstrap):
#   NEWPROJ_GITHUB        off|private|public   (flags, else setting newproj.github)
#   NEWPROJ_RU            on|off               (flags, else setting newproj.ru)
#   NEWPROJ_GITHUB_OWNER  explicit owner (--github-owner=X), else gh's login
# Every remote precondition is checked by newproj_remote_preflight BEFORE the
# project directory is touched; anything failing afterwards is reported with
# the manual commands to finish — nothing is ever deleted.
#
# Order with --github (remote first):
#   1. newproj_remote_clone: gh repo create OWNER/NAME (empty), then with --ru
#      `ru add` + `ru sync --clone-only` so ru clones it wherever its layout
#      says (the path is read back from `ru list --json`); without --ru,
#      `gh repo clone` into the default directory.
#   2. the caller scaffolds inside that clone (git config, beads, AGENTS.md …);
#   3. newproj_remote_finish: initial commit + push (ru is already registered).

[[ -n "${MACACFS_NEWPROJ_REMOTE_LOADED:-}" ]] && return 0
MACACFS_NEWPROJ_REMOTE_LOADED=1

NEWPROJ_REMOTE_DIR="${NEWPROJ_REMOTE_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
if ! declare -f config_effective >/dev/null 2>&1; then
    # shellcheck source=../config.sh
    source "$NEWPROJ_REMOTE_DIR/../config.sh"
fi

NEWPROJ_GITHUB="${NEWPROJ_GITHUB:-}"
NEWPROJ_RU="${NEWPROJ_RU:-}"
NEWPROJ_GITHUB_OWNER="${NEWPROJ_GITHUB_OWNER:-}"
_NEWPROJ_OWNER_CACHE=""

# newproj_remote_parse_flag ARG -> 0 if ARG was a remote flag (and applied)
newproj_remote_parse_flag() {
    case "$1" in
        --github|--gh|--gh-private|--github=private) NEWPROJ_GITHUB=private ;;
        --gh-public|--github=public) NEWPROJ_GITHUB=public ;;
        --no-github|--github=off) NEWPROJ_GITHUB=off ;;
        --github=*)
            printf 'Error: --github accepts private or public (got "%s")\n' "${1#--github=}" >&2
            return 2 ;;
        --github-owner=*)
            NEWPROJ_GITHUB_OWNER="${1#--github-owner=}"
            if [[ ! "$NEWPROJ_GITHUB_OWNER" =~ ^[A-Za-z0-9][A-Za-z0-9-]{0,38}$ ]]; then
                echo "Error: --github-owner must be a GitHub user or organization name" >&2
                return 2
            fi ;;
        --ru) NEWPROJ_RU=on ;;
        --no-ru) NEWPROJ_RU=off ;;
        *) return 1 ;;
    esac
    return 0
}

# Fill unset selections from persistent settings (flag > env > config > off).
newproj_remote_init_defaults() {
    [[ -n "$NEWPROJ_GITHUB" ]] || NEWPROJ_GITHUB="$(config_effective newproj.github)"
    [[ -n "$NEWPROJ_RU" ]] || NEWPROJ_RU="$(config_effective newproj.ru)"
    case "$NEWPROJ_GITHUB" in off|private|public) ;; *) NEWPROJ_GITHUB=off ;; esac
    case "$NEWPROJ_RU" in on|off) ;; *) NEWPROJ_RU=off ;; esac
    export NEWPROJ_GITHUB NEWPROJ_RU NEWPROJ_GITHUB_OWNER
}

newproj_remote_active() {
    [[ "${NEWPROJ_GITHUB:-off}" != off || "${NEWPROJ_RU:-off}" == on ]]
}

# The GitHub owner: --github-owner, else the authenticated gh login.
newproj_remote_owner() {
    if [[ -n "$NEWPROJ_GITHUB_OWNER" ]]; then
        printf '%s\n' "$NEWPROJ_GITHUB_OWNER"; return 0
    fi
    if [[ -z "$_NEWPROJ_OWNER_CACHE" ]]; then
        command -v gh >/dev/null 2>&1 || return 1
        _NEWPROJ_OWNER_CACHE="$(gh api user -q .login 2>/dev/null)" || { _NEWPROJ_OWNER_CACHE=""; return 1; }
        [[ -n "$_NEWPROJ_OWNER_CACHE" ]] || return 1
    fi
    printf '%s\n' "$_NEWPROJ_OWNER_CACHE"
}

# Ask ru for its resolved configuration. `ru config` prints
#   PROJECTS_DIR=/path   and   LAYOUT=flat|owner-repo|full
# on stderr (its resolved values: env RU_* > ~/.config/ru/config > defaults).
# Sets _NEWPROJ_RU_DIR / _NEWPROJ_RU_LAYOUT; returns 1 when ru is absent or
# its answer is unusable.
_NEWPROJ_RU_QUERIED=""
_NEWPROJ_RU_DIR=""
_NEWPROJ_RU_LAYOUT=""
newproj_ru_config() {
    if [[ -z "$_NEWPROJ_RU_QUERIED" ]]; then
        _NEWPROJ_RU_QUERIED=1
        if command -v ru >/dev/null 2>&1; then
            local out
            out="$(ru config 2>&1 </dev/null)" || out=""
            _NEWPROJ_RU_DIR="$(printf '%s\n' "$out" | sed -n 's/^[[:space:]]*PROJECTS_DIR=//p' | head -1)"
            _NEWPROJ_RU_LAYOUT="$(printf '%s\n' "$out" | sed -n 's/^[[:space:]]*LAYOUT=//p' | head -1)"
            [[ "$_NEWPROJ_RU_DIR" == /* ]] || _NEWPROJ_RU_DIR=""
            case "$_NEWPROJ_RU_LAYOUT" in flat|owner-repo|full) ;; *) _NEWPROJ_RU_LAYOUT="" ;; esac
        fi
    fi
    [[ -n "$_NEWPROJ_RU_LAYOUT" ]]
}

# ru's layout (flat|owner-repo|full), or empty when ru cannot tell us.
newproj_ru_layout() {
    newproj_ru_config && printf '%s\n' "$_NEWPROJ_RU_LAYOUT"
}

# Projects base directory (macacfs replacement for acfs' /data/projects):
# MACACFS_PROJECTS_DIR > ACFS_PROJECTS_DIR > newproj.projects_dir setting >
# ru's PROJECTS_DIR > an existing /data/projects > ~/Projects.
newproj_projects_dir() {
    local d
    if [[ -n "${MACACFS_PROJECTS_DIR:-}" ]]; then printf '%s\n' "$MACACFS_PROJECTS_DIR"; return; fi
    if [[ -n "${ACFS_PROJECTS_DIR:-}" ]]; then printf '%s\n' "$ACFS_PROJECTS_DIR"; return; fi
    d="$(config_effective newproj.projects_dir)"
    if [[ -n "$d" ]]; then printf '%s\n' "$d"; return; fi
    if newproj_ru_config && [[ -n "$_NEWPROJ_RU_DIR" ]]; then printf '%s\n' "$_NEWPROJ_RU_DIR"; return; fi
    if [[ -d /data/projects ]]; then printf '%s\n' /data/projects; return; fi
    printf '%s\n' "$HOME/Projects"
}

# Default directory for NAME = where ru would put OWNER/NAME under its
# configured LAYOUT (flat: base/NAME, owner-repo: base/OWNER/NAME,
# full: base/github.com/OWNER/NAME). Falls back to base/NAME when ru is
# absent, its layout is unreadable, or the layout needs an unknown owner.
newproj_default_project_dir() {
    local name="$1" base layout owner
    base="$(newproj_projects_dir)"
    layout="$(newproj_ru_layout)" || layout=""
    case "$layout" in
        owner-repo|full)
            if owner="$(newproj_remote_owner 2>/dev/null)"; then
                if [[ "$layout" == full ]]; then
                    printf '%s/github.com/%s/%s\n' "$base" "$owner" "$name"
                else
                    printf '%s/%s/%s\n' "$base" "$owner" "$name"
                fi
                return
            fi ;;
    esac
    printf '%s/%s\n' "$base" "$name"
}

# True when PARENT is missing but lies beneath the existing projects base, so
# newproj_ensure_layout_parent may create it (ru's <base>/<owner> folders).
newproj_layout_parent_creatable() {
    local parent="$1" base
    [[ -d "$parent" ]] && return 1
    base="$(newproj_projects_dir)"
    [[ -d "$base" && -w "$base" && "$parent" == "$base"/* ]]
}

# Create the missing layout folders between an existing projects base and the
# project's parent (e.g. <base>/<owner>). Never creates the base itself.
newproj_ensure_layout_parent() {
    local parent base
    parent="$(dirname "$1")"
    [[ -d "$parent" ]] && return 0
    base="$(newproj_projects_dir)"
    [[ -d "$base" && "$parent" == "$base"/* ]] || return 0
    mkdir -p "$parent"
}

_newproj_git_identity_ok() {
    git config user.name >/dev/null 2>&1 && git config user.email >/dev/null 2>&1
}

# newproj_remote_preflight NAME [EXPLICIT_DIR] -> 0, or 1 after listing every
# problem. Runs before anything local or remote is created. EXPLICIT_DIR is the
# directory the user passed, if any: with --ru, ru alone decides where the
# clone goes, so an explicit directory must be exactly ru's path.
newproj_remote_preflight() {
    local name="$1" explicit_dir="${2:-}" owner="" out rc ru_dir
    local -a problems=()
    newproj_remote_active || return 0

    if [[ "$NEWPROJ_RU" == on && "$NEWPROJ_GITHUB" == off ]]; then
        problems+=("--ru needs a GitHub remote: add --github (or set newproj.github), or use --no-ru")
    fi
    if [[ "$NEWPROJ_RU" == on && "$NEWPROJ_GITHUB" != off && -n "$explicit_dir" ]]; then
        ru_dir="$(newproj_default_project_dir "$name")"
        if [[ "${explicit_dir%/}" != "$ru_dir" ]]; then
            problems+=("with --ru, ru clones the repo into its own layout path ($ru_dir); drop the directory argument, or use --no-ru")
        fi
    fi
    if [[ "$NEWPROJ_RU" == on ]] && ! command -v ru >/dev/null 2>&1; then
        problems+=("ru is not installed — run: macacfs install ru   (or pass --no-ru)")
    fi
    if [[ "$NEWPROJ_GITHUB" != off ]]; then
        if ! _newproj_git_identity_ok; then
            problems+=("git user.name/user.email are not set; the initial commit pushed to GitHub needs them — run: git config --global user.name \"Your Name\"; git config --global user.email you@example.com")
        fi
        if ! command -v gh >/dev/null 2>&1; then
            problems+=("gh (GitHub CLI) is not installed — run: brew install gh   (or pass --no-github)")
        elif ! gh auth status >/dev/null 2>&1; then
            problems+=("gh is not authenticated — run: gh auth login   (or pass --no-github)")
        elif ! owner="$(newproj_remote_owner)"; then
            problems+=("could not determine the GitHub account (gh api user failed); pass --github-owner=OWNER")
        else
            out="$(gh api "repos/$owner/$name" 2>&1 >/dev/null)"; rc=$?
            if [[ $rc -eq 0 ]]; then
                problems+=("GitHub repo $owner/$name already exists — choose another project name or --github-owner")
            elif [[ "$out" != *"404"* ]]; then
                problems+=("could not check whether $owner/$name exists on GitHub: ${out:-gh api failed}")
            fi
        fi
    fi

    if ((${#problems[@]})); then
        echo "Error: GitHub/ru preflight failed — nothing was created:" >&2
        local p
        for p in "${problems[@]}"; do echo "  - $p" >&2; done
        return 1
    fi
    return 0
}

# Refuse to publish personal data to a PUBLIC repo: home paths and secrets.
newproj_remote_scan_public() {
    local dir="$1" hits
    [[ "$NEWPROJ_GITHUB" == public ]] || return 0
    hits="$(cd "$dir" && git ls-files -z 2>/dev/null | xargs -0 grep -nIE \
        -e "$HOME/" -e "/Users/${USER:-__none__}/" \
        -e 'gh[pousr]_[A-Za-z0-9]{20,}' -e 'github_pat_[A-Za-z0-9_]{20,}' \
        -e 'sk-[A-Za-z0-9_-]{20,}' -e 'AKIA[0-9A-Z]{16}' \
        -e 'BEGIN [A-Z ]*PRIVATE KEY' 2>/dev/null | head -20)"
    if [[ -n "$hits" ]]; then
        echo "Error: refusing to push to a PUBLIC repo — tracked files contain personal paths or secrets:" >&2
        printf '%s\n' "$hits" | sed 's/^/  /' >&2
        return 1
    fi
    return 0
}

# ru's local path for OWNER/NAME, from `ru list --json` (empty if not listed).
_newproj_ru_path() {
    ru list --json 2>/dev/null | python3 -I -c '
import json, sys
want = sys.argv[1]
try:
    data = json.load(sys.stdin)
except ValueError:
    sys.exit(0)
for repo in data.get("data", {}).get("repos", []):
    if repo.get("repo") == want:
        print(repo.get("path", ""))
        break
' "$1"
}

_newproj_ru_listed() { [[ -n "$(_newproj_ru_path "$1")" ]]; }

# newproj_remote_clone NAME DEFAULT_DIR -> 0 and sets NEWPROJ_CLONE_DIR.
# Step 1 of the remote-first order: create the empty GitHub repo, then have
# ru clone it into its layout path (with --ru), else gh repo clone it into
# DEFAULT_DIR. HEAD is pointed at main so the first push creates main.
# On failure prints what exists and how to finish; never deletes anything.
NEWPROJ_CLONE_DIR=""
newproj_remote_clone() {
    local name="$1" dir="$2" owner repo
    NEWPROJ_CLONE_DIR=""
    [[ "$NEWPROJ_GITHUB" != off ]] || return 0
    owner="$(newproj_remote_owner)" || { echo "Error: GitHub owner unknown" >&2; return 1; }
    repo="$owner/$name"
    echo "Creating GitHub repo $repo ($NEWPROJ_GITHUB)..."
    gh repo create "$repo" "--$NEWPROJ_GITHUB" >/dev/null || {
        echo "Error: gh repo create $repo failed — nothing was created." >&2; return 1; }
    NEWPROJ_GITHUB_URL="https://github.com/$repo"
    if [[ "$NEWPROJ_RU" == on ]]; then
        local -a add=(add "$repo" --non-interactive)
        [[ "$NEWPROJ_GITHUB" == private ]] && add+=(--private)
        echo "Registering $repo with ru and cloning it into ru's layout..."
        ru "${add[@]}" >/dev/null || {
            echo "Error: ru add $repo failed. The GitHub repo exists: $NEWPROJ_GITHUB_URL" >&2
            echo "  Finish by hand: ru add $repo${add[3]:+ --private}; ru sync $repo; then rerun newproj inside the clone" >&2
            return 1; }
        ru sync "$repo" --clone-only --non-interactive >/dev/null || {
            echo "Error: ru sync $repo failed. The repo is on GitHub and registered with ru." >&2
            echo "  Finish by hand: ru sync $repo" >&2
            return 1; }
        dir="$(_newproj_ru_path "$repo")"
        [[ -n "$dir" && -d "$dir/.git" ]] || {
            echo "Error: ru did not clone $repo (ru list shows: ${dir:-nothing})" >&2; return 1; }
    else
        newproj_ensure_layout_parent "$dir"
        echo "Cloning $repo into $dir..."
        gh repo clone "$repo" "$dir" -- -q 2>/dev/null || {
            echo "Error: gh repo clone $repo $dir failed. The GitHub repo exists: $NEWPROJ_GITHUB_URL" >&2; return 1; }
    fi
    git -C "$dir" rev-parse --verify -q HEAD >/dev/null 2>&1 || git -C "$dir" symbolic-ref HEAD refs/heads/main
    NEWPROJ_CLONE_DIR="$dir"
    return 0
}

# True when DIR is a fresh clone of an empty repo: only .git, no commits.
newproj_is_fresh_clone() {
    local dir="$1" entry
    [[ -d "$dir/.git" ]] || return 1
    git -C "$dir" rev-parse --verify -q HEAD >/dev/null 2>&1 && return 1
    for entry in "$dir"/* "$dir"/.[!.]* "$dir"/..?*; do
        [[ -e "$entry" ]] || continue
        [[ "$entry" == "$dir/.git" ]] || return 1
    done
    return 0
}

# Make sure HEAD exists (the push needs a commit). Commits whatever newproj
# just created; never called when the project had prior history.
newproj_remote_ensure_commit() {
    local dir="$1"
    git -C "$dir" rev-parse --verify -q HEAD >/dev/null 2>&1 && return 0
    git -C "$dir" add -A -- . ':(exclude).acfs' || return 1
    git -C "$dir" commit -q -m "Initial commit" || return 1
}

_newproj_manual_hint() {
    local dir="$1" name="$2" owner="${3:-OWNER}" with_gh="${4:-yes}"
    echo "  Finish by hand:" >&2
    echo "    cd $(printf '%q' "$dir")" >&2
    if [[ "$NEWPROJ_GITHUB" != off && "$with_gh" == yes ]]; then
        echo "    gh repo create $owner/$name --$NEWPROJ_GITHUB --source=. --remote=origin --push" >&2
    fi
    if [[ "$NEWPROJ_RU" == on ]]; then
        echo "    ru add --from-cwd$([[ "$NEWPROJ_GITHUB" == private ]] && echo ' --private')" >&2
    fi
}

newproj_remote_publish() {
    local dir="$1" name="$2" owner
    [[ "$NEWPROJ_GITHUB" != off ]] || return 0
    owner="$(newproj_remote_owner)" || { echo "Error: GitHub owner unknown" >&2; return 1; }
    newproj_remote_ensure_commit "$dir" || { echo "Error: could not create the initial commit" >&2; return 1; }
    newproj_remote_scan_public "$dir" || return 1
    if git -C "$dir" remote get-url origin >/dev/null 2>&1; then
        # Remote-first order: the repo was created and cloned up front; push.
        echo "Pushing the initial commit to $owner/$name..."
        git -C "$dir" push -q -u origin HEAD || return 1
    else
        # No clone (e.g. a project created before remote-first): create + push.
        echo "Creating GitHub repo $owner/$name ($NEWPROJ_GITHUB) and pushing..."
        (cd "$dir" && gh repo create "$owner/$name" "--$NEWPROJ_GITHUB" --source=. --remote=origin --push) || return 1
    fi
    NEWPROJ_GITHUB_URL="https://github.com/$owner/$name"
    return 0
}

newproj_remote_ru() {
    local dir="$1" name="$2" owner
    [[ "$NEWPROJ_RU" == on ]] || return 0
    owner="$(newproj_remote_owner)" || return 1
    # Remote-first order: newproj_remote_clone already registered it.
    _newproj_ru_listed "$owner/$name" && return 0
    local -a args=(add --from-cwd --non-interactive)
    [[ "$NEWPROJ_GITHUB" == private ]] && args+=(--private)
    echo "Registering $owner/$name with ru..."
    (cd "$dir" && ru "${args[@]}") || return 1
    ru list --json 2>/dev/null | grep -qF "\"repo\":\"$owner/$name\"" || {
        echo "Error: ru did not list $owner/$name after ru add" >&2; return 1; }
}

# Run publish then ru registration for a freshly created project.
# Returns non-zero (after printing what to do) on any failure; never deletes.
newproj_remote_finish() {
    local dir="$1" name="$2" owner=""
    newproj_remote_active || return 0
    owner="$(newproj_remote_owner 2>/dev/null)" || owner="OWNER"
    if ! newproj_remote_publish "$dir" "$name"; then
        echo "Error: GitHub publish failed. The local project is intact at: $dir" >&2
        _newproj_manual_hint "$dir" "$name" "$owner"
        return 1
    fi
    [[ -n "${NEWPROJ_GITHUB_URL:-}" ]] && echo "GitHub: $NEWPROJ_GITHUB_URL"
    if ! newproj_remote_ru "$dir" "$name"; then
        echo "Error: ru registration failed (local project and GitHub repo are intact)." >&2
        _newproj_manual_hint "$dir" "$name" "$owner" no
        return 1
    fi
    [[ "$NEWPROJ_RU" == on ]] && echo "ru: registered $owner/$name"
    return 0
}
