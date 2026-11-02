#!/usr/bin/env bash
# SessionStart: in a repo bound to an Epic Context project, tell the agent
# which project this is and what it must do first — through the Epic Context
# MCP connector, which carries the user's own sign-in. Nothing is fetched here.
set -u
EC_INPUT="$(cat 2>/dev/null || true)"
. "$(dirname "$0")/_common.sh"
# After a compaction the summary keeps a skill's method, but what get_skill and
# get_briefing said about this project is gone (feedback from a design
# session, 26 October 2026): fetch them again before going on.
if [ "$(ec_input_field source)" = "compact" ]; then
  echo "This session was just compacted. What get_briefing and get_skill told you about the project — its rules, its learnings, the blocks of the task — is no longer in your context. Before you continue the task: call get_briefing for it again, and get_skill for the expert it names, with the project_id."
  echo
fi
# The rules themselves are written once in Epic Context (lib/skills/base-rules.ts)
# and generated next to this script when the plugin is built.
here="$(dirname "$0")"
if ! ec_bound; then
  # Not a repo of one project — a plan, research, a question about the
  # organisation (Robert, 21 October): the brain still comes first.
  if [ -f "$here/rules-unbound.txt" ]; then
    cat "$here/rules-unbound.txt"
  else
    echo "Epic Context is connected: look there first — get_orientation without a project_id lists the organisations and their shared context; research agents cannot reach Epic Context, so give them get_context_pack."
  fi
  exit 0
fi

name="${EC_PROJECT_NAME:-this project}"
if [ -f "$here/rules-bound.txt" ]; then
  # Fill in the project; a name with a slash or an ampersand stays literal.
  safe_name=$(printf '%s' "$name" | sed -e 's/[\/&|]/\\&/g')
  sed -e "s|{{PROJECT}}|${EC_PROJECT}|g" -e "s|{{NAME}}|${safe_name}|g" "$here/rules-bound.txt"
else
  echo "This repo works with Epic Context: project ${name} (id ${EC_PROJECT}). First call get_orientation with project_id ${EC_PROJECT}, look in Epic Context first, then get_briefing before you write."
fi
exit 0
