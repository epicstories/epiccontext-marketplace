# Example: Three Competitor Types for One JTBD

Direct + substitute + indirect competitors for the same JTBD. Demonstrates JTBD-framed competitive analysis and shows why "doing nothing" is often the most dangerous competitor.

## Competitor 1 — Direct (premium chain)

```yaml
id: competitor-premium-chain-x
type: competitor
maturity: drafted
name: "PremiumChain X"
url: https://...
last_reviewed: 2026-04-15
competitive_type: direct
hired_for_jtbd: [jtbd-recurring-maintenance]
target_personas: [persona-recovering-rachel]
positioning:
  stated: "Premium massage and wellness, every visit perfect"
  inferred: "Operational consistency at scale; same experience whether you're in Amsterdam or Rotterdam"
business_model: subscription_and_walk_in
pricing:
  - tier: "Member"
    price: "€85/visit (with €19/mo membership)"
  - tier: "Walk-in"
    price: "€110/visit"
key_features_for_jtbd:
  - feature: "Booking app with locations across NL"
    quality: strong
  - feature: "Therapist selection at booking"
    quality: weak
  - feature: "Membership program"
    quality: strong
  - feature: "Provider continuity"
    quality: weak
strengths_for_jtbd:
  - "Easy to book, broad availability"
  - "Trusted brand, fewer concerns about quality on first visit"
  - "Clear pricing, no surprises"
weaknesses_for_jtbd:
  - "Provider-agnostic experience — Rachel's preference for one therapist is unmet"
  - "Atmosphere skews commercial / spa-like, not professional / clinical"
  - "Up-sell pressure on additional services and product"
switching_cost:
  level: low
customer_signals:
  - source: google_reviews
    sentiment: mixed_positive
    summary: "Praised for consistency and convenience; criticized for feeling impersonal"
  - source: reddit_wellness_thread
    summary: "Often described as 'the Starbucks of massage' — reliable but not memorable"
strategic_moves:
  - date: 2026-02-01
    event: "Launched a higher-tier membership with provider preferences"
    implication: "Acknowledging the provider-continuity gap"
our_positioning_relative:
  win_on: "Provider continuity, professional rather than commercial atmosphere"
  lose_on: "Number of locations, brand recognition, marketing reach"
  avoid_comparison: "Don't position as 'the cheaper alternative'"
evidence_sources: [research-asana-2026-q1, insight-rachel-on-provider-continuity]
```

## Competitor 2 — Substitute (independent therapists)

```yaml
id: competitor-independent-therapists
type: competitor
maturity: drafted
name: "Independent therapists (category, not single brand)"
competitive_type: substitute
hired_for_jtbd: [jtbd-recurring-maintenance]
target_personas: [persona-recovering-rachel]
positioning:
  stated: "Personal, trusted, often word-of-mouth"
  inferred: "Relationship-driven, the way most people found a therapist before chains existed"
business_model: pay_per_visit_cash_or_invoice
pricing:
  - tier: "Standard"
    price: "€60-90/visit (varies)"
key_features_for_jtbd:
  - feature: "Provider continuity"
    quality: strong
  - feature: "Personal relationship over time"
    quality: strong
  - feature: "Booking convenience"
    quality: weak
strengths_for_jtbd:
  - "Maximum provider continuity (always the same person)"
  - "Often longer appointments, less rushed"
  - "Personal recommendation networks build strong trust"
  - "Pricing usually below chain prices"
weaknesses_for_jtbd:
  - "Booking is usually manual and high-friction"
  - "If the therapist gets sick or leaves, no fallback"
  - "Limited availability; popular ones book weeks ahead"
  - "Rachel can't easily find one without a referral"
switching_cost:
  level: high
  drivers: ["personal relationship, hard to leave"]
strategic_moves:
  - date: ongoing
    event: "Some independents joining marketplaces (e.g., Treatwell) but losing the personal feel"
    implication: "Structural gap: independents who want booking convenience without losing personal feel"
our_positioning_relative:
  win_on: "Booking convenience, fallback if a therapist is unavailable, professional environment"
  lose_on: "Maximum personal relationship — chain-of-one beats us"
  avoid_comparison: "Don't try to be more personal than a single dedicated therapist; aim for 'almost as personal, much easier to manage'"
evidence_sources: [research-asana-2026-q1]
```

## Competitor 3 — Indirect (doing nothing / DIY)

```yaml
id: competitor-self-care-default
type: competitor
maturity: drafted
name: "Self-care + doing nothing (the do-it-yourself default)"
competitive_type: substitute
hired_for_jtbd: [jtbd-recurring-maintenance]
target_personas: [persona-recovering-rachel]
positioning:
  stated: "I'll just stretch / use a foam roller / sleep more"
  inferred: "The free, always-available option that everyone defaults to"
business_model: free
pricing:
  - tier: "DIY"
    price: "€0 + ad hoc product spend"
key_features_for_jtbd:
  - feature: "Always available"
    quality: strong
  - feature: "No commitment"
    quality: strong
  - feature: "Effective for the actual job"
    quality: weak
strengths_for_jtbd:
  - "Free"
  - "No booking, no scheduling, no decision"
  - "Familiar"
weaknesses_for_jtbd:
  - "Doesn't actually solve accumulating muscle tension"
  - "Self-discipline is unreliable when busy"
  - "Eventually fails; the moment of crisis is when paid alternatives are considered"
switching_cost:
  level: zero
customer_signals:
  - source: research-asana-2026-q1
    summary: "Every customer interviewed described a phase of 'I'll just deal with it myself' before booking. Doing nothing is the universal first response."
our_positioning_relative:
  win_on: "Actually addresses the underlying issue, not just the surface tension"
  lose_on: "Cost, convenience, zero commitment"
  avoid_comparison: "Don't argue 'we're better than stretching' — argue 'we're for when stretching isn't enough'"
evidence_sources: [research-asana-2026-q1]
```

## What this example demonstrates

**The most dangerous competitor is "doing nothing."** For any service that can be deferred — wellness, fitness, home repair, professional development — the universal first response is "I'll handle it myself." This is the substitute that wins by default until something breaks.

**Direct, substitute, and indirect competitors all matter and need different responses.** The premium chain is fought on convenience and brand. The independent therapist is fought on systematic reliability. Doing nothing is fought on consequences of waiting. Each requires different positioning, often in different places (homepage hero, retention emails, pricing page).

**"Avoid this comparison" is as valuable as "win on this."** Sometimes the right move is to refuse the comparison entirely.

## How to adapt

Things that travel:
- The three-types-of-competitor frame
- Treating "doing nothing" or "the manual workaround" as a real competitor
- Per-competitor positioning rather than a single positioning
- Strengths and weaknesses framed through the JTBD

## Common adaptations

**For B2B SaaS:**
- Direct: other vendors in the category
- Substitute: spreadsheets, custom-built internal tools, the consulting firm
- Indirect: doing nothing, deferring the project, status quo

**For e-commerce:**
- Direct: same-category brands
- Substitute: different-category brands solving the same job
- Indirect: not buying, deferring, using what they have

## Sources

- Christensen, *Competing Against Luck*
- Porter — *Competitive Strategy*
- EVD-USR-016 — Forces of Progress (anxiety + habit favor "doing nothing")
- EVD-USR-018 — Switch interview methodology
- EVD-USR-023 — Mental and Physical Availability
- EVD-USR-025 — Double Jeopardy
