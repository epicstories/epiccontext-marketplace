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
  // The texts of the result, however the harness wrapped them.
  const unwrap = (r) => {
    if (typeof r === "string") { try { return unwrap(JSON.parse(r)); } catch { return [r]; } }
    if (Array.isArray(r)) return r.flatMap((c) => (c && typeof c === "object" && "text" in c ? [String(c.text)] : unwrap(c)));
    return r && typeof r === "object" ? [JSON.stringify(r)] : [];
  };
  // Only a page of Epic Context itself. An outside service answers through
  // call_tool_action too, and its links are data, never something to open in
  // the browser where the person is signed in (audit, 8 November 2026).
  const ours = (value) => {
    let u;
    try { u = new URL(value); } catch { return null; }
    const local = u.hostname === "localhost" || u.hostname === "127.0.0.1";
    if (u.protocol !== "https:" && !(local && u.protocol === "http:")) return null;
    if (!local && !/(^|\.)epiccontext\.com$/.test(u.hostname) && !/^epiccontext\.[a-z0-9-]+\.sslip\.io$/.test(u.hostname)) return null;
    return u.toString();
  };
  const briefing = /get_briefing$/.test(tool);
  let url = null;
  for (const text of unwrap(input.tool_response)) {
    if (briefing) {
      const m = text.match(/Open beside the chat now:\*\*[^\n]*? — (https?:\/\/[^\s"]+)/);
      if (m) url = ours(m[1].replace(/[.,;)]+$/, ""));
    } else {
      // The url of the result itself, at its top level: never one nested in what a service answered.
      try { const v = JSON.parse(text); if (v && typeof v === "object" && typeof v.url === "string") url = ours(v.url); } catch {}
    }
    if (url) break;
  }
  if (!url) return;
  const what = /share_plan|call_tool_action/.test(tool) ? "the plan on the board" : briefing ? "the page of what you are about to change" : "the page you just wrote";
  const note = `Epic Context: open ${url} beside the chat now — ${what}. In Claude desktop use the built-in browser (navigate in the tab you already use), otherwise Claude in Chrome; then say in the chat what changed. Without a browser, give the url.`;
  process.stdout.write(JSON.stringify({ hookSpecificOutput: { hookEventName: "PostToolUse", additionalContext: note } }));
});
' 2>/dev/null || true
exit 0
