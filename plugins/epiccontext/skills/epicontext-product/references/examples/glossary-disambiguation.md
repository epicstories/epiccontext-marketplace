# Example: Glossary Disambiguation

A common situation: the same word means different things in different contexts, or different words are used for the same thing. This example shows how to handle both.

## The situation

In a wellness service product, audit reveals "session" used in three different contexts:

1. The 60-minute appointment with a therapist
2. A user's logged-in browser session
3. A package of multiple appointments sold together ("10-session package")

And separately, "treatment", "appointment", "service", and "booking" all sometimes refer to the same 60-minute event.

## The disambiguation

```yaml
# THE 60-MINUTE EVENT — pick a canonical term
id: glossary-treatment
type: glossary_term
maturity: drafted
canonical_term: "Treatment"
plain_definition: "A 60-minute service delivered by a therapist to a customer at the studio"
plain_examples:
  - "Book a treatment with your preferred therapist"
  - "Each treatment includes a brief consultation"
locale_variants:
  en: "Treatment"
  nl: "Behandeling"
synonyms_to_avoid:
  - "Session (deprecated 2026-Q2 for the 60-minute event; reserved for browser session and package contexts)"
  - "Appointment (use for the booking record, not the event itself)"
  - "Service (too generic; reserved for marketing context)"
notes: "Treatment chosen over Session because Session is overloaded; over Service because Service is too generic; over Appointment because Appointment refers to the scheduled record, not the event."
status: active
linked_features: [feature-booking, feature-rebooking]

# THE LOGGED-IN BROWSER SESSION — separate term, separate concept
id: glossary-user-session
type: glossary_term
maturity: drafted
canonical_term: "User session"
plain_definition: "An active period of authenticated use, beginning at login and ending at logout or expiration"
plain_examples:
  - "Your user session expires after 24 hours of inactivity"
locale_variants:
  en: "User session"
  nl: "Gebruikerssessie"
synonyms_to_avoid:
  - "Session (without 'User' prefix; ambiguous with treatment context)"
notes: "Always use full term 'user session' in user-facing content to avoid confusion with treatment context."
status: active
linked_features: [feature-authentication]

# THE PACKAGE — yet another distinct concept
id: glossary-package
type: glossary_term
maturity: drafted
canonical_term: "Package"
plain_definition: "A pre-purchased set of multiple treatments at a bundled price"
plain_examples:
  - "The 10-treatment package is valid for 12 months"
  - "Save 15% with a package"
locale_variants:
  en: "Package"
  nl: "Pakket"
synonyms_to_avoid:
  - "Bundle (deprecated 2026-Q2; use Package)"
  - "Series (deprecated 2026-Q2; use Package)"
status: active
linked_features: [feature-packages]

# THE BOOKING RECORD — distinct from the event itself
id: glossary-booking
type: glossary_term
maturity: drafted
canonical_term: "Booking"
plain_definition: "The scheduled record of an upcoming or past treatment, including time, therapist, customer, and payment status"
plain_examples:
  - "Manage your bookings in your account"
  - "Your booking is confirmed"
locale_variants:
  en: "Booking"
  nl: "Reservering"
synonyms_to_avoid:
  - "Appointment (use Booking for the record; Appointment is conversational only)"
notes: "A Booking refers to a Treatment, but is not the Treatment itself. The Booking exists from creation through completion or cancellation."
status: active
linked_features: [feature-booking, feature-rebooking, feature-cancellation]
```

## What this example demonstrates

**Disambiguation is harder than it looks.** "Session" was being used in three legitimate contexts — the answer wasn't to pick one and force the others to use a different word, it was to recognize three distinct concepts and give each a clear canonical term.

**Synonym deprecation needs a date and a reason.** "Deprecated 2026-Q2" with a note about why. Otherwise the next person who joins the team will reintroduce the synonym without knowing why it was removed.

**The notes field carries the rationale.** Future contributors need to know why "Treatment" beat "Service" and "Appointment". Without rationale, the choices look arbitrary and get re-litigated.

**Booking and Treatment are intentionally distinct.** A common mistake is to merge "the event" and "the record of the event". Keeping them separate is cleaner: a Booking is a thing you can edit, cancel, view; a Treatment is what happens during the booking.

## How to adapt

When you have ambiguity:
1. List every context the term appears in
2. Decide if these are actually the same concept or different concepts that share a word
3. If different concepts, give each one a distinct canonical term (even if it means using a longer word)
4. If same concept across contexts but different word, pick canonical and deprecate others
5. Document the rationale for future readers

## Common adaptations

**For B2B SaaS where "user", "account", "team", and "organization" are entangled:**
- Often three or four distinct concepts that share words
- Each needs its own glossary term with explicit boundaries

**For e-commerce where "product", "item", "SKU", "variant" overlap:**
- Often a hierarchy (Product → Variant → SKU) where each level needs a distinct term

**For multi-locale products:**
- Don't translate-then-disambiguate. Disambiguate first; then localize each canonical term.

## Sources

- Donna Spencer — *A Practical Guide to Information Architecture* — vocabulary discipline
- Karen McGrane — *Content Strategy for Mobile* — terminology consistency across platforms
- EVD-PRD-010 — Terminology inconsistency causes measurable comprehension cost
- EVD-PRD-011 — Localization at glossary layer holds; at content layer drifts
