# Standards — context-triggered numbers and conventions

Advisory layer. Nothing here blocks; every line yields a finding with its
label. Read only the blocks the intake switches on.

`last_reviewed: 2026-10-22`

Labels: **[SPEC]** normative specification or platform guideline ·
**[MEASURED]** empirical study (n/method noted) · **[RULE]** expert
advice or derived norm · **⚠** old (>8 years), single-site, or verified
only second-hand — use as direction, never as a threshold.

Authority when lines conflict: the project's own data in the graph >
[SPEC] > [MEASURED] > [RULE]. A [RULE] never blocks a design; it adds a
note.

Contents: §1 Mobile · §2 Desktop & dense · §3 Tablet/TV/wearable · §4
Content vs task · §5 Platform conventions · §6 Timing & performance ·
§7 Language & NL notation · §8 Legal EU/NL · §9 Myths not to encode ·
Intake map

---

## §1 — Context is MOBILE (or ≥40% mobile in the project's analytics)

- Design viewport 360–430 CSS px; most common 360×800, 390×844, 414×896 → StatCounter 2026 → [MEASURED, volatile] → design at 360, test reflow at 320.
- Grip: 49% one-handed, 36% cradled, 15% two-handed; 67% of one-handed use with the right thumb → Hoober 2013, n=1,333 field observations → [MEASURED ⚠ 2013, smaller phones] → primary actions within thumb reach; treat the thumb zone as a gradient, not a heatmap, because users shift grip constantly.
- Phablets are used two-handed ~70% of the time → Hoober & Shank → [MEASURED ⚠] → large screens make top corners costly one-handed.
- Keep primary navigation visible (tab bar / nav bar, 3–5 items); hamburger only for secondary items → NN/g 2016 (hidden nav +15% task time on mobile), NN/g 2025 update → [MEASURED] → "if you don't need to hide navigation, don't".
- Body text iOS 17 pt (Dynamic Type Large), minimum 11 pt → Apple HIG → [SPEC].
- Body text Android: M3 body-large 16 sp → Material 3 → [SPEC].
- Web body ≥16 px → browser behaviour (iOS Safari zooms smaller inputs) → [RULE].
- Safe areas: `env(safe-area-inset-*)` for notch, Dynamic Island, home indicator → Apple HIG Layout → [SPEC].
- Forms: correct `type` and `inputmode`, `autocomplete` attributes, single column → Baymard 2023 (16% of sites use multi-column) → [MEASURED].
- NL address entry: postcode + house number → address lookup is the local convention; 28% of mobile sites still ask city/state manually → Baymard 2023 → [MEASURED].

## §2 — Context is DESKTOP / data-dense enterprise

- Most common desktop viewports: 1920×1080 (28%), 1536×864 (10%, = 1920 at 125% scale), 1366×768 (8%), 1280×720 (5%) → StatCounter 2026 → [MEASURED, volatile] → design the core layout at 1280–1440 CSS px; assume OS scaling shrinks the effective viewport.
- Never a hamburger on desktop → NN/g 2016: hidden nav used 27% vs 48% visible; tasks ≥39% slower → [MEASURED].
- Text column 45–75 characters (≈ max-width 60–75ch); Baymard 50–75, ≤80 for accessibility; data tables may be wider → Bringhurst; Baymard → [RULE].
- Hover never reveals essential information or actions; everything reachable by click and focus → NN/g Icon Usability; WCAG 1.4.13 → [SPEC + MEASURED].
- Keyboard: full Tab order and visible focus; accelerators for frequent actions (Cmd/Ctrl+K, `/`, Esc closes overlays) → WCAG 2.1.1; platform convention → [SPEC + RULE].
- Tables: numbers right-aligned with tabular figures, sortable columns, sticky header, density switch → NN/g complex-application series → [RULE].
- "Reduce clutter without reducing capability"; staged disclosure for expert tools; a learnable system is not always an efficient one → NN/g Kaplan 2020 → [RULE] → supports the B2B exception in P2/P7.
- Sort/filter response ≤0.1 s feels like direct manipulation → Nielsen 1993 → [RULE, perceptual, still valid].

## §3 — Tablet / TV / wearable (core conventions only)

- Tablet: 88% of tablet use is seated; large tablets often lie flat → Hoober & Shank → [MEASURED ⚠] → two-pane layouts and navigation rail instead of a bottom bar.
- TV: focus-based navigation (D-pad), large targets, ~66×66 pt controls on tvOS → Apple → [SPEC, second-hand ⚠ verify on developer.apple.com].
- Wearable: one task per screen; text min ~12 pt, body ~16 pt on Apple Watch → Apple → [SPEC, second-hand ⚠ verify].

## §4 — CONTENT (read/scan) versus TASK (app/tool)

- Users read ~20% of words, at most 28%; half the text is read only on pages ≤111 words → Nielsen 2008 → [MEASURED ⚠ 2008] → front-load headings and first words of paragraphs.
- Time on page follows a Weibull with negative aging: most leave within 10–20 s; those who stay 30 s often stay ≥2 min → Nielsen 2011 on Microsoft Research data → [MEASURED ⚠] → value proposition clear within 10 s.
- Scanning patterns: F (badly structured text — a failure pattern, not a layout goal), layer-cake (headings; most efficient), spotted (looking for specific words/numbers), commitment (reads all) → NN/g 2017/2019 → [MEASURED] → design for layer-cake with descriptive headings.
- Attention: 57% of viewing time above the fold, 74% in the first two screens, 81% in three, on 1920×1080 (120 participants, >130,000 fixations) → NN/g 2018 → [MEASURED] → key CTA and proposition above the fold, plus a visual cue that more follows.
- Visual appeal judged within 50 ms (Lindgaard 2006); visual-complexity effect at 17 ms (Tuch/Google 2012); prototypicality (looks like its category) grows with exposure → [MEASURED] → low complexity and category-typical layout win first impressions; this measures appeal, not trust or conversion.
- Task-focused apps: scanning is "optimized for the current task" — recognisable places beat reading order → NN/g 2017 → [MEASURED] → P7 task-first in task screens.
- Banner blindness: users learn to ignore anything that looks like an ad; loud surface still needs conventional skeleton → NN/g → [MEASURED].

## §5 — Platform conventions (where users expect things)

- Logo top-left, links home; a centred logo makes "home in one click" fail 6× more often → NN/g Whitenton 2016, n=50 → [MEASURED].
- Search top-right; primary navigation top or left → NN/g convention → [RULE].
- Button order follows the platform: Windows OK-then-Cancel, Apple primary on the right; on the web pick one order in the design system and keep it everywhere → NN/g 2008 → [RULE].
- Forms: single column, labels above fields, inline validation after leaving the field, error under the field disappearing when valid, input preserved → Baymard 2024 (31% no inline validation), 2023 (98% generic messages), 2024 (34% wipe card data) → [MEASURED].
- Checkout: average 11.3 fields, ~8 needed; 70% average cart abandonment (mean of 50 studies 2006–2025); top reasons extra costs, forced account creation, long checkout → Baymard 2024/2025 → [MEASURED; quote the edition year].
- Carousels: ~1% of visitors click, 84% of those on slide 1 → Runyon 2013, one university → [MEASURED ⚠ single site] → one static hero over competing messages.
- iOS: tab bar at the bottom, back top-left plus edge swipe, SF Pro, sheets. Android (M3): navigation bar at the bottom (rail on tablet), system back via gesture/button, Roboto/system font → [SPEC] → cross-platform: share IA and tokens; keep back, system controls and typography native.
- NL mobile OS: Android ~68%, iOS ~32% → StatCounter 2026 → [MEASURED, volatile] → an iOS-only design language is a mistake for NL audiences.
- Continuous curvature (squircle): Figma "iOS" preset = 60% corner smoothing; CSS `corner-shape: squircle` Chromium-only → [SPEC] → visible at large radii (≥24 px), negligible at small; decide once in the radius rule (P4).

## §6 — Timing and performance

- 0.1 s feels instant; 1 s keeps the flow of thought; 10 s is the limit of attention, after which show percent-done and allow cancel → Nielsen 1993 (on Miller 1968) → [RULE, perceptual, stable].
- Feedback by wait: <1 s none (avoid flicker); 1–10 s spinner or skeleton (skeleton when the layout is known); >10 s determinate bar → derived from Nielsen → [RULE].
- Core Web Vitals "good": LCP ≤2.5 s, INP ≤200 ms, CLS ≤0.1 at p75; "poor" >4 s, >500 ms, >0.25; INP replaced FID 12 March 2024 → web.dev → [SPEC].
- Animation 100–500 ms: ~100 ms simple feedback, 200–300 ms large transitions, 400 ms already slow; the more frequent the animation the shorter and subtler → NN/g Laubheimer 2020 → [RULE, expert]; Material and Apple motion tokens take precedence within their platform.
- Fluid motion: gestures with momentum may overshoot slightly; taps get full damping, no bounce; every animation interruptible and redirectable → Apple WWDC18 "Designing Fluid Interfaces" → [SPEC/RULE] → the digital counterpart of P5's tactility.
- "53% of mobile visits abandon over 3 s load" → Google/DoubleClick 2016, data 2015–16 → [MEASURED ⚠ outdated] → never as a threshold; use LCP.

## §7 — Language and NL/EU notation

- Reading level: 8th grade for a broad consumer audience, ~12th grade for educated B2B; in NL terms aim for B1 for the public → NN/g 2015; NL government B1 convention → [RULE].
- Difficult text hurts comprehension more on mobile than desktop (marginal) → NN/g → [MEASURED, weak].
- Case: Dutch always uses sentence case; Material and most web style guides use sentence case; Apple uses title case in English UI → [SPEC/language].
- NL notation: 24-hour clock (14:30), decimal comma and dot thousands (€ 1.234,56, euro sign before with a space), date dd-mm-jjjj or "22 okt. 2026", week starts Monday → Unicode CLDR nl-NL → [SPEC] → always via `Intl` APIs, never hardcoded.

## §8 — Legal (EU/NL)

- European Accessibility Act (Directive 2019/882) applies since 28 June 2025 to e-commerce, consumer banking, e-books, telecom, transport services to consumers; micro-enterprises providing services (<10 FTE and ≤€2m) exempt; pure B2B out of scope; transition for existing contracts/products to 28 June 2030; technical norm EN 301 549 (includes WCAG AA) → [SPEC/legal; NL implementation not verified against wetten.overheid.nl].
- NL government: Besluit digitale toegankelijkheid overheid requires EN 301 549 / WCAG AA and an accessibility statement → [SPEC; not re-verified].

## §9 — Myths: do not encode

- **Three-click rule**: no empirical basis; success depends on information scent, not click count (Porter 2003; NN/g).
- **"People don't scroll"**: 43% of viewing time is below the fold (NN/g 2018). But **"the fold is irrelevant"** is equally false: attention drops sharply after it.
- **7±2 for menus**: Miller 1956 was about working memory, not scanning visible options; menus may be longer if grouped and scannable.
- **"Fewer options is always better"**: Hick's law covers unfamiliar, equal options; for known, well-grouped items the search structure matters more than the count.
- **"Carousels work"**: never convincingly shown; see Runyon.
- **"A hamburger on desktop is clean"**: measured findability and time cost (NN/g 2016).
- **"Users decide to trust you in 50 ms"**: Lindgaard measured appeal, not trust or conversion.
- **"One accent colour" as a Rams law**: Braun used several signal colours; the rule is colour = meaning, not colour = one.

---

## Intake map — which answer switches on which block

| Intake answer | Source in the graph | Blocks |
|---|---|---|
| ≥40% mobile | `analytics` | §1 + §5 + §6 |
| ≥40% desktop | `analytics` | §2 + §5 + §6 |
| Both (NL default ~50/50) | `analytics` or assumption | §1 + §2 fully; design both breakpoints |
| Daily use / expert | `persona`, `journey_map` | §2 density and accelerators; §6 timing; quieter P5 |
| Once / novice | `persona`, `journey_map` | §4 front-loading; §5 conventions; visible labels |
| Content page | a node in the `ia_tree`, `content_page` | §4 |
| Task screen | `journey_map` step | §5 + §6 |
| Critical flow (pay, sign-up, destructive) | `journey_map`, `feature` | §5 forms + checkout; floor confirmation |
| iOS / Android / cross-platform | `tech_stack` | §5 native conventions |
| NL consumer / B2B / government | `overview`, `legal` | §7 notation; §8 law |

Until the device mix is answered from the project's own data, assume the
NL ~50/50 mix, design both breakpoints fully, and say in the output that
the assumption was used.
