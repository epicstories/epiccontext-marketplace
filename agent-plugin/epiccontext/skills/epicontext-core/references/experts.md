# The experts — which one, and which reference

The graph holds 34 canonical entities in eight groups, each answering one
question. Each group has its **expert** (ADR-072): a skill with the method,
to which `get_skill("<expert>", project_id)` adds what this organisation and
project already know. Find the expert, read its `SKILL.md`, then read the
entity's reference **before** you write that entity.

You rarely choose: `get_briefing` names the expert for its task type, and
the write gate notices when a block is written under another expert's
briefing. When the briefing names none (an unnamed general task), pick by
the group of the block you will write.

Every path below starts with the skill. For `get_skill`, drop `.md`:
`get_skill("epicontext-users/references/entities/persona")`.

## The experts

| Expert | The question | Entities | Start here |
|---|---|---|---|
| **Brand** | How do we show up? | vision, positioning, tone of voice, messaging | `epicontext-brand/SKILL.md` |
| **Strategy** | Where are we going? | product strategy, business model, OGSM, roadmap, business case | `epicontext-strategy/SKILL.md` |
| **Users & research** | Who for and why? | persona, JTBD, journey map, customer insight, competitor, research | `epicontext-users/SKILL.md` |
| **Product** | What is it? | overview, feature, glossary, information architecture, content | `epicontext-product/SKILL.md` |
| **Design** | How does it look and feel? | design system | `epicontext-design/SKILL.md`; the entity: `epicontext-design/references/entities/design-system.md` |
| **Build** | How does it work? | tech stack, architecture, infrastructure, decision (ADR), legal, finance | `epicontext-build/SKILL.md`; frontend `epicontext-build/references/frontend/README.md`, backend `epicontext-build/references/backend/README.md`, finance `epicontext-build/references/finance/README.md` |
| **Marketing** | How do people find us? | marketing strategy, campaign, channel, content piece | `epicontext-marketing/SKILL.md`; search: `epicontext-marketing/references/search-optimization/README.md` |
| **Performance** | Is it working? | analytics, KPI, feedback | `epicontext-performance/SKILL.md` |

An expert's `SKILL.md` holds its entity table, how the entities connect, the
order to populate, the maturity bar per entity, its analysis flows, its
anti-patterns and its output format. Read it once per task with that expert.

## Entity → reference

Read the reference before producing the entity. Each holds the purpose, the
fields and body, the depth bar per maturity and the edges.

| Entity (block types) | Reference |
|---|---|
| vision | `epicontext-brand/references/entities/vision.md` |
| positioning (`brand_positioning`) | `epicontext-brand/references/entities/positioning.md` |
| tone of voice | `epicontext-brand/references/entities/tone-of-voice.md` |
| messaging (`messaging_framework`) | `epicontext-brand/references/entities/messaging.md` |
| product strategy (`product_strategy_canvas`) | `epicontext-strategy/references/entities/strategy.md` |
| business model (`business_model_canvas`) | `epicontext-strategy/references/entities/business-model.md` |
| OGSM | `epicontext-strategy/references/entities/ogsm.md` |
| roadmap | `epicontext-strategy/references/entities/roadmap.md` |
| business case (+ SWOT, Porter's, obeya, strategic group map) | `epicontext-strategy/references/entities/business-case.md` |
| persona | `epicontext-users/references/entities/persona.md` |
| JTBD | `epicontext-users/references/entities/jtbd.md` |
| journey map | `epicontext-users/references/entities/journey-map.md` |
| customer insight | `epicontext-users/references/entities/customer-insight.md` |
| competitor | `epicontext-users/references/entities/competitor.md` |
| research (`user_research`, `research_data`) | `epicontext-users/references/entities/research.md` |
| overview (`product_overview`) | `epicontext-product/references/entities/overview.md` |
| feature | `epicontext-product/references/entities/feature.md` |
| glossary | `epicontext-product/references/entities/glossary.md` |
| information architecture (`ia_tree`, `taxonomy`) | `epicontext-product/references/entities/ia-node.md` |
| content (`content_page`) | `epicontext-product/references/entities/content.md`, body: `epicontext-product/references/content-page-body.md` |
| design system (`component_spec`, `storybook_link`, brand assets) | `epicontext-design/references/entities/design-system.md` |
| tech stack | `epicontext-build/references/entities/tech-stack.md` |
| architecture (diagrams, APIs, data models) | `epicontext-build/references/entities/architecture.md` |
| infrastructure (`dev_setup`, `integration`, `constraint`, testing) | `epicontext-build/references/entities/infrastructure.md` |
| decision (ADR) | `epicontext-build/references/entities/adr.md` |
| legal | `epicontext-build/references/entities/legal.md` |
| finance (`running_costs`, `budget`) | `epicontext-build/references/finance/README.md` |
| marketing strategy | `epicontext-marketing/references/entities/marketing-strategy.md` |
| campaign | `epicontext-marketing/references/entities/campaign.md` |
| channel | `epicontext-marketing/references/entities/channel.md` |
| content piece | `epicontext-marketing/references/entities/content-piece.md` |
| analytics (`analytics_event`, `insight`) | `epicontext-performance/references/entities/analytics.md` |
| KPI (`kpi`, `metric`, `north_star`) | `epicontext-performance/references/entities/kpi.md` |
| feedback | `epicontext-performance/references/entities/feedback.md` |

## What you need → which reference

Every expert's folder has the same parts (where it has them):

| You need | Read |
|---|---|
| How the expert works, its order and its maturity bar | `epicontext-<expert>/SKILL.md` |
| The rules for one entity | `epicontext-<expert>/references/entities/<entity>.md` |
| To make a decision (voice register, which framework, research or ship, needs an ADR…) | `epicontext-<expert>/references/decisions/` |
| A worked example | `epicontext-<expert>/references/examples/` |
| A workshop or method (positioning, strategic options, assumption audit, war-gaming, growth diagnosis, research synthesis, IA design, KPI architecture, ADR workshop, campaign briefing, mental availability and CEPs) | `epicontext-<expert>/references/methodologies/` |
| To diagnose, summarize or recommend with one expert | `epicontext-<expert>/references/analysis-flows.md` |
| To defend a claim with a source | `epicontext-<expert>/references/evidence.md` |
| A check / create / list routine, step by step | `epicontext-<expert>/references/workflows/` |
| The edges a block must carry | `epicontext-context/references/connections/README.md` |
| How a shape is written (timeline, canvas, tree, `~~~chart`, `~~~flow`) | `epicontext-core/references/markdown-conventions.md` |
| Cross-group reasoning | `epicontext-core/references/analysis/README.md` |

`<expert>` is one of `brand`, `strategy`, `users`, `product`, `design`,
`build`, `marketing`, `performance`.

## What the expert knows about this project

`get_skill("<expert>", project_id)` returns the method, then **What this
organisation and project know**: the expertise document of the discipline
(the project's choices within the method — for Design, the design rules),
its rules and its recent learnings, the organisation's first. The project's
part may differ from the organisation's, never from the method's floor.

When you learn something for the discipline, record it where the next
session finds it:

- a rule (a choice, a "we always / never") → `save_rule` with `expert`;
- a finding, a surprise, what worked or failed → `log_learning` with `expert`;
- a choice the whole discipline rests on → the expertise document itself.

Without `expert`, the expert of your last briefing is used. The editors
connect what you wrote, propose a learning seen three times as a rule, and
propose a pattern that recurs across organisations as a change to the
method (`propose_skill_delta`).

## The hard rules — keep these in view

1. **Scaffold first, never block.** Stub is the floor. Fill to drafted the
   moment evidence exists; mark what is assumed instead of refusing.
2. **Read the entity's reference before you write it.** The schema
   gatekeeper rejects an invalid value with `validation_issues`; fix and
   retry rather than working around it.
3. **The numbers are never invented.** A cost, a KPI value, a conversion
   rate, a market size: from the graph, the repo, an invoice or a cited
   source — or the structure stays with the value blank and a line saying
   what to measure and where it comes from. Date every figure.
4. **Every block ships with its required connections**
   (`epicontext-context/references/connections/README.md`). Say what a
   link means with `link_blocks`.
5. **Write directly, with a reason**, and with the `briefing_id` from
   `get_briefing`. An unproven claim is `assumed`.
6. **The discipline contract** applies to every block at drafted or above:
   `epicontext-core/references/discipline.md`.
7. **Quote the evidence.** Before recommending, `get_evidence_for` the
   target and cite what it returns; if it returns nothing, say so.
8. **The organisation's blocks are inherited, not copied.** Differ per
   field with `override_block` and a reason.
9. **When uncertain, say so** in the block (`# TODO: needs decision`)
   rather than fabricate.

## Improve an expert

Confusion, a missing example, a schema rejection, evidence worth sharing:
`propose_skill_delta` with the expert's `skill_name` (`epicontext-users`)
and the file inside it (`epicontext-users/references/evidence.md`). Knowledge about one
project belongs in that project's expertise, not in the method. The
pattern: `epicontext-core/references/self-improvement-loop.md`.
