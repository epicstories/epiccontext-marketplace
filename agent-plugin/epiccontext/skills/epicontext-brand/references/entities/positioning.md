# Positioning

The **place this brand occupies in the customer's mind** relative to alternatives. Positioning is the answer to *"of the X options the persona is considering, why this one, on which axes?"*

A real positioning block names the **frame of reference** (which category we're competing in), **the persona we're positioning for**, **the differentiation axes**, and **the proof points** that make the position credible.

## Why most positioning blocks are too thin

The classic failure: a value-prop sentence + "we're better/faster/cheaper" + no axes named. That's a tagline. A real positioning block names *which competitors we're against*, *what axis differentiates*, and *why the persona would believe us*.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Frame of reference | "We're a SaaS." | The category the persona evaluates us in (named alternatives in the same category). |
| Target persona | absent | Linked primary persona — positioning is always *for* someone. |
| Differentiation axes | "Better." | 2–3 axes we differentiate on, named in the persona's vocabulary. |
| Proof points | absent | Why the persona would believe the differentiation — features, customers, founders, metrics. |
| Position statement | absent | "For [persona] who [need], [brand] is [category] that [diff] unlike [alternative] which [limit]." |
| Anti-positions | absent | What we are NOT (filters wrong customers out). |

## Depth checklist (BEFORE writing)

1. **Frame of reference** with named alternatives.
2. **Linked persona** — for whom?
3. **2–3 differentiation axes** in persona vocabulary.
4. **Proof points** per axis.
5. **One-sentence position statement** (For X who Y, brand is Z…).
6. **2+ anti-positions.**
7. **Linked vision + messaging.**

## Small visual — positioning map

A small flow diagram showing where this brand sits vs. alternatives on the persona's axes.

````
~~~flow
title: Positioning vs alternatives
direction: LR
nodes:
  - { id: persona, label: "Persona", role: person }
  - { id: us, label: "Us", sub: "axis: [X high]", role: system }
  - { id: a1, label: "Alternative A", sub: "axis: [X low]", role: external }
  - { id: a2, label: "Alternative B", sub: "axis: [Y]", role: external }
edges:
  - { from: persona, to: us, label: "chooses for [X]" }
  - { from: persona, to: a1, label: "abandons for [reason]" }
  - { from: persona, to: a2, label: "considered but not chosen" }
~~~
````

Setup + narration explaining the axis trade-off.

## Push-back prompts (AFTER drafting)

- **"What category am I in?"** Without a frame, the position is unmoored.
- **"Could the persona repeat my position back?"** If no, it's not positioned for them.
- **"What's the proof?"** Differentiation without evidence is wishful.
- **"What am I NOT?"** Anti-positions filter wrong customers; without them, the brand attracts everyone (and serves none).
- **"Does this agree with vision?"** Conflict between vision and positioning means one is wrong.

## Evidence pool

- **Linked vision** — positioning descends from vision.
- **Linked primary persona + competitor blocks** — defines the frame.
- **Linked messaging** — articulates the positioning.
- **Customer_insight blocks** — confirm whether positioning lands.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder phrases). |
| **drafted** | Frame + linked persona + 2–3 axes + proof points + statement + ≥2 anti-positions + linked vision. ≥400 words. Positioning-map diagram. |
| **validated** | Drafted + ≥1 customer_insight or research block validates the persona believes the position + messaging block consistent + ≥1 win/loss interview cited. |

## Anti-patterns to refuse

- **The tagline-as-positioning.** Catchy line, no frame, no axes. Refuse.
- **The everyone-positioning.** No anti-positions; serves all personas. Refuse.
- **The proof-free positioning.** "We're better" with no evidence. Refuse.
- **The category-free positioning.** No frame of reference. Refuse.

## Output schema (markdown body)

```
### Frame of reference (category + alternatives)
### Target persona
### Differentiation axes
### Proof points
### Position statement
### Anti-positions (what we are NOT)
### Positioning map
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `positioning` block must:

- Link **vision** (positioning descends from vision).
- Link **the primary persona**.
- Link **≥2 competitor** blocks (the frame of reference).
- Be referenced *by* the **messaging** block.

Positioning with no persona link is unmoored.
