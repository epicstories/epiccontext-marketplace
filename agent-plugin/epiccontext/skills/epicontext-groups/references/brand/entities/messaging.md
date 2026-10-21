# Messaging

The **architecture of what the brand says** — elevator pitch, value propositions, supporting proof, and the audience-specific framing (executive / practitioner / end-user) of each. Messaging descends from vision + positioning + tone, and feeds every customer-facing surface.

A real messaging block is **operational** — a copywriter or AI can pick any audience + context and find the right line to use, with the proof point that backs it up.

## Why most messaging blocks are too thin

The classic failure: an elevator pitch + 3 generic benefits. That's a homepage skeleton, not a messaging architecture. A real block names the **proof point per claim**, the **audience-specific phrasing**, and the **anti-claims** (what we never say).

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Elevator pitch | "We help X do Y." | One sentence + the unique mechanism, in the persona's voice. |
| Value propositions | "Faster, better, cheaper." | 3–5 named claims, each with: the audience it lands for + the proof point + the anti-claim it replaces. |
| Proof points | absent | Per claim: features, customer quotes, metrics, public references. |
| Audience-specific framing | absent | Same value prop reworded for executive / practitioner / end-user. |
| Anti-claims | absent | Claims we never make (filters out wrong positioning). |
| Boilerplate | absent | The one-paragraph brand description used in press / partner docs. |

## Depth checklist (BEFORE writing)

1. **Elevator pitch** specific, persona-voiced.
2. **3–5 value props** with proof per claim.
3. **Audience-specific framing** for each (exec / practitioner / end-user).
4. **Anti-claims** named.
5. **Boilerplate** drafted.
6. **Linked vision + positioning + tone.**

## Small visual — messaging architecture

A small flow showing how messaging cascades from vision → positioning → claims → audience-specific lines.

````
~~~flow
title: Messaging architecture
direction: TB
nodes:
  - { id: v, label: "Vision", role: external }
  - { id: pos, label: "Positioning", role: container }
  - { id: pitch, label: "Elevator pitch", role: component }
  - { id: vp1, label: "Value prop 1", role: component }
  - { id: vp2, label: "Value prop 2", role: component }
  - { id: exec, label: "Exec framing", role: process }
  - { id: prac, label: "Practitioner framing", role: process }
edges:
  - { from: v, to: pos, label: "anchors" }
  - { from: pos, to: pitch }
  - { from: pos, to: vp1 }
  - { from: pos, to: vp2 }
  - { from: vp1, to: exec }
  - { from: vp1, to: prac }
~~~
````

Setup + narration explaining the cascade.

## Push-back prompts (AFTER drafting)

- **"What's the proof?"** Claims without proof are slogans. Force one proof per claim.
- **"How does this land for a practitioner vs. an executive?"** Without per-audience framing, the messaging is generic.
- **"What do we never say?"** Without anti-claims, messaging drifts toward whatever the writer feels.
- **"Does the boilerplate match?"** A messaging block without a usable one-paragraph description is missing the most-reused asset.
- **"Does it agree with vision + positioning?"** If the elevator pitch contradicts the position, one is wrong.

## Evidence pool

- **Linked vision + positioning + tone.**
- **Live copy** — what's already on the marketing site / in onboarding.
- **Customer quotes** — proof points.
- **Press releases / partner descriptions** — boilerplate sources.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder pitch + bullets). |
| **drafted** | All checklist items + ≥3 value props with proof + per-audience framing + anti-claims + boilerplate + cascade diagram. ≥500 words. |
| **validated** | Drafted + ≥1 piece of live marketing copy aligned + ≥1 partner / press use of the boilerplate. |

## Anti-patterns to refuse

- **The slogan-only messaging.** Catchy lines, no proof.
- **The generic value props.** "Faster / better / cheaper" with no axis.
- **The single-audience messaging.** Only the founder's voice; doesn't translate.
- **The contradictory messaging.** Disagrees with vision or positioning.

## Output schema (markdown body)

```
### Elevator pitch
### Value propositions (claim + audience + proof + anti-claim)
### Audience-specific framing (exec / practitioner / end-user)
### Anti-claims
### Boilerplate
### Messaging architecture
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `messaging` block must:

- Link **vision** + **positioning** + **tone_of_voice**.
- Be referenced *by* at least one **content_page** (marketing landing) and the **product_overview** value-prop line.

Messaging with no live page referencing it is unused.
