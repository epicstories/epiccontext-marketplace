#!/usr/bin/env bash
# Shared by the Epic Context plugin hooks. They need no key and fetch
# nothing: the agent reads Epic Context through the MCP connector the user
# signed in to, and the hooks make sure it does. Never fails a session.
#
# A repo is bound to a project by an `.epicontext` file with the project id
# (no secrets — it can be committed). Without one a session gets a single
# orientation line at its start (look in Epic Context first) and the other
# hooks stay quiet.

EC_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
EC_CONFIG="$EC_DIR/.epicontext"

# A string field out of the project's .epicontext: as JSON where node is there
# (a name may hold quotes), else the first match, without needing jq.
ec_field() {
  [ -f "$EC_CONFIG" ] || return 0
  if command -v node >/dev/null 2>&1; then
    node -e 'try { const c = JSON.parse(require("fs").readFileSync(process.argv[1], "utf8")); const v = (c.project && c.project[process.argv[2]]) ?? c[process.argv[2]]; if (typeof v === "string") process.stdout.write(v.replace(/[\r\n]+/g, " ").slice(0, 200)); } catch {}' "$EC_CONFIG" "$1" 2>/dev/null
    return 0
  fi
  sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" "$EC_CONFIG" | head -n1
}

EC_PROJECT="$(ec_field id)"
# Only an id that looks like one. The file is committed and the id goes into
# the rules text and into commands, so anything else leaves the repo unbound
# (audit, 8 November 2026).
printf '%s' "$EC_PROJECT" | grep -Eq '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$' || EC_PROJECT=""
EC_PROJECT_NAME="$(ec_field name)"

ec_bound() {
  [ -n "$EC_PROJECT" ]
}

# A per-session marker file. No session id, no marker (status 1, nothing
# printed): a shared fallback name would let one session's briefing release
# another's hold, or one session's hold catch another.
ec_marker() {
  [ -n "${2:-}" ] || return 1
  printf '%s/ec-%s-%s' "${TMPDIR:-/tmp}" "$1" "$(printf '%s' "$2" | tr -c 'A-Za-z0-9_-' '_')"
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

# A route as the server stores it: lower case, a leading slash, no trailing one.
ec_route_norm() {
  printf '%s' "$1" | tr 'A-Z' 'a-z' | sed -e 's#^\([^/]\)#/\1#' -e 's#\(.\)/$#\1#'
}

# The route a page file draws, for the frameworks whose routes are files
# (ADR-082: a UI page briefing is asked for by route, not by file name):
# Next.js app/ and pages/, SvelteKit routes/, Nuxt and Astro pages/. Route
# groups `(x)` and parallel slots `@x` are no part of the URL. Prints
# nothing for a file that is not a page.
ec_page_route() {
  rel="${1#"$EC_DIR"/}"
  case "$rel" in
    app/*|src/app/*)
      case "$rel" in */page.tsx|*/page.jsx|*/page.ts|*/page.js|*/page.mdx|page.tsx|page.jsx) ;; *) return 0 ;; esac
      route="$(printf '%s' "$rel" | sed -e 's#^src/##' -e 's#^app/##' -e 's#/*page\.[a-z]*$##')" ;;
    src/routes/*)
      case "$rel" in */+page.svelte|*/+page.ts|src/routes/+page.svelte) ;; *) return 0 ;; esac
      route="$(printf '%s' "$rel" | sed -e 's#^src/routes/##' -e 's#/*+page\.[a-z]*$##')" ;;
    pages/*|src/pages/*)
      case "$rel" in */_*|_*|pages/api/*|src/pages/api/*) return 0 ;; esac
      route="$(printf '%s' "$rel" | sed -e 's#^src/##' -e 's#^pages/##' -e 's#\.[a-z]*$##' -e 's#/*index$##')" ;;
    *) return 0 ;;
  esac
  route="$(printf '%s' "$route" | sed -e 's#([.]*)##g' -e 's#([^)]*)/##g' -e 's#([^)]*)$##' -e 's#@[^/]*/##g' -e 's#/$##')"
  ec_route_norm "/$route"
}
