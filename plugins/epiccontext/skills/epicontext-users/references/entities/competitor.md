# Competitor

A **named alternative the persona currently uses (or could use) instead of our product** — with their wedge, their gaps, our wedge against them, and the durability of that wedge. Not every player in the market; specifically the ones the persona evaluates.

A real competitor block lets a positioning decision land ("we wedge against X by Y") and feeds the business case's *competitive advantage* section.

## Why most competitor blocks are too thin

Classic failure: a name + a one-line description + "they're slower / more expensive." That's name-calling, not analysis. A real competitor block names what they do *well* (honest), where their wedge is, where ours is, and **how long that gap lasts**.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Name + category | "X is a tool." | Name + product category + target segment + pricing model. |
| Their wedge | "They're popular." | The specific thing they do well + why. |
| Their gaps | "Slower." | 3 honest gaps from the persona's perspective. |
| Our wedge against them | "We're better." | The specific axis we cut on + the durability ("until X happens"). |
| Strategic implication | absent | What this competitor changes about our strategy / roadmap. |
| Sources | absent | Public docs, comparison reviews, ex-customer conversations. Cited. |
| Threat trajectory | absent | Where this competitor is heading (recent funding, product launches, hires). |

## Depth checklist (BEFORE writing)

1. **Named target segment** (not "everyone").
2. **Their wedge stated honestly** — what they do *well*.
3. **3 gaps from the persona's perspective** (not from ours).
4. **Our wedge + durability window** — "we cut on X until Y happens."
5. **Strategic implication** — does this competitor force a roadmap shift?
6. **Sources cited** for any claim.
7. **Threat trajectory** — funding, launches, hires.
8. **Linked persona** + **linked product_strategy** (if our wedge is shaped by them).

## Small visual — positioning vs us

A small flow diagram showing where they wedge vs where we wedge, on the axes the persona evaluates.

````
~~~flow
title: [Competitor] vs us
direction: LR
nodes:
  - { id: persona, label: "Persona", role: person }
  - { id: comp, label: "[Competitor]", sub: "wedges on: [axis]", role: external }
  - { id: us, label: "Us", sub: "wedges on: [axis]", role: system }
  - { id: gap, label: "Gap we exploit", role: process }
edges:
  - { from: persona, to: comp, label: "currently uses for [X]" }
  - { from: persona, to: us, label: "switches for [Y]" }
  - { from: comp, to: gap, label: "doesn't cover" }
  - { from: gap, to: us, label: "we cover" }
~~~
````

Setup + narration: name the durability window honestly ("Gap lasts ~12 months until they likely ship X").

## Push-back prompts (AFTER drafting)

- **"Did I name what they do well?"** Refusing to acknowledge their strengths is positioning weakness. Force at least 2.
- **"Whose perspective are the gaps from?"** "They lack feature X" is from our perspective. "Sara skips them because their setup takes >1h" is the persona's. Use the persona's.
- **"How long does our wedge last?"** "Until they ship feature X" or "until they hire a product designer" — name the trigger.
- **"What forces a roadmap shift?"** If their next move doesn't change ours, why are we tracking them?
- **"Are claims cited?"** "They're expensive" without a pricing link is gossip.

## Evidence pool

- **Their public site, docs, pricing page.**
- **Independent comparison reviews / G2 / Capterra.**
- **Ex-customer conversations** — single most valuable signal.
- **Linked persona** — whose perspective on the gap?
- **Linked product_strategy** — does this competitor shape our bet?
- **Their changelog / Twitter / hiring** — threat trajectory.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (description + invented strengths/weaknesses). |
| **drafted** | All 8 checklist items present. ≥3 honest gaps with sources. Our wedge + durability window stated. ≥300 words. Linked persona. Small-visual positioning diagram. |
| **validated** | Drafted + ≥1 ex-customer conversation cited + threat trajectory dated within 3 months + product_strategy or business_case explicitly references this competitor. |

## Anti-patterns to refuse

- **The strawman competitor.** Only weaknesses listed, no strengths. Refuse.
- **The orphan competitor.** Not linked to persona or strategy. Why are we tracking them?
- **The vibes-only block.** Claims without sources. Force citations.
- **The "we're better" claim.** No specific axis, no durability window. Refuse.
- **The everyone-is-our-competitor block.** Force the persona-evaluated subset.

## Output schema (markdown body)

```
### Name + category + target segment
### Their wedge (honest)
### Their gaps (from the persona's view)
### Our wedge + durability window
### Strategic implication
### Threat trajectory
### Sources
### Positioning vs us
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `competitor` block must:

- Link **at least one persona** (whose perspective on the gap?).
- Be referenced *by* the **product_strategy_canvas** or **business_case** competitive-frame section.
- Optionally link **customer_insight** blocks (signals where this competitor lost to us or vice versa).

A competitor we don't reference in strategy or a business case isn't doing graph work.

## Likely-moves table (required at ≥ drafted)

Every `competitor` block at maturity ≥ `drafted` must include a
**Likely moves** table — ranked actions the rival could take in the
next 6–12 months that would affect our position. Each row:

| Move | Trigger (when this becomes likely) | Impact on us | Confidence (low / med / high) |
|---|---|---|---|

Without this, a competitor block is a static portrait that goes stale
the moment the rival ships anything. The likely-moves table forces the
analysis to be anticipatory rather than archival, ties into the
`war-gaming` methodology (under `epicontext-analysis`), and gives the
KPI architecture concrete early-warning signals to track.

Confidence is honest — most rows are *low* confidence with no cited
evidence; that's fine, it's a watch list. *Medium* requires at least
one cited signal (public statement, hiring pattern, product preview).
*High* requires explicit confirmation. Borrows the McKinsey
competitive-intel pattern: explain WHY the move is likely, not just
WHAT it might be.
