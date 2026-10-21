# Example: Messaging Hierarchy

A messaging structure with primary, supporting, and audience-adapted messages.

```yaml
id: messaging
type: messaging
maturity: drafted
last_reviewed: 2026-04-30

linked_positioning: positioning
linked_tone_of_voice: tone-of-voice

primary_message:
  text: "Same therapist. Every visit. By default."
  evidence: "Q1 2026 research — 100% of regular customers name provider continuity as the top criterion"
  audience: "All audiences (with adaptation)"
  why_this: "It's the single most distinctive thing we do, and it's what regulars stay for"

supporting_messages:
  - id: msg-quality
    text: "Quality consistency across every visit, capped at 3 locations"
    supports: primary
    evidence: "Operational quality bar; aligned with strategy"
    
  - id: msg-pricing
    text: "Pricing shown upfront — no upsells at checkout"
    supports: primary
    evidence: "Addresses anxiety force in JTBD; differentiates from premium chains"
    
  - id: msg-booking-fast
    text: "Book in under 90 seconds on mobile"
    supports: primary
    evidence: "User testing showed 3x faster than independent-therapist booking"
    
  - id: msg-trust
    text: "Trusted by [N] regulars since [year]"
    supports: primary
    evidence: "Social proof; updated quarterly"

audience_variations:
  - audience: persona-recovering-rachel
    audience_label: "Returning customers"
    primary_emphasis: "Same therapist, every visit"
    secondary_emphasis: "Booking under 90 seconds"
    de_emphasize: "First-visit pricing — she's past that point"
    surfaces: ["rebook email", "in-app rebook flow", "loyalty messaging"]
    
  - audience: persona-first-time-customer
    audience_label: "First-time customers"
    primary_emphasis: "Quality consistency from your first visit"
    secondary_emphasis: "Transparent pricing"
    de_emphasize: "Same therapist (less compelling pre-relationship)"
    add_in: "What to expect on a first visit"
    surfaces: ["homepage hero", "first-visit landing pages", "search ads"]
    
  - audience: persona-gift-purchaser
    audience_label: "Gift purchasers"
    primary_emphasis: "A treatment they'll actually want to use"
    secondary_emphasis: "Flexible scheduling for the recipient"
    de_emphasize: "Same therapist (recipient may not have one yet)"
    surfaces: ["gift voucher landing page", "holiday email campaigns"]

surfaces_using_messaging:
  homepage_hero: 
    primary: "Same therapist. Every visit. By default."
    supporting: msg-quality
  pricing_page:
    primary: "Pricing shown upfront — no upsells at checkout"
    supporting: msg-trust
  email_welcome_first_visit:
    primary: "Quality consistency from your first visit"
    supporting: msg-booking-fast
  email_rebook_returning:
    primary: "Lisa is available [dates]"
    supporting: msg-booking-fast
    note: "For returning customers, we lead with the relationship — naming the therapist is the message"
  pricing_page:
    primary: msg-pricing
    supporting: msg-trust

what_we_dont_say:
  - "Bespoke wellness experience" — too marketing-y
  - "Industry-leading" — superlative without substance
  - "Transformative" — overpromise
  - "Holistic" — too vague
  - "Pamper yourself" — wrong frame for healthcare positioning

cross_references:
  positioning_alignment: "Every message must support our positioning of provider-continuity-first"
  voice_alignment: "Every message must read in our warm-but-direct voice"
  product_reality_check: "We don't message what the product can't deliver"

review_cadence: quarterly
last_market_test: 2026-Q1 (sales conversations confirmed primary message lands)
```

## What this example demonstrates

**Hierarchy: one primary, several supporting.** Trying to lead with everything means leading with nothing. Pick the primary; everything else supports.

**Audience adaptations are real.** Same brand, but Rachel and a first-timer don't hear the same primary message. The relationship is everything for Rachel; quality is everything for the first-timer.

**Surfaces map to messages.** Each surface has a primary and supporting message. No more "what should the homepage hero say" debates.

**What-we-don't-say list.** Marketing language we deliberately avoid. This is brand discipline; without it, drift creeps.

**Cross-references prevent disconnect.** Messaging must align with positioning, voice, and product reality. Single-direction reference checks.

## How to adapt

For your project:
1. Start from positioning. Messaging derives.
2. Pick ONE primary message — the most distinctive thing.
3. Write 3-5 supporting messages with evidence.
4. Identify audience variations where the same message wouldn't land.
5. Map surfaces to messages.
6. Build a "what we don't say" list — discipline through exclusion.

## Sources

- Dunford, *Obviously Awesome*
- McGrane, *Content Strategy for Mobile*
- EVD-BRD-001 — Positioning is most leveraged
- EVD-BRD-004 — Specific positioning beats generic in customer language
