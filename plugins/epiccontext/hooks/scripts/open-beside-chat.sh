#!/usr/bin/env bash
# PostToolUse on Epic Context's writes, its plan and its briefing: the url
# the result carries becomes a note the agent sees at that moment — open it
# beside the chat now (Robert, 2026-10-20: "when you make a plan, open the
# board; when you change the context, open the page; when you change a
# component, open the design system"). A sentence inside a JSON result is
# read past in a long build; a note from the harness is not. Never blocks.
set -u
. "$(dirname "$0")/_common.sh"
ec_bound || exit 0
command -v node >/dev/null 2>&1 || exit 0

EC_INPUT="$(cat 2>/dev/null || true)"
printf '%s' "$EC_INPUT" | node -e '
let raw = "";
process.stdin.on("data", (d) => (raw += d)).on("end", () => {
  let input;
  try { input = JSON.parse(raw); } catch { return; }
  const tool = String(input.tool_name || "");
  const response = typeof input.tool_response === "string" ? input.tool_response : JSON.stringify(input.tool_response ?? "");
  // The result is text inside the response: undo one level of escaping.
  const text = response.replace(/\\"/g, "\"").replace(/\\n/g, "\n");
  const briefing = /get_briefing$/.test(tool);
  const match = briefing
    ? text.match(/Open beside the chat now:\*\*[^\n]*? — (https?:\/\/[^\s".]+(?:\.[^\s".]+)*)/)
    : text.match(/"url"\s*:\s*"(https?:\/\/[^"]+)"/);
  if (!match) return;
  const what = /share_plan|call_tool_action/.test(tool) ? "the plan on the board" : briefing ? "the page of what you are about to change" : "the page you just wrote";
  const note = `Epic Context: open ${match[1]} beside the chat now — ${what}. In Claude desktop use the built-in browser (navigate in the tab you already use), otherwise Claude in Chrome; then say in the chat what changed. Without a browser, give the url.`;
  process.stdout.write(JSON.stringify({ hookSpecificOutput: { hookEventName: "PostToolUse", additionalContext: note } }));
});
' 2>/dev/null || true
exit 0
