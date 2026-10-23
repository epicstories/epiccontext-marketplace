# Red flags — what generated UI gets wrong most

Named anti-patterns, so a finding can say the name instead of describing
the symptom. Check these first when critiquing generated or hastily built
UI, and use them to triage when the lens tables grow long. Each flag: what
it looks like → which layer it violates → default severity → the fix.

**⚙ marks a flag that is measurable** — by a DOM check, a token
computation or a screenshot at a fixed width — and so belongs in step 3
(measure), with evidence attached, before any lens "sees" it. The
unmarked flags are the ones a lens judges.

Contents: Floor flags (1–9) · Principle flags (10–18) · Standards flags
(19–22) · The "AI default" clusters

## Floor flags

1. ⚙ **Tiny targets.** Icon buttons at 24–32 px with no padding. → Floor: target size [SPEC] → 3 on touch → hit area 44 pt / 48 dp, visual icon may stay 24.
2. ⚙ **Placeholder-as-label.** The only label is inside the field and vanishes on focus; floating labels that disappear. → Floor: recognition; NN/g 2014/2018 → 3 → label above the field, always visible.
3. ⚙ **Icon-only actions.** Unlabelled icons for anything beyond home, search, print. → Floor: signifiers; NN/g Icon Usability → 2; 3 on a primary action → visible text label.
4. ⚙ **Hover-only affordance.** Actions, tooltips or secondary controls that appear on hover and don't exist on touch or keyboard. → Floor: signifiers; WCAG 1.4.13 → 3 → visible at rest, or reachable by focus and tap.
5. **Happy path only.** No loading, empty, error or success state designed. → Floor: states → 3 on a primary flow → design every state; the empty state is the first-run experience.
6. ⚙ **Ghost contrast.** Secondary text and borders in light grey under 4.5:1 / 3:1; disabled-looking enabled controls. → Floor: contrast [SPEC] → 3 for functional text → tokens that pass in both themes.
7. ⚙ **Stolen focus.** `outline: none`, no visible focus, or focus hidden under a sticky header. → Floor: focus [SPEC] → 3 → visible 2 px ring at 3:1, offset from sticky bars.
8. **Generic errors.** "Something went wrong", errors at the top of the form, input wiped on error, validation firing while typing. → Floor: error recovery; Baymard 2023–24 → 3 → plain-language error at the field, after blur, input preserved.
9. **Silent actions.** A primary action with no feedback, a save with no confirmation, a wait with no indicator. → Floor: system status → 4 → feedback within 0.1 s; indicator over 1 s.

## Principle flags

10. ⚙ **Desktop-first mobile.** Horizontal scroll or overlap at 320–360 px; features that exist on one breakpoint only. → P3 (one experience); floor reflow [SPEC] → 3 → design both breakpoints; nothing device-exclusive without a recorded reason.
11. ⚙ **Hamburger on desktop.** Primary navigation hidden while there is room. → P3; NN/g 2016 [MEASURED] → 3 → visible navigation; hamburger only for secondary items on small screens.
12. **Nothing first.** Every KPI tile in its own colour and size; three CTAs of equal weight; a hero with four messages. → P7 → 3 when the primary action isn't among the first three things seen → one thing first, one second, the rest one quiet tone.
13. **Delight everywhere.** A different micro-animation on every control, hover bounces, 600-ms transitions on a daily tool. → P5; NN/g animation → 3 when it slows a daily action → one quiet motion language; at most one loud moment per flow, justified, with a reduced-motion twin.
14. **Component sprawl.** A new card/list/badge variant per screen with its own padding and radius. → P4, P9 → 2 → compose from the existing specs; a new component only after the pattern recurs 3×.
15. ⚙ **Off-scale values.** `padding: 13px 18px`, radius 10 px next to 12 px, a 7-px gap. → P9 → 2 → tokens from the scale; record optical corrections.
16. ⚙ **Colour-only meaning.** Red/green status with no icon or text; selection shown by tint alone. → P4; WCAG 1.4.1 → 3 on a primary task → double-code with shape, text or icon.
17. **Borrowed picture.** A reference's hero, gradient or layout copied without its problem (a dark SaaS gradient on a compliance tool). → P6 → 1; 2 when it fights the slider stance → borrow the solved problem, not the style.
18. **Pollution by request.** Elements traceable only to "it worked before", "it looks nice", "it's less work". → P8 → severity of the principle it damages → ask which experience improves; say no with a number.

## Standards flags

19. **Carousel compromise.** An auto-rotating hero holding three stakeholders' messages. → §5 Runyon 2013 ⚠; P7 → 2 → one static hero; the other messages get their own place.
20. ⚙ **US notation in NL.** 12-hour clock, `$`-style "€1,234.56", mm/dd/yyyy, Title Case in Dutch headings. → §7 [SPEC] → 2 → `Intl` APIs, sentence case.
21. ⚙ **Multi-column forms, too many fields.** Two-column checkouts, more than ~8 fields, city asked after postcode. → §5 Baymard [MEASURED] → 2; 3 on checkout → single column, lookup from postcode + house number.
22. ⚙ **Layout shift.** Images and embeds without reserved dimensions; a primary button that jumps when content loads. → §6 CLS [SPEC] → 2; 3 when it moves a primary action → reserve space; skeletons with the final layout.

## The "AI default" clusters

Three visual clusters that generated UI converges on. None is wrong;
each is a *default* rather than a *choice*. When a direction lands in one
of them, the self-critique asks what the project's context would have
chosen instead, and says what changed.

- **Cream + serif + terracotta** — the "editorial warmth" default.
- **Near-black + one acid accent + Inter** — the "developer tool" default.
- **Broadsheet grid + oversized display type** — the "brand site" default.

A direction that sits in one of these must be able to point at the
project's experience sentence (P1) and slider stance (P2) as the reason;
otherwise it is distributional convergence, and P8 applies.

## When a new flag shows up

A failure the suite meets repeatedly that isn't on this list is worth a
`propose_skill_delta` on this skill — with the pattern, the layer it
violates, the default severity and one real example. Skill knowledge is
global across projects; a platform admin reviews it.
