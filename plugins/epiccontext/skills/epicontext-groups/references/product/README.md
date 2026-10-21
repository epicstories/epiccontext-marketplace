# Epic Context — Product Group

*Part of `epicontext-groups` (`references/product/README.md`), formerly the `epicontext-product` skill. Paths below are relative to the `epicontext-groups` folder: for `get_skill`, put `epicontext-groups/` in front.*

Populate, maintain, and analyze the Product group of an Epic Context project graph: product overview, features, glossary, information architecture, and content. The Product group answers *what the product is* — the named things it does, the words used to describe them, how they're organized, and the copy users actually read.

This skill does two kinds of work:
- **Populate** entities from product specs, content audits, and team decisions
- **Analyze** existing context to find gaps, summarize for an audience, and recommend action

## When to use this skill

**Populating:**
- Scaffolding a new project's Product layer at kickoff
- Adding or updating an overview, feature, glossary term, IA node, or content string
- Ingesting product specs, feature requests, content audits, or terminology workshops
- Capturing a new term or concept that emerges in research or stakeholder conversation

**Analyzing:**
- Auditing IA against journey maps and personas (does the structure serve actual user paths?)
- Reconciling drift between glossary, content, and what the product actually says
- Summarizing the product's current state for internal review or client communication
- Recommending feature priorities based on JTBD and journey opportunities

**Reviewing:**
- Checking whether product context is at the right maturity level
- Resolving structural decisions ("should this be a feature or a setting?", "is this one term or three?")

## Core principle

**Scaffold first, never block.** Every project starts with all entities scaffolded from sensible defaults. Stub is a valid maturity state. Don't refuse to create a feature because no JTBD is linked yet — scaffold a stub JTBD too, link them, mark both as stubs, move forward. The skill's job is to populate and link; never to gate on missing input. **Stub is the floor, not the finish line:** the moment you have evidence — the repo, real research, the existing graph — fill the node to `drafted` in the same pass instead of leaving its scaffold placeholder, and run the proactive context pass (`epicontext-context` (fill)) rather than waiting to be asked node-by-node.

Every entity has a **maturity state**: stub (default/inferred), drafted (researched/decided), validated (proven through usage). Product entities drift faster than Users entities because the product itself changes — a glossary term written six months ago for a feature that has since been renamed is drift. Flag and reconcile, don't silently update.


**Three modes of work this skill supports:**
1. **Scaffold** — stub all entities at project kickoff from sensible defaults.
2. **Specialize** — upgrade stubs to drafted/validated as decisions, research, and production use accumulate.
3. **Analyze** — use the populated, linked graph to find tensions across groups, classify problems vs accepted trade-offs, and recommend action with explicit reasoning. For cross-group analysis, see `epicontext-analysis` (its `ANALYSIS.md`). For product-specific flows, see `references/product/analysis-flows.md`.

## The five entities

| Entity | Purpose | Reference file |
|--------|---------|----------------|
| Overview | The product's elevator description and capability map | `references/product/entities/overview.md` |
| Feature | Named capabilities the product provides | `references/product/entities/feature.md` |
| Glossary | The vocabulary — every domain noun the product uses | `references/product/entities/glossary.md` |
| IA Node | Sections, pages, navigation, what contains what | `references/product/entities/ia-node.md` |
| Content | Copy strings bound to component + journey + locale | `references/product/entities/content.md` |

**Read the relevant reference file before producing any entity.**

## The IA tree is the spine of the project

The product's page tree (`ia_tree` blocks and `content_page` blocks)
is the **spine** of the whole graph — the structural anchor every
other entity attaches to. The graph mirrors the deployed sitemap;
the deployed sitemap mirrors the graph. They are the same shape, by
design.

When you populate Product:

- **Pages are first-class anchors.** Other entities point at pages,
  not the other way around: `feature.implemented_on = [page-key]`,
  `journey_step.route = "/checkout"`, `content.page = page-key`.
- **Journey steps need a page to point at.** Most journey-map steps
  happen on a screen, so a `content_page` must exist for that step's
  route (its `route` matches the page `slug`). When you build the page
  tree, make sure every screen a journey passes through has a
  `content_page` node; when a journey references a route with no page,
  create the page rather than leaving the step unlinked. See the
  journeys guidance in `references/users/README.md`.
- **Comments from stakeholders bind to pages.** The widget records a
  comment's `route` field; that's what makes the comment show up at
  the right page node in the context map. Don't treat comments as
  free-floating notes — they're page artifacts.
- **The overview, glossary, and (cross-page) features sit above the
  tree** in the overarching layer (see `epicontext-core` for the
  full model). They connect downward to the pages they touch.
- **A page without features and content is empty scaffolding.** A
  feature without a page assignment is homeless. Flag both as
  drift during analysis.

Build the IA tree early. The page tree is what makes the whole
project navigable for anyone — humans, agents, and stakeholders
walking the prototype with the widget open.

### content_page body is the page's actual content

A `content_page` block's `body` (markdown) is the canonical store for
everything on the deployed page — the code, the widget, and the editor
all read the same string. Every body has three sections:
`## Context summary` (2–4 sentences ending in a `Touches:` line of real
markdown links to the connected blocks), `## Page copy` (the exact copy
that ships), and `## Images`. The code's copy and image paths trace to
lines in the body. Full shape, rationale, and authoring rules:
`references/product/content-page-body.md` — read it before creating or
updating any `content_page`.

### Pages are mandatory companions to features

**Every feature ships on (at least) one page. Every page surfaces
(at least) one feature.** If either side is missing, the spine is
broken and the context map will show it as a floating node.

When you (or a paired skill like `epicontext-frontend`) work on a
feature, you must also work on the `content_page` block(s) where
that feature is implemented:

- **New feature, existing page** — update the page's `feature_refs`
  to include the new feature, and update the page's body to describe
  what the feature does *on this page* (one sentence per feature is
  fine for a stub).
- **New feature, no existing page** — create a `content_page` block
  for the page that will host it. The page's `slug` matches the route
  the user will navigate to. Add it to the `ia_tree` in the right
  spot.
- **New page, no feature yet** — refuse. A page without a feature is
  scaffolding, not context. Scaffold a stub feature first (with the
  user's permission), then bind them.

The canonical connection `content_page.feature_refs → feature[]` is
**required** (see `epicontext-context` (connections)). Never create a
`content_page` without at least one feature in `feature_refs`.

This is the "context-as-you-build" rule: when an AI agent builds UI
for a project, the page blocks land in the same change as the
feature blocks. See `epicontext-frontend` and `epicontext-suite` (feature-to-work)
for the per-skill enforcement.

## How the entities connect

Product entities form a network internally and reach into Users (especially) and Build:

```
overview ──► feature ──► jtbd (Users group)
              │     └──► journey_map (Users group)
              │
              ├──► ia_node ──► component (Build group)
              │
              └──► content ──► glossary_term
                       │
                       └──► component (Build group)

glossary ◄── (referenced by features, content, IA labels, almost everything)
```

Read this as: **glossary is the most-referenced entity in the group**. If a glossary term changes, every feature description, content string, and IA label using it should reconcile. Features link upstream to JTBDs (the *why* from Users group) and downstream to journey phases and components. IA nodes are the navigable structure. Content strings are the actual user-facing words, bound to glossary terms so renaming propagates.

When creating any entity, populate the relationship fields. Especially link content → glossary terms — that's where drift hurts most.

## Order to populate for a new project

1. **Overview** — the product's elevator description. Forces clarity before details.
2. **Glossary** — even a starter set of 10-20 core terms. Everything else cites these.
3. **Feature** — the named capabilities. Each feature should trace to a JTBD (Users group).
4. **IA Node** — the structural skeleton. Sections and pages, organized by user mental model not internal team structure.
5. **Content** — the actual copy, bound to features, IA nodes, and glossary terms.

For a project where a product already exists, reverse it: **glossary** first (extract the terms the existing content already uses), then **IA** from the existing sitemap, **features** by inventory, **content** by audit, and the **overview** last, once the parts are known.

## Maturity expectations at a glance

| Entity | Stub | Drafted | Validated |
|--------|------|---------|-----------|
| Overview | Inferred from product description | Reviewed by team, ties to strategy | Used in pitches/sales successfully |
| Feature | Listed, no link to JTBD | Linked to JTBD + journey | Shipped, measured, retained |
| Glossary | Term + brief definition | Definition + usage examples + linked content | Stable across 6+ months of use |
| IA Node | Inferred from sitemap | Tested against personas/journeys | Validated through tree test or analytics |
| Content | Written, no glossary binding | Bound to glossary, fits journey phase, voice-checked | Tested with users, performs |

## Analyzing context — finding the problem and what to do about it

When the request is to *understand* or *act on* product context (not just populate it), use the three flows in `references/product/analysis-flows.md`:

**Diagnose** — find the underlying issue. For Product, the most common diagnoses are:
- Glossary drift (multiple terms for the same thing, or one term for multiple things)
- Feature-JTBD mismatch (features that don't trace to a job, or jobs without a serving feature)
- IA against mental model (navigation organized by team structure, not user understanding)
- Content voice drift (copy that doesn't match Brand group's tone, or contradicts the glossary)

**Summarize** — three audience formats: internal (under 100 words), team (200-350 words), client (1-2 pages). Pick by audience.

**Recommend action** — recommend ONE action, explain why, name the tradeoffs honestly. Calibrate to evidence strength: tentative diagnosis → small reversible action; high-confidence → confident action with measurement.

Read `references/product/analysis-flows.md` before producing any analytical output — it holds the evidence-sufficiency gates, refusal conditions, and the client-facing discipline (cite by name, keep claims and quotes distinct, always include "what we still need to validate", name alternatives considered).

## When you need to make a structural decision

Decision trees in `references/product/decisions/`:

- `decisions/feature-or-setting.md` — when something is a feature vs. a configuration option vs. just a property
- `decisions/one-term-or-many.md` — glossary disambiguation: same word different meanings, or different words same meaning
- `decisions/ia-pattern.md` — hierarchical, faceted, hub-and-spoke, flat — picking a navigation pattern
- `decisions/content-ownership.md` — who owns this string: design, marketing, legal, support

For research-method decisions (which method, qual or quant, when to research at all), see the Users group: `references/users/decisions/which-research-method.md` and `references/users/decisions/research-vs-ship.md`.

## When you need a worked example

Reference examples in `references/product/examples/`:

- `examples/overview-service-business.md` — overview for a hybrid online-offline service product
- `examples/feature-with-jtbd-trace.md` — a feature defined with full upstream/downstream relationships
- `examples/glossary-disambiguation.md` — handling a term that has multiple meanings across contexts
- `examples/ia-tested-against-personas.md` — IA structure with persona-walkthrough validation
- `examples/content-bound-to-glossary.md` — copy strings with glossary references intact

## When you need to defend a claim with evidence

`references/product/evidence.md` — cited data from trusted sources for product decisions.

## The discipline contract

Every entity in this group at maturity ≥ `drafted` must pass the six
norms in `epicontext-core/references/discipline.md` — MECE,
answer-first, evidence-aware, assumption-conscious, executive-
readable, specific-enough. Especially relevant for Product: a feature
description that doesn't open with the persona-visible value in
sentence one is failing answer-first; an IA tree with overlapping
sections is failing MECE; a glossary term defined without `origin` is
failing evidence-aware.

## Anti-patterns to refuse

If a request would require any of these, push back:

**Populating anti-patterns:**
- A feature without a linked JTBD ("we should build X" with no user reason)
- Glossary terms that are actually marketing copy ("our amazing fast platform")
- IA organized by team structure ("Engineering Section", "Marketing Section")
- Content strings disconnected from features or IA nodes
- Overview that's a feature list rather than a positioning statement

**Analysis anti-patterns:**
- IA "audit" without testing against actual user journeys
- Feature prioritization without JTBD linkage
- Content review that ignores glossary consistency
- Recommendations to "redesign navigation" from thin evidence

**Scaffold-and-flag instead of refusing.** When something is missing, scaffold it as a stub with sensible defaults rather than blocking work. Example: "Creating these features as stubs and scaffolding stub JTBDs they likely serve — both marked stub maturity. Specialize the JTBDs when user research is available; they'll lift the features with them."

## Output format

YAML structure defined in each entity's reference file. Always include:
- `maturity` field
- Relationship fields appropriate to the entity (`linked_jtbd`, `linked_journey_map`, `glossary_terms`, etc.)
- `last_reviewed` date for entities prone to drift (especially glossary, IA, content)

When uncertain about a field, write `# TODO: needs decision` rather than fabricating.

## When this skill ends

This skill ends when the requested entity (or set of entities) has been produced. If the work touches Users, Build, Brand, Strategy, Marketing, or Performance, surface the need but don't expand scope — those have their own skills.

## Improve this skill (self-improvement loop)

If you hit confusion, a missing example, missing evidence, a new
pattern that's not yet covered, the schema gatekeeper rejects
something you wrote, **or you encounter project data or a cited
source that would strengthen the evidence library** — don't just
power through. Call `propose_skill_delta` so an admin can review it.
An accepted delta doesn't edit this skill's files: it is committed
as an overlay that `get_skill` applies when it serves the skill.

See `epicontext-core` for the full friction → skill-delta pattern
and how to format the proposal.
