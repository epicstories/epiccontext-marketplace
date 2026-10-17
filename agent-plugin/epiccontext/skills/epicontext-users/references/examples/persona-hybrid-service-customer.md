# Example: Hybrid Service Customer Persona

A research-backed persona for a service business where customers book online but receive the service in person. Closest example shape to wellness, hospitality, healthcare, fitness, beauty.

```yaml
id: persona-recovering-rachel
type: persona
maturity: drafted
persona_type: qualitative
name: "Recovering Rachel"
scope: "Used for: booking flow + first-visit experience design for the regular-customer journey"
one_line: "A working professional with a recurring physical concern who wants reliable maintenance care, not a luxury experience"

attitudes:
  - "Treats the service as healthcare, not pampering"
  - "Wants competence first, atmosphere second"
  - "Loyal once trust is established, but slow to establish it"
  - "Prefers booking the same provider every time, even if it means waiting"

goals:
  - "Maintain her physical wellbeing without fitting a complicated routine into a busy week"
  - "Find a place she can go for years without re-evaluating"
  - "Walk in trusting the quality without checking reviews each time"

pain_points:
  - "Booking systems that don't show specific provider availability"
  - "Studios that feel commercial or rushed"
  - "Inconsistent experiences across visits to the same place"
  - "Pressure to upgrade, add packages, or book series"

behaviors:
  - "Books 1-2 weeks ahead, same time slot when possible"
  - "Reads reviews before first visit; rarely after that"
  - "Refers friends only after 3+ positive visits"
  - "Will switch entirely if two visits are notably worse than her baseline"
  - "Pays slightly above market price for consistent quality"

expectations:
  - "Booking takes under 90 seconds"
  - "Reminders arrive before — not during — her workday"
  - "The provider remembers her between visits"
  - "Pricing is simple and stable"

context: "Books from her phone during evening downtime or lunch break. Drives or commutes 15-30 minutes for the appointment. The visit is a small but anchored moment in her week."

quotes:
  - source: research-asana-2026-q1
    text: "I'd rather wait two weeks for the right person than go to whoever's free."
  - source: research-asana-2026-q1
    text: "I don't want to think about it. I want it on the calendar and I want it to be good."

demographics_only_if_relevant:
  age_range: "Late 20s to mid-50s, varies"
  context_relevance: "What matters is having a recurring concern + scheduling autonomy + disposable income for monthly visits, NOT specific age or income"

evidence_sources: [research-asana-2026-q1]
linked_jtbds: [jtbd-recurring-maintenance, jtbd-find-trusted-provider]
linked_journey_maps: [journey-first-visit, journey-rebooking, journey-referral]
linked_competitors: [competitor-other-massage-studios, competitor-physiotherapy, competitor-self-care-substitutes]
```

## Why this is "drafted"

- Based on qualitative interviews with actual customers
- Scope is specific (booking flow + first visit, not "all customers")
- Behaviors are observable and tied to evidence
- Linked to multiple JTBDs and journey maps reflecting different visit stages

## How to adapt this example

Things that travel to other hybrid service businesses:
- Service-as-healthcare framing (not entertainment, not luxury)
- Provider loyalty pattern (same person matters more than same brand)
- Trust-building over multiple visits
- Quality-tolerance threshold ("two bad visits = switch")
- Booking lead time and time-of-day patterns

Things specific to this example, change for your context:
- Specific cadence (1-2 weeks for massage; would differ for hair, dental)
- The "treats it as healthcare" framing — luxury services need different framing
- Provider continuity matters less in some categories

## Common adaptations

**For one-off or rare-visit services:**
- Replace recurring concern with specific occasion
- Trust comes from credentials and reviews, not repeated visits
- Referral pattern shifts

**For luxury / experiential services:**
- Atmosphere becomes a primary expectation, not secondary
- Pricing tolerance higher
- Quotes shift toward emotional language

**For time-sensitive services (urgent care, repair):**
- Lead time collapses to same-day or hours
- Trust matters less than availability
- Provider continuity often impossible

## Sources informing this example

- NN/g — *3 Persona Types* (qualitative)
- EVD-USR-022 — Online research influences offline purchases
- EVD-USR-026 — In-store/in-service decision moments matter for recurring behavior
- EVD-USR-027 — Observational research methods for offline contexts
- EVD-USR-023 — Mental and Physical Availability for service businesses
