#!/usr/bin/env bash
# PreToolUse on Edit/Write: in a repo bound to Epic Context, the first edit
# to a UI file waits until the session has fetched a briefing (get_briefing
# over the MCP connector). Held once: if the agent tries again without one
# — the connector may not be there — the edit goes through, so a session
# can never be trapped. The server's write gate enforces graph writes.
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
[ -f "$(ec_marker briefed "$session")" ] && exit 0

held="$(ec_marker held "$session")"
if [ -f "$held" ]; then
  exit 0
fi
touch "$held" 2>/dev/null || true

base="$(basename "$file")"
target="${base%.*}"
case "$file" in
  */pages/*|*/app/*page.*|*/routes/*|*/views/*) task_type="ui-page" ;;
  *) task_type="ui-component" ;;
esac

reason="$(printf 'Epic Context: read before you change UI. Call get_briefing(task_type: "%s", target: "%s", project_id: "%s") through the Epic Context MCP connector, follow it, then make this edit again and pass its briefing_id when you write context. If the Epic Context tools are not available in this session, say so to the user and retry the edit; it will go through.' "$task_type" "$target" "$EC_PROJECT" | ec_json_string)" || exit 0
printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":%s}}\n' "$reason"
exit 0
