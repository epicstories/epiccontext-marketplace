# Spine and overarching layer — how the graph is organised

A project's graph isn't a flat blob. It has a **spine** (the page
tree) and an **overarching layer** (context that applies everywhere).
Everything you read and write should respect that shape — the same
way the user navigates the product.

## The spine: the page tree

The user's product is the leading concrete thing. The IA tree
(`ia_tree` blocks) defines the pages they navigate. **Every page is
an anchor.** Around each page sit the things that exist on or because
of that page:

- `content` strings rendered on it
- `feature`(s) implemented there
- `journey_map` step(s) that pass through it
- `persona`(s) most likely to be there
- `kpi` / `analytics_event`(s) measured here
- widget comments left on that route (their `route` field matches the
  page's slug — high-confidence binding)

The page tree mirrors the sitemap of the deployed app. Walking the
tree should feel like walking the product.

## The overarching layer: globally-applicable context

Things that don't belong to one page float above the tree as a
project-wide cluster, **linked downward** to the pages they touch:

| Group        | Entities that live here                                            |
|--------------|--------------------------------------------------------------------|
| Brand        | vision, positioning, tone_of_voice, messaging                      |
| Strategy     | product_strategy, business_model, ogsm, roadmap, business_case     |
| Users (broad)| persona (whole-product), jtbd, customer_insight, competitor, research |
| Product (broad)| overview, glossary, information_architecture                     |
| Build        | design_system, tech_stack, architecture, infrastructure, decision, legal, finance |
| Marketing    | marketing_strategy, campaign, channel, content_piece               |
| Performance  | analytics (project-wide), kpi, feedback                            |

Personas and JTBDs are technically Users-group, but they live in the
overarching layer because they cross pages. A page can *link to*
"primary persona" without owning it.

## Why this matters

- **The prototype is the user experience.** A stakeholder commenting
  on `/account/billing` sees their comment land on that page node in
  the graph. The product and its context are visibly the same thing.
- **Walking the tree teaches the project.** A new team member can
  trace a page → the feature it implements → the JTBD it serves →
  the persona it serves, in three hops.
- **Drift becomes visible.** A page with no `feature` link, or a
  feature linking to no page, or a journey step pointing at a route
  that doesn't exist — all show up as breaks in the spine.

## Group colors (visualisation cue)

Each of the 7 v3 groups has a consistent color shade across the UI.
When you render output that references blocks, prefer the group's
shade for the surrounding chrome so a reader can read groups at a
glance.

| Group        | Shade        |
|--------------|--------------|
| Brand        | fuchsia      |
| Strategy     | violet       |
| Users        | sky          |
| Product      | lime         |
| Build        | neutral grey |
| Marketing    | cyan         |
| Performance  | amber        |

Blocks outside the canonical groups (development workflow, reports,
meeting notes) render in stone.
