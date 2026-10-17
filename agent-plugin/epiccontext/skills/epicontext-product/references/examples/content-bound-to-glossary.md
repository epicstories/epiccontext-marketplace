# Example: Content Bound to Glossary

Content strings with full glossary references intact. Demonstrates how renames propagate when content is bound to glossary instead of typed literally.

## Three content strings for the same booking flow

```yaml
# HEADLINE
id: content-booking-flow-headline
type: content
maturity: drafted
last_reviewed: 2026-04-25
string_type: heading
content:
  en: "Book your next {treatment} with {therapist}"
  nl: "Boek je volgende {treatment} met {therapist}"
glossary_terms_referenced:
  - glossary-treatment   # rendered as "treatment" / "behandeling"
  - glossary-therapist   # rendered as "therapist" / "therapeut"
brand_tone_referenced: brand-tone-warm-direct
linked_feature: feature-therapist-specific-booking
linked_ia_node: ia-book-now
linked_component: component-booking-flow-header
linked_journey_phase: journey-rebooking/phase-2-booking
constraints:
  max_length_chars: 60
  required_locale: [en, nl]
voice_check:
  - "Direct verb ('Book' not 'Schedule a booking for')"
  - "Possessive frame ('your next') signals continuity"
  - "No exclamation, no superlative"
status: shipped

---
# THERAPIST SELECTOR LABEL
id: content-therapist-selector-label
type: content
maturity: drafted
string_type: label
content:
  en: "Choose your {therapist}"
  nl: "Kies je {therapist}"
glossary_terms_referenced:
  - glossary-therapist
brand_tone_referenced: brand-tone-warm-direct
linked_feature: feature-therapist-specific-booking
linked_component: component-therapist-selector
linked_journey_phase: journey-rebooking/phase-2-booking
constraints:
  max_length_chars: 30
  required_locale: [en, nl]
status: shipped

---
# AVAILABILITY EMPTY STATE (when chosen therapist has no availability)
id: content-availability-empty-state
type: content
maturity: drafted
string_type: empty_state
content:
  en: "{therapist} doesn't have available {treatment_plural} in this date range. Try a different week, or {therapist}'s next available slot is {next_available_date}."
  nl: "{therapist} heeft geen beschikbare {treatment_plural} in deze periode. Probeer een andere week, of {therapist}'s eerstvolgende moment is {next_available_date}."
glossary_terms_referenced:
  - glossary-therapist
  - glossary-treatment  # plural form handled by locale
brand_tone_referenced: brand-tone-warm-direct
linked_feature: feature-therapist-specific-booking
linked_component: component-availability-calendar
linked_journey_phase: journey-rebooking/phase-2-booking
constraints:
  max_length_chars: 200
  required_locale: [en, nl]
voice_check:
  - "Acknowledges the disappointment without being sappy"
  - "Provides immediate next action"
  - "Doesn't blame the user or the therapist"
status: shipped
```

## What this example demonstrates

**The strings reference glossary tokens, not literal words.** The English content says "Book your next {treatment} with {therapist}" — when the glossary is rendered, it becomes "Book your next treatment with Lisa." When the Dutch glossary renders, it becomes "Boek je volgende behandeling met Lisa." The string structure is the same; the localization happens at the glossary level.

**Renaming "Treatment" to "Session" would only require a glossary change.** All three content strings reference `glossary-treatment`. If the team decided "Session" is the better term, they update the glossary entry, and all three strings render with the new word automatically. No find-and-replace across content. No drift.

**Constraints are captured per string.** Max length 60 chars for the headline (because the component has a width constraint). Required locales (English and Dutch are mandatory; Thai might be optional). These constraints prevent each content update from rediscovering the same limits.

**Voice check is explicit.** Each string has voice principles attached. When updating, the voice check is the criterion — does the new copy still match? Without this, voice drifts as different writers contribute.

**Empty states are content too.** Common mistake: writing primary content carefully, dashing off empty states. Empty states often appear at frustrating moments (no availability, no results) where good content matters most.

## What rename propagation looks like in practice

If the team decides to rename "Therapist" to "Practitioner":

1. Update `glossary-therapist`: change canonical_term to "Practitioner", add "Therapist" to synonyms_to_avoid with deprecation date
2. Update locale_variants to new translations
3. All three content strings automatically render with "Practitioner" / new translation
4. No need to touch any content entity directly

Compare to a system without binding: "therapist" appears in 47 content strings, in three languages, requiring 141 manual edits and inevitable misses.

## How to adapt

For your content:
1. Identify every domain noun in the string
2. Replace each one with a glossary token (`{glossary-id}` syntax or whatever your system uses)
3. Verify the glossary entries have the right locale variants
4. Bind to feature, IA node, component, journey phase
5. Define constraints (length, required locales)
6. Capture voice principles for review

## Common adaptations

**For systems without templating:**
- Even if the rendering layer doesn't support tokens, document the glossary references in the entity. Future migration is then mechanical.

**For products with rich formatting (rich text, markdown):**
- Keep glossary references at the noun level only. Don't try to template formatting.

**For products with very long content (articles, help docs):**
- Glossary references still apply, but the content entity might be a wrapper around a CMS document. Track which glossary terms appear, even if the text isn't literally tokenized.

## Sources

- Karen McGrane — *Content Strategy for Mobile* — multilingual content
- Sarah Richards — *Content Design*
- EVD-PRD-010 — Terminology inconsistency causes measurable comprehension cost
- EVD-PRD-011 — Localization at glossary layer holds; at content layer drifts
