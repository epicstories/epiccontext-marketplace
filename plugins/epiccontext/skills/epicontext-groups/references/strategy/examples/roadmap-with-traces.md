# Example: Roadmap with Traces

A Now/Next/Later roadmap with each item traced to OGSM and a declined section.

```yaml
id: roadmap-2026
type: roadmap
maturity: drafted
last_reviewed: 2026-04-30
review_cadence: quarterly
horizon_model: now_next_later

linked_ogsm: ogsm-2026-q2-q4

now:  # Q2 2026, committed
  - item: "Therapist-specific booking flow"
    linked_feature: feature-therapist-specific-booking
    linked_strategies: [str-1-1-1]
    linked_goals: [goal-1-1]
    confidence: high
    owner: "Robert + Frenz"
    dependencies: []
    rationale: "Highest-impact lever for the rebook-rate goal; insight is triangulated across 7 sources"
    status: in_progress
    target_completion: 2026-07-01
    business_case: bc-therapist-specific-booking

  - item: "Quality consistency dashboard for therapists"
    linked_strategies: [str-1-1-2]
    linked_goals: [goal-1-1]
    confidence: high
    owner: "Robert"
    dependencies: []
    rationale: "Per-therapist NPS visibility lets us catch quality drift early"
    status: planning
    target_completion: 2026-08-15

next:  # Q3 2026, drafted
  - item: "Recurring booking automation"
    linked_feature: feature-recurring-bookings
    linked_strategies: [str-1-1-1]
    linked_goals: [goal-1-1]
    confidence: medium
    rationale: "Once provider-continuity foundation is solid, recurring patterns are the natural extension"
    dependencies: [feature-therapist-specific-booking]

  - item: "Referral surface in post-treatment flow"
    linked_strategies: [str-1-2-1]
    linked_goals: [goal-1-2]
    confidence: medium
    rationale: "Referral acquisition needs explicit surface; currently happens organically without prompt"

later:  # Q4+ 2026, directional
  - item: "Second-location feasibility study"
    linked_strategies: [str-2-2-1]
    linked_goals: [goal-2-2]
    confidence: medium
    rationale: "Subject to first-location quality stability and operational readiness"

  - item: "Subscription / membership model exploration"
    linked_strategies: []  # Not yet tied to a strategy — that's the point of "exploration"
    confidence: low
    rationale: "Currently declined in 2026 strategy; revisit in 2027 planning"
    note: "Listed as exploration in Later horizon to keep visible without committing"

declined:
  - item: "Marketplace expansion (third-party therapists)"
    declined_reason: "Conflicts with strategy on provider continuity and quality control"
    declined_date: 2026-Q1
    requested_by: "External advisor; some team members"

  - item: "Same-day booking"
    declined_reason: "Operational quality cost too high; not aligned with positioning"
    declined_date: 2026-Q1

  - item: "Mobile app (native)"
    declined_reason: "Mobile web works for our use case; native app cost not justified at current scale"
    declined_date: 2026-Q2
    revisit_at: "Reconsider if customer feedback shifts or scale crosses 2 locations"

  - item: "International expansion"
    declined_reason: "Out of scope through 2027 per strategy"
    declined_date: 2026-Q1

notes: "Quarterly review at end of each quarter. External events (major competitor move, market shift) trigger off-cycle review. Items moving from Next to Now require active confirmation, not passive aging in."
```

## What this example demonstrates

**Each item traces to OGSM.** linked_strategies and linked_goals on every Now and Next item. If the link is empty, the item shouldn't be there (or OGSM is missing something).

**Confidence calibrated to horizon.** Now items are high confidence. Next items are medium. Later items are low. This honesty matters; pretending Later items have firm dates is what makes roadmaps lie.

**Declined section is alive.** Items considered and declined are recorded with reasons and dates. Without this, the same ideas resurface every quarter as new ideas.

**One Later item without OGSM linkage** is flagged as exploration. Some forward-looking items don't yet trace to current OGSM — that's fine, but it should be explicit.

**Owners and dependencies on Now items.** Real commitments need real owners. Dependencies show what unblocks what.

## How to adapt

For your project:
1. Pick horizon model (Now/Next/Later or quarterly)
2. List items, each with strategy/goal linkage
3. Mark confidence honestly
4. Capture dependencies
5. ALWAYS include a declined section — it pays back enormously
6. Set review cadence and stick to it

## Sources

- Cagan, *Inspired*, *Empowered* — outcome-focused roadmaps
- Bastow — Now/Next/Later format
- EVD-STR-011 — Outcome-focused roadmaps outperform feature-focused
- EVD-STR-012 — Now/Next/Later as confidence calibration
