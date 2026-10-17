#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────
# Epic Context — context-sync enforcement hook (the dogfooding rule, enforced)
#
# The graph is the single source of truth — for CODE and for SESSION
# OUTPUTS. Two things must not leave a session unreconciled:
#
#   1. Product code changed          → the graph must reflect what shipped
#      (feature / decision / tech_stack / page blocks).
#   2. A durable deliverable was     → it must be written to the graph, not
#      produced (a plan, a review,     live only in chat or a loose file.
#      a report, an artifact)          Collaboration mandate, 2026-08-26:
#                                      a co-worker's AI session must find
#                                      your plan in EpicContext.
#
#   session-start : record the base commit for this session.
#   stop          : if either condition holds and the agent hasn't been
#                   reminded yet, block ONCE with the reconciliation steps.
#
# Safety: any uncertainty → allow (exit 0). The stop_hook_active guard plus
# a per-session marker mean it reminds at most once per session and can
# NEVER trap a session in a loop.
# ─────────────────────────────────────────────────────────────────────────
set -u

phase="${1:-stop}"
input="$(cat 2>/dev/null || true)"

# Pull a string field out of the hook's stdin JSON without requiring jq.
get_field() {
  printf '%s' "$input" \
    | sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" \
    | head -n1
}

session_id="$(get_field session_id)"
cwd="$(get_field cwd)"
if [ -n "$cwd" ]; then cd "$cwd" 2>/dev/null || true; fi

# Must be in a git repo to reason about changes; otherwise stay out of the way.
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

base_file="/tmp/ec-ctx-base-${session_id:-default}"
marker_file="/tmp/ec-ctx-reminded-${session_id:-default}"

# ── session-start: remember where we began ──────────────────────────────
if [ "$phase" = "session-start" ]; then
  git rev-parse HEAD > "$base_file" 2>/dev/null || true
  rm -f "$marker_file" 2>/dev/null || true
  exit 0
fi

# ── stop: decide whether to remind ──────────────────────────────────────

# Loop guard: if this stop is already a continuation of our own block, allow.
if printf '%s' "$input" | grep -q '"stop_hook_active"[[:space:]]*:[[:space:]]*true'; then
  exit 0
fi
# Single-fire guard: one reminder per session, however many stops follow.
[ -f "$marker_file" ] && exit 0

base=""
[ -f "$base_file" ] && base="$(cat "$base_file" 2>/dev/null || true)"

# Files changed this session = committed-since-base + working tree + untracked.
changed=""
if [ -n "$base" ]; then
  changed="$(git diff --name-only "$base" HEAD 2>/dev/null || true)"
fi
changed="$changed
$(git status --porcelain 2>/dev/null | sed 's/^...//' || true)"

# ── Condition 1: PRODUCT code changed. Skills/docs/tests/stories and the
# hook itself don't, on their own, demand a graph update.
code="$(printf '%s\n' "$changed" \
  | grep -E '\.(ts|tsx|js|jsx|sql)$' \
  | grep -vE '(^|/)\.claude/' \
  | grep -vE '\.(test|spec|stories)\.' \
  | sort -u | sed '/^$/d')"

# ── Condition 2: a durable deliverable was produced but not landed in the
# graph. All signals are deterministic; anything unreadable → no signal.
transcript="$(get_field transcript_path)"

graph_write="no"
if [ -n "$transcript" ] && [ -r "$transcript" ]; then
  if grep -qE '"name"[[:space:]]*:[[:space:]]*"[^"]*(create_block|update_block|ingest_text|ingest_comments|propose_delta|commit_skill_delta)"' \
      "$transcript" 2>/dev/null; then
    graph_write="yes"
  fi
fi

deliverable=""
# Plans written into the repo instead of the graph.
plans="$(printf '%s\n' "$changed" | grep -E '^docs/plans/.*\.md$' | sort -u | sed '/^$/d')"
[ -n "$plans" ] && deliverable="plan file(s) under docs/plans/"
# A published artifact (a report or page delivered outside the graph).
if [ -n "$transcript" ] && [ -r "$transcript" ]; then
  if grep -qE '"name"[[:space:]]*:[[:space:]]*"Artifact"' "$transcript" 2>/dev/null; then
    deliverable="${deliverable:+$deliverable, }a published artifact"
  fi
  # A plan presented via plan mode.
  if grep -qE '"name"[[:space:]]*:[[:space:]]*"ExitPlanMode"' "$transcript" 2>/dev/null; then
    deliverable="${deliverable:+$deliverable, }a plan-mode plan"
  fi
fi

unlanded=""
if [ -n "$deliverable" ] && [ "$graph_write" = "no" ]; then
  unlanded="$deliverable"
fi

# Nothing to reconcile → allow.
[ -z "$code" ] && [ -z "$unlanded" ] && exit 0

reason="Context-sync check (dogfooding rule): this session produced work the Epic Context graph — the single source of truth — may not reflect yet."

if [ -n "$code" ]; then
  sample="$(printf '%s\n' "$code" | head -n 6 | sed 's/^/  - /')"
  reason="$reason

PRODUCT CODE changed (sample):
${sample}

Reconcile the code:
1. Decide what actually shipped: a new/changed feature, an architectural decision (ADR), a tech_stack/architecture change, or a new page.
2. Run detect_drift (MCP) and read the relevant entities.
3. Write the missing feature/decision blocks (create_block / update_block, source: \"code\", with a reason)."
fi

if [ -n "$unlanded" ]; then
  reason="$reason

SESSION OUTPUT not landed: this session produced ${unlanded}, and no graph write happened. A plan or report that lives only in chat, an artifact, or a repo file is invisible to your co-workers' sessions — that is the collaboration failure EpicContext exists to prevent.
1. Write the deliverable to the graph: create_block / update_block / ingest_text with a reason (a review or plan lands as a research_data report, a choice as a decision).
2. If the MCP write gate refuses, record the write verbatim in docs/plans/2026-08-24-pending-graph-updates.md so the next session can land it."
fi

reason="$reason

If nothing in the graph needs updating, say so explicitly, then stop again.
This reminder fires at most once per session; stopping again is always allowed."

touch "$marker_file" 2>/dev/null || true

# Block the stop with a reason the agent will act on. Prefer JSON; fall back
# to exit-code 2 (+stderr) if python3 isn't available.
if command -v python3 >/dev/null 2>&1; then
  python3 - "$reason" <<'PY'
import json, sys
print(json.dumps({"decision": "block", "reason": sys.argv[1]}))
PY
  exit 0
else
  printf '%s\n' "$reason" 1>&2
  exit 2
fi
