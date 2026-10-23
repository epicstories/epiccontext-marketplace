# Example: Hybrid First-Visit Journey

A 7-phase journey spanning digital discovery, online booking, physical service, and post-visit. Demonstrates journey-as-binding-contract for a hybrid online-offline service business.

```yaml
id: journey-first-visit
type: journey_map
maturity: drafted
map_type: current_state

actor: persona-recovering-rachel
scenario: "First-time customer trying out the studio after hearing about it from a friend or finding it via search"
goal: "Determine whether this place will become her regular maintenance provider"
expectations:
  - "Booking takes under two minutes"
  - "First visit feels professional, not over-engineered"
  - "Pricing matches what's online"
  - "She leaves knowing whether to come back"

phases:
  - id: phase-1-discovery
    name: "Discovery"
    actions:
      - "Hears about the studio from a colleague or sees it in a Google search"
      - "Visits the homepage on her phone"
      - "Scans Google reviews briefly"
    thoughts:
      - source: research-asana-2026-q1
        text: "Looks legit. Let me see if booking is annoying."
    emotion: 0
    touchpoints: ["Word of mouth", "Google search", "Studio homepage", "Google reviews"]
    channels: [web, social, word_of_mouth]
    pain_points:
      - "Hard to tell from homepage which therapists specialize in what"
    opportunities:
      - description: "Make value proposition clear within 5 seconds of landing"
        owner: marketing
        priority: medium
    related_components: [component-homepage-hero, component-trust-signals]
    related_ia_nodes: [ia-homepage]

  - id: phase-2-booking
    name: "Booking"
    actions:
      - "Taps 'Book' from homepage"
      - "Picks a service type, then therapist (or 'first available'), then time slot"
      - "Enters contact and payment details"
    thoughts:
      - source: research-asana-2026-q1
        text: "Why can't I see who's available without picking a service first?"
      - source: research-asana-2026-q1
        text: "OK that was fast. Confirmation came right away."
    emotion: +2
    touchpoints: ["Booking flow on mobile", "Confirmation email", "Calendar invite"]
    channels: [web, email]
    pain_points:
      - "Therapist selection requires service to be picked first; first-time customers don't know which service maps to which therapist"
    opportunities:
      - description: "Allow therapist-first browsing for new customers who care about the person more than the service type"
        owner: "product + design"
        priority: high
    related_components: [component-booking-flow, component-therapist-card]
    related_ia_nodes: [ia-booking-flow]

  - id: phase-3-pre-visit
    name: "Pre-visit"
    actions: ["Receives reminder 24h before", "Drives or commutes", "Looks for parking / studio entrance"]
    thoughts:
      - source: research-asana-2026-q1
        text: "Reminder came at the right time. Easy to find."
    emotion: +1
    touchpoints: ["SMS or email reminder", "Map / directions", "Studio exterior signage"]
    channels: [sms, email, physical]
    pain_points: ["Parking instructions buried in confirmation email"]
    opportunities:
      - description: "Send parking and entrance details in the reminder"
        owner: operations
        priority: low

  - id: phase-4-arrival
    name: "Arrival and intake"
    actions: ["Walks into studio", "Greets reception or therapist", "Fills out intake form (first visit only)", "Waits briefly"]
    thoughts:
      - source: research-asana-2026-q1
        text: "I expected to wait a few minutes. The form was longer than I'd like for a first visit."
    emotion: 0
    touchpoints: ["Studio interior", "Reception or therapist", "Intake form"]
    channels: [physical, paper_or_tablet]
    pain_points:
      - "Intake form repeats info already given at booking"
      - "Wait area not clearly designated"
    opportunities:
      - description: "Pre-fill intake form from booking data; collect remaining info digitally before arrival"
        owner: "operations + product"
        priority: high
    related_components: [component-intake-form]

  - id: phase-5-service
    name: "Service"
    actions: ["Brief consultation with therapist", "Receives the treatment", "Brief debrief at end"]
    thoughts:
      - source: research-asana-2026-q1
        text: "She actually listened. That's the difference."
      - source: research-asana-2026-q1
        text: "I felt better walking out than I have in weeks."
    emotion: +4
    touchpoints: ["Therapist 1:1", "Treatment room environment"]
    channels: [physical]
    pain_points: ["Some treatment rooms have audible noise from reception or other rooms"]
    opportunities:
      - description: "Sound-isolate treatment rooms"
        owner: operations
        priority: medium
    related_jtbds: [jtbd-recurring-maintenance]

  - id: phase-6-checkout-and-rebook
    name: "Checkout and rebook"
    actions: ["Pays (often pre-paid at booking)", "Decides whether to rebook now or later", "Leaves studio"]
    thoughts:
      - source: research-asana-2026-q1
        text: "I'd rather rebook now while I'm thinking about it. But I don't want to be pushed."
    emotion: +2
    touchpoints: ["Reception", "Payment confirmation", "Rebook prompt"]
    channels: [physical, email]
    pain_points: ["Rebook prompt feels like a sales pitch when handled wrong"]
    opportunities:
      - description: "Make rebooking a casual, low-pressure offer at checkout — easy follow-up via email if she declines"
        owner: "operations + product"
        priority: high
    related_components: [component-rebook-prompt, component-followup-email]

  - id: phase-7-post-visit
    name: "Post-visit"
    actions: ["Receives thank-you email", "Receives review request 24-48h later", "Decides whether to return"]
    thoughts:
      - source: research-asana-2026-q1
        text: "If I felt good and the booking is easy, I'll come back. If anything was off, I won't bother."
    emotion: +2
    touchpoints: ["Thank-you email", "Review request", "Calendar reminder for self-imposed next visit"]
    channels: [email]
    opportunities:
      - description: "Time the rebooking nudge based on therapist's recommended cadence, not a default"
        owner: "product + operations"
        priority: medium

related_jtbds: [jtbd-recurring-maintenance, jtbd-find-trusted-provider]
business_goal: "Increase first-to-second-visit conversion rate by removing friction in booking and intake while protecting the unhurried, professional service experience"
evidence_sources: [research-asana-2026-q1]
```

## What this example demonstrates

**The journey doesn't end at booking.** It continues through the physical service and post-visit. For hybrid businesses, mapping only the digital phase misses where most of the customer's experience actually happens.

**Emotions plot a real curve.** Phases 1-4 are neutral or low-positive. Phase 5 (the service) is the peak. Phases 6-7 come down but stay positive. This shape is typical for service businesses.

**Opportunities have owners across functions.** Product, operations, marketing. Improving the experience requires more than design.

**The business goal is specific and measurable.** "Increase first-to-second-visit conversion rate" — without this the journey is documentation, not a decision driver.

## How to adapt

Things that travel:
- 7-phase structure (discovery → booking → pre-visit → arrival → service → checkout → post-visit)
- Emotional shape: build, peak at service, gentle decline
- Multi-owner opportunities

Things specific to this example:
- The intake form pain (not all services have intake)
- Therapist-specific booking
- Physical environment details

## Common adaptations

**For digital-only services:**
- Phases collapse to 4-5 (no physical arrival/service)
- "Service" becomes "first meaningful action in product"
- Emotions tend to peak later (at first value moment)

**For e-commerce one-time purchases:**
- Phases shift to discovery → consideration → cart → checkout → delivery → use
- Discovery longer; service moment is unboxing/first use

**For B2B sales journeys:**
- Phases extend to weeks/months
- Emotions plotted by primary stakeholder
- Opportunities skew toward enablement, content, sales tooling

## Sources

- NN/g — *Journey Mapping 101*, *Customer Journey Maps: When and How*
- EVD-USR-008 — Journey-level optimization (McKinsey)
- EVD-USR-019 — Messy Middle: discovery and booking are a tight loop
- EVD-USR-022 — Online research influences offline purchases
- EVD-USR-026 — In-store moments influence repeat behavior
- EVD-USR-027 — Observational methods for offline phases
