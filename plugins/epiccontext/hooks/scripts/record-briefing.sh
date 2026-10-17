#!/usr/bin/env bash
# PostToolUse on the MCP tool get_briefing: remember that this session read
# its briefing, so the pre-edit hook lets UI edits through.
set -u
EC_INPUT="$(cat 2>/dev/null || true)"
. "$(dirname "$0")/_common.sh"
touch "$(ec_marker briefed "$(ec_input_field session_id)")" 2>/dev/null || true
exit 0
