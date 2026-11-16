#!/usr/bin/env bash
# PostToolUse on the MCP tool get_skill: remember that this session loaded the
# design skill from Epic Context, so the pre-edit hook lets UI edits through.
set -u
EC_INPUT="$(cat 2>/dev/null || true)"
. "$(dirname "$0")/_common.sh"
case "$(ec_input_field name)" in
  epicontext-design|epicontext-design/*|epicontext-design-judgment) ;;
  *) exit 0 ;;
esac
marker="$(ec_marker designed "$(ec_input_field session_id)")" || exit 0
touch "$marker" 2>/dev/null || true
exit 0
