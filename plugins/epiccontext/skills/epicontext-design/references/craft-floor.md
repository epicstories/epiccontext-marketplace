# Craft floor — pass 1 of every critique

These are the minimums nobody reasonably argues against, so they are not
principles (they fail Spool's test: the opposite is never a sensible
choice). They are checked on every design, every self-critique, every
variant — before taste enters. A floor finding of severity ≥3 blocks
release regardless of the project's slider stance.

Each line: what to check → the source → default severity when it fails on
a primary task. Lower by one for secondary tasks.

## System status and feedback (NN/g H1)

- Every action gives feedback within 0.1 s; a wait over ~1 s shows an indicator; over 10 s a determinate progress bar and a way to cancel. → Nielsen 1993; NN/g → 4 when a primary action gives no feedback.
- All states are designed: default, hover, focus, active, disabled, loading, empty, error, success. "Happy path only" is the most common generated-UI failure. → NN/g empty states; Vercel guidelines → 3 for a missing error or loading state on a primary flow.

## Error prevention and recovery (H5, H9)

- Destructive or irreversible actions get a confirmation or an undo; the confirmation names what will happen. → NN/g H5, "Cancel vs Close" → 4 when a destructive primary action has neither.
- Constraints and good defaults prevent slips (input masks, allowed ranges, sensible pre-selection). → Norman; NN/g H5 → 2.
- Error messages are in plain language, placed at the field, say what to do, and the user's input is preserved. → NN/g H9; Baymard 2023–24 (98% of sites use generic messages; 34% wipe card data) → 3.
- Inline validation fires after the field is left, not while typing; the error disappears once the field is valid. → Baymard 2024 → 2.

## User control (H3)

- A visible exit from every state: Cancel, Back, Close, Esc on overlays. → NN/g H3 → 3.
- The user's work is protected: no data loss on navigation, timeout or error. → Tognazzini "Protect users' work" → 4 on a primary flow.

## Consistency with conventions (H4, Jakob's Law)

- Platform and web conventions for navigation, forms, links, buttons, back. → NN/g H4 → 3 on core interactions.
- Internal consistency: the same thing looks and behaves the same everywhere in the product. → NN/g H4 → 2.
- One experience across breakpoints: nothing exists on one device and not the other without a recorded reason. → P3; NN/g responsive guidance → 3 for primary features.

## Signifiers and recognition (Norman; H6)

- Every interactive element is recognisable as interactive at rest: no core action is icon-only, hover-only or disguised as text. → NN/g flat-UI study 2017 (22% slower with weak signifiers); Icon Usability 2014 → 3.
- Labels are visible; a placeholder is never the only label; no floating label that disappears. → NN/g Placeholders 2014/2018 → 3 on forms.
- Icons carry a visible text label, except home, search and print. → NN/g Icon Usability → 2.
- Nothing must be remembered between screens that the UI could show. → NN/g H6 → 2.

## Language (H2)

- The user's words, not internal jargon; sentence case in Dutch always; labels say what happens on tap. → NN/g H2 → 2.

## Keyboard and focus (WCAG 2.1.1, 2.4.7, 2.4.11)

- Full keyboard operation in a logical order; nothing trapped. → WCAG 2.1.1, 2.1.2 → 4 on a primary flow.
- A visible focus indicator on every focusable element; never `outline: none` without a replacement; not hidden behind sticky bars. → WCAG 2.4.7 (AA), 2.4.11 (AA); aim for 2.4.13 (AAA: 2 px, 3:1) → 3.

## Contrast and colour (WCAG 1.4.3, 1.4.11, 1.4.1)

- Text ≥4.5:1; large text and UI components ≥3:1 — in both themes. → WCAG 2.2 AA → 3 for functional text.
- Colour is never the only carrier of meaning: status, error and selection are double-coded with shape, text or icon. → WCAG 1.4.1 → 3 when the meaning is on a primary task.

## Target size and spacing (WCAG 2.5.8; HIG; Material)

- Hit area ≥24×24 CSS px (legal floor, AA); design norm 44×44 pt on iOS and 48×48 dp with 8 dp spacing on Android. The visual icon may be 24; the hit area may not. → WCAG 2.2; Apple HIG; Material → 3 on touch for primary actions.

## Reflow and text (WCAG 1.4.10, 1.4.12, 1.4.4)

- The layout works at 320 CSS px without horizontal scroll (= desktop at 400% zoom). → WCAG 1.4.10 → 3.
- Nothing breaks at line-height 1.5×, paragraph spacing 2×, letter spacing 0.12 em, word spacing 0.16 em; text scales to 200%. → WCAG 1.4.12, 1.4.4 → 2.
- Body text ≥16 px on the web (iOS Safari zooms inputs under 16 px); iOS Dynamic Type / text styles and Android sp, never fixed px in native. → HIG; Material → 2.

## Motion (WCAG 2.2.2, 2.3.3; NN/g)

- `prefers-reduced-motion` is respected with a variant that conveys the same meaning; no autoplaying motion without pause; nothing flashes more than 3×/s. → WCAG → 4 for flashing; 3 for no reduced-motion variant on a daily interaction.
- Interaction animations stay within 100–500 ms; feedback ≈100 ms; large transitions 200–300 ms; frequent animations shortest. → NN/g 2020 → 2; 3 when it delays a daily action.

## Honesty (Rams #6; NN/g deceptive patterns)

- No deceptive patterns: no fake urgency, no pre-checked opt-ins, no confirmshaming, no upsell disguised as the primary button, cancelling no harder than signing up. → NN/g; EU consumer law → 4.
- Visual promise equals actual behaviour: a primary-looking button does the primary thing. → Rams #6 → 3.

## Help (H10)

- Contextual help where tasks are complex; findable, task-focused, short. → NN/g H10 → 1; 2 for expert tools with no onboarding at all.

## Performance (web.dev)

- Space reserved for images and embeds (CLS ≤0.1); interactions respond under 200 ms (INP); LCP ≤2.5 s at p75. → Core Web Vitals (INP since March 2024) → 2; 3 when a layout shift moves a primary action.

---

Severity on the floor is scored as `frequency × impact × persistence`;
show the three factors so a human can re-score. The floor is not
exhaustive — WCAG 2.2 AA in full is the reference — but a design that
passes this list is unlikely to fail an audit on anything a designer
controls.
