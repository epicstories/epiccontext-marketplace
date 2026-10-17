# OGSM (Objectives, Goals, Strategies, Measures)

The **cascade from qualitative ambition to quantitative result** — Objectives (qualitative ambitions), Goals (quantified outcomes), Strategies (chosen approaches), Measures (instruments tracking progress). A real OGSM lets a stakeholder say *"are we on track?"* and get a number.

A real OGSM block links each Goal to the strategy it tests, each Measure to the goal it instruments, and refuses unmeasured goals or strategyless goals.

## Why most OGSM blocks are too thin

The classic failure: 1 objective, 3 vague goals, 2 strategies, no measures. The cascade breaks where measurement should start. A real OGSM has **quantified goals**, **measures with current value + target + cadence**, and **strategies that link to real product_strategy / business_case blocks**.

## The depth bar

| Layer | Stub | Drafted |
|---|---|---|
| Objectives | "Grow." | 1–3 qualitative ambitions tied to vision. Time-bounded (this year / this quarter). |
| Goals | "Get more users." | Quantified outcomes per objective: number + by-when + how-measured. |
| Strategies | "Marketing + product." | Linked product_strategy + business_case blocks that pursue each goal. |
| Measures | absent | Per measure: current value + target + cadence + owner. Tied to one goal. |

## Depth checklist (BEFORE writing)

1. **Objectives** tied to vision, time-bounded.
2. **Goals quantified** (number + by-when).
3. **Strategies linked** to product_strategy / business_case blocks.
4. **Measures** with current value + target + cadence + owner.
5. **Review cadence** stated.
6. **Linked vision** + product_strategy.

## Small visual — OGSM cascade

The OGSM is inherently hierarchical. A small tree-shaped flow makes it scannable.

````
~~~flow
title: OGSM cascade
direction: TB
nodes:
  - { id: o, label: "Objective: [ambition]", role: system }
  - { id: g1, label: "Goal 1: [number by date]", role: container }
  - { id: g2, label: "Goal 2: [number by date]", role: container }
  - { id: s1, label: "Strategy: [linked product_strategy]", role: component }
  - { id: m1, label: "Measure: [metric]", sub: "current → target · cadence", role: external }
edges:
  - { from: o, to: g1 }
  - { from: o, to: g2 }
  - { from: g1, to: s1, label: "pursued by" }
  - { from: g1, to: m1, label: "tracked by" }
~~~
````

Setup + narration: name the goals that aren't yet measured (open gaps).

## Push-back prompts (AFTER drafting)

- **"Is every goal quantified?"** "Get more users" isn't. "+50 paying users by Q4" is.
- **"Is every measure instrumented?"** Without current + target + cadence, the measure is aspirational.
- **"Does each strategy link to a real block?"** Strategy without product_strategy_canvas link is decoration.
- **"Who owns each measure?"** Unowned measures aren't tracked.

## Evidence pool

- **Linked vision** (objectives descend from vision).
- **Linked product_strategy + business_case** (strategies).
- **Linked KPI / analytics_event blocks** (measures).
- **Existing dashboards / reports** — current measure values.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (empty cascade). |
| **drafted** | 1–3 objectives + quantified goals + linked strategies + measures with current/target/cadence/owner + linked vision. ≥400 words. Cascade diagram. |
| **validated** | Drafted + ≥1 quarter of measure data + ≥1 strategy-shipped milestone + last review dated within cadence. |

## Anti-patterns to refuse

- **The unmeasured goal.** "Grow user base." Refuse — quantify.
- **The strategyless goal.** Goal with no linked strategy block. Refuse.
- **The unowned measure.** Refuse — name an owner.
- **The static OGSM.** Last reviewed > cadence ago. Flag as drift.

## Output schema (markdown body)

```
### Objective(s)
### Goals (quantified)
### Strategies (linked)
### Measures (current → target, cadence, owner)
### Review cadence
### OGSM cascade
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `ogsm` block must:

- Link **vision**.
- Link **≥1 product_strategy_canvas** + **≥1 business_case** as strategies.
- Link **≥1 kpi** block per measure.

OGSM with no measures is a wish list.
