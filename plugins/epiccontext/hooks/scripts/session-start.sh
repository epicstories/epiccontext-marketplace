#!/usr/bin/env bash
# SessionStart: in a repo bound to an Epic Context project, tell the agent
# which project this is and what it must do first — through the Epic Context
# MCP connector, which carries the user's own sign-in. Nothing is fetched here.
set -u
. "$(dirname "$0")/_common.sh"
if ! ec_bound; then
  # Not a repo of one project — a plan, research, a question about the
  # organisation (Robert, 21 October): the brain still comes first.
  cat <<'MSG'
Epic Context is connected: the brain of your organisations (decisions, plans, research, brand, product, how the team works). Before you research, plan, advise or design anything for them, look there first: get_orientation without a project_id lists the organisations and their shared context, then get_briefing or search_blocks for the subject. Web research and research agents cannot reach Epic Context: put what you found in their brief.
MSG
  exit 0
fi

name="${EC_PROJECT_NAME:-this project}"
cat <<MSG
This repo works with Epic Context: project ${name} (id ${EC_PROJECT}). Its context — brand, users, product, design system, decisions — lives there, not in this repo.

1. First call get_orientation with project_id ${EC_PROJECT} through the Epic Context MCP connector. Before research, a plan or advice — about this project or the organisation — look in Epic Context first (get_briefing, search_blocks; the organisation's shared context for its decisions and plans), and brief research agents and subagents with what you found: they cannot reach it.
2. Before UI, strategy or architecture work: get_briefing(task_type, target, project_id ${EC_PROJECT}). Pass its briefing_id with every create_block / update_block. Edits to UI files are held until a briefing was fetched in this session.
3. Write decisions, rules and learnings back to Epic Context with a reason (save_rule / log_learning), never to a local memory file.
4. Open what you touch beside the chat, right away, every time, in your browser pane (in Claude desktop: the built-in browser; otherwise Claude in Chrome): the url of each block you write, the plan's card that share_plan returns, and — when you change a component or a page — its page in the design system or its content page (the UI briefing names it). Without a browser, give the url.
5. What the session leaves for a person — an action, a decision, an approval, a setting, a question, an investigation — goes to that person with hand_off (a card for a named member: "Nico", "me"), not into a list in the chat. list_handoffs shows what is already waiting.
6. Every build has a plan: as soon as you have one, put it on the board with share_plan (key: the branch) — or call_tool_action kanban.share_plan if your tool list has no share_plan yet — and call it again as steps start and finish. Notes worth keeping go to write_note; what someone must know but not do goes to notify. get_orientation lists the organisation's tools and what each is for.

If the Epic Context tools are not available, tell the user to connect the Epic Context connector (Settings → Connectors) and sign in.
MSG
exit 0
