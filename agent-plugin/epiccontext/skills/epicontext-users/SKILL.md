---
name: epicontext-users
description: "Use when the user mentions a persona, JTBD, journey map, user research, customer insight, competitor, switch interview, voice of customer or discovery, or hands over interview transcripts, support tickets or NPS responses. Populates and analyzes the Users group of an Epic Context graph: diagnoses patterns, summarizes for any audience, and recommends action from the evidence."
metadata:
  epic.requires: "competitor,customer_insight,journey_map,jtbd,persona,research_data,user_research"
  epic.version: "1.0.0"
  epic.contenthash: "82553b7e77d3a273"
---

# Epic Context — Users Group

Populate, maintain, and **analyze** the Users group of an Epic Context project graph: personas, jobs to be done, journey maps, customer insights, competitors, and research documents. The Users group answers *who* the project is for and *why* — and it's the foundation every other group (Brand, Strategy, Product, Build, Marketing, Performance) builds on.

This skill does two kinds of work:
- **Populate** entities from research and raw input
- **Analyze** existing context to find problems, summarize for an audience, and recommend action

## When to use this skill

Trigger this skill in any of these situations:

**Populating:**
- Scaffolding a new project's Users layer at kickoff
- Adding or updating a persona, JTBD, journey, insight, competitor, or research entry
- Ingesting raw input (interview transcripts, support tickets, NPS, switch interviews) into structured graph entities

**Analyzing:**
- Diagnosing what a pattern in the graph or raw input actually means ("why is rebooking dropping?", "what's blocking this persona?")
- Summarizing user-facing context for internal clarity, team alignment, or client communication
- Recommending action based on the diagnosis, with explicit tradeoffs

**Reviewing:**
- Checking whether user-facing context is at the right maturity level
- Running discovery research for a client engagement
- Resolving methodology decisions ("which research method?", "which persona type?")

## Core principle

**Scaffold first, never block.** Every project starts with all entities scaffolded from sensible defaults. Stub is a valid maturity state — it's the starting point, not a problem. The skill's job is to populate and link; never to refuse work because a piece isn't ready yet. If research is missing, scaffold a stub from best-practice defaults and flag what would upgrade it. If a required link is missing, scaffold the linked entity as a stub too. Move forward; specialize over time. **Stub is the floor, not the finish line:** the moment you have evidence — the repo, real research, the existing graph — fill the node to `drafted` in the same pass instead of leaving its scaffold placeholder, and run the proactive context pass (`epicontext-fill`) rather than waiting to be asked node-by-node.

Every entity has a **maturity state**: stub (default/inferred), drafted (research-backed), or validated (proven through usage and measurement). Honest maturity matters — never claim *validated* without evidence. But never gate work on maturity either. When in doubt, mark down and keep moving.

**Three modes of work this skill supports:**
1. **Scaffold** — stub all six Users entities at project kickoff from sensible defaults.
2. **Specialize** — upgrade stubs to drafted/validated as research arrives.
3. **Analyze** — use the populated, linked graph to find tensions across groups, classify problems vs accepted trade-offs, and recommend action with explicit reasoning. For cross-group analysis, see `epicontext-analysis` (its `ANALYSIS.md`). For Users-specific analysis flows, see `references/analysis-flows.md`.

## The six entities

The Users group has six entity types. Each has its own reference file with full process, schema, quality bar, and failure modes.

| Entity | Purpose | Reference file |
|--------|---------|----------------|
| Persona | Who the user is, evidence-based | `references/entities/persona.md` |
| Job to Be Done | Why they hire products in specific circumstances | `references/entities/jtbd.md` |
| Journey Map | How they accomplish a goal over time (body as markdown tables: phase H2 + `Step / Happiness / Actions / Experience / Insights` columns; 3-7 phases × 2-5 steps each minimum for *drafted*) | `references/entities/journey-map.md` |
| Customer Insight | Voice-of-customer signals, triangulated | `references/entities/customer-insight.md` |
| Competitor | Alternatives hired for the same JTBD | `references/entities/competitor.md` |
| Research | Source studies that everything else cites | `references/entities/research.md` |

**Read the relevant reference file before producing any entity.** Each contains the schema, process, and quality bar specific to that entity type.

## Users entities live in the overarching layer, but link down to the page tree

Personas, JTBDs, and customer insights aren't bound to a single page
— they're whole-product. In the context map they sit in the
**overarching layer** above the spine (see `epicontext-core` for the
full model), with edges drawn down to the pages where they show up.

Two specific binding patterns to honour when populating:

- **Journey maps step through pages — a step is usually a screen.**
  This is one of the most important and most-missed links in the
  graph. For **every** step in a `journey_map` that happens on a
  screen of the product (most of them), set the step's `route` field
  (e.g. `/checkout`, `/account/billing`) to the **slug of a
  `content_page`** (or `ia_node`). Rules:
  - If no `content_page` exists for that route yet, **create one**
    so the step has a real page to point at — don't
    leave the step routeless just because the page is missing. Every
    page that a journey passes through must exist as a `content_page`
    node.
  - The route on the step must **match the page's `slug`** (same
    path, leading slash, no trailing slash) so the link resolves.
  - Only steps that are genuinely off-screen (an email, a phone call,
    a warehouse action) may have no route — call those out explicitly
    so a reviewer knows the omission is intentional, not an oversight.

  Without this, a journey reads as a free-floating sequence instead of
  a path across the page spine, and the pages it touches show no
  journey context. When you create or review a `journey_map`, audit
  every step for a page route and flag the ones missing it.
- **Comments from the widget bind to pages by route.** When a
  stakeholder leaves a comment from the embedded widget, the
  comment captures its `route` automatically. If you ingest
  comments via `ingest_comments`, the writes (personas, JTBDs,
  insights) must *reference the originating page* in their
  `reason` — whoever reads the changes feed needs to see "this
  insight came from /checkout comments" to judge whether to keep it.

When you create a persona, JTBD, or journey map, fill in:
- `linked_pages` (where the persona is most active, where the JTBD
  happens, what pages the journey passes through)
- `linked_features` (what they reach for to do the job)

Without those links, Users entities float free of the product. The
spine + overarching model only works if the edges down to the page
tree are populated.

## How the entities connect

Users entities form a network. Strongest relationships:

```
research ───────► persona
   │                │
   │                ├──► jtbd ──► competitor
   │                │       │
   │                │       └──► feature (Product group, separate skill)
   │                │
   │                └──► journey_map ──► ia_node, component (Product/Build)
   │
   └──► customer_insight ◄── (continuous stream into all the above)
```

Read this as: **research is the source layer**. Personas derive from research. JTBDs link to personas (who) and circumstances (when). Competitors are alternatives hired for those JTBDs. Journey maps are how a persona accomplishes a JTBD over time. Customer insights are continuous signals that flow into and refine all of the above.

When creating any entity, populate the relationship fields. Entities without connections are dead entries — the graph's value comes from the edges.

## Order to populate for a new project

For a project starting from scratch:

1. **Research** first — even if minimal (desk research, proto). Everything below is more honest when grounded in *some* evidence.
2. **JTBD** — at least one or two core jobs. JTBD anchors persona scope and competitor framing.
3. **Persona** — for the JTBDs identified. Persona scope follows from JTBD scope.
4. **Competitor** — through the lens of the JTBDs and personas now defined.
5. **Journey Map** — for the primary persona pursuing the primary JTBD.
6. **Customer Insight** — ongoing, accrues continuously as new signals arrive.

For a project where research already exists:

- Run the research entity flow first to ingest existing studies into the graph.
- Then create other entities, each citing the relevant research entries.

## Maturity expectations at a glance

| Entity | Stub | Drafted | Validated |
|--------|------|---------|-----------|
| Persona | Inferred | 5+ interviews | Used in design cycle |
| JTBD | Inferred | 3+ switch interviews | Drove product decision |
| Journey | Inferred | Research per phase | Drove change, measured |
| Insight | Single source | 3+ corroborating | Acted on, measured |
| Competitor | Name + URL | JTBD-framed | Switch-interview confirmed |
| Research | Planned | Complete + linked | Used in decision + measured |

Never claim maturity not earned. Honest staging beats inflated claims.

## Analyzing context — finding the problem and what to do about it

When the request is to *understand* or *act on* the context (not just populate it), use the three flows in `references/analysis-flows.md`:

**Diagnose** — Find the underlying problem. Two starting points: (A) from the existing graph when context is already populated, (B) from raw input when interview transcripts, support tickets, or NPS responses haven't been structured yet. Each has its own process, but both share evidence-sufficiency gates that must pass before declaring a diagnosis.

**Summarize** — Compress a diagnosis or graph slice into a 60-second readable form, in one of three audience formats: internal (under 100 words), team (200-350 words), client (1-2 pages). Pick by who reads it — tone, depth, and structure differ.

**Recommend action** — Default posture: recommend ONE action, explain why, name the tradeoffs honestly, and show 2-3 alternatives considered. Calibrate to evidence strength: tentative diagnosis → tentative action; high-confidence diagnosis → confident action with built-in measurement.

Read `references/analysis-flows.md` before producing any analytical output. It holds the evidence-sufficiency checks, opposing-hypothesis tests, the extra discipline for client-facing output (cite sources by name, keep claims and quotes distinct, always list what still needs validating), and the conditions under which to **refuse to analyze** (single-source evidence, too-narrow date range, loaded questions, justifying a decision already made, unverifiable sources). Skipping them produces confident-sounding bad analysis.

## When you need to make a methodology decision

Decision trees live in `references/decisions/`. Read the relevant one before committing to an approach:

- `decisions/which-research-method.md` — qual vs. quant first, then specific method by question type
- `decisions/persona-type.md` — proto vs. qualitative vs. statistical vs. layered, by evidence available
- `decisions/journey-artifact.md` — current-state vs. future-state vs. day-in-life vs. service blueprint vs. multi-actor
- `decisions/research-vs-ship.md` — calibrating research depth to stakes and reversibility

These are short and branching. Read them when the question comes up; skip them otherwise.

## When you need a worked example

Reference examples live in `references/examples/`. Use them when starting from blank or unsure what "drafted" looks like:

- `examples/persona-b2b-saas-power-user.md` — research-backed B2B power user persona
- `examples/persona-hybrid-service-customer.md` — service business persona (closest match to wellness, hospitality, retail with digital booking)
- `examples/jtbd-recurring-service.md` — JTBD with all four Forces of Progress mapped, paired with the hybrid service persona
- `examples/journey-hybrid-first-visit.md` — 7-phase journey spanning digital and physical experience
- `examples/competitor-three-types.md` — direct, substitute, and indirect competitors for the same JTBD
- `examples/insight-triangulated.md` — customer insight built from 7 sources across 5 channel types

Examples #02–#06 are intentionally the same project (a wellness service business), so reading them in sequence shows how the entities link in practice. Example #01 is the contrast piece (B2B SaaS) showing a different shape.

**Adapt examples; don't copy literally.** Each example includes "How to adapt this example" and "Common adaptations" sections.

## When you need to defend a claim with evidence

`references/evidence.md` is the citable data library — research methodology and sample sizes, persona and journey impact, VoC, JTBD theory, competitive analysis, decision-making behaviour, empirical marketing science, offline behaviour, and practitioner research craft.

Reference entries by ID (e.g., EVD-USR-008). Only cite when the source is trusted and the claim is actually supported. **Never invent statistics or attribute claims to sources without verification.**

## Likely-moves table (competitor discipline)

Every `competitor` block at maturity ≥ `drafted` carries a **Likely
moves** table (move / trigger / impact on us / confidence) — what the
rival could do in the next 6–12 months. Format and confidence rules:
`references/entities/competitor.md`.

## The discipline contract

Every entity in this group at maturity ≥ `drafted` must pass the six
norms in `epicontext-core/references/discipline.md` — MECE,
answer-first, evidence-aware, assumption-conscious, executive-
readable, specific-enough. Especially: a persona without cited quotes
or research is failing evidence-aware; a JTBD without a measurable
outcome is failing specific-enough.

## Anti-patterns to refuse

If a request would require any of these, push back instead of producing the output:

**Populating anti-patterns:**
- A persona without research backing claimed as "drafted" or "validated"
- A persona built from demographics rather than attitudes, goals, behaviors
- A JTBD with the product or solution baked into the statement (e.g., "help me book a massage" instead of "help me maintain my physical wellbeing")
- A journey map without a stated business goal
- Customer insights from a single source presented as triangulated
- Competitive analysis based only on category membership (missing substitutes and indirect)
- Statistics or claims attributed to sources without verifiable citation
- Skipping the maturity flag when an entity is generated quickly

**Analysis anti-patterns:**
- Diagnosis from a single signal claimed as a pattern
- Confident-sounding analysis from thin or one-sided evidence
- Recommendations that ignore tradeoffs or hide costs
- Summaries that drop disconfirming evidence to make the case cleaner
- "Analysis" produced to justify a decision already made
- Hedge-loaded prose that sounds analytical but commits to nothing

**Scaffold-and-flag instead of blocking.** For *populating* work, never refuse because input is missing — scaffold a stub from sensible defaults and mark maturity honestly (e.g., "Creating proto-persona at stub maturity from the brief; specialize when interviews land — here's what would lift it to drafted: [list]"). For *analysis* work, be honest about confidence — "the evidence is too thin for a confident diagnosis; here's what additional input would resolve it." Stubs and tentative findings are valid outputs; refusing the work is not.

## Output format

When producing an entity, output the YAML structure defined in the entity's reference file. Always include:

- `maturity` field (stub | drafted | validated)
- `evidence_sources` field (list of research IDs, or `[]` if stub)
- Relationship fields appropriate to the entity type (linked_persona, linked_jtbds, etc.)

When uncertain about a field, write `# TODO: needs research` rather than fabricating content.

## When this skill ends

This skill ends when the requested entity (or set of entities) has been produced and saved to the graph. If the work touches other entity groups (Brand, Strategy, Product, Build, Marketing, Performance), surface that need but don't expand scope — those have their own skills.

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
