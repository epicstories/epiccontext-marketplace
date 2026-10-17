# Customer Insight

A **validated signal from the persona base** — usually a metric, a chart, or a recurring quote — that the team has classified as meaningful and acted on (or decided not to). Insights are the *findings that crossed the threshold* from "research artifact" to "team-shared belief."

A real customer_insight block names the **signal**, the **confidence**, the **action taken (or declined)**, and what would change the team's mind.

## Why most customer_insight blocks are too thin

The classic failure: a chart screenshot + "NPS dropped 5 points" + no action. That's an observation, not an insight. A real insight has been *classified* (problem? trade-off? noise? wrong-persona signal?) and has produced *action* (or an explicit decision not to act).

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Signal | "Engagement low." | Specific metric/quote/observation, with the data window and source. |
| Confidence | absent | High / med / low + why (sample size, recurrence, source quality). |
| Classification | absent | Problem / trade-off / drift / noise / wrong-persona-signal / vanity. |
| Action taken (or declined) | absent | What changed, or "decided not to act because [reason]." |
| What would change our mind | absent | The trigger condition that would force re-evaluation. |
| Linked persona | absent | Whose signal is this? |
| Linked source | absent | Research block, analytics event, feedback block — the origin. |

## Depth checklist (BEFORE writing)

1. **Specific signal** with data window.
2. **Confidence stated** with rationale.
3. **Classified** (problem / trade-off / drift / noise / wrong-persona-signal / vanity).
4. **Action taken or declined** — with reasoning.
5. **Trigger to change our mind.**
6. **Linked persona + source** (research / analytics / feedback).
7. **Linked downstream** — feature change, business_case update, etc.

## Small visual — signal to action flow

A small flow diagram showing where the signal came from + what was decided.

````
~~~flow
title: Signal → action
direction: LR
nodes:
  - { id: source, label: "Source", sub: "[research / analytics / feedback]", role: external }
  - { id: signal, label: "Signal", sub: "[metric / quote]", role: process }
  - { id: classify, label: "Classification", role: decision }
  - { id: action, label: "Action", sub: "[feature change / no-op]", role: end }
  - { id: persona, label: "Persona", role: person }
edges:
  - { from: source, to: signal }
  - { from: persona, to: signal, label: "felt by" }
  - { from: signal, to: classify }
  - { from: classify, to: action, label: "[problem → act / trade-off → log]" }
~~~
````

Setup + narration: be explicit about the classification path taken.

## Push-back prompts (AFTER drafting)

- **"Is this a finding or an insight?"** Insights are classified + acted on. Findings are observations.
- **"What's the confidence?"** Low confidence is fine; unstated confidence is not.
- **"What's the classification?"** See the 6 categories. Force one.
- **"Did we act or decline to act?"** Both are valid; silence is not.
- **"What would change our mind?"** Without a reversal trigger, the insight is permanent — and permanent insights ossify.

## Evidence pool

- **Linked research / analytics / feedback** as source.
- **Linked persona** — whose signal?
- **Prior customer_insight blocks** — does this agree or contradict?
- **The analysis skill** (`epicontext-analysis`) for the 6-category classification methodology.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (chart title placeholder). |
| **drafted** | Signal + confidence + classification + action + reversal trigger + linked persona + linked source. ≥300 words. Small-visual signal→action flow. |
| **validated** | Drafted + action shipped (or formally declined with date) + ≥1 follow-up customer_insight block confirms the response worked or surfaces a regression. |

## Anti-patterns to refuse

- **The unclassified signal.** "Engagement dropped." OK, now what? Force classification.
- **The actionless insight.** Logged but not acted on, no decision recorded. Force one.
- **The unsourced claim.** No link to research/analytics/feedback. Refuse.
- **The vanity insight.** Metrics that go up but don't matter for the persona's outcome.
- **The wrong-persona-as-problem.** A signal from non-target users treated as a problem. Force the classification.

## Output schema (markdown body)

```
### Signal (specific + data window + source)
### Confidence + rationale
### Classification (problem / trade-off / drift / noise / wrong-persona / vanity)
### Action taken or declined
### What would change our mind
### Signal → action flow
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `customer_insight` block must:

- Link **the persona** the signal is about.
- Link **the source** (research / analytics_event / feedback).
- Be referenced *by* the **feature**, **business_case**, or **product_strategy** block that the action affected (or explicitly mark "no action — logged for visibility").

Insight with no upstream source is unsupported. Insight with no downstream connection is shelfware.
