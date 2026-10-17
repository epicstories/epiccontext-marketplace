---
name: epicontext-analysis
description: >
  Use when a signal (customer feedback, KPI shift, AI search visibility
  report, competitor move) must be classified as a real problem, an
  acceptable trade-off, drift, a wrong-persona signal or vanity; when
  stakeholders disagree about what to fix; or when recommending action
  with explicit trade-offs and a reversal condition. Cross-group
  reasoning over the Epic Context graph.
allowed-tools: Read, Grep, Glob
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.contenthash: "d1f5624be219206d"
---

# Epic Context — Analysis (cross-group reasoning)

The third mode of work after **scaffold** and **specialize**:
**analyze** — use the populated, linked graph to find what's actually
going on, decide what's a real problem versus an accepted trade-off,
and recommend action with explicit reasoning.

> **The truth lives in the connections, not in any single entity.**

A user pain in isolation might mean nothing. Connected to strategy and
business model, it might be acceptable. Connected to performance data
and competitors, it might be the most important problem in the project.

Read [`ANALYSIS.md`](./ANALYSIS.md) for the full five-step pattern
(state signal precisely → traverse linked context → identify tensions
→ classify → recommend with trade-offs named).

## Quick reference — when to invoke

- Stakeholder asks "is this a problem?"
- A KPI drops or surprises
- Survey, NPS, or AI search visibility signal looks alarming
- Stakeholders disagree about what to fix
- Periodic review of where the project stands
- A competitor moves; deciding whether to react

## The five-step pattern (compressed)

1. **State the signal precisely** — what did you see, where, when, how
   big? Quote numbers and direct words.
2. **Traverse the linked context** — pull every connected entity across
   all seven groups (Brand · Strategy · Users · Product · Build ·
   Marketing · Performance); the traversal IS the work.
3. **Identify tensions** — where does the linked context disagree?
   Tensions are signals; don't smooth over them.
4. **Classify** — real problem to fix / acceptable trade-off / drift to
   reconcile / wrong-persona signal / vanity & noise.
5. **Recommend with explicit trade-offs** — what's recommended, what's
   traded off, what would make us reverse, where the decision lives.

See `ANALYSIS.md` for full detail, classification table, and worked
example.

## Tools for the traversal

The graph this analyzes is the project graph, read through MCP:

- **Whole graph or a briefing** — `get_book` (everything in one call),
  `get_briefing` (task_type `strategy` or `research`: the blocks the question must see, then a ranked walk).
- **By entity or block** — `list_v3_entities`, `get_v3_entity`,
  `list_blocks`, `get_block`, `search_blocks`.
- **Evidence behind a claim** — `get_evidence_for`.
- **Required edges between block types** — see the
  `epicontext-connections` skill; the write result also lists any
  required connection a block is missing.
- **Drift** — `detect_drift` flags broken references and invariant
  violations; it pairs with this skill's "drift to reconcile"
  classification. `check_project_health` gives the wider health view.

Reading is free; analysis itself writes nothing until you land the
recommendation.

## Sparring-partner methodologies (dialogic)

Load these when the user signals high-stakes reasoning — not as
content to produce, but as workflows to RUN with the user. Each one
defines: inputs to verify from the graph, step-by-step ASKS with
stop conditions, a refinement loop that forces bias-detection, and
what lands in the graph — written directly with `create_block` /
`update_block`, each with a `reason` that shows in the changes feed.

- `methodologies/war-gaming.md` — stress-test a strategy against six
  scenario categories (competitor / customer / market / regulatory /
  operational / financial), build a response playbook bound to
  observable early-warning signals already in the graph. Run before
  committing to a strategy that could be disrupted.
- `methodologies/growth-diagnosis.md` — diagnose stalled growth by
  building a MECE driver tree, isolating the single binding
  constraint via Theory of Constraints, then distinguishing root
  cause from symptom via 5-whys. Run when the user reports "we're
  not growing", "metrics are flat", or "the team disagrees on the
  real problem."

The McKinsey-style discipline these methodologies enforce
(MECE / answer-first / hypothesis-led / 80-20 focus) layers on top
of the five-step pattern above — the pattern is the spine; the
methodologies are the muscle.

## Cross-group entry points

Each group's SKILL.md applies the analysis pattern to its own signals:

| Group | Common signal types this skill helps classify |
|---|---|
| epicontext-users | customer survey, persona drift, journey friction, JTBD shift |
| epicontext-product | feature usage, IA findability, content drift, glossary inconsistency |
| epicontext-business-strategy | OGSM at risk, competitor moves, business model strain |
| epicontext-brand | voice drift, positioning erosion, messaging not landing |
| epicontext-build | performance regression, tech debt, security/legal exposure, accessibility gaps |
| epicontext-marketing | campaign underperforming, channel mix drift, claims the product doesn't back |
| epicontext-performance | KPI shifts, AEO visibility, feedback synthesis |

Read the per-group SKILL.md when the signal is local; read this skill
when reasoning across groups.

## Anti-patterns this skill refuses

- Treating one group's signal as the whole truth.
- "Yes" to every customer pain.
- "No" to every user signal because of business reasons.
- Recommending without naming the trade-off.
- Skipping the reversal condition.
- Confusing drift with disagreement.
- Analysis as procrastination — match analysis depth to stake size.
