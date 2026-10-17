# Feature

A **specific capability** of the product — what it does, who hires it, how it works, where in the prototype it lives, and what its success metric is. A feature block is the bridge between *jobs* (why it exists) and *content_pages / journeys* (where it shows up).

A real feature block lets a developer build it, a designer test it, and an AI client predict where it appears in the journey.

## Why most feature blocks are too thin

Classic failure: a name + a one-line description + "users will love it." Generic, jobless, success-criterion-free. A real feature names the **persona hiring it**, **the JTBD it serves**, **the mechanism** (how it actually works), and **the success metric**.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Name + summary | "Search." | One sentence + the persona-visible value. |
| Persona + JTBD | unlinked | Linked persona + linked JTBD this feature serves. |
| Mechanism | "It searches." | The actual mechanism — what triggers it, what it does, what it returns. |
| User-facing copy | absent | Key labels / CTAs / empty states — references glossary terms. |
| Pages it appears on | absent | Linked content_page blocks where the feature renders. |
| Journey steps it touches | absent | Linked journey step routes. |
| Success metric | absent | What KPI / analytics_event measures whether it works. |
| Status | "draft" | proposed / in-build / shipped / deprecated, with date. |

## Depth checklist (BEFORE writing)

1. **Linked persona + JTBD.**
2. **Mechanism** specific enough to disagree with.
3. **User-facing copy** drafted (with glossary refs).
4. **Linked content_pages + journey steps.**
5. **Success metric** linked (KPI / analytics_event).
6. **Status + date.**
7. **Linked decision (ADR)** if the feature reflects a non-trivial choice.

## Small visual — feature flow

A small flow showing user → trigger → feature → outcome.

````
~~~flow
title: Feature flow
direction: LR
nodes:
  - { id: persona, label: "Persona", role: person }
  - { id: page, label: "content_page", sub: "/[slug]", role: container }
  - { id: trigger, label: "User trigger", role: start }
  - { id: feature, label: "[Feature mechanism]", role: process }
  - { id: outcome, label: "Outcome", sub: "tracked by [metric]", role: end }
edges:
  - { from: persona, to: page, label: "visits" }
  - { from: page, to: trigger }
  - { from: trigger, to: feature }
  - { from: feature, to: outcome }
~~~
````

Setup + narration: name the empty / error states.

## Push-back prompts (AFTER drafting)

- **"Which JTBD does this serve?"** Featureless features are decoration.
- **"Where does it appear?"** Without content_page links, the prototype can't render it.
- **"How do we know it works?"** Force a linked metric.
- **"What's the empty state?"** Most features die in their empty state.
- **"Does this match the existing journey?"** Cross-check.

## Evidence pool

- **Linked persona + JTBD.**
- **Linked content_pages + journey steps.**
- **Linked glossary** for user-facing copy.
- **Linked metric / analytics_event** for success.
- **Code references** — `app/` files that implement the feature.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder description). |
| **drafted** | Mechanism + linked persona + JTBD + ≥1 content_page + ≥1 journey step + success metric + status. ≥300 words. Feature-flow diagram. |
| **validated** | Drafted + shipped in production + metric has ≥30 days of data + ≥1 customer_insight or feedback block confirms the outcome. |

## Anti-patterns to refuse

- **The jobless feature.** No linked JTBD. Refuse.
- **The page-less feature.** No content_page links. Force them.
- **The metric-less feature.** Force a success measure.
- **The empty-state-blind feature.** Most features fail here; design it.

## Output schema (markdown body)

```
### Summary + persona-visible value
### Persona + JTBD it serves
### Mechanism (how it works)
### User-facing copy (CTAs, labels, empty states)
### Where it appears (pages + journey steps)
### Success metric
### Status
### Feature flow
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `feature` block must:

- Link **the persona** hiring it.
- Link **the JTBD** it serves.
- Link **≥1 content_page** where it renders.
- Link **≥1 metric / analytics_event** measuring success.

A feature without a JTBD is a hobby project.
