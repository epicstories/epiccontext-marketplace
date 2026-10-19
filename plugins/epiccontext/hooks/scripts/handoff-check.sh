#!/usr/bin/env bash
# Stop: a session that wrote to Epic Context but handed nothing off is
# reminded once to hand off what it leaves for people (suite plan, phase 1).
# Never traps a session: the stop_hook_active guard and a per-session
# marker mean it blocks at most once; any uncertainty allows.
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

# Wrote to the graph this session, and no hand-off yet.
grep -qE '"name"[[:space:]]*:[[:space:]]*"mcp__[^"]*__(create_block|update_block|save_rule|log_learning|ingest_text)"' "$transcript" || exit 0
grep -qE '"name"[[:space:]]*:[[:space:]]*"mcp__[^"]*__(hand_off|create_task|notify)"' "$transcript" && exit 0

: > "$marker" 2>/dev/null || exit 0
reason="Before you finish: does this session leave anything for a person — an action, a decision, an approval, a setting, a question or an investigation? Then call hand_off with each item for a named member, instead of listing it in your reply. If nothing is left for anyone, just finish."
printf '{"decision":"block","reason":%s}\n' "$(printf '%s' "$reason" | ec_json_string)" || exit 0
exit 0
