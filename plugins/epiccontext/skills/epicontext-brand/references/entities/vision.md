# Vision

The **long-term anchor** — where this brand is going, why it matters, and what the world looks like when the brand has won. Vision is upstream of positioning, messaging, and product strategy; they all should point at it. Not a tagline; an opinionated statement about the future.

A real vision block makes a stakeholder say *"yes I believe that"* or *"no I think you're wrong"* — never *"sure, sounds fine."* A vision that nobody can disagree with isn't a vision; it's a platitude.

## Why most vision blocks are too thin

The classic failure: a single bromide ("Make the world better with technology") followed by nothing. That's marketing copy. A real vision names **what changes in the world**, **why now**, **what the brand specifically contributes**, and **the time horizon** by which the change is measurable.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Statement | "Make X better." | One paragraph: what specifically changes in the world; what the brand contributes; the time horizon. |
| Why now | absent | What shifted that makes this possible / urgent now. |
| What this brand contributes | absent | The specific role this brand plays (one player among many — name them). |
| Time horizon | absent | 5 / 10 / 25 years. Without a horizon there's no falsification. |
| Falsification | absent | "We were wrong if X happens by [date]." |
| Aligned positioning + messaging | absent | Linked positioning + messaging blocks should descend from this. |

## Depth checklist (BEFORE writing)

1. **One-paragraph statement** specific enough to disagree with.
2. **Why now** — what's shifted.
3. **What this brand contributes** vs. other players.
4. **Time horizon** named.
5. **Falsification condition** stated.
6. **Linked positioning** + messaging that descend from this.

## Push-back prompts (AFTER drafting)

- **"Could a stakeholder disagree?"** If no, it's a platitude — sharpen.
- **"Is the horizon named?"** A vision without a date can't be wrong, which means it can't be right.
- **"What does this brand specifically contribute?"** "Make X better" with no role-naming is a mission, not a vision.
- **"Does positioning agree?"** If positioning says one thing and vision says another, the conflict is the diagnosis.

## Evidence pool

- **Linked positioning + messaging** — should descend from this.
- **Linked product_strategy** — vision is upstream of strategy.
- **External signals** — market shifts, regulatory changes, technology curves that support "why now."

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default or one-line platitude. |
| **drafted** | Statement + why-now + contribution + horizon + falsification + linked positioning. ≥250 words. |
| **validated** | Drafted + ≥1 strategic decision (ADR or business_case) cites the vision as its anchor + ≥1 external market signal supports "why now." |

## Anti-patterns to refuse

- **The platitude.** "Empower humans through technology." Refuse.
- **The dateless vision.** No horizon = no falsification. Refuse.
- **The role-free vision.** Doesn't name what this brand specifically contributes. Refuse.
- **The disconnected vision.** Positioning/messaging contradict it silently. Flag the conflict.

## Output schema (markdown body)

```
### Statement
### Why now
### What this brand contributes
### Time horizon
### Falsification — what would prove us wrong
```

## Required connections (graph-level)

A drafted `vision` block must:

- Be referenced *by* the **positioning** block (positioning descends from vision).
- Be referenced *by* the **messaging** block.
- Be referenced *by* at least one **product_strategy** or **business_case** as the anchor.

A vision nothing descends from is decoration.
