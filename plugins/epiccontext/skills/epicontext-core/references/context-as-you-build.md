# Context-as-you-build — the global rule

**When you build UI for a project, the matching `content_page` block(s)
land in the same change.** Not later, not "we'll add it next sprint" —
same effort, same commit.

Why this is a hard rule, not a nice-to-have:

- The graph is the source of truth. UI without a page block in the
  graph is drift on day one — the prototype is no longer a projection
  of the graph, it's diverged from it.
- The spine of the graph is the page tree. A feature with no page
  binding is homeless; a page with no feature is empty scaffolding.
  Both show up as breaks in the context map. Fix them at write time,
  not as audit follow-up.
- Stakeholders walking the deployed product with the widget open
  expect their comment on `/account/billing` to land at a real node
  in the graph. If there's no `content_page` block for that route,
  the comment floats and "this page" panel is empty.

The mandate is enforced in three skills:

- **`epicontext-product`** — pages are mandatory companions to features.
  `content_page.feature_refs` is a required canonical connection; a
  page without one is flagged as incomplete.
- **`epicontext-build` (frontend)** — when you build a page in code, you write
  its `content_page` block in the same change.
- **`epicontext-suite` (feature-to-work)** — every UI story that lands ships with a
  paired content_page write in its acceptance criteria.

Read the per-skill detail when you're in that mode. The rule is the
same everywhere: **no page in code without a page in the graph.**

## The same rule applies to features and decisions — not just pages

The page rule is one instance of a broader contract: **anything you ship
to the product must exist in the graph.** When you build a feature, add a
`feature` block; when you make an architectural choice, add a `decision`
(ADR); when you change the stack or architecture, update `tech_stack` /
`architecture_diagram`. Do it in the same change as the code, via
`update_block` / `create_block`.

A feature that's live in code but absent from the graph is drift: a later session reading the graph (e.g.
to write a post, plan work, or analyze the product) will conclude the
feature "isn't shipped." Treat a missing feature/decision block exactly
like a missing test — the work isn't done until the graph reflects it.

**This is enforced, not just advised.** The context-sync **Stop hook**
in the Epic Context plugin for Claude Code runs at the end of
every session: if product code changed and the graph
wasn't reconciled, it blocks once and reminds you to run `detect_drift`
and `update_block` / `create_block` for anything new or drifted before finishing. So
after a build, do the context pass *before* you finish — the hook will
otherwise stop you to do it. If genuinely nothing in the graph needs
updating, say so explicitly and stop again (the reminder fires at most
once per session).

## Every page body carries a summary AND links its context

These are the two most-skipped steps. Do both **without being asked** —
they are part of producing a `content_page`, not an extra the user has
to request.

1. **Write a `## Context summary`.** Every `content_page` body opens
   with a 2–4 sentence summary: what the page is, who it's for, and
   what context touches it. Author it at create time with full
   knowledge of the page's role — it is content, not a lazily-derived
   UI feature, so it must already be in the body when the page is
   opened (never a "generating summary…" spinner). The editor and the
   widget read the same string. End the summary with a `Touches:` line
   naming the connected entities.

2. **Make the connected context navigable as REAL markdown links.**
   The brain is only a brain if you can click through it. When the
   summary (or copy) names another entity, write it as a standard
   markdown link to that block's editor route —
   `[Product Owner](/<org>/<project>/<section>/<blockKey>)` — **not**
   as bare `persona/product-owner` text. This matters: bare `type/key`
   text is **not** a link. It renders as plain text in the book and the
   editor; only the widget's separate "linked context" badges (derived
   from the structured `feature_refs` / `persona_refs`) make it
   clickable there. A markdown link renders as a real link in the
   editor AND the widget AND any export. The `Touches:` line at the end
   of the summary should therefore be markdown links too:
   `Touches: [Product Owner](/acme/store/users/product-owner), [Context map](/acme/store/product/context-map).`
   Keep it in sync whenever you change a page's `feature_refs` /
   `persona_refs`.

If you write or update a page and skip the summary or the links, you've
shipped half the context. The exact body shape lives in
`epicontext-product` and `epicontext-build` (frontend); the connection contract
lives in `epicontext-context` (connections).
