#!/usr/bin/env bash
# Stop: once per session, after work, ask for what the suite should see
# (docs/suite/planning-en-meldingen.md §5):
#   - a plan was made (a todo list, plan mode, or a build of many edits)
#     but never put on the board with share_plan;
#   - the graph was written but nothing handed off to people;
#   - the graph was written or a plan shared, and nothing opened beside the
#     chat (Robert, 2026-10-20).
# One message for both. Never traps a session: the stop_hook_active guard
# and a per-session marker mean it blocks at most once; any uncertainty
# allows.
#
# Before that, every answer: a person the last answer gives something to do
# or know ("For Frenz: …", "Nico needs to …") with nothing sent to them in
# this session is sent through the suite — hand_off puts a card on their
# Kanban board with a notification, notify sends a notice (Robert,
# 2026-10-26: "make these actions into notification … connect all people to
# tasks or update"). At most once per answer.
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

# The people the last answer gives something to do or know, to whom this
# session sent nothing (hand_off, notify, create_task). Prints "Frenz, Nico".
EC_NAMED_JS='
const fs = require("fs");
const lines = fs.readFileSync(process.argv[1], "utf8").split("\n").filter(Boolean);
const entries = []; for (const l of lines) { try { entries.push(JSON.parse(l)); } catch {} }
const blocks = (e) => (Array.isArray(e?.message?.content) ? e.message.content : []);
const isPrompt = (e) => e.type === "user" && (typeof e?.message?.content === "string" || blocks(e).some((b) => b.type === "text"));
let text = "";
for (let i = entries.length - 1; i >= 0; i--) {
  const e = entries[i];
  if (isPrompt(e)) break;
  if (e.type === "assistant") text = blocks(e).filter((b) => b.type === "text").map((b) => b.text).join("\n") + "\n" + text;
}
const NOT_A_NAME = new Set("This That These Those It The A An Each Every Everyone Everybody Someone Somebody Nobody One You We They He She Who What Which Here There Then Now Also And But Or If When Het Dit Dat Die Deze Je Jij U Wij We Ze Iemand Iedereen Elke Elk Er Hier Daar Claude Epic Context Brain Design Kanban Notes Notifications Social Content Capture Coolify GitHub Prisma Next Docker Traefik Dashboard Prototype Chat Mail Calendar Research Analytics Processes Work User Users CRM Suite Plugin Settings Nothing Something Everything Anything Test Tests Code Data Migration Migrations Migratie Migraties Build Deploy Review Release Server Database Page Pages Block Blocks Skill Skills This Nog Niets Alles Iets".split(" "));
const names = new Set();
const add = (n) => { if (n && !NOT_A_NAME.has(n)) names.add(n); };
for (const m of text.matchAll(/(?:^|[\s(>*_-])(?:For|Voor|Aan)\s+\**([A-Z][a-z\u00e0-\u00ff]+)\**\s*:/g)) add(m[1]);
for (const m of text.matchAll(/\b([A-Z][a-z\u00e0-\u00ff]+)\s+(?:needs to|needs|must|should|has to|still has to|will have to|moet|moeten|dient|zou moeten)\b/g)) add(m[1]);
const sent = entries.flatMap(blocks).filter((b) => b.type === "tool_use" && (/__(hand_off|notify|create_task)$/.test(b.name ?? "") || (/__call_tool_action$/.test(b.name ?? "") && /"(create_task|notify|hand_off)"/.test(JSON.stringify(b.input ?? {}))))).map((b) => JSON.stringify(b.input ?? {}).toLowerCase());
const unsent = [...names].filter((n) => !sent.some((s) => s.includes(n.toLowerCase())));
process.stdout.write(unsent.join(", "));
'
named="$(command -v node >/dev/null 2>&1 && node -e "$EC_NAMED_JS" "$transcript" 2>/dev/null || true)"
if [ -n "$named" ]; then
  answer_marker="$(ec_marker "named-$(printf '%s' "$named$(wc -c < "$transcript")" | cksum | cut -d' ' -f1)" "$session")" || answer_marker=""
  if [ -n "$answer_marker" ] && [ ! -f "$answer_marker" ]; then
    : > "$answer_marker" 2>/dev/null || exit 0
    reason="Your answer gives ${named} something to do or to know, and this session sent them nothing. Send it through the suite now, so it reaches them: hand_off for an action, a decision, an approval, a setting, a question or an investigation (a card on their Kanban board, with a notification); notify for what they only need to know. The server finds the member, or says who it could mean. Then say in your answer that it was sent, with the card's link. If it is not a person, or it was already sent, just finish."
    printf '{"decision":"block","reason":%s}\n' "$(printf '%s' "$reason" | ec_json_string)" || exit 0
    exit 0
  fi
fi

called() { grep -qE "\"name\"[[:space:]]*:[[:space:]]*\"$1\"" "$transcript"; }

graph_write=0; called 'mcp__[^"]*__(create_block|update_block|save_rule|log_learning|ingest_text)' && graph_write=1
edits="$(grep -cE '"name"[[:space:]]*:[[:space:]]*"(Edit|Write|MultiEdit|NotebookEdit)"' "$transcript" 2>/dev/null)"
planned=0; { called '(TodoWrite|TaskCreate|ExitPlanMode)' || [ "${edits:-0}" -ge 10 ] 2>/dev/null; } && planned=1

ask=""
# A suite verb through call_tool_action (sessions whose tool list predates it) counts too.
via_action() { grep -qE "\"action\"[[:space:]]*:[[:space:]]*\"$1\"" "$transcript"; }

if [ "$planned" = 1 ] && ! called 'mcp__[^"]*__share_plan' && ! via_action 'share_plan'; then
  ask="This session made a plan (a todo list, plan mode, or a build of many edits) but did not put it on the board. Call share_plan with its steps and their statuses now (key: the branch), so the plan shows in Kanban."
fi
if [ "$graph_write" = 1 ] && ! called 'mcp__[^"]*__(hand_off|create_task|notify)' && ! via_action '(create_task|notify)'; then
  ask="${ask:+$ask }Does this session leave anything for a person — an action, a decision, an approval, a setting, a question or an investigation? Then call hand_off with each item for a named member, instead of listing it in your reply."
fi
# Wrote to Epic Context, or shared a plan, and opened nothing beside the chat.
if { [ "$graph_write" = 1 ] || called 'mcp__[^"]*__(share_plan|write_note)' || via_action '(share_plan|write_note)'; } && ! called 'mcp__[^"]*(Claude_Browser|claude-in-chrome)__(navigate|browser_batch|preview_start)'; then
  ask="${ask:+$ask }You wrote to Epic Context but opened nothing beside the chat: open the last page you wrote (or the plan's card) in the browser pane now, so the person sees it."
fi
[ -n "$ask" ] || exit 0

: > "$marker" 2>/dev/null || exit 0
reason="Before you finish: ${ask} If there is nothing to share, just finish."
printf '{"decision":"block","reason":%s}\n' "$(printf '%s' "$reason" | ec_json_string)" || exit 0
exit 0
