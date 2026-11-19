#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────
# Epic Context — the context-sync check
#
# One script for this repository (.claude/settings.json) and for every
# repository bound to a project through the plugin (hooks/scripts/), so what
# it says must be true in both: no file or rule only this repository has.
#
# The project's context is the single source of truth — for CODE and for
# SESSION OUTPUTS. Two things must not leave a session unreconciled:
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
# NEVER trap a session in a loop. Without a session id there is nothing to
# keep the marker by, so it does nothing (a shared name would let one
# session's state answer for another's). State goes to $TMPDIR, not /tmp.
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

session_id="$(get_field session_id | tr -c 'A-Za-z0-9_-' '_')"
[ -n "$session_id" ] || exit 0
cwd="$(get_field cwd)"
if [ -n "$cwd" ]; then cd "$cwd" 2>/dev/null || true; fi

# Must be in a git repo to reason about changes; otherwise stay out of the way.
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

state_dir="${TMPDIR:-/tmp}"
state_dir="${state_dir%/}"
base_file="$state_dir/ec-ctx-base-${session_id}"
dirty_file="$state_dir/ec-ctx-dirty-${session_id}"
marker_file="$state_dir/ec-ctx-reminded-${session_id}"

# Every uncommitted file (untracked ones each on their own) with the hash of
# what it holds now: "<hash> <path>" per line, "-" when it cannot be read.
dirty_snapshot() {
  git status --porcelain --untracked-files=all 2>/dev/null \
    | sed 's/^...//; s/.* -> //' \
    | while IFS= read -r f; do
        [ -n "$f" ] || continue
        printf '%s %s\n' "$(git hash-object -- "$f" 2>/dev/null || echo -)" "$f"
      done
}

# ── session-start: remember where we began ──────────────────────────────
if [ "$phase" = "session-start" ]; then
  git rev-parse HEAD > "$base_file" 2>/dev/null || true
  dirty_snapshot > "$dirty_file" 2>/dev/null || true
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
# Uncommitted work that was already there at session-start, unchanged since,
# is not this session's: a session that only answered a question beside
# half-done work must not be told it changed product code.
changed=""
if [ -n "$base" ]; then
  changed="$(git diff --name-only "$base" HEAD 2>/dev/null || true)"
fi
worktree="$(dirty_snapshot)"
if [ -f "$dirty_file" ] && [ -s "$dirty_file" ]; then
  worktree="$(printf '%s\n' "$worktree" | grep -vxF -f "$dirty_file" 2>/dev/null || true)"
fi
changed="$changed
$(printf '%s\n' "$worktree" | sed 's/^[^ ]* //')"

# ── Condition 1: PRODUCT code changed. Skills/docs/tests/stories and the
# hook itself don't, on their own, demand a graph update.
code="$(printf '%s\n' "$changed" \
  | grep -E '\.(ts|tsx|js|jsx|mjs|cjs|sql|py|go|rb|php|java|kt|kts|swift|rs|cs|vue|svelte|astro|dart|ex|exs|scala)$' \
  | grep -vE '(^|/)\.claude/' \
  | grep -vE '\.(test|spec|stories)\.' \
  | sort -u | sed '/^$/d')"

# ── Condition 2: a durable deliverable was produced but not landed in the
# graph. All signals are deterministic; anything unreadable → no signal.
transcript="$(get_field transcript_path)"

# True when the transcript holds an actual CALL of a tool whose name matches the
# regex $1. Anchored on the tool_use block: a bare `"name": "Artifact"` also
# appears in the tool DEFINITIONS the transcript carries, so it matched every
# session (and mistook a mere definition of create_block for a graph write).
used_tool() {
  [ -n "$transcript" ] && [ -r "$transcript" ] || return 1
  grep -qE "\"type\"[[:space:]]*:[[:space:]]*\"tool_use\"[[:space:]]*,[[:space:]]*\"id\"[[:space:]]*:[[:space:]]*\"[^\"]*\"[[:space:]]*,[[:space:]]*\"name\"[[:space:]]*:[[:space:]]*\"($1)\"" \
    "$transcript" 2>/dev/null
}

graph_write="no"
if used_tool '[^"]*(create_block|update_block|ingest_text|ingest_comments|propose_delta)'; then
  graph_write="yes"
fi

deliverable=""
# Plans written into the repository instead of the context: a Markdown file
# in a folder called plans, wherever a repository keeps one.
plans="$(printf '%s\n' "$changed" | grep -E '(^|/)plans/.*\.md$' | sort -u | sed '/^$/d')"
[ -n "$plans" ] && deliverable="plan file(s) in the repository"
# A published artifact (a report or page delivered outside the graph).
if used_tool 'Artifact'; then
  deliverable="${deliverable:+$deliverable, }a published artifact"
fi
# A plan presented via plan mode.
if used_tool 'ExitPlanMode'; then
  deliverable="${deliverable:+$deliverable, }a plan-mode plan"
fi

unlanded=""
if [ -n "$deliverable" ] && [ "$graph_write" = "no" ]; then
  unlanded="$deliverable"
fi

# Nothing to reconcile → allow.
[ -z "$code" ] && [ -z "$unlanded" ] && exit 0

reason="Context-sync check (Epic Context)."

if [ -n "$code" ]; then
  sample="$(printf '%s\n' "$code" | head -n 6 | sed 's/^/  - /')"
  reason="$reason

This session changed product code. Check that the project's context still matches: run detect_drift, write the missing feature or decision pages, each with a reason.

Changed (sample):
${sample}"
fi

if [ -n "$unlanded" ]; then
  reason="$reason

This session produced ${unlanded}, and wrote nothing to Epic Context. A plan or report that lives only in the chat, an artifact or a repository file is invisible to your co-workers' sessions.
1. Write it to the project's context: create_block / update_block / ingest_text with a reason (a plan goes on the board with share_plan and, when it is worth keeping, into a document of category plan; a review or audit lands as a document; a choice as a decision).
2. If a write is refused (a lock, the write gate), say so and put the content in your reply, so a person can land it."
fi

reason="$reason

If nothing in the context needs updating, say so, then stop again.
This reminder fires at most once per session; stopping again is always allowed."

touch "$marker_file" 2>/dev/null || true

# Block the stop with a reason the agent will act on: JSON from node or
# python3, else exit code 2 with the reason on stderr (stdout stays empty,
# never half a JSON object).
if command -v node >/dev/null 2>&1; then
  node -e 'process.stdout.write(JSON.stringify({ decision: "block", reason: process.argv[1] }) + "\n")' "$reason"
  exit 0
elif command -v python3 >/dev/null 2>&1; then
  python3 - "$reason" <<'PY'
import json, sys
print(json.dumps({"decision": "block", "reason": sys.argv[1]}))
PY
  exit 0
else
  printf '%s\n' "$reason" 1>&2
  exit 2
fi
