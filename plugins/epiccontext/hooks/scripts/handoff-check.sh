#!/usr/bin/env bash
# Stop: once per session, after work, ask for what the suite should see
# (docs/suite/planning-en-meldingen.md §5):
#   - a plan was made (a todo list, plan mode, or a build of many edits)
#     but never put on the board with share_plan;
#   - the graph was written but nothing handed off to people.
# One message for both. Never traps a session: the stop_hook_active guard
# and a per-session marker mean it blocks at most once; any uncertainty
# allows.
set -u
. "$(dirname "$0")/_common.sh"
ec_bound || exit 0

EC_INPUT="$(cat 2>/dev/null || true)"
printf '%s' "$EC_INPUT" | grep -q '"stop_hook_active"[[:space:]]*:[[:space:]]*true' && exit 0

session="$(ec_input_field session_id)"
marker="$(ec_marker handoff "$session")" || exit 0
[ -f "$marker" ] && exit 0

transcript="$(ec_input_field transcript_path)"
[ -n "$transcript" ] && [ -f "$transcript" ] || exit 0

called() { grep -qE "\"name\"[[:space:]]*:[[:space:]]*\"$1\"" "$transcript"; }

graph_write=0; called 'mcp__[^"]*__(create_block|update_block|save_rule|log_learning|ingest_text)' && graph_write=1
edits="$(grep -cE '"name"[[:space:]]*:[[:space:]]*"(Edit|Write|MultiEdit|NotebookEdit)"' "$transcript" 2>/dev/null)"
planned=0; { called '(TodoWrite|TaskCreate|ExitPlanMode)' || [ "${edits:-0}" -ge 10 ] 2>/dev/null; } && planned=1

ask=""
if [ "$planned" = 1 ] && ! called 'mcp__[^"]*__share_plan'; then
  ask="This session made a plan (a todo list, plan mode, or a build of many edits) but did not put it on the board. Call share_plan with its steps and their statuses now (key: the branch), so the plan shows in Kanban."
fi
if [ "$graph_write" = 1 ] && ! called 'mcp__[^"]*__(hand_off|create_task|notify)'; then
  ask="${ask:+$ask }Does this session leave anything for a person — an action, a decision, an approval, a setting, a question or an investigation? Then call hand_off with each item for a named member, instead of listing it in your reply."
fi
[ -n "$ask" ] || exit 0

: > "$marker" 2>/dev/null || exit 0
reason="Before you finish: ${ask} If there is nothing to share, just finish."
printf '{"decision":"block","reason":%s}\n' "$(printf '%s' "$reason" | ec_json_string)" || exit 0
exit 0
