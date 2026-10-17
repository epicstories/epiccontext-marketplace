#!/usr/bin/env bash
# The context-sync check (session-start records the base commit, stop
# reminds once), only in a repo bound to Epic Context.
set -u
. "$(dirname "$0")/_common.sh"
ec_bound || exit 0
exec "$(dirname "$0")/context-sync-check.sh" "$@"
