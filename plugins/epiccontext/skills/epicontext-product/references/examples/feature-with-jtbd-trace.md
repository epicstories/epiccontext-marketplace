# Example: Feature with Full JTBD Trace

A feature defined with complete upstream linkage to JTBD and downstream linkage to journey, content, components, and metrics. Demonstrates "every feature traces to a job."

```yaml
id: feature-therapist-specific-booking
type: feature
maturity: drafted
last_reviewed: 2026-04-30
status: in_development

name: "Therapist-specific booking"
short_definition: "Customers can browse availability filtered by individual therapist and book that therapist's open slots directly, without picking a service type first"
detailed_definition: "On the booking flow, customers can choose to start either by service type OR by therapist. When starting by therapist, they see that therapist's calendar across all services they offer. The therapist's regular customers (identified by booking history) get this view as the default."

does_not_do:
  - "Does not allow simultaneous booking with multiple therapists"
  - "Does not show therapist personal calendars beyond business hours"
  - "Does not surface therapist personal information beyond what's on their public profile"

# UPSTREAM: traces to a job in Users group
linked_jtbds:
  - jtbd-recurring-maintenance  # Rachel's job: maintain physical wellbeing on a predictable rhythm
linked_personas:
  - persona-recovering-rachel  # Inherited from JTBD

# DOWNSTREAM: where this feature lives in journeys
linked_journey_phases:
  - journey-first-visit/phase-2-booking  # Used during first booking when customer was referred to a specific therapist
  - journey-rebooking/phase-2-booking    # Primary use case — repeat customers booking with their preferred therapist
  - journey-referral/phase-3-booking      # When referred customers want to book with the recommended therapist

# DOWNSTREAM: components that implement this (Build group)
linked_components:
  - component-booking-flow
  - component-therapist-card
  - component-availability-calendar

# DOWNSTREAM: content used to describe and label this feature
linked_content:
  - content-booking-flow-headline
  - content-therapist-selector-label
  - content-availability-empty-state

# DOWNSTREAM: glossary terms used in this feature
linked_glossary_terms:
  - glossary-therapist
  - glossary-booking
  - glossary-treatment

# DEPENDENCIES on other features
dependencies:
  - feature-base-booking-flow
  - feature-therapist-profiles  # has to exist for therapist selection to make sense

# PRIORITY with reasoning
priority: high
priority_reasoning: "Linked to the strongest insight in our customer feedback (insight-therapist-specific-booking, triangulated across 7 sources). Core to JTBD hiring criteria for our primary persona — Rachel explicitly named provider continuity as her top criterion in research."

# METRICS for validation
metrics:
  - metric: "Rebooking conversion rate"
    target: "Increase from 42% to 55% within 90 days of launch"
    measured_via: analytics
  - metric: "Time-to-rebook (from intent to confirmation)"
    target: "Reduce from current median 4.5 minutes to under 2 minutes"
    measured_via: analytics
  - metric: "Support tickets in 'cannot find therapist' category"
    target: "Reduce by 60% within 60 days of launch"
    measured_via: support_categorization

evidence_sources:
  - research-asana-2026-q1
  - insight-therapist-specific-booking  # the triangulated insight
```

## What this example demonstrates

**Every link is meaningful.** This isn't a checklist exercise — each linked entity has a real role:
- The JTBD answers "why does this feature exist?"
- The persona answers "who is this for?"
- The journey phases answer "where in their experience does this matter?"
- The components answer "what builds it?"
- The content answers "what do users read?"
- The glossary answers "what words do we use?"
- The metrics answer "how will we know it worked?"

**Priority reasoning is evidence-anchored.** "High priority" alone is meaningless. Tying it to a specific insight (with its own ID, traceable to source quotes) makes the priority defensible and reviewable.

**Does-not-do bounds the scope.** Without explicit "does not do," the feature expands silently as developers and stakeholders add edge cases.

**Metrics are tied to the JTBD, not just to engagement.** "Rebooking conversion" measures whether the feature actually helps customers do the job, not just whether they click the new button.

## How to adapt

When defining a feature:
1. Start upstream — find or create the JTBD it serves
2. Define crisply (does and does-not)
3. Map to journey phases where it appears
4. Identify components, content, glossary terms it uses
5. Set evidence-anchored priority
6. Define success metrics tied to JTBD outcomes

## What "validated" would look like for this feature

The feature reaches validated maturity when:
- Shipped to all customers
- Rebook conversion measurably improved (matching or exceeding the 55% target)
- Time-to-rebook reduced (matching or exceeding the 2-minute target)
- Support tickets in the "cannot find therapist" category dropped (matching or exceeding the 60% reduction target)
- Three months of stable behavior post-launch

If shipped but metrics don't move, the feature is shipped-but-unvalidated and the diagnosis was probably wrong. Don't backfill rationale — diagnose what happened.

## Sources

- Marty Cagan — *Inspired* — feature definition and upstream JTBD linkage
- EVD-PRD-007 — Outcome-Driven Innovation feature scoring
- EVD-PRD-009 — Most MVP feature lists ship far more than needed
