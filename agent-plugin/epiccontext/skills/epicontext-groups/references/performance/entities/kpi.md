# KPI

A **measurable indicator** of progress toward a goal — name, definition, current value, target, cadence, owner, and the strategic bet it instruments. KPIs cascade: a north-star KPI sits above driver KPIs which sit above input metrics.

A real KPI block names where in the cascade it sits, the strategy it instruments, and the **falsification condition** — the value that would force a strategy review.

## Why most KPI blocks are too thin

Classic failure: a metric name + a number. No definition (is "active user" weekly or monthly?), no target, no cadence, no owner. A real KPI is **operational** — anyone reading it can replicate the calculation.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Name | "Active users." | Specific name + cascade position (north star / driver / input). |
| Definition | absent | Calculation method, time window, edge cases. |
| Current value | absent | Latest measurement + date. |
| Target | absent | Number + by-when + how derived. |
| Cadence | absent | How often measured + reviewed. |
| Owner | absent | Who watches. |
| Strategy it instruments | absent | Linked product_strategy / business_case / OGSM goal. |
| Falsification | absent | What value would force a strategy review. |

## Depth checklist (BEFORE writing)

1. **Definition** unambiguous.
2. **Cascade position** named.
3. **Current + target + cadence + owner.**
4. **Linked strategy / OGSM goal.**
5. **Falsification threshold.**
6. **Linked analytics_event** that instruments the KPI.

## Small visual — KPI cascade

A small flow showing how this KPI relates upward (north-star) and downward (input metrics).

````
~~~flow
title: KPI cascade
direction: TB
nodes:
  - { id: ns, label: "North-star KPI", role: system }
  - { id: this, label: "[This KPI]", sub: "driver", role: container }
  - { id: i1, label: "Input metric 1", role: component }
  - { id: i2, label: "Input metric 2", role: component }
  - { id: ev1, label: "analytics_event", role: external }
edges:
  - { from: this, to: ns, label: "moves" }
  - { from: i1, to: this, label: "drives" }
  - { from: i2, to: this, label: "drives" }
  - { from: ev1, to: i1, label: "instruments" }
~~~
````

Setup + narration: name the input metrics and which features influence them.

## Push-back prompts (AFTER drafting)

- **"Could two analysts compute this the same way?"** If no, definition is ambiguous.
- **"What's the target derivation?"** Pulled from where? OGSM goal? Comparable benchmark?
- **"What would force a strategy review?"** Without falsification, the KPI is a wall display.
- **"Where's the upstream signal?"** Linked analytics_event.

## Evidence pool

- **Linked OGSM goal + product_strategy + business_case.**
- **Linked analytics_event** instrumenting it.
- **Existing dashboards.**
- **External benchmarks** for target derivation.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder name). |
| **drafted** | Definition + cascade position + current + target + cadence + owner + linked strategy + falsification + linked analytics_event. ≥300 words. Cascade diagram. |
| **validated** | Drafted + ≥1 quarter of data + last review within cadence + ≥1 decision influenced by the KPI. |

## Anti-patterns to refuse

- **The ambiguous KPI.** Force the calculation.
- **The targetless KPI.** "Track active users" is monitoring, not a KPI.
- **The unowned KPI.** Refuse.
- **The free-floating KPI.** No linked strategy.

## Output schema (markdown body)

```
### Name + cascade position
### Definition (calculation, window, edge cases)
### Current value + date
### Target + by-when + derivation
### Cadence + owner
### Strategy it instruments
### Falsification — what value would force a review
### KPI cascade
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `kpi` block must:

- Link **OGSM goal** OR **product_strategy** OR **business_case**.
- Link **≥1 analytics_event** instrumenting it.
- Optionally be referenced *by* **customer_insight** blocks.

A KPI with no upstream instrumentation is a wish.
