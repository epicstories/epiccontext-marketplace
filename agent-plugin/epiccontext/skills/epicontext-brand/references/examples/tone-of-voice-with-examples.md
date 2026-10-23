# Example: Tone of Voice with Examples

A complete tone-of-voice document with do/don't pairs and edge case applications.

```yaml
id: tone-of-voice
type: tone_of_voice
maturity: drafted
last_reviewed: 2026-04-30

principles:
  - id: warm-direct
    principle: "Warm but direct"
    explanation: "Friendly without being saccharine; clear without being curt. We respect customers' time and intelligence."
    do:
      - "Welcome back. Your appointment with Lisa is Tuesday at 2pm."
      - "We need a few details to confirm your booking."
      - "That time isn't available with Lisa. Here are her next openings: [list]"
    dont:
      - "Greetings, valued customer! How wonderful to see you again! Your incredible appointment awaits!"
      - "Please furnish requisite information to complete the booking confirmation process."
      - "Unfortunately, due to scheduling constraints, the requested time slot is unavailable."

  - id: healthcare-not-luxury
    principle: "Healthcare-professional, not luxury-spa"
    explanation: "Clinical confidence without clinical coldness. Treatment is a maintenance practice, not an indulgence."
    do:
      - "60-minute treatment with Lisa, your senior therapist"
      - "Your therapist will discuss any concerns at the start of each session"
      - "Most regular customers see best results from monthly visits"
    dont:
      - "Indulge yourself in 60 minutes of pure bliss"
      - "Pamper your senses with our luxurious wellness experience"
      - "Treat yourself to the ultimate relaxation"

  - id: confident-without-superlatives
    principle: "Confident without superlatives"
    explanation: "Specific claims, not adjective stacks. We make claims we can substantiate."
    do:
      - "Same therapist every visit, by default"
      - "Pricing shown upfront — no upsells at checkout"
      - "Trained senior therapists with 5+ years of clinical experience"
    dont:
      - "The best therapists, the most amazing experiences, the finest quality"
      - "Unbeatable service, world-class expertise, premium experience"
      - "The ultimate destination for wellness in the Randstad"

  - id: customer-language-not-marketing
    principle: "Use customer language, not marketing language"
    explanation: "Customers say 'getting massage', not 'partaking in wellness modalities'. Match how customers talk."
    do:
      - "Book a treatment"
      - "Your therapist remembers what works for you"
      - "Pay when you book, not at the end"
    dont:
      - "Schedule your bespoke wellness journey"
      - "Your wellness practitioner will personalize your treatment journey"
      - "Frictionless transactional experience at point of service"

application_examples:
  heading_homepage: "Same therapist. Every visit. By default."
  heading_booking: "Pick your therapist, then your time"
  body_about: "We're a small studio with senior therapists and a simple promise: book once, get the same trusted person every time. We'll grow to three locations and stop. Quality matters more than scale."
  button_primary: "Book with Lisa"
  button_secondary: "See all therapists"
  error_state: "We couldn't find that booking. Try searching by date or therapist name."
  empty_state_no_bookings: "No upcoming treatments. Browse therapists' availability to book your next session."
  microcopy_form_field_helper: "Your phone number is used only for booking reminders — never for marketing."

difficult_moment_examples:
  complaint_response: "I'm sorry the visit didn't meet expectations. I'd like to understand what happened. Could you share more about [specific issue]? We can offer [specific remedy] and I'd like to talk about how to prevent it next time."
  
  price_increase: "Starting January 1, 2027, treatment prices will increase by €5 to €90. This reflects increases in therapist compensation and operational costs. Existing packages purchased before then remain at current pricing — no changes there."
  
  cancellation_due_to_therapist_illness: "Lisa is unwell and won't be in tomorrow. Your appointment can be rebooked with another therapist for the same time, or with Lisa for [next available date]. Either way is fine — just reply with your preference."
  
  declining_a_request: "We don't offer same-day bookings — our therapists' schedules are set in advance to give them recovery time between treatments. Lisa's earliest opening is [date]."

cross_references:
  glossary_alignment: "Voice principles must align with glossary tone — clinical term + casual voice creates dissonance"
  brand_consistency_across_surfaces: "Same voice in app, marketing, email, support — calibrated by surface but never contradictory"
  surface_calibration:
    in_app: "Most direct. Brevity rules."
    transactional_email: "Warm but informational"
    marketing_email: "Slightly more energy, but still confident-without-superlatives"
    support_response: "Most warmth. Most patience. Specific solutions."
    legal_text: "Different rules apply — accuracy first, plain language where possible"

linked_brand:
  vision: vision
  positioning: positioning
  messaging: messaging
```

## What this example demonstrates

**Every principle has do/don't pairs.** The anti-examples teach as much as the examples. Without "don't" pairs, writers don't see where the line is.

**Application examples cover real content types.** Heading, body, button, error, empty state, microcopy — different constraints each.

**Difficult moments are addressed.** Complaints, price increases, cancellations, declining requests. These are where voice character is tested.

**Surface calibration is explicit.** Same voice in spirit; calibrated for surface. Marketing email has more energy than in-app copy. Legal has different rules.

**Cross-references prevent dissonance.** Voice and glossary together. A clinical glossary term in casual voice is dissonance.

## How to adapt

For your project:
1. Pick 3-5 principles. Each one should be something specific you do (not just an adjective).
2. Write 3+ do/don't pairs per principle.
3. Apply across content types.
4. Address 3-4 difficult moments — they reveal voice character.
5. Cross-reference glossary explicitly.

## Sources

- Hall, *Conversational Design*
- Richards, *Content Design*
- Fenton & Lee, *Nicely Said*
- MailChimp Voice and Tone (public reference)
- EVD-BRD-003 — Voice consistency aids comprehension and trust
- EVD-BRD-007 — Tone documents need examples
