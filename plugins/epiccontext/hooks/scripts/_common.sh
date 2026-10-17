#!/usr/bin/env bash
# Shared by the Epic Context plugin hooks. Never fails a session: any
# missing piece (no project, no key, no network) means "stay quiet".
#
# The project and key come from the plugin's settings (project_id, api_key).
# A repo that already carries an .epicontext file works too.

EC_BASE="${EPICCONTEXT_URL:-https://www.epiccontext.com}"
EC_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
EC_CONFIG="$EC_DIR/.epicontext"

# A string field out of the project's .epicontext without needing jq.
ec_field() {
  [ -f "$EC_CONFIG" ] || return 0
  sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" "$EC_CONFIG" | head -n1
}

EC_PROJECT="${CLAUDE_PLUGIN_OPTION_PROJECT_ID:-$(ec_field id)}"
EC_KEY="${CLAUDE_PLUGIN_OPTION_API_KEY:-$(ec_field apiKey)}"

ec_ready() {
  [ -n "$EC_PROJECT" ] && [ -n "$EC_KEY" ] && command -v curl >/dev/null 2>&1
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
