---
name: epicontext-groups
description: >
  Use for any content of the graph: vision, positioning, tone of voice,
  messaging; strategy, OGSM, roadmap, business case; persona, JTBD, journey,
  research, competitor; feature, glossary, IA, content; design system, tech
  stack, architecture, ADR, legal, cost; marketing, campaign, channel,
  SEO/SEA/GEO; analytics, KPI, feedback. Populate, audit, analyze: one
  reference per group.
metadata:
  epic.requires: "analytics_event,api_endpoint,api_spec,architecture_diagram,brand_asset,brand_moodboard,brand_positioning,brand_visual_identity,budget,business_case,business_model_canvas,campaign,channel,competitor,component_spec,constraint,content_page,content_piece,customer_insight,data_model,data_schema,decision,design_application,dev_setup,feature,feature_market_analysis,feedback,figma_embed,glossary,ia_tree,insight,integration,journey_map,jtbd,kpi,legal_document,marketing_strategy,messaging_framework,metric,north_star,obeya_board,ogsm,persona,porters_five_forces,product_overview,product_strategy_canvas,research_data,roadmap,running_costs,storybook_link,strategic_group_map,swot_analysis,taxonomy,tech_stack,testing_strategy,tone_of_voice,user_research,vision"
  epic.version: "1.0.0"
  epic.contenthash: "9771f99093c1e765"
---

# Epic Context — The groups of the graph

The graph holds 34 canonical entities in eight groups, each answering one
question. This skill is the router: find the group, read its `README.md`,
then read the entity's reference **before** you write that entity.

Every path below is inside this skill's folder. For `get_skill`, put
`epicontext-groups/` in front and drop `.md`:
`get_skill("epicontext-groups/references/users/entities/persona")`.

## When to use this skill

- **Populating** — scaffolding a group at kickoff, adding or updating an
  entity, ingesting a workshop, a deck, a spec, interview notes, a bill.
- **Analyzing** — finding drift inside a group, summarizing it for an
  audience, recommending one action with its trade-offs.
- **Reviewing** — is this block at the right maturity, does it trace to the
  rest of the graph, does it pass the discipline contract?

For reasoning *across* groups (is this signal a problem or a trade-off?),
use `epicontext-analysis`. For making the whole graph right at once (fill,
repair, connections), use `epicontext-context`.

## Core principle — scaffold first, never block

Every project starts with all 34 entities scaffolded as stubs from sensible
defaults. Stub is a valid state — the floor, not the finish line. Never
refuse to create a block because its upstream is thin: create it, mark what
is assumed, and link it. The moment you have evidence — the repo, research,
the existing graph — fill the node to drafted in the same pass, and run the
fill pass (`epicontext-context/references/fill/README.md`) rather than
waiting to be asked node by node.

Maturity: **stub → drafted (assumed) → validated** (→ superseded). Drafted
is tailored to this project but unproven; validated is proven by research,
decisions or production use (`mark_validated` with the evidence).

## The groups → which reference

| Group | The question | Entities | Start here |
|---|---|---|---|
| **Brand** | How do we show up? | vision, positioning, tone of voice, messaging | `references/brand/README.md` |
| **Strategy** | Where are we going? | product strategy, business model, OGSM, roadmap, business case | `references/strategy/README.md` |
| **Users** | Who for and why? | persona, JTBD, journey map, customer insight, competitor, research | `references/users/README.md` |
| **Product** | What is it? | overview, feature, glossary, information architecture, content | `references/product/README.md` |
| **Design** | How does it look and feel? | design system | `references/build/entities/design-system.md`, and `epicontext-design` for the canvas and the brandbook |
| **Build** | How does it work? | tech stack, architecture, infrastructure, decision (ADR), legal, finance | `references/build/README.md`; finance: `references/build/finance/README.md` |
| **Marketing** | How do we grow? | marketing strategy, campaign, channel, content piece | `references/marketing/README.md`; search: `references/marketing/search-optimization/README.md` |
| **Performance** | Is it working? | analytics, KPI, feedback | `references/performance/README.md` |

A group's `README.md` holds its entity table, how the entities connect, the
order to populate, the maturity bar per entity, its analysis flows, its
anti-patterns and its output format. Read it once per task in that group.

## Entity → reference

Read the reference before producing the entity. Each holds the purpose, the
fields and body, the depth bar per maturity and the edges.

| Entity (block types) | Reference |
|---|---|
| vision | `references/brand/entities/vision.md` |
| positioning (`brand_positioning`) | `references/brand/entities/positioning.md` |
| tone of voice | `references/brand/entities/tone-of-voice.md` |
| messaging (`messaging_framework`) | `references/brand/entities/messaging.md` |
| product strategy (`product_strategy_canvas`) | `references/strategy/entities/strategy.md` |
| business model (`business_model_canvas`) | `references/strategy/entities/business-model.md` |
| OGSM | `references/strategy/entities/ogsm.md` |
| roadmap | `references/strategy/entities/roadmap.md` |
| business case (+ SWOT, Porter's, obeya, strategic group map) | `references/strategy/entities/business-case.md` |
| persona | `references/users/entities/persona.md` |
| JTBD | `references/users/entities/jtbd.md` |
| journey map | `references/users/entities/journey-map.md` |
| customer insight | `references/users/entities/customer-insight.md` |
| competitor | `references/users/entities/competitor.md` |
| research (`user_research`, `research_data`) | `references/users/entities/research.md` |
| overview (`product_overview`) | `references/product/entities/overview.md` |
| feature | `references/product/entities/feature.md` |
| glossary | `references/product/entities/glossary.md` |
| information architecture (`ia_tree`, `taxonomy`) | `references/product/entities/ia-node.md` |
| content (`content_page`) | `references/product/entities/content.md`, body: `references/product/content-page-body.md` |
| design system (`component_spec`, `storybook_link`, brand assets) | `references/build/entities/design-system.md` |
| tech stack | `references/build/entities/tech-stack.md` |
| architecture (diagrams, APIs, data models) | `references/build/entities/architecture.md` |
| infrastructure (`dev_setup`, `integration`, `constraint`, testing) | `references/build/entities/infrastructure.md` |
| decision (ADR) | `references/build/entities/adr.md` |
| legal | `references/build/entities/legal.md` |
| finance (`running_costs`, `budget`) | `references/build/finance/README.md` |
| marketing strategy | `references/marketing/entities/marketing-strategy.md` |
| campaign | `references/marketing/entities/campaign.md` |
| channel | `references/marketing/entities/channel.md` |
| content piece | `references/marketing/entities/content-piece.md` |
| analytics (`analytics_event`, `insight`) | `references/performance/entities/analytics.md` |
| KPI (`kpi`, `metric`, `north_star`) | `references/performance/entities/kpi.md` |
| feedback | `references/performance/entities/feedback.md` |

## What you need → which reference

Every group folder has the same parts (where the group has them):

| You need | Read |
|---|---|
| How the group works, its order and its maturity bar | `references/<group>/README.md` |
| The rules for one entity | `references/<group>/entities/<entity>.md` |
| To make a decision (voice register, which framework, research or ship, needs an ADR…) | `references/<group>/decisions/` |
| A worked example | `references/<group>/examples/` |
| A workshop or method (positioning, strategic options, assumption audit, research synthesis, IA design, KPI architecture, ADR workshop, campaign briefing, mental availability and CEPs) | `references/<group>/methodologies/` |
| To diagnose, summarize or recommend inside a group | `references/<group>/analysis-flows.md` |
| To defend a claim with a source | `references/<group>/evidence.md` |
| A check / create / list routine, step by step | `references/<group>/workflows/` |
| Running cost, a bill, a budget, a chart of spend | `references/build/finance/README.md` |
| SEO, SEA, GEO/AEO: the loop, KPIs, evidence, anti-patterns, tooling | `references/marketing/search-optimization/README.md` and its siblings |
| The edges a block must carry | `epicontext-context/references/connections/README.md` |
| How a shape is written (timeline, canvas, tree, `~~~chart`, `~~~flow`) | `epicontext-core/references/markdown-conventions.md` |
| Cross-group reasoning | `epicontext-analysis` |

`<group>` is one of `brand`, `strategy`, `users`, `product`, `build`,
`marketing`, `performance`.

## The hard rules — keep these in view

1. **Scaffold first, never block.** Stub is the floor. Fill to drafted the
   moment evidence exists; mark what is assumed instead of refusing.
2. **Read the entity's reference before you write it.** The schema
   gatekeeper rejects an invalid value with `validation_issues`; fix and
   retry rather than working around it.
3. **The numbers are never invented.** A cost, a KPI value, a conversion
   rate, a market size: from the graph, the repo, an invoice or a cited
   source — or the structure stays with the value blank and a line saying
   what to measure and where it comes from. Date every figure. A plausible
   wrong number is worse than a gap.
4. **Every block ships with its required connections.** The full table of
   required and recommended edges lives in
   `epicontext-context/references/connections/README.md`; `check_project_health` flags a
   block that misses one. Say what a link means with `link_blocks`.
5. **Write directly, with a reason.** Every `create_block` / `update_block`
   carries a `reason` and the `briefing_id` from `get_briefing`; the change
   shows in the changes feed and can be undone. An unproven claim is
   `assumed`.
6. **The discipline contract** — MECE, answer-first, evidence-aware,
   assumption-conscious, executive-readable, specific-enough — applies to
   every block at drafted or above: `epicontext-core/references/discipline.md`.
7. **Quote the evidence.** Before recommending, `get_evidence_for` the
   target and cite what it returns; if it returns nothing, say so.
8. **The organisation's blocks are inherited, not copied.** Brand, design
   system, shared personas and glossary usually live in the organisation's
   shared context (marked `[org]`). Differ per field with `override_block`
   and a reason; never copy an org block into the project.
9. **When uncertain, say so** in the block (`# TODO: needs decision`) rather
   than fabricate.

## Anti-patterns across the groups

- A brand, strategy or persona written from general knowledge with no
  evidence and no `assumed` marking.
- An entity created without its required edges ("I'll link it later").
- A tone of voice of adjectives only; a positioning without a competitive
  frame; a feature with no JTBD; a KPI with no target, owner or source.
- A number made up to make a chart look complete.
- Copying an org block into the project instead of overriding it.
- Analysis from one source, one stakeholder or one data point.

Each group's README has its own list; when you refuse, offer the honest
version ("I can write this as a stub; drafted needs …").

## Output

Every block: its key sentence first, the `maturity` it has earned, its
links to the other groups, sources named. Visuals follow the shape
conventions — a journey as a timeline, a BMC as a canvas, a number as a
`~~~chart` — when they carry information the prose doesn't.

## Improve this skill

Confusion, a missing example, a schema rejection, evidence worth sharing:
`propose_skill_delta` with `skill_name: "epicontext-groups"` and the
reference inside it (`references/users/evidence.md`,
`references/brand/examples/<new>.md`). An accepted delta is served by
`get_skill` as an overlay. The pattern:
`epicontext-core/references/self-improvement-loop.md`.
