#!/usr/bin/env bash
# SessionStart: in a repo bound to an Epic Context project, tell the agent
# which project this is and what it must do first — through the Epic Context
# MCP connector, which carries the user's own sign-in. Nothing is fetched here.
set -u
. "$(dirname "$0")/_common.sh"
ec_bound || exit 0

name="${EC_PROJECT_NAME:-this project}"
cat <<MSG
This repo works with Epic Context: project ${name} (id ${EC_PROJECT}). Its context — brand, users, product, design system, decisions — lives there, not in this repo.

1. First call get_orientation with project_id ${EC_PROJECT} through the Epic Context MCP connector.
2. Before UI, strategy or architecture work: get_briefing(task_type, target, project_id ${EC_PROJECT}). Pass its briefing_id with every create_block / update_block. Edits to UI files are held until a briefing was fetched in this session.
3. Write decisions, rules and learnings back to Epic Context with a reason (save_rule / log_learning), never to a local memory file.
4. Every write returns a url. Open it right away, every time, in your browser pane beside the chat (in Claude desktop: the built-in browser; otherwise Claude in Chrome), so the user sees the changed page like an artifact; without a browser, give them the url.
5. What the session leaves for a person — an action, a decision, an approval, a setting, a question, an investigation — goes to that person with hand_off (a card for a named member: "Nico", "me"), not into a list in the chat. list_handoffs shows what is already waiting.

If the Epic Context tools are not available, tell the user to connect the Epic Context connector (Settings → Connectors) and sign in.
MSG
exit 0
