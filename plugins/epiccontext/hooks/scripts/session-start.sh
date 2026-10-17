#!/usr/bin/env bash
# SessionStart: put the anchor and a short orientation in front of the agent
# — which project, its stack, the five rules, its state — so the first
# thing it knows is where the context lives. Both come from the server;
# nothing is written into the repo.
set -u
. "$(dirname "$0")/_common.sh"
ec_ready || exit 0

anchor="$(curl -sf --max-time 6 \
  -H "Authorization: Bearer $EC_KEY" \
  "$EC_BASE/api/v1/projects/$EC_PROJECT/anchor" 2>/dev/null)" || anchor=""

orientation="$(curl -sf --max-time 6 \
  -H "Authorization: Bearer $EC_KEY" \
  "$EC_BASE/api/v1/projects/$EC_PROJECT/v3/orientation?format=text" 2>/dev/null)" || orientation=""

[ -n "$anchor$orientation" ] || exit 0
{
  [ -n "$anchor" ] && printf '%s\n\n' "$anchor"
  [ -n "$orientation" ] && printf '%s\n\n' "$orientation"
  printf 'Before changing UI, strategy or architecture: call get_briefing(task_type, target) and pass its briefing_id when you write.\n'
} | head -c 9000
exit 0
