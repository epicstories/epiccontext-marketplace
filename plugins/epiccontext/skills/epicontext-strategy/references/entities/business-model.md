# Business Model

The **Business Model Canvas** — how this brand creates value, delivers it, and captures some. Nine zones (customer segments, value propositions, channels, customer relationships, revenue streams, key resources, key activities, key partnerships, cost structure). A real business model block fills each with named, sourced, falsifiable claims.

A real BMC block is what a partner / investor / new hire reads to understand *how the business actually works* in 5 minutes.

## Why most BMC blocks are too thin

The classic failure: 2 bullets per zone, generic claims, no unit economics, no named customer segment. That's a slide template. A real BMC names the **specific segments**, the **unit economics direction**, the **named channels with conversion rates**, and the **specific partnerships** that matter.

## The depth bar

| Zone | Stub | Drafted |
|---|---|---|
| Customer segments | "SMBs." | Linked primary persona + secondary segments named, with size estimate per segment. |
| Value propositions | "Save time." | The mechanism per segment, linked to messaging block. |
| Channels | "Web + sales." | Named channels with current acquisition cost + conversion rate (or "to measure"). |
| Customer relationships | "SaaS support." | Onboarding model + retention model + expansion model. |
| Revenue streams | "Subscription." | Pricing model + tier structure + unit economics direction. |
| Key resources | "Team + product." | The specific assets that compound (skill base, customer data, brand). |
| Key activities | "Build product." | The 3–5 things this team must do well to win. |
| Key partnerships | "Vendors." | Named partners + what each gives + dependency risk. |
| Cost structure | "Salaries + infra." | Structural vs variable + spend by line + scale drivers. |

## Depth checklist (BEFORE writing)

1. **Each of 9 zones** substantively filled (not bullets).
2. **Linked persona** as primary customer segment.
3. **Named channels with conversion/acquisition numbers** (or "to measure").
4. **Pricing tiers + unit economics direction.**
5. **Named partnerships with dependency assessment.**
6. **Cost structure** with scale drivers.
7. **Linked product_strategy** + **business_case** blocks.

## Push-back prompts (AFTER drafting)

- **"Is the customer segment a persona or a category?"** "SMBs" is a category. Link a persona.
- **"What's the unit economic direction?"** Without LTV/CAC direction, the model isn't financial.
- **"Who's the riskiest partner?"** If a partner going away kills the model, name it.
- **"What scales with usage?"** Without scale drivers, the cost structure is static.
- **"Does this agree with product_strategy?"** Strategy says where, BMC says how money flows. Both must agree.

## Evidence pool

- **Linked primary persona + competitor blocks.**
- **Linked product_strategy + business_case** — should agree.
- **Linked tech_stack + infrastructure** — informs cost structure.
- **External benchmarks** — comparable companies' unit economics.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (empty canvas). |
| **drafted** | All 9 zones substantively filled. Linked persona + competitors + strategy + business_case. Unit econ direction stated. ≥500 words. |
| **validated** | Drafted + ≥1 quarter of actual revenue + cost data + ≥1 unit econ number (LTV, CAC, payback) measured + partnerships in place. |

## Anti-patterns to refuse

- **The slide-template BMC.** Bullets per zone, no specifics.
- **The category-segment.** No linked persona.
- **The unit-econ-free model.** No LTV/CAC direction.
- **The partner-free model.** Real businesses depend on partners; name them.
- **The disconnected BMC.** Doesn't agree with product_strategy.

## Output schema (markdown body)

Use the **canvas shape** convention — H2 per zone, bullets under each.

```
## Customer Segments
## Value Propositions
## Channels
## Customer Relationships
## Revenue Streams
## Key Resources
## Key Activities
## Key Partnerships
## Cost Structure
```

## Required connections (graph-level)

A drafted `business_model_canvas` block must:

- Link **the primary persona** (customer segment).
- Link **product_strategy_canvas** + **business_case** (they should agree).
- Link **≥2 competitor** blocks (frame of reference).
- Optionally link **tech_stack** + **infrastructure** (informs cost structure).

A BMC that contradicts the strategy means one is wrong.
