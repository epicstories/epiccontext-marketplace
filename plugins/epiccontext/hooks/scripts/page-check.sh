#!/usr/bin/env bash
# Stop: once per session, a page this session was briefed on that is still
# not in the brain (ADR-082; Robert, 4 November 2026: "de aansluiting van
# context op het prototype is HEEL belangrijk"). A UI page briefing for a
# route without a content_page says "is not in the brain yet" with the
# route in backticks; this hook reads those briefings back from the
# transcript and looks for the create_block (or update_block) of that page.
# Without a model, without the server. Never traps a session: the
# stop_hook_active guard and a per-session marker mean it blocks at most
# once; any uncertainty allows.
set -u
. "$(dirname "$0")/_common.sh"
ec_bound || exit 0

EC_INPUT="$(cat 2>/dev/null || true)"
printf '%s' "$EC_INPUT" | grep -q '"stop_hook_active"[[:space:]]*:[[:space:]]*true' && exit 0

session="$(ec_input_field session_id)"
marker="$(ec_marker page-check "$session")" || exit 0
[ -f "$marker" ] && exit 0

transcript="$(ec_input_field transcript_path)"
[ -n "$transcript" ] && [ -f "$transcript" ] || exit 0
command -v node >/dev/null 2>&1 || exit 0

# The routes a briefing found without a page and no write gave one. Prints "/a, /b".
EC_PAGES_JS='
const fs = require("fs");
const lines = fs.readFileSync(process.argv[1], "utf8").split("\n").filter(Boolean);
const entries = []; for (const l of lines) { try { entries.push(JSON.parse(l)); } catch {} }
const parts = (e) => (Array.isArray(e?.message?.content) ? e.message.content : [e]);
const uses = [], results = new Map();
for (const e of entries) for (const p of parts(e)) {
  if (p?.type === "tool_use") uses.push(p);
  if (p?.type === "tool_result") {
    const c = p.content;
    const text = typeof c === "string" ? c : Array.isArray(c) ? c.map((x) => (typeof x === "string" ? x : x?.text ?? "")).join("\n") : "";
    results.set(p.tool_use_id, text);
  }
}
const needed = new Set();
for (const u of uses) {
  if (!/__get_briefing$/.test(u.name ?? "")) continue;
  const text = results.get(u.id) ?? "";
  if (!text.includes("is not in the brain yet")) continue;
  for (const m of text.matchAll(/No `content_page` for `([^`]+)`/g)) needed.add(m[1]);
}
if (needed.size === 0) process.exit(0);
const keyOf = (r) => "content-page-" + (r.replace(/^\//, "").replace(/[^a-z0-9]+/gi, "-").replace(/^-+|-+$/g, "").toLowerCase() || "home");
const writes = uses.filter((u) => /__(create_block|update_block)$/.test(u.name ?? "")).map((u) => JSON.stringify(u.input ?? {}).toLowerCase().replace(/\s+/g, ""));
const open = [...needed].filter((r) => !writes.some((w) => w.includes(`"slug":"${r.toLowerCase()}"`) || w.includes(`"key":"${keyOf(r)}"`)));
process.stdout.write(open.join(", "));
'
open="$(node -e "$EC_PAGES_JS" "$transcript" 2>/dev/null || true)"
[ -n "$open" ] || exit 0

: > "$marker" 2>/dev/null || exit 0
reason="This session was briefed on ${open}, and the briefing said the page is not in the brain yet. Write its content_page now: the briefing has the create_block call (key, slug, template_ref and the three body sections). People open the prototype to see each page beside its context and its components, and the widget shows that context on the page itself — only through this block. If you did not change that page after all, say so and finish."
printf '{"decision":"block","reason":%s}\n' "$(printf '%s' "$reason" | ec_json_string)" || exit 0
exit 0
