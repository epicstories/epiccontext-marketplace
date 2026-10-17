#!/usr/bin/env bash
# SessionStart: put the anchor and a short orientation in front of the agent
# — which project, its stack, the five rules, its state — so the first
# thing it knows is where the context lives. Both come from the server;
# nothing is written into the repo.
set -u
. "$(dirname "$0")/_common.sh"
if ! ec_ready; then
  # Installed but not told which project: say so once, instead of staying silent.
  if [ -z "$EC_PROJECT" ] || [ -z "$EC_KEY" ]; then
    printf 'Epic Context plugin: no project set for this session, so no anchor or briefing was loaded. Set the plugin options project_id and api_key (Project settings → Connect AI tools in Epic Context shows both), or add an .epicontext file to the repo. The Epic Context MCP tools still work once you sign in (/mcp).\n'
  fi
  exit 0
fi

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
