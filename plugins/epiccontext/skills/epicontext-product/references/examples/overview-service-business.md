# Example: Overview for Hybrid Service Business

A product overview for a wellness service business, demonstrating how overview ties to Users group (persona, JTBD) and bounds the product without listing features.

```yaml
id: overview
type: product_overview
maturity: drafted
last_reviewed: 2026-04-30

elevator_line: "A booking and management platform that helps recurring wellness customers maintain a regular practice with the therapist they trust, without the friction of marketplace platforms or the unreliability of independent providers."

primary_persona: persona-recovering-rachel
primary_jtbd: jtbd-recurring-maintenance
differentiating_approach: "Provider-continuity-first: every booking flow surface treats the therapist relationship as the primary unit, with services as secondary. We don't try to maximize provider variety; we make the relationship reliable."

capability_map:
  - capability: "Therapist-relationship booking"
    features: [feature-therapist-specific-booking, feature-therapist-profiles, feature-rebook-with-same]
  - capability: "Predictable scheduling"
    features: [feature-recurring-bookings, feature-availability-notifications]
  - capability: "Transparent pricing"
    features: [feature-no-hidden-fees, feature-package-clarity]
  - capability: "Customer continuity"
    features: [feature-treatment-history, feature-preferences-memory]

bounds:
  - "We don't run a marketplace — only direct relationships with our own therapists"
  - "We don't do same-day bookings (operational decision tied to quality bar)"
  - "We don't sell wellness products beyond gift vouchers"
  - "We don't offer in-home services"
  - "We don't operate beyond 3 locations (wife's quality ceiling — first-class constraint)"

secondary_personas:
  - persona-gift-purchaser  # buying a gift voucher for someone else
secondary_jtbds:
  - jtbd-find-trusted-provider  # for new customers without an existing relationship

linked_strategy: strategy-service-led-quality
linked_features:
  - feature-therapist-specific-booking
  - feature-therapist-profiles
  - feature-rebook-with-same
  - feature-recurring-bookings
  - feature-availability-notifications
  - feature-no-hidden-fees
  - feature-package-clarity
  - feature-treatment-history
  - feature-preferences-memory
```

## What this example demonstrates

**The elevator line is one sentence and answers four questions.** Who it's for ("recurring wellness customers"), what they want ("maintain a regular practice"), what's distinctive ("with the therapist they trust"), and what's not ("without the friction of marketplace platforms or the unreliability of independent providers"). If you can't say all four in one sentence, the team doesn't yet agree on what the product is.

**Bounds are concrete and defensible.** "Max 3 locations" isn't aspirational restraint — it's tied to a specific constraint (quality ceiling). "No same-day booking" connects to operational quality. "No marketplace" is a positioning choice, not just a missing feature.

**Capability map groups, doesn't list.** Four capability areas, each containing 2-4 features. This makes the product's shape visible without drowning the reader in details.

**Differentiating approach is verbal, not numerical.** "Provider-continuity-first" describes a design principle. It's clear enough to be testable in any feature decision: does this feature reinforce continuity or undermine it?

## How to adapt

For your product:
1. Pick ONE primary persona and ONE primary JTBD. Resist secondaries until the primary is solid.
2. Write the differentiating approach as a sentence describing how — not what.
3. Group features into 3-7 capability areas.
4. Make exclusions ("does not do") at least as explicit as inclusions.
5. Tie back to strategy in Strategy group.

## Sources

- April Dunford — *Obviously Awesome* — positioning fundamentals
- Geoffrey Moore — *Crossing the Chasm* — positioning statement template
