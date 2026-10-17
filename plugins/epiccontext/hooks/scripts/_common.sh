#!/usr/bin/env bash
# Shared by the Epic Context plugin hooks. They need no key and fetch
# nothing: the agent reads Epic Context through the MCP connector the user
# signed in to, and the hooks make sure it does. Never fails a session.
#
# A repo is bound to a project by an `.epicontext` file with the project id
# (no secrets — it can be committed). Without one the hooks stay quiet, so a
# plugin installed for the whole machine only acts in Epic Context repos.

EC_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
EC_CONFIG="$EC_DIR/.epicontext"

# A string field out of the project's .epicontext without needing jq.
ec_field() {
  [ -f "$EC_CONFIG" ] || return 0
  sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" "$EC_CONFIG" | head -n1
}

EC_PROJECT="$(ec_field id)"
EC_PROJECT_NAME="$(ec_field name)"

ec_bound() {
  [ -n "$EC_PROJECT" ]
}

# A per-session marker file.
ec_marker() {
  printf '%s/ec-%s-%s' "${TMPDIR:-/tmp}" "$1" "$(printf '%s' "${2:-default}" | tr -c 'A-Za-z0-9_-' '_')"
}

# JSON-encode stdin as a string literal, with whatever runtime is there.
ec_json_string() {
  if command -v node >/dev/null 2>&1; then
    node -e 'let s="";process.stdin.on("data",d=>s+=d).on("end",()=>process.stdout.write(JSON.stringify(s)))'
  elif command -v python3 >/dev/null 2>&1; then
    python3 -c 'import json,sys;sys.stdout.write(json.dumps(sys.stdin.read()))'
  else
    return 1
  fi
}

# A field out of the hook's stdin JSON.
ec_input_field() {
  printf '%s' "$EC_INPUT" | sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" | head -n1
}
