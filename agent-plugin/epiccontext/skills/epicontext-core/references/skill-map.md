# Which skill for what

Twelve skills of two kinds (ADR-072, 23 October 2026). `epicontext-core` is
always relevant. For the work itself, the briefing names the expert: load it
with `get_skill("<expert>", project_id)`, which gives its method and then what
this organisation and project already know. A path below is inside that
skill's folder: for `get_skill`, put the skill name in front
(`epicontext-users/references/entities/persona.md`).

## Working with Epic Context — the same for everyone

| Skill | Holds |
|---|---|
| `epicontext-core` | The workflow, the hard gates, the coverage mandates, the five-step analysis (`references/analysis/README.md`) — always |
| `epicontext-suite` | The suite: what each tool is for, the five verbs, the organisation's shared context vs a workspace, cross-tool recipes, feature → stories and tasks as cards |
| `epicontext-context` | Making and keeping the brain right: kickoff, fill, alignment and repair, connections, the constitution |
| `epicontext-boards` | Workshops on Miro / FigJam boards, and harvesting them back |

## The experts — one per group, each answering its group's question

| Expert | Question | Holds |
|---|---|---|
| `epicontext-brand` | How do we show up? | Vision, positioning, tone of voice, messaging |
| `epicontext-strategy` | Where are we going? | Product strategy, business model, OGSM, roadmap, business case; war-gaming and growth diagnosis |
| `epicontext-users` | Who for and why? | Personas, JTBD, journeys, customer insight, competitors, research |
| `epicontext-product` | What is it? | Overview, features, glossary, IA, content |
| `epicontext-design` | How does it look and feel? | Every design judgment and design act, with Robert's standard; the design system, the canvas, the brandbook, Figma |
| `epicontext-build` | How does it work? | Frontend and backend in any stack, tech stack, architecture, infrastructure, ADRs, legal, running costs |
| `epicontext-marketing` | How do people find us? | Marketing strategy, campaigns, channels, content pieces; SEO, SEA, GEO/AEO |
| `epicontext-performance` | Is it working? | Analytics, KPIs, feedback |

An expert is three layers. Its **method** is this folder, the same at every
client. The **organisation's expertise** and the **project's expertise** are
in the graph, and `get_skill` puts them under the method when you pass a
project. What you learn goes back with `save_rule` / `log_learning` and the
expert's id (`brand`, `strategy`, `users`, `product`, `design`, `build`,
`marketing`, `performance`).

## Working on… → where

| Working on… | Skill or reference |
|---|---|
| A brand-new project — "what do I do now?" | `epicontext-context/references/kickoff/README.md` |
| Fill / populate the whole graph | `epicontext-context/references/fill/README.md` |
| Audit / link integrity + repair / project health | `epicontext-context/references/alignment/README.md` |
| Connection rules between blocks | `epicontext-context/references/connections/README.md` |
| Project rules, glossary terms, section guides | `epicontext-context/references/constitution/README.md` |
| Which entity has which reference | `epicontext-core/references/experts.md` |
| Brand voice, positioning, vision, messaging | `epicontext-brand/SKILL.md` |
| Product strategy, business model, OGSM, roadmap, business case | `epicontext-strategy/SKILL.md` |
| Stress-testing a strategy, stalled growth | `epicontext-strategy/references/methodologies/war-gaming.md`, `epicontext-strategy/references/methodologies/growth-diagnosis.md` |
| Personas, JTBD, journeys, insights, competitors, research | `epicontext-users/SKILL.md` |
| Features, glossary, IA, content, product overview | `epicontext-product/SKILL.md` |
| Judging, critiquing, choosing or designing a screen, flow or component — always | `epicontext-design/SKILL.md` |
| The design system entity, tokens | `epicontext-design/references/entities/design-system.md` |
| Designing screens and variants on the design canvas | `epicontext-design/references/canvas-and-brandbook.md` |
| Building UI (any stack) | `epicontext-build/references/frontend/README.md` |
| Choosing or reviewing a frontend framework | `epicontext-build/references/frontend/framework-selection/README.md` |
| Building APIs / DB / server code | `epicontext-build/references/backend/README.md` |
| Tech stack, ADRs, architecture, infra, legal | `epicontext-build/SKILL.md` |
| Running cost, cloud bill, model spend, budgets | `epicontext-build/references/finance/README.md` |
| Marketing strategy, campaigns, channels, content pieces | `epicontext-marketing/SKILL.md` |
| SEO, SEA, GEO/AEO — search and AI-answer visibility | `epicontext-marketing/references/search-optimization/README.md` |
| KPIs, analytics, feedback | `epicontext-performance/SKILL.md` |
| A signal to classify, cross-group reasoning | `epicontext-core/references/analysis/README.md` |
| Workshops on Miro / FigJam boards | `epicontext-boards/SKILL.md` |
| A plan, a hand-off, notes, which tool is for what | `epicontext-suite/SKILL.md` |
| Planning stories + sprints | `epicontext-suite/references/feature-to-work.md` |

## The old names

`get_skill` still answers every old name with the moved content and a line
naming the new place. Since 23 October 2026: `epicontext-groups` is the
experts (`references/<group>/…` is `epicontext-<group>/…`),
`epicontext-analysis` is `epicontext-core/references/analysis/`,
`epicontext-frontend` and `epicontext-backend` are under `epicontext-build`.
From before 21 October: `-business-strategy` is `epicontext-strategy`;
`-finance` and `-framework-selection` are in `epicontext-build`;
`-search-optimization` in `epicontext-marketing`; `-kickoff`, `-fill`,
`-alignment`, `-connections` and `-constitution` in `epicontext-context`;
`-development` in `epicontext-suite`.
