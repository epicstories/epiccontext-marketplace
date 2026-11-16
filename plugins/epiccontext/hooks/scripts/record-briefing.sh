#!/usr/bin/env bash
# PostToolUse on the MCP tool get_briefing: remember that this session read
# its briefing, so the pre-edit hook lets UI edits through — and, for a
# briefing on a route, that this route's page files may be edited (ADR-082).
set -u
EC_INPUT="$(cat 2>/dev/null || true)"
. "$(dirname "$0")/_common.sh"
marker="$(ec_marker briefed "$(ec_input_field session_id)")" || exit 0
touch "$marker" 2>/dev/null || true
target="$(ec_input_field target)"
case "$target" in
  /*)
    key="$(ec_route_norm "$target" | cksum | cut -d' ' -f1)"
    page="$(ec_marker "page-$key" "$(ec_input_field session_id)")" && touch "$page" 2>/dev/null
    ;;
esac
exit 0
