# Example: Services-Led Strategy

A strategy for a services-led product business — relevant for Epic Context's own posture and for client engagements that follow a similar shape.

```yaml
id: strategy-services-led-quality
type: strategy
maturity: drafted
last_reviewed: 2026-04-30
review_cadence: quarterly

bet: "We will become the trusted recurring-treatment provider for working professionals in the Randstad by winning on provider continuity and quality consistency, capping at 3 locations through 2027."

audience:
  primary_persona: persona-recovering-rachel
  primary_jtbd: jtbd-recurring-maintenance

mechanism:
  description: "Provider-continuity-first booking + quality ceiling at 3 locations + transparent pricing without upsell pressure. Customers stay because the same therapist remembers them, the experience is consistent, and there's no pressure tactics."
  proof_points:
    - "Q1 2026 customer research shows provider continuity as #1 hiring criterion"
    - "Premium chains (large, multi-location) lose customers exactly on this dimension"
    - "Single independent therapists win on continuity but lose on booking convenience — gap we fill"

timeframe:
  current_horizon: "2026-2027"
  judgment_moment: "End of 2027 — rebook rate, customer retention, profitability per location"

declined:
  markets:
    - "International expansion (out of scope through 2027)"
    - "Same-day booking market (operational quality cost too high)"
  segments:
    - "One-off luxury / event customers (different product, different brand)"
    - "Pure functional / cheap massage segment (race to bottom)"
  capabilities:
    - "Marketplace model with third-party therapists"
    - "Subscription / membership model (currently — under review for 2027)"
    - "Mobile in-home services"

assumptions:
  - assumption: "Provider continuity matters more than convenience to our segment"
    test: "Switch interviews show this consistently in 2026 Q1 research"
    confidence: high
  - assumption: "3-location quality ceiling is sustainable and operationally viable"
    test: "Operational data on first location's quality stability over time"
    confidence: medium
  - assumption: "Referral-driven acquisition stays dominant as we approach 3 locations"
    test: "Channel mix tracking quarterly"
    confidence: medium
  - assumption: "Customers will pay slight premium for consistency"
    test: "Price elasticity testing; current data shows tolerance"
    confidence: medium

linked_business_model: business-model-hybrid-service
linked_ogsm: ogsm-2026
linked_overview: overview
linked_personas: [persona-recovering-rachel, persona-first-time-customer, persona-gift-purchaser]
linked_jtbds: [jtbd-recurring-maintenance, jtbd-find-trusted-provider]

next_review: 2026-08-01
```

## What this example demonstrates

**The bet is one sentence.** "We will become X by Y within Z." If the bet sentence is missing pieces, the strategy is missing thinking.

**Mechanism is specific.** "Provider continuity + quality ceiling + transparent pricing" — three concrete things, not "be the best." Each is testable.

**Declined items are explicit.** Markets, segments, capabilities not pursued. This is what makes it a strategy rather than a description of ambition.

**Assumptions are named with confidence.** Each assumption has a test and a confidence level. This makes the strategy falsifiable — there's a clear way to know it's wrong.

## How to adapt

Things that travel:
- Bet-as-one-sentence with audience, mechanism, timeframe
- Explicit declined section
- Assumptions with tests and confidence

Things specific to this example:
- The "3 locations" cap (specific to this business)
- The Randstad geography
- The provider-continuity mechanism

## Common adaptations

**For SaaS startups:**
- Mechanism shifts to product-led growth, vertical specialization, integration moat, etc.
- Timeframe usually shorter (12-18 months)
- Declined often includes "not building feature X that competitors have"

**For services-led consultancies:**
- Mechanism is method/IP/team capability
- Timeframe often 2-3 years
- Declined includes engagement types not pursued (transformation programs vs. discrete projects)

## Sources

- Porter, *What is Strategy?* — strategy as choices
- Martin, *Playing to Win* — cascade of choices
- Rumelt, *Good Strategy / Bad Strategy* — diagnosis, guiding policy, coherent action
- EVD-STR-001, EVD-STR-002, EVD-STR-003
