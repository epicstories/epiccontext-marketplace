# Example: JTBD for Recurring Service

JTBD with all four Forces of Progress mapped, paired with `persona-hybrid-service-customer.md`.

```yaml
id: jtbd-recurring-maintenance
type: job_to_be_done
maturity: drafted
job_executor: persona-recovering-rachel
circumstance: "When my body starts feeling stiff or sore from work and daily life, and I notice it's accumulating"
job_statement: "Help me maintain my physical wellbeing on a predictable rhythm so it doesn't become a crisis"

job_type: core_functional

dimensions:
  functional: "Address muscle tension and recovery before it impairs work or sleep"
  emotional: "Feel cared for and seen as a person, not processed as a transaction"
  social: "Be the kind of person who takes responsibility for her own health"

forces_of_progress:
  push:
    - "Self-care at home (stretching, foam roller) isn't enough"
    - "Pain or stiffness is reaching the point where it interferes with work or sleep"
    - "She remembers feeling better when she had a regular practice"
  pull:
    - "Booking is fast and predictable"
    - "Same provider every visit means no re-explaining her body"
    - "Visible expertise (trained therapists, clean professional space)"
    - "Calm pace — not rushed, not over-extended"
  anxiety:
    - "What if the new place is rushed or impersonal?"
    - "What if they upsell or pressure me?"
    - "What if I commit to a series and don't end up using it?"
    - "What if my preferred therapist leaves?"
  habit:
    - "She has a current provider she's used before, even if not consistently"
    - "Doing nothing is always available; the body adapts to its current state"

hiring_criteria:
  - "Specific therapist availability visible at booking"
  - "Reviews mention same provider over time"
  - "Pricing is clearly displayed without hidden upsells"
  - "Studio is professional, not commercial-spa"
  - "Booking is mobile-fast"

firing_criteria:
  - "Two visits notably worse than her baseline"
  - "Pressure to buy series or upgrade"
  - "Inability to book her preferred provider"
  - "Hidden fees or pricing that changes between visits"

desired_outcomes:
  - "Reduce stiffness and pain to a baseline she can maintain"
  - "Spend under 5 minutes on booking and admin per visit"
  - "Trust that quality won't degrade between visits"
  - "Feel competent and in control of her routine"

current_solutions:
  - "Independent therapists found through word of mouth"
  - "Premium chains (good but expensive and inconsistent)"
  - "Physiotherapy (medical but harder to book regularly)"
  - "Self-care alone (default fallback)"

evidence_sources: [research-asana-2026-q1]
linked_persona: persona-recovering-rachel
linked_journey_maps: [journey-first-visit, journey-rebooking]
linked_competitors: [competitor-independent-therapists, competitor-premium-chains, competitor-physiotherapy]
linked_features: [feature-therapist-specific-booking, feature-transparent-pricing]
```

## What this example demonstrates

**The product is not in the job statement.** "Maintain my physical wellbeing" — not "book a massage." A massage is one solution to this job. So is yoga. So is doing nothing. Treating the job at this level reveals real competition.

**Functional/emotional/social pull differently.** Functional says "fast and effective." Emotional says "cared for." Social says "I'm responsible." A purely functional design wins functional but loses emotional. The product has to do both.

**Anxiety is concrete and addressable.** "What if I commit to a series and don't use it?" can be addressed directly (don't push series). Mapping anxieties produces immediate design implications.

**Firing criteria predict churn.** Two bad visits, hidden fees, inability to book preferred provider — these make customers leave.

## How to adapt

Things that travel:
- The "before it becomes a crisis" framing for maintenance services
- Functional/emotional/social tension where one wins at the others' expense
- "Habit" as a force (doing nothing is the default competitor)
- Firing criteria distinct from hiring criteria

Things specific to this example:
- The "self-care at home isn't enough" push
- The provider-continuity criterion
- The "responsible adult" social dimension

## Common adaptations

**For software / SaaS recurring use:**
- Push: "current tool is breaking under our growth"
- Pull: integration with existing stack
- Anxiety: data migration, training cost, vendor lock-in
- Habit: existing tool works "well enough"

**For one-time large purchases (renovations, vehicles):**
- Push usually accumulates over years
- Anxiety dominates
- Habit barely exists

**For B2B services:**
- Job executor and buyer often differ — both have jobs
- Social dimension shifts to "look competent to my boss"
- Hiring criteria include procurement and legal hurdles

## Sources

- Christensen, *Competing Against Luck*
- Moesta & Spiek — switch interview methodology
- EVD-USR-015 — Three dimensions
- EVD-USR-016 — Forces of Progress
- EVD-USR-018 — Switch interview methodology
- EVD-USR-023 — Mental and Physical Availability
