#!/usr/bin/env bash
# An Epic Context skill comes from Epic Context, never from a copy on disk
# (ADR-076). The plugin's own skills (epiccontext:epicontext-…) are pointers
# that say so. A full copy — this repo's .claude/skills, an older plugin, a
# folder someone copied — is the text of the day it was made: without the
# edits made in the Skills settings, and without what the organisation and
# project know, which only get_skill adds.
#
#   PreToolUse on Skill   the first load of such a copy in a session is
#                         refused, with the get_skill call to make instead.
#                         Tried again (no connector?), it goes through: a
#                         session is never trapped.
#   UserPromptSubmit      "/epicontext-…" typed by the person loads the copy
#   (arg: prompt)         without a tool call; the agent is told to load the
#                         served skill as well.
set -u
EC_INPUT="$(cat 2>/dev/null || true)"
. "$(dirname "$0")/_common.sh"

served_call() {
  if ec_bound; then
    printf 'get_skill(name: "%s", project_id: "%s")' "$1" "$EC_PROJECT"
  else
    printf 'get_skill(name: "%s", project_id: <the project you work on, if any>)' "$1"
  fi
}

if [ "${1:-}" = "prompt" ]; then
  skill="$(ec_input_field prompt | sed -n 's|^[[:space:]]*/\(epicontext-[a-z-]*\).*|\1|p')"
  [ -n "$skill" ] || exit 0
  context="$(printf 'Epic Context: /%s loaded a copy of the skill from disk. Load the skill itself from Epic Context now, before you act on it: %s through the Epic Context connector. That is the current text, with the edits made in its settings and what this organisation and project already know; follow it where the two differ.' "$skill" "$(served_call "$skill")" | ec_json_string)" || exit 0
  printf '{"hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":%s}}\n' "$context"
  exit 0
fi

skill="$(ec_input_field skill)"
case "$skill" in
  epicontext-*) ;;   # a copy on disk; the plugin's pointers carry its prefix
  *) exit 0 ;;
esac

session="$(ec_input_field session_id)"
# Without a session id there is nothing to remember the refusal by: let it
# through rather than refuse it every time.
[ -n "$session" ] || exit 0
held="$(ec_marker "skill-$skill" "$session")" || exit 0
[ -f "$held" ] && exit 0
touch "$held" 2>/dev/null || exit 0

reason="$(printf 'Epic Context: "%s" here is a copy on disk, not the skill. Load it from Epic Context instead: %s through the Epic Context connector. That is the current text, with the edits made in its settings and what this organisation and project already know. A reference it names loads the same way: get_skill(name: "%s/references/<file>"). If the Epic Context tools are not available in this session, say so to the user and load the skill again; it will go through.' "$skill" "$(served_call "$skill")" "$skill" | ec_json_string)" || exit 0
printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":%s}}\n' "$reason"
exit 0
