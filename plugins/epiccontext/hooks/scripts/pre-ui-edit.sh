#!/usr/bin/env bash
# PreToolUse on Edit/Write: in a repo bound to Epic Context, the first edit
# to a UI file waits until the session has fetched a briefing (get_briefing
# over the MCP connector). A page file waits for the briefing of its own
# route, once per route (ADR-082): its context page in the brain is what the
# prototype and the widget show beside it. Held once each: if the agent
# tries again without one — the connector may not be there — the edit goes
# through, so a session can never be trapped. The server's write gate
# enforces graph writes.
set -u
EC_INPUT="$(cat 2>/dev/null || true)"
. "$(dirname "$0")/_common.sh"
ec_bound || exit 0

file="$(ec_input_field file_path)"
[ -n "$file" ] || exit 0
case "$file" in
  *.tsx|*.jsx|*.vue|*.svelte|*.astro|*.css|*.scss|*.html|*.swift|*.kt|*.dart) ;;
  *) exit 0 ;;
esac

session="$(ec_input_field session_id)"
# Without a session id there is nothing to remember the hold by, so there
# is no hold: never trap a session, never share a marker between sessions.
[ -n "$session" ] || exit 0
# A page: its own route's briefing, once per route.
route="$(ec_page_route "$file")"
if [ -n "$route" ]; then
  key="$(printf '%s' "$route" | cksum | cut -d' ' -f1)"
  if [ ! -f "$(ec_marker "page-$key" "$session")" ]; then
    held_page="$(ec_marker "held-page-$key" "$session")"
    [ -f "$held_page" ] && exit 0
    touch "$held_page" 2>/dev/null || true
    reason="$(printf 'Epic Context: this file draws the page %s. Call get_briefing(task_type: "ui-page", target: "%s", task: "<the task in a sentence>", project_id: "%s") through the Epic Context MCP connector before you change it. It brings the page, its template and its components; if the page is not in the brain yet, it says so with the create_block call to make — write that page in this change, because the prototype and the widget show the context of a page only through it. Load the epicontext-design skill with get_skill and the project_id if you have not. Then make this edit again. If the Epic Context tools are not available in this session, say so to the user and retry the edit; it will go through.' "$route" "$route" "$EC_PROJECT" | ec_json_string)" || exit 0
    printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":%s}}\n' "$reason"
    exit 0
  fi
fi
if [ -f "$(ec_marker briefed "$session")" ]; then
  # Briefed: the design skill itself from Epic Context, once, before the first UI edit
  # (feedback from a design session, 26 October 2026: "Maak er een poort van, geen advies").
  [ -f "$(ec_marker designed "$session")" ] && exit 0
  held_design="$(ec_marker held-design "$session")"
  [ -f "$held_design" ] && exit 0
  touch "$held_design" 2>/dev/null || true
  reason="$(printf 'Epic Context: you have the briefing; now load the design skill before this UI edit — get_skill(name: "epicontext-design", project_id: "%s") through the Epic Context connector, its method and this project'"'"'s design rules. Then make the edit again, and name the principle behind each change. If the Epic Context tools are not available in this session, say so to the user and retry the edit; it will go through.' "$EC_PROJECT" | ec_json_string)" || exit 0
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":%s}}\n' "$reason"
  exit 0
fi

held="$(ec_marker held "$session")"
if [ -f "$held" ]; then
  exit 0
fi
touch "$held" 2>/dev/null || true

base="$(basename "$file")"
target="${base%.*}"
task_type="ui-component"
[ -n "$route" ] && { task_type="ui-page"; target="$route"; }
reason="$(printf 'Epic Context: read before you change UI. Call get_briefing(task_type: "%s", target: "%s", task: "<the task in a sentence>", project_id: "%s") through the Epic Context MCP connector, follow it — design is judged with the epicontext-design skill: load it with get_skill and the project_id if you have not, so you also get the design rules of this project — then make this edit again and pass its briefing_id when you write context. If the Epic Context tools are not available in this session, say so to the user and retry the edit; it will go through.' "$task_type" "$target" "$EC_PROJECT" | ec_json_string)" || exit 0
printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":%s}}\n' "$reason"
exit 0
