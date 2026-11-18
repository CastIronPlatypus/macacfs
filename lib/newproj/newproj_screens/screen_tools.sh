#!/usr/bin/env bash
# macacfs: newproj TUI wizard - Project Tools screen (not part of the acfs port).
# Multi-select of the per-project flywheel tools from lib/projinit.sh's
# registry, preselected from newproj.tools, plus a "Save as defaults" toggle.
# br and ubs keep their own checkboxes on the Features screen; saving defaults
# records them too. Realizes: wizard-screens-code / fb-lib-newproj-screens.

if [[ -n "${_MACACFS_SCREEN_TOOLS_LOADED:-}" ]]; then
    return 0
fi
_MACACFS_SCREEN_TOOLS_LOADED=1

SCREEN_TOOLS_ID="tools"
SCREEN_TOOLS_TITLE="Project Tools"
SCREEN_TOOLS_STEP=5
SCREEN_TOOLS_NEXT="agents_preview"
SCREEN_TOOLS_PREV="features"

SAVE_DEFAULTS_LABEL="Save these choices as the newproj default"

# Tool ids this screen offers (registry minus the Features-screen ones).
tools_screen_ids() {
    declare -f projinit_ids >/dev/null 2>&1 || return 0
    projinit_ids | grep -vxE 'br|ubs'
}

tools_screen_is_on() { [[ ",$(state_get tools_selected)," == *",$1,"* ]]; }

# The full tool list this wizard run will use (Features br/ubs + this screen).
tools_screen_full_list() {
    local list=""
    [[ "$(state_get enable_br)" == "true" ]] && list="br"
    [[ -n "$(state_get tools_selected)" ]] && list="${list:+$list,}$(state_get tools_selected)"
    [[ "$(state_get enable_ubsignore)" == "true" ]] && list="${list:+$list,}ubs"
    projinit_normalize "$list"
}

render_tools_screen() {
    render_screen_header "Project Tools" "$SCREEN_TOOLS_STEP" 9
    echo "Which flywheel tools should be initialized in this project?"
    echo -e "${TUI_GRAY}(beads and the UBS ignore file are on the Features screen)${TUI_NC}"
    echo ""
    local i=1 id box
    for id in $(tools_screen_ids); do
        if tools_screen_is_on "$id"; then box="[x]"; else box="[ ]"; fi
        echo -e "  $i) $box ${TUI_PRIMARY}$id${TUI_NC}  ${TUI_GRAY}$(projinit_desc "$id")${TUI_NC}"
        ((i++)) || true
    done
    if [[ "$(state_get save_tool_defaults)" == "true" ]]; then box="[x]"; else box="[ ]"; fi
    echo ""
    echo -e "  s) $box $SAVE_DEFAULTS_LABEL"
    echo ""
    echo -e "${TUI_GRAY}Enter numbers to toggle (e.g. 1 3), 's' for save-defaults, 'all', 'none', or Enter when done${TUI_NC}"
}

handle_tools_input() {
    while true; do
        render_tools_screen > /dev/tty
        local ids=() id
        for id in $(tools_screen_ids); do ids+=("$id"); done

        if [[ "$GUM_AVAILABLE" == "true" && "$TERM_HAS_COLOR" == "true" ]]; then
            local options=() pre=() label picked
            for id in "${ids[@]}"; do
                label="$id — $(projinit_desc "$id")"
                options+=("$label")
                tools_screen_is_on "$id" && pre+=("$label")
            done
            options+=("$SAVE_DEFAULTS_LABEL")
            [[ "$(state_get save_tool_defaults)" == "true" ]] && pre+=("$SAVE_DEFAULTS_LABEL")
            local selarg=""
            [[ ${#pre[@]} -gt 0 ]] && selarg=$(IFS=,; echo "${pre[*]}")
            picked=$(gum choose --no-limit \
                --cursor.foreground "#cba6f7" --selected.foreground "#a6e3a1" \
                --header "Select project tools (Space to toggle, Enter to confirm)" \
                ${selarg:+--selected="$selarg"} \
                "${options[@]}" < /dev/tty 2>/dev/tty) || return 1
            local chosen="" save=false line
            while IFS= read -r line; do
                [[ -z "$line" ]] && continue
                if [[ "$line" == "$SAVE_DEFAULTS_LABEL" ]]; then save=true
                else chosen="${chosen:+$chosen,}${line%% *}"; fi
            done <<< "$picked"
            state_set tools_selected "$(projinit_normalize "$chosen")"
            state_set save_tool_defaults "$save"
            log_input "tools" "$chosen save=$save"
            echo "$SCREEN_TOOLS_NEXT"
            return 0
        fi

        echo "" > /dev/tty
        echo -n "Toggle options (or Enter to continue): " > /dev/tty
        local input=""
        read -r input < /dev/tty || true
        case "$input" in
            '')
                log_input "tools" "confirmed"
                echo "$SCREEN_TOOLS_NEXT"
                return 0 ;;
            all) state_set tools_selected "$(IFS=,; echo "${ids[*]}")" ;;
            none) state_set tools_selected "" ;;
            b|back) return 1 ;;
            *)
                local tok sel
                for tok in $input; do
                    if [[ "$tok" == s ]]; then
                        if [[ "$(state_get save_tool_defaults)" == "true" ]]; then state_set save_tool_defaults false
                        else state_set save_tool_defaults true; fi
                    elif [[ "$tok" =~ ^[0-9]+$ ]] && (( tok >= 1 && tok <= ${#ids[@]} )); then
                        id="${ids[$((tok-1))]}"
                        sel="$(state_get tools_selected)"
                        if tools_screen_is_on "$id"; then
                            sel="$(printf '%s' "$sel" | tr ',' '\n' | grep -vx "$id" | paste -sd, -)"
                        else
                            sel="${sel:+$sel,}$id"
                        fi
                        state_set tools_selected "$(projinit_normalize "$sel")"
                    fi
                done ;;
        esac
    done
}

run_tools_screen() {
    log_screen "ENTER" "tools"
    SCREEN_HANDLER_OUTPUT=""
    SCREEN_HANDLER_STATUS=0
    run_screen_handler_capture handle_tools_input
    if [[ $SCREEN_HANDLER_STATUS -eq 0 ]] && [[ -n "$SCREEN_HANDLER_OUTPUT" ]]; then
        navigate_forward "$SCREEN_HANDLER_OUTPUT"
    else
        navigate_back
    fi
    return 0
}
