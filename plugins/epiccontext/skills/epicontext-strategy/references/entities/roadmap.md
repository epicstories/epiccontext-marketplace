# Roadmap

The **sequence of what gets built when** — phases, named items, the strategy each item serves, and the falsification condition that would re-prioritise. A roadmap is *not* a list of features; it's a sequenced bet anchored in strategy.

A real roadmap block links every item to a product_strategy or business_case, and is **dated honestly** (best/expected/worst).

## Why most roadmap blocks are too thin

Classic failure: "Now / Next / Later" with feature names. Generic, dateless, unanchored. A real roadmap names the strategy each item serves, the cost (engineer-weeks), the dependencies, and what evidence would re-prioritise.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Phases | "Now / Next / Later." | Named horizons with dates (Q3 2026 / H2 2026 / 2027). |
| Items per phase | Feature names only | Each item: name + strategy link + business_case link + cost (engineer-weeks) + dependencies + success criterion. |
| Cost summary | absent | Engineer-weeks per phase. Capacity check. |
| Dependencies | absent | Item-to-item dependencies + external dependencies. |
| Re-prioritisation trigger | absent | What signal would force a reshuffle. |
| Anti-roadmap | absent | What we deliberately defer (with reason). |

## Depth checklist (BEFORE writing)

1. **Phases dated** (not "Now / Next").
2. **Each item linked** to strategy + business_case.
3. **Cost in engineer-weeks** per item.
4. **Dependencies** named.
5. **Success criterion** per item.
6. **Anti-roadmap** — 3+ deferred items with reason.
7. **Re-prioritisation trigger** stated.

## Push-back prompts (AFTER drafting)

- **"Are the phases dated?"** "Now / Next / Later" is calendar-free; force dates.
- **"What does each item cost?"** Without engineer-weeks, capacity is unknowable.
- **"Which item serves which strategy?"** Unmoored items = drift between roadmap and strategy.
- **"What did we defer and why?"** Anti-roadmap clarifies focus.
- **"What would change the order?"** Static roadmaps decay.

## Evidence pool

- **Linked product_strategy** + **business_case** blocks.
- **Existing feature blocks** — what's already shipped or in flight.
- **OGSM measures** — which roadmap items move which measure.
- **Capacity estimate** — engineer-weeks available per phase.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (empty timeline). |
| **drafted** | Phases dated + items with cost + linked strategy + dependencies + success criteria + anti-roadmap + re-prio trigger. ≥500 words. |
| **validated** | Drafted + last review within cadence + ≥1 completed item with retro vs. estimate + capacity vs. cost reconciled. |

## Anti-patterns to refuse

- **The Now/Next/Later roadmap.** Force dates.
- **The cost-free roadmap.** Force engineer-weeks.
- **The strategy-unmoored roadmap.** Force linked strategy per item.
- **The roadmap-without-anti-roadmap.** Force deferred-with-reason.

## Output schema (markdown body)

Use the **timeline shape** convention — H2 per phase with markdown table of items.

```
## Q3 2026
| Item | Strategy | Cost (eng-wk) | Dependencies | Success criterion |
|---|---|---|---|---|

## H2 2026
| ... |

### Anti-roadmap (deferred + reason)
### Re-prioritisation trigger
```

## Required connections (graph-level)

A drafted `roadmap` block must:

- Link **product_strategy_canvas** + **≥1 business_case**.
- Link **≥3 feature** blocks (the items being built).
- Be referenced *by* the **ogsm** (strategies pursuing goals).

Roadmap with no business_case link bypasses justification.
