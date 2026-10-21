# Epic Context — Performance Group

*Part of `epicontext-groups` (`references/performance/README.md`), formerly the `epicontext-performance` skill. Paths below are relative to the `epicontext-groups` folder: for `get_skill`, put `epicontext-groups/` in front.*

Populate, maintain, and analyze the Performance group: analytics, KPIs, and feedback. Performance answers *how the project is actually doing* — the measurement layer that closes the loop with strategy and customer reality.

This skill does two kinds of work:
- **Populate** entities from analytics setup, KPI definitions, feedback collection
- **Analyze** existing measurement to find gaps, summarize for an audience, recommend action

## When to use this skill

**Populating:**
- Scaffolding a new project's Performance layer (instrumenting from day one)
- Adding or updating analytics, KPIs, feedback channels
- Capturing AEO / AI search visibility tracking (a newer subset of analytics)
- Documenting which measures from OGSM map to actual instruments

**Analyzing:**
- Diagnosing whether the right things are being measured
- Summarizing project performance for stakeholders, team, or client
- Recommending what to start measuring or stop measuring
- Checking whether feedback is acted on or just collected

**Reviewing:**
- Are KPIs still relevant to current strategy?
- Is feedback closing the loop or accumulating in a graveyard?

## Core principle

**Scaffold first, never block.** Every project starts with stub entities for analytics (sensible default events for the project type), KPIs (placeholder targets to be specialized), and feedback channels (default sources to monitor). Stubs are starting points, not finished work. The skill's job is to populate and link; specialization happens as the project runs and real measurement begins. **Stub is the floor, not the finish line:** the moment you have evidence — the repo, real research, the existing graph — fill the node to `drafted` in the same pass instead of leaving its scaffold placeholder, and run the proactive context pass (`epicontext-context` (fill)) rather than waiting to be asked node-by-node.

Once running, the Performance group has the highest risk of vanity metrics — measurements that move regardless of whether the project is succeeding. The discipline is twofold: every measure should trace to an OGSM Goal (Strategy group), and every collected signal should have a documented action loop. Measures without strategic linkage are decoration. Feedback without action is collection without learning. Mark KPIs as stub until they have an owner, target, and cadence.


**Three modes of work this skill supports:**
1. **Scaffold** — stub all entities at project kickoff from sensible defaults.
2. **Specialize** — upgrade stubs to drafted/validated as decisions, research, and production use accumulate.
3. **Analyze** — use the populated, linked graph to find tensions across groups, classify problems vs accepted trade-offs, and recommend action with explicit reasoning. For cross-group analysis, see `epicontext-analysis` (its `ANALYSIS.md`). For performance-specific flows, see `references/performance/analysis-flows.md`.

## The three entities

| Entity | Purpose | Reference file |
|--------|---------|----------------|
| Analytics | Behavioral and operational measurement instrumentation | `references/performance/entities/analytics.md` |
| KPI | Specific tracked metrics with targets, owners, cadence — and the experiments designed to move them (A/B tests, multivariate, holdouts) | `references/performance/entities/kpi.md` |
| Feedback | Voice-of-customer signals flowing back (NPS, reviews, AI visibility) | `references/performance/entities/feedback.md` |

**Read the relevant reference file before producing any entity.**

> **On experiments:** experiments are a structured sub-form of KPI work — they target a primary KPI and use other KPIs as guardrails. They live in `kpi.md` rather than as a separate entity. The schema includes both tracked-KPI and experiment shapes.

## How the entities connect

```
ogsm.measure (Strategy group) ──► kpi (tracked) ──► analytics ──► dashboard / reporting
                                       │                │
                                       ▼                │
                                  kpi (experiment) ◄────┘  (validates KPI deltas with causal evidence)
                                       │
                                       └──► customer_insight (Users group)
                                                 ▲
                                                 │
                                            feedback ────┘
```

Read this as: **OGSM Measures are the strategic frame; KPIs are the operationalized version**. Analytics is the instrumentation that produces the data. Experiments (a sub-form of KPI) are how causal claims are made from KPI movement (without experiments, KPI changes are correlational). Feedback is the inbound voice-of-customer stream. Both flow into customer insights in the Users group, which closes the loop back to personas and JTBDs.

## Order to populate for a new project

1. **KPIs first** — define what success looks like (derived from OGSM measures)
2. **Analytics** — instrumentation to actually capture KPI data
3. **Feedback** — channels for voice-of-customer
4. **Experiments** (sub-form of KPI) — once KPIs and analytics exist, experiments become possible. Don't pre-define experiments before there's a KPI to move.

For an existing project:
- Start with what's already being measured (analytics tools usually exist)
- Map current measures to OGSM — find gaps and orphans
- Add feedback channels if missing

## Maturity expectations

| Entity | Stub | Drafted | Validated |
|--------|------|---------|-----------|
| Analytics | Tool listed | Events instrumented; data flowing | Reports actually used in decisions |
| KPI (tracked) | Metric named | Target, owner, cadence, OGSM link, instrumentation source | Drove a real decision; performance evaluated |
| KPI (experiment) | Hypothesis written | Hypothesis + design + sample size + pre-committed success criteria + rollback | Decision made from result; learning recorded; action taken |
| Feedback | Channel exists | Channel + categorization + action loop | Closed loop demonstrated; signals → action |

## Analyzing context — finding the problem

Use the three flows in `references/performance/analysis-flows.md`.

**Diagnose** — common Performance diagnoses:
- Vanity metrics (measures without OGSM linkage)
- Measurement gaps (OGSM Goals without instrumentation)
- Feedback graveyards (signals collected but not acted on)
- Dashboard drift (reports nobody looks at; or KPIs that drift without anyone noticing)

**Summarize** — three audience formats: internal (under 100 words), team (200-350 words), client (1-2 pages). Performance summaries for clients should include both numbers AND interpretation — raw numbers without context mislead.

**Recommend action** — recommend ONE action, explain why, name tradeoffs honestly. Performance recommendations split into: instrument something new, stop measuring something, change a target, change cadence, close a feedback loop.

## When you need to make a measurement decision

`references/performance/decisions/`:
- `decisions/which-metric-framework.md` — picking a metric framework (OKRs, OGSM, North Star, Pirate Metrics)
- `decisions/lead-vs-lag-indicator.md` — picking what to track and how (leading vs. lagging)
- `decisions/quant-vs-qual-feedback.md` — when to instrument vs. when to ask

## When you need to design or audit the KPI system (sparring-partner mode)

`methodologies/kpi-architecture.md` is **dialogic** — the AI runs it
WITH the user as a guided conversation. Use when promoting a `kpi`
or `north_star` block past `stub`, when the user asks "what should
we measure?", or when an existing dashboard is noisy / backward /
disconnected. The methodology forces every KPI to be anchored to a
named decision, builds a MECE value-driver tree, classifies metrics
as outcome / driver / activity, culls vanity, and assigns owners +
thresholds + review cadence. Quality bar before claim-drafted: ≤ 10
executive KPIs, each with a named-person owner, each tied to a
decision, MECE-checked driver tree.

## When you need a worked example

`references/performance/examples/`:
- `examples/kpi-with-full-trace.md` — KPI with full OGSM linkage and instrumentation source
- `examples/aeo-tracking-setup.md` — minimum-viable AEO instrumentation
- `examples/feedback-synthesis.md` — raw signals → themes → action loop demonstration

## When you need to defend a claim with evidence

`references/performance/evidence.md` — including the AEO / AI search visibility sources held back from the Users group.

## The discipline contract

Every entity in this group at maturity ≥ `drafted` must pass the six
norms in `epicontext-core/references/discipline.md` — MECE,
answer-first, evidence-aware, assumption-conscious, executive-
readable, specific-enough. Especially relevant for Performance: a
KPI without a named decision it informs is failing specific-enough; a
dashboard with overlapping driver-tree branches is failing MECE; a
feedback synthesis that asserts a pattern without citing the source
signals is failing evidence-aware. The `kpi-architecture.md`
methodology under `references/performance/methodologies/` enforces these at
design time.

## Anti-patterns to refuse

**Populating anti-patterns:**
- KPIs without OGSM linkage (decoration; not strategically anchored)
- Analytics events without a downstream consumer (instrument-everything cargo cult)
- Feedback collection without action loop (graveyard)
- Targets that aren't comparison-able (no baseline, no cadence)

**Analysis anti-patterns:**
- Performance recommendations from one week of data
- "Improve KPI X" without diagnosing why it's not moving
- Adding new measures to make the dashboard look fuller

When refusing, offer the honest version. Example: "I can list this metric, but for it to be a drafted KPI, it needs an OGSM link, target, owner, cadence, and instrumentation source. Which of these are unclear?"

## Output format

YAML structures defined in entity references. Always include:
- `maturity` field
- Linkage to OGSM (Strategy group), customer_insight (Users group), or feature (Product group) where applicable
- `last_reviewed` date — measurement frames go stale

When uncertain, write `# TODO: needs decision` rather than fabricating.

## When this skill ends

Skill ends when entity is produced. If touching Strategy (OGSM measures), Users (customer insights from feedback), or Product (feature performance), surface the need without expanding scope.

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
