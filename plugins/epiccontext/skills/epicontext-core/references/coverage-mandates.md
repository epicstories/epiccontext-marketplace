# The coverage mandates — what must always exist

Three completeness rules sit above the per-block rules. They are not
aspirations; treat a violation like a failing test.

## 1. Every page, known and ordered

Every screen the product serves has a `content_page` block with a
`slug` matching its route, a context summary, and its links (features
on it, personas it serves, journey steps that land on it). The page set
IS the product's surface — the site map, the widget's "This page" panel
and the content canvas all derive from it, so a missing page is a hole
in every one of those at once. The route-coverage ADR in the graph is
the standing decision.

## 2. Every UI surface, a documented component — and a *visible* one

Any UI in the project has a `component_spec`. Whatever the stack — a
React or Vue component, a Svelte file, an Astro partial, a plain HTML
include, a native view — if it renders UI, it has a spec.

The mandate has a second half that was missing for months, and its
absence cost a whole client design system: **a spec must render the
real component, and every variant it declares.** That means
`preview_url` (plus one per entry in `variants`), each the **absolute**
URL of the project's own public preview route, readable without a
session. Epic Context's built-in preview registry only knows Epic
Context's own components and returns nothing for anyone else's,
silently. A starter route and registry live at
`https://www.epiccontext.com/templates/epiccontext-preview/README.md`; a relative
path is refused, not proxied. An existing Storybook is a valid preview
source under the same rules — public, absolute story-iframe URLs — but
it is not required. `check_project_health` flags specs nobody can see.
The design system is the steady source of all UI; a page describing a
component you cannot see is not that (ADR-045).

And a third half: **the chain must be walkable.** Every screen gets a
page-layer spec (`route` = the content page's slug, `uses` naming its
components); every composed spec declares `uses`; every `uses` key is
itself a documented spec — atoms included, no component too small.
Health checks every hop; the book renders each one as a link.

## 3. Every journey step that happens on a screen, linked to its page

A step's `route` selects a `content_page` — steps are screens, and an
unlinked step is invisible to the page-context panel and the drift
scan (`detect_drift` reports `journey_step_no_page` for exactly this).

## What you owe when you build

When you build something new, the mandate tells you what else you now
owe: a new route owes a page block AND a page-layer spec; new UI owes a
spec that names its parts and a live preview; a new journey owes its
steps' pages.
