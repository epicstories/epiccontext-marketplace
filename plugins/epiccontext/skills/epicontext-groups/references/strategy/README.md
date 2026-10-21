# Epic Context — Strategy Group

*Part of `epicontext-groups` (`references/strategy/README.md`), formerly the `epicontext-business-strategy` skill. Paths below are relative to the `epicontext-groups` folder: for `get_skill`, put `epicontext-groups/` in front.*

Populate, maintain, and analyze the Strategy group: product strategy, business model, OGSM, roadmap, and business cases. Strategy answers *where the project is going* — and provides the framework every other group (Brand, Users, Product, Build, Marketing, Performance) is judged against.

This skill does two kinds of work:
- **Populate** entities from strategy docs, leadership decisions, and stakeholder input
- **Analyze** existing strategy to find misalignment, summarize for an audience, and recommend action

## When to use this skill

**Populating:**
- Scaffolding a new project's Strategy layer at kickoff
- Adding or updating strategy, business model, OGSM, roadmap items, or business cases
- Ingesting strategy workshops, leadership decisions, or board discussions
- Capturing a new strategic bet that emerges during the project

**Analyzing:**
- Diagnosing whether current work actually serves the stated strategy
- Reconciling drift between strategy and what's being built
- Summarizing strategy for internal alignment or client communication
- Evaluating a proposed bet against the existing roadmap

**Reviewing:**
- Checking whether strategy context is at the right maturity level
- Resolving strategic decisions ("build vs. buy?", "now vs. later?", "this market or that one?")

## Dialogic mode — sparring partner, not scribe

> **Strategy is where dialogic mode matters most.** The graph records
> the strategy; the conversation IS the strategy. The AI's job in this
> skill is to FACILITATE: ask the user the question they're avoiding,
> push back on vague bets, force the trade-off to be named, hold the
> reversal condition until it's observable.

You're not a strategy generator. You're a sparring partner. The
moment a strategy is produced WITHOUT pushback from the user, it's
producer-mode failure — the strategy already drifted before it
landed. Default to question-first. Examples of the shape:

| Producer-mode (avoid) | Sparring-partner mode (preferred) |
|---|---|
| "Here's a draft strategy: ship feature X to segment Y by Q3…" | "Before I draft: what's the bet, in one sentence? Persona + mechanism + horizon." |
| "Your OGSM should have these 3 objectives…" | "Which OGSM Goal would tell us we won? Read it back — if it's not a number with a date, we haven't decided yet." |
| "Your alternatives considered: A, B, C." | "Which alternatives are you actually considering — and which are you including because the template demands three?" |

When the user asks for a strategy / business case / OGSM / roadmap,
**default to loading the relevant methodology under
`references/strategy/methodologies/`** and running it as a guided conversation
rather than producing content immediately. The methodologies are
where the discipline lives:

- `methodologies/assumption-audit.md` — for promoting strategy /
  business_case past drafted, or when the user says "is this sound?"
- `methodologies/strategic-options.md` — for build-vs-buy, this-
  segment-vs-that, now-vs-later, or any "should we X or Y?" question

## Core principle

**Scaffold first, never block.** Every project starts with all strategy entities scaffolded from sensible defaults — a stub strategy that names the bet, a stub OGSM that frames the operating year, a stub business model. The skill's job is to populate and link; specialization is the work of building. **Stub is the floor, not the finish line:** the moment you have evidence — the repo, real research, the existing graph — fill the node to `drafted` in the same pass instead of leaving its scaffold placeholder, and run the proactive context pass (`epicontext-context` (fill)) rather than waiting to be asked node-by-node.

Strategy is the most aspirational entity group. The risk: documents that describe ambition without commitment. Every strategy entity should eventually be specific enough that someone could disagree with it. "Be the best in our category" is not a strategy — it's a vibe. "Win on provider continuity for recurring service customers in NL by 2027 by maintaining max 3 locations and proprietary booking IP" is a strategy. Stubs are fine; vague stubs that pretend to be drafted are not.


**Three modes of work this skill supports:**
1. **Scaffold** — stub all entities at project kickoff from sensible defaults.
2. **Specialize** — upgrade stubs to drafted/validated as decisions, research, and production use accumulate.
3. **Analyze** — use the populated, linked graph to find tensions across groups, classify problems vs accepted trade-offs, and recommend action with explicit reasoning. For cross-group analysis, see `epicontext-analysis` (its `ANALYSIS.md`). For strategy-specific flows, see `references/strategy/analysis-flows.md`.

## The five entities

| Entity | Purpose | Reference file |
|--------|---------|----------------|
| Strategy | Where we're going and how — the bet | `references/strategy/entities/strategy.md` |
| Business Model | How value is created and captured | `references/strategy/entities/business-model.md` |
| OGSM | Objectives, Goals, Strategies, Measures — the operating frame | `references/strategy/entities/ogsm.md` |
| Roadmap | What's coming when, with rationale | `references/strategy/entities/roadmap.md` |
| Business Case | Justification for a specific bet | `references/strategy/entities/business-case.md` |

**Read the relevant reference file before producing any entity.**

## How the entities connect

```
strategy ◄─────► business_model
   │                  │
   ▼                  ▼
  ogsm ──────► roadmap
   │              │
   │              └──► feature (Product group)
   │
   └──► business_case ──► roadmap items
```

Read this as: **strategy is the parent**. Business model expresses how strategy makes money. OGSM operationalizes strategy into objectives and measures. Roadmap sequences the work. Business cases justify specific bets. Features in the Product group should ultimately trace upward to strategy via OGSM and roadmap.

When creating any entity, populate relationship fields. A roadmap item that doesn't trace to OGSM is a roadmap item without strategic justification — flag it.

## Order to populate for a new project

1. **Strategy** — the bet. Even if rough.
2. **Business model** — how the strategy generates value and revenue.
3. **OGSM** — translate strategy into objectives and measurable goals.
4. **Roadmap** — sequence the work that serves OGSM.
5. **Business cases** — only for specific bets that need explicit justification (large investments, contested decisions).

For an existing project:
- **Strategy** often exists informally (in slides, in heads). Capture what's actually believed, not what would be polished.
- **OGSM** can usually be reverse-engineered from current goals and measures.
- **Roadmap** likely exists somewhere — surface it; don't recreate it.

## Maturity expectations

| Entity | Stub | Drafted | Validated |
|--------|------|---------|-----------|
| Strategy | One-line bet, not specific | Specific bet with mechanism, audience, timeframe | Tested against market events; refined or confirmed |
| Business Model | Listed revenue streams | Full model with unit economics | Profitable at scale; replicable |
| OGSM | Objectives only | Full O/G/S/M with linked measures | Drove decisions; measures hit (or missed and were rebuilt) |
| Roadmap | List of items | Linked to OGSM; sequenced with rationale | Shipped; outcomes measured against OGSM goals |
| Business Case | Premise stated | Full case with cost, impact, alternatives | Decision made; outcome measured |

## Analyzing context — finding the problem and what to do about it

When the request is to *understand* or *act on* strategy context, use the three flows in `references/strategy/analysis-flows.md`.

**Diagnose** — common diagnoses in Strategy:
- Strategy-execution drift (current work doesn't trace to strategy)
- OGSM with no measures or measures that don't connect to strategy
- Roadmap full of items without strategic justification
- Business model assumptions that haven't been tested

**Summarize** — three audience formats: internal (under 100 words), team (200-350 words), client (1-2 pages). Strategy summaries for clients should always include the bet, the bounds, and what's being declined.

**Recommend action** — recommend ONE action, explain why, name the tradeoffs honestly. Strategy recommendations need extra discipline: a recommendation to "pivot strategy" is much heavier than "adjust roadmap sequencing." Be calibrated.

## When you need to make a strategic decision

`references/strategy/decisions/`:
- `decisions/which-strategy-framework.md` — picking among Porter, Wardley, Ansoff, Lean Canvas, BMC, OGSM, OKRs by situation
- `decisions/now-vs-later.md` — sequencing logic for roadmap items
- `decisions/build-vs-buy-vs-partner.md` — when a capability isn't built in-house
- `decisions/focus-vs-expand.md` — adding a market/persona/segment vs. doubling down

## When you need to run a methodology (sparring-partner mode)

These are **dialogic** — the AI runs them WITH the user as a guided
conversation, not as content production. Each one defines: inputs to
verify from the graph, a step-by-step workflow where each step is an
ASK with stop conditions, a refinement loop, a quality bar, and what
lands in the graph as a result. Load the relevant file when promoting
an entity past `drafted` or when the user signals a high-stakes
strategic decision.

- `methodologies/assumption-audit.md` — extract load-bearing
  assumptions, score importance × evidence, convert weak ones into
  testable hypotheses. Run before promoting a strategy or
  business_case to `validated`, or when the user asks "is this
  actually sound?".
- `methodologies/strategic-options.md` — generate meaningfully-
  different paths, score against decision-specific criteria with
  cited evidence per cell, name the reversal condition. Run when
  the user faces "build vs buy", "now vs later", "this segment vs
  that segment", or any "should we X or Y?" question.

## When you need a worked example

`references/strategy/examples/`:
- `examples/strategy-services-led.md` — services-led product strategy (matches Epic Context's own posture)
- `examples/business-model-hybrid-service.md` — business model for a hybrid online-offline service business
- `examples/ogsm-quarterly.md` — full OGSM with linked measures
- `examples/roadmap-with-traces.md` — roadmap with each item traced to OGSM

## When you need to defend a claim with evidence

`references/strategy/evidence.md` — Porter, Christensen, Wardley Mapping, Lean Startup, McKinsey strategic frameworks.

## Kill list with revisit triggers (roadmap discipline)

Every `roadmap` block at maturity ≥ `drafted` must include a **Kill
list** section — 3–5 named initiatives the team explicitly chose NOT
to do this period, each with a **revisit trigger**: the specific
observable condition that would bring it back onto the roadmap.

Without the kill list, the roadmap is wishful thinking — every
plausible idea silently survives as "later, maybe." The kill list
makes the trade-off real: *"Not doing X this quarter because [cited
strategic reason]. Revisit when [observable signal]."* The team
remembers what was declined and why, future arguments cite the prior
decision rather than re-litigating it, and the kill list teaches the
AI which proposals to refuse for the right reason.

This borrows the McKinsey initiative-prioritizer pattern. See
`epicontext-core/references/discipline.md` § Specific-enough for the
norm — a revisit trigger is what makes a kill specific, not just a
vague "later."

## The discipline contract

Every entity in this group at maturity ≥ `drafted` must pass the six
norms in `epicontext-core/references/discipline.md` — MECE,
answer-first, evidence-aware, assumption-conscious, executive-
readable, specific-enough. Load it before promoting any strategy
block. Especially: a strategy that doesn't open with the bet in
sentence one is failing the answer-first norm; a roadmap without a
MECE driver tracing items to OGSM goals is failing the MECE norm; a
business_case that asserts ROI without citing supporting blocks is
failing the evidence-aware norm.

## Anti-patterns to refuse

**Populating anti-patterns:**
- Strategy that's a vibe, not a specific bet ("be the best", "delight customers")
- OGSM where measures aren't measurable
- Roadmap items disconnected from OGSM
- Business cases that don't include alternatives considered
- Business model that doesn't address how money flows

**Analysis anti-patterns:**
- "Strategy" recommendations from market commentary alone (no internal evidence)
- Roadmap reshuffling presented as strategic analysis
- Business case validation without testing the underlying assumptions

When refusing, offer the honest version. Example: "I can capture this as a stub strategy noting the team has a directional preference; making it drafted requires specifying the bet, the audience, and the timeframe."

## Output format

YAML structures defined in entity references. Always include:
- `maturity` field
- Relationship fields appropriate to the entity (linked_strategy, linked_ogsm, linked_business_case)
- `last_reviewed` date — strategy goes stale fast

When uncertain, write `# TODO: needs decision` rather than fabricating.

## When this skill ends

Skill ends when the requested entity has been produced. If the work touches Users, Product, Brand, Build, Marketing, or Performance, surface the need but don't expand scope.

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
