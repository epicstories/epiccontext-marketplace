#!/usr/bin/env bash
# PreToolUse on Edit/Write: before the first change to a UI file in a
# session, fetch the briefing for that component or page and put it — and
# its briefing_id — in front of the agent. Hooks speed things up; the
# server's write gate is what enforces (bouwplan principle 2).
set -u
EC_INPUT="$(cat 2>/dev/null || true)"
. "$(dirname "$0")/_common.sh"
ec_ready || exit 0

file="$(ec_input_field file_path)"
[ -n "$file" ] || exit 0
case "$file" in
  *.tsx|*.jsx|*.vue|*.svelte|*.astro|*.css|*.scss|*.html|*.swift|*.kt|*.dart) ;;
  *) exit 0 ;;
esac

session="$(ec_input_field session_id)"
base="$(basename "$file")"
target="${base%.*}"
case "$file" in
  */pages/*|*/app/*page.*|*/routes/*|*/views/*) task_type="ui-page" ;;
  *) task_type="ui-component" ;;
esac

# Once per session and target: a briefing per keystroke is noise.
marker="${TMPDIR:-/tmp}/ec-briefed-${session:-default}-$(printf '%s' "$task_type-$target" | tr -c 'A-Za-z0-9_-' '_')"
[ -f "$marker" ] && exit 0

payload="{\"task_type\":\"$task_type\",\"target\":\"$target\",\"format\":\"text\",\"budget\":6000}"
briefing="$(curl -sf --max-time 8 -X POST \
  -H "Authorization: Bearer $EC_KEY" -H "Content-Type: application/json" \
  -d "$payload" "$EC_BASE/api/v1/projects/$EC_PROJECT/v3/briefing" 2>/dev/null)" || exit 0
[ -n "$briefing" ] || exit 0
touch "$marker" 2>/dev/null || true

context="$(printf 'Epic Context briefing for %s (%s) — read it before this edit, and pass the briefing_id below when you write context:\n\n%s' "$target" "$task_type" "$briefing" | head -c 20000 | ec_json_string)" || exit 0
printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","additionalContext":%s}}\n' "$context"
exit 0
