# Example: IA Tested Against Personas

An IA structure with explicit persona-walkthrough validation. Shows how to validate IA before declaring it drafted.

## The IA

```yaml
id: ia-root
type: ia_node
maturity: drafted
last_reviewed: 2026-04-25
node_type: section
label: "Root"
ia_pattern: hierarchical
purpose: "Top-level structure of the booking and customer experience"
parent: null
children:
  - ia-home
  - ia-book-now
  - ia-my-bookings
  - ia-therapists
  - ia-pricing-and-packages
  - ia-account
validation_method: persona_walkthrough

# CHILD NODES (abbreviated for example)
---
id: ia-home
label: "Home"
purpose: "Entry point for new and returning customers; show value, recent activity for logged-in"
primary_personas: [persona-recovering-rachel, persona-gift-purchaser]
journey_phases:
  - journey-first-visit/phase-1-discovery
  - journey-rebooking/phase-1-discovery
features_hosted: [feature-trust-signals, feature-quick-rebook]

---
id: ia-book-now
label: "Book"
label_glossary: glossary-booking
purpose: "Main booking flow; supports both service-first and therapist-first entry"
primary_personas: [persona-recovering-rachel, persona-first-time-customer]
journey_phases:
  - journey-first-visit/phase-2-booking
  - journey-rebooking/phase-2-booking
features_hosted: [feature-therapist-specific-booking, feature-base-booking-flow]

---
id: ia-my-bookings
label: "My Bookings"
label_glossary: glossary-booking
purpose: "Manage upcoming and past bookings; rebook or cancel"
primary_personas: [persona-recovering-rachel]
journey_phases:
  - journey-rebooking/phase-1-discovery
  - journey-rebooking/phase-6-rebook
features_hosted: [feature-treatment-history, feature-rebook-with-same]

---
id: ia-therapists
label: "Therapists"
label_glossary: glossary-therapist
purpose: "Browse therapist profiles; entry point for therapist-first booking"
primary_personas: [persona-recovering-rachel, persona-first-time-customer]
journey_phases:
  - journey-first-visit/phase-2-booking
features_hosted: [feature-therapist-profiles]
```

## The persona walkthrough validation

```markdown
## Validation: Recovering Rachel

**Scenario:** Rachel wants to rebook with her preferred therapist, Lisa.

**Path through current IA:**
1. Lands on Home. Sees "My Bookings" in main nav.
2. Goes to My Bookings. Sees her past treatment with Lisa.
3. Clicks "Rebook with Lisa" inline. Lands on Lisa's calendar in the booking flow.
4. Picks a slot. Confirms. Done.

**Steps: 4. Time estimate: under 90 seconds. ✅ Matches her expectation.**

**Friction points found:**
- Original IA had only "Book Now" without "My Bookings" surfaced in main nav. Rachel had to drill into her account menu to find past bookings. **Fixed in this version.**
- "Therapists" section initially didn't link to therapist-specific availability. Rachel could browse profiles but had to backtrack to "Book Now" to see availability. **Fixed in this version — Therapists section now leads to availability when therapist is selected.**

## Validation: First-time customer

**Scenario:** First-time customer who was referred to a specific therapist.

**Path through current IA:**
1. Lands on Home. Doesn't yet have an account or history.
2. Sees "Therapists" in main nav. Clicks.
3. Browses to find the referred therapist.
4. Clicks therapist's profile, sees availability.
5. Picks a slot. Account creation happens during booking. Done.

**Steps: 5. Time estimate: under 3 minutes. ✅ Matches the persona's expectation for first booking.**

**Friction points found:**
- "Therapists" being a top-level nav item is critical for this persona. Hiding it under "Book" would break this journey.

## Validation: Gift purchaser

**Scenario:** Buying a treatment voucher as a gift for someone else.

**Path through current IA:**
1. Lands on Home.
2. Looks for "Gift" or similar — NOT IN CURRENT IA.
3. Clicks "Pricing and Packages" hoping for vouchers.
4. Finds gift voucher option.

**Steps: 4. Time estimate: 2 minutes IF they figure out to look in Pricing.**

**❌ FRICTION FOUND: Gift purchasing is hidden. Persona-gift-purchaser has a primary task that requires them to guess the right section. This is an IA-mental-model gap.**

**Recommendation:** Add a top-level "Gift" navigation item OR surface gift vouchers prominently on Home for first-time visitors.
```

## What this example demonstrates

**Validation is concrete, not theoretical.** The walkthrough is per-persona, with specific scenarios, step counts, and time estimates. "Tested against personas" without a written walkthrough is unverified.

**Friction is named and located.** Each issue is tied to a specific node, persona, and journey phase. Vague "navigation could be better" is not actionable; "Gift purchasing is hidden under Pricing — primary task for persona-gift-purchaser" is.

**Validated-after-fixing matters.** The IA shows fixes that came from earlier walkthroughs. The current state isn't the first attempt; it's the result of testing. Document this trail so future contributors know why the IA looks the way it does.

**One persona's frictionless path can hide another's blocker.** Rachel's path is smooth; Gift Purchaser's isn't. Walking each persona separately surfaces this. Walking only the primary persona would miss it.

## How to adapt

For your IA:
1. Map the children of root and at least one level deeper.
2. For each persona, write a concrete scenario.
3. Walk it step-by-step. Count steps, estimate time.
4. Flag friction explicitly — what didn't work, where they got lost.
5. Iterate the IA, then re-walk. Document the trail.

## What "validated" would require

For this IA to reach validated maturity:
- Tree test with 25+ users finding primary tasks at acceptable success rate
- Behavioral analytics showing primary journeys completing in expected step counts
- 3+ months of stability without major restructuring

## Sources

- NN/g — *Tree Testing*, *Card Sorting*
- Donna Spencer — *A Practical Guide to Information Architecture*
- Abby Covert — *How to Make Sense of Any Mess*
- EVD-PRD-001 — Tree testing reveals findability problems quantitatively
- EVD-PRD-003 — Most websites have IA problems traceable to internal structure bias
