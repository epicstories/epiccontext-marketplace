# Example: Design System with Tokens

A design system entity showing specialization on top of a foundation, with the relationship to code clearly captured. This example happens to use a React web stack (shadcn/ui + Tailwind); the shape — foundation with rationale, specialized tokens, inventoried components, drift candidates — is the same in any stack. In every stack, each component in the inventory also gets a `component_spec` block with a live `preview_url`.

```yaml
id: design-system
type: design_system
maturity: drafted
last_reviewed: 2026-04-30

foundation:
  base: "shadcn/ui"
  styling: "Tailwind CSS 3.x"
  rationale: "Speed of build (everything copy-paste-able from shadcn); accessibility defaults; ownership of the actual code (no SaaS lock-in); fits our services-led-quality strategy of moving fast without compromising quality"

tokens:
  colors:
    source: "tailwind.config.ts + src/styles/tokens/colors.ts"
    specialization:
      - token: "primary"
        value: "Custom warm teal #2A8B9C (replaces shadcn default slate-900)"
        rationale: "Brand specialization — feels healthcare-warm, not corporate"
      - token: "neutral scale"
        value: "Warm grays (off-white to charcoal) replacing shadcn cool-gray defaults"
        rationale: "Aligns with healthcare-warm voice in tone-of-voice entity"
      - token: "destructive"
        value: "Default shadcn (red-500)"
      - token: "accent"
        value: "Soft sage #7CA982"
        rationale: "Used sparingly; signals 'recurring booking' moments"

  typography:
    source: "src/styles/tokens/typography.ts"
    specialization:
      - token: "font-sans"
        value: "Inter Variable"
        rationale: "Strong UI font; great at small sizes; humanist enough for warm voice"
      - token: "font-serif"
        value: "Source Serif 4"
        rationale: "Editorial moments only — about page, longer-form content"
      - token: "type scale"
        value: "Custom scale: 12, 14, 16, 18, 20, 24, 30, 36, 48"
        rationale: "Healthcare-professional register — slightly larger body (16) than default; tighter heading scale than fashion brands"

  spacing:
    source: "tailwind.config.ts (default scale)"
    specialization: "None — Tailwind default works"

  radii:
    source: "src/styles/tokens/radii.ts"
    specialization:
      - token: "card"
        value: "12px (between sm 4px and lg 16px)"
        rationale: "Healthcare-warm — softer than corporate, less playful than consumer"

  shadows:
    source: "src/styles/tokens/shadows.ts"
    specialization:
      - token: "elevated-warm"
        value: "Custom — 0 4px 12px rgba(42,139,156,0.08)"
        rationale: "Subtle teal-tinted shadow on primary cards; reinforces brand without being heavy"

  motion:
    source: "src/styles/tokens/motion.ts"
    specialization:
      - token: "duration-default"
        value: "300ms (longer than shadcn default 200ms)"
        rationale: "Calm pace; avoids feeling rushed or frantic"
      - token: "easing-default"
        value: "cubic-bezier(0.16, 1, 0.3, 1)"
        rationale: "Slight overshoot feels alive without being playful"

components:
  - name: "Button"
    status: stable
    source: "src/components/ui/button.tsx"
    variants: [primary, secondary, ghost, destructive, link]
    notes: "shadcn default + brand teal primary; no other modifications"

  - name: "Card"
    status: stable
    source: "src/components/ui/card.tsx"
    variants: [default, elevated]
    notes: "Uses card radius and elevated-warm shadow; otherwise shadcn"

  - name: "Input"
    status: stable
    source: "src/components/ui/input.tsx"
    variants: [default, error]
    notes: "Default shadcn; error variant uses destructive token"

  - name: "TherapistCard"
    status: drafted
    source: "src/components/booking/therapist-card.tsx"
    notes: "Domain-specific composite; uses Card + Avatar + custom layout. NOT promoted to system primitive — too specific to be reusable."

  - name: "AvailabilityCalendar"
    status: in_progress
    source: "src/components/booking/availability-calendar.tsx"
    notes: "Composite component; built on top of system primitives. Not a system component itself."

deprecated:
  - name: "old Button"
    reason: "Replaced by shadcn Button in 2026-Q1"
    removal_target: "2026-Q3 (after audit confirms no usage)"

drift_candidates:
  - candidate: "Custom date picker on booking flow"
    issue: "Built ad-hoc; doesn't use system tokens for color/typography"
    proposed_action: "Replace with shadcn DatePicker; estimate ~1 day"
  - candidate: "One-off dropdown in admin UI"
    issue: "Uses raw HTML select instead of shadcn Select"
    proposed_action: "Refactor to shadcn Select for consistency"

linked_strategy: strategy-services-led-quality
linked_brand_tone: tone-of-voice
linked_components_in_product:
  - component-booking-flow
  - component-therapist-card
  - component-availability-calendar

repo_url: "https://github.com/...../app"
storybook_url: "https://design.app.example.com"  # if maintained

review_cadence: quarterly
```

## What this example demonstrates

**Foundation chosen with rationale.** "shadcn/ui" isn't just a name — there's an explanation tied to strategy.

**Tokens specialized, not invented.** Most tokens stay default. Specialization is targeted: brand color, type scale, motion. Specialization-by-default produces unmaintainable systems.

**Source paths captured.** Every token has a code location. The entity describes; the code is truth.

**Components inventoried with status.** Stable, drafted, in-progress, deprecated. Not aspirational — actual current state.

**Composite components flagged as composites.** TherapistCard isn't a system primitive. AvailabilityCalendar isn't a system primitive. Treating them as such would inflate the system.

**Drift candidates named.** One-off components built outside the system. Either promote (if reusable) or refactor (if not). Don't accumulate.

**Cross-references make the system coherent.** Brand tone informs visual choices; strategy informs the foundation choice; product components consume the system.

## How to adapt

For your design system:
1. Pick a foundation; don't build from scratch unless you must.
2. Specialize tokens with rationale — color, typography, motion are common specialization points.
3. Source paths for everything (the code is the source of truth).
4. Inventory components with honest status.
5. Track drift candidates explicitly; don't pretend they don't exist.
6. Cross-reference to brand and strategy.

## Sources

- shadcn/ui (current foundation)
- Brad Frost — *Atomic Design*
- Jina Anne — design tokens
- EVD-BLD-004 — Design tokens enable scalable design systems
