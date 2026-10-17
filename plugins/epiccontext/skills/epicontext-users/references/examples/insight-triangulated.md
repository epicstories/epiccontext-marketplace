# Example: Triangulated Customer Insight

A customer insight built from 7 sources across 5 channel types. Demonstrates what triangulation actually means and the difference between raw quotes and interpretation.

```yaml
id: insight-therapist-specific-booking
type: customer_insight
maturity: drafted

signal_type: pain
summary: "Customers strongly prefer booking a specific therapist over 'first available' — but the booking flow forces service-first selection, which obscures therapist availability"

raw_quotes:
  - source: support-ticket-2026-04-12
    date: 2026-04-12
    text: "Why can't I just see when [Therapist Name] is free? I don't care which service code that is."
    persona_match: persona-recovering-rachel
  - source: support-ticket-2026-03-28
    date: 2026-03-28
    text: "I've been trying to rebook with [Therapist] but the website keeps showing me other people's slots."
  - source: google-review-2026-04-02
    date: 2026-04-02
    text: "Love the studio, hate that I have to dig through the booking flow to find the one therapist I trust."
  - source: research-asana-2026-q1
    date: 2026-03-15
    text: "I'd rather wait two weeks for the right person than go to whoever's free."
    persona_match: persona-recovering-rachel
  - source: nps-comment-2026-q1
    date: 2026-03-22
    text: "Booking is fine but it could be way better if I could find my therapist directly"
  - source: nps-comment-2026-q1
    date: 2026-03-25
    text: "Please add a way to follow my therapist's schedule"
  - source: in-person-feedback-from-therapist
    date: 2026-04-05
    text: "Three customers this week mentioned trouble rebooking with me specifically"

interpretation: "Customers experience the booking flow as service-centric when their decision is therapist-centric. The mismatch creates friction at the most loyal customer touchpoint (rebooking) and signals that the system doesn't understand what they value."

triangulation:
  source_count: 7
  source_types: [support_ticket, review, research_interview, nps, in-person]
  date_range: 2026-03-15 to 2026-04-12
  pattern_strength: "Same complaint across five different source types in under 30 days. Customer + therapist + behavioral evidence (high rebook abandonment in flow analytics) all align."

related_persona: persona-recovering-rachel
related_jtbd: jtbd-recurring-maintenance
related_journey_phase: journey-rebooking/phase-2-booking
related_feature: feature-therapist-specific-booking

priority: high
status: acknowledged

evidence_sources: [research-asana-2026-q1]
```

## Why this is "drafted" not "stub"

**Drafted because:**
- Triangulated across 7 sources of 5 different types
- Date range narrow enough for recency, broad enough to avoid recency bias
- Interpretation distinct from raw quotes
- Linked to persona, JTBD, journey phase, and feature
- Status field tracked

**Would be a stub if:**
- One support ticket only
- A single Reddit thread
- A stakeholder's hunch

**Would become validated when:**
- A redesign addresses it
- Post-redesign metrics confirm reduction in booking abandonment, increase in rebooking rate, decrease in this category of support tickets
- The original quote pattern stops appearing

## What this example demonstrates

**Triangulation is not volume; it's variety.** Seven sources from five different channels is much stronger than 100 mentions on one channel. Variety eliminates source-specific bias.

**Interpretation is distinct from quotes.** The raw quotes say "I want X." The interpretation says "the system doesn't understand what they value." That's the actionable framing — it points to a design decision, not a feature request.

**Status matters.** "New" insights pile up. "Acknowledged but not acted on" insights get forgotten. The status field forces honesty about where each insight is in the action loop.

## How to adapt

Things that travel:
- Multi-source pattern (support + reviews + research + NPS + behavioral)
- Date range that's recent but not just-this-week
- Interpretation that points to a system pattern, not a feature
- Status field for action-loop tracking

## Common adaptations

**For pure-digital products:**
- Replace in-person quotes with usability test observations or session recordings
- Add behavioral analytics signals (drop-off, rage clicks)

**For B2B contexts:**
- Account manager notes become a major source
- Sales call recordings are gold
- Customer success conversations replace support tickets

**For low-volume / early-stage products:**
- Triangulation is harder when you have fewer customers
- One or two sources may be the best you have — flag as stub
- Concentrate on interview depth instead of source variety

## Sources

- NN/g — VoC methodology
- Forrester — VoC program design
- McKinsey — CX programs
- EVD-USR-011 — Surveys alone insufficient
- EVD-USR-012 — 56% rarely or never complain
- EVD-USR-019 — Messy Middle: capture across channels
