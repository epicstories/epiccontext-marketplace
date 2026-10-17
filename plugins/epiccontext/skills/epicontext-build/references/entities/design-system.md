# Design System

The project's **shared visual + interaction language**: tokens (color, type, space, radius, shadow), components (atoms → molecules → patterns), and the operating rules that keep them consistent. Tokens come from **the project's own token source** (a theme file, CSS variables, a tokens JSON, a native theme — whatever the stack uses), as recorded in its `design_system` and `tech_stack` blocks. Every UI surface has a `component_spec` block with a live `preview_url` — an absolute public URL rendering the real component (ADR-045). An existing Storybook is a valid preview source under the same rules (public, absolute story-iframe URLs), but it is not required and not the source of truth.

The scaffolded design_system block (block type `storybook_link`) is a pointer — the URL of the project's live component catalogue — plus the *why*: the philosophy, the coverage commitment, the accessibility floor, and the rules for when to bend them, which the code doesn't carry.

A real design_system block tells a new contributor: *what tokens exist, what components are available, how to extend them, when to add a new one vs. compose, and what the accessibility floor is.* If yours just contains a catalogue URL and "see the catalogue for the rest", it's a stub.

> **The cross-project standard** — the mandatory base inventory every
> project ships with, the fixed documentation anatomy per component
> (live preview, every variant rendered with a when-to-use caption,
> states, do/don't, accessibility), and the setup/repair playbooks —
> lives in `epicontext-design/references/design-system-standards.md`,
> grounded in Material 3, Uber Base, and NS Nessie. Check a project's
> inventory against it before calling the design_system block drafted.

## Why most design_system blocks are too thin

The pattern: a URL pointing at a component catalogue, three sentences naming the component library and CSS framework, end. That tells the reader where the components live but not:
- **Which tokens are canonical** (and whether components are required to consume them)
- **How tokens map** to what components consume — utility classes, CSS variables, theme objects (the "8px = `--space-2`" kind of contract)
- **The component coverage** — which categories are fully covered, which are gaps, which are intentionally bespoke
- **The accessibility floor** — WCAG level, keyboard nav requirement, ARIA strategy
- **Theming strategy** — single theme, dark mode, multi-brand
- **The extension contract** — when to add a new component vs. compose; when to bend a token

A drafted design_system block is the **rulebook + map**, not the gallery.

## The depth bar

| Section | Stub looks like | Drafted looks like |
|---|---|---|
| Tokens | "We use [CSS framework]." | Token tree per axis (color / type / space / radius / shadow / motion), with canonical values and where they're defined in the project's token source. |
| Token-to-consumer contract | absent | The mapping rule (e.g. "spacing scale is 4-based; 8px = `--space-2`", plus the utility class or theme key it surfaces as, if the stack has one). Components don't hardcode; they consume tokens. |
| Component inventory | "[Component library name]." | Categorised inventory: atoms (button, input), molecules (form-field, popover), patterns (block-editor, widget tooltip). Per category: coverage % and gaps. |
| Component contract | absent | What's *required* of every component: a11y baseline, prop naming conventions, theming support, dark-mode support, RTL support if applicable. |
| Theming strategy | absent | Single-theme vs. multi-theme; how dark mode works (CSS variables, a theme class, a platform setting); how a future second brand would slot in. |
| Accessibility floor | absent | WCAG level committed to (A / AA / AAA), keyboard nav requirements, ARIA strategy, the testing tools used to enforce. |
| Preview coverage | "Yes." | Every UI surface has a `component_spec` with a live `preview_url` (and one per declared variant); what's documented vs. what's not; the per-state convention. |
| When to add a new component | absent | The rule: only when the same pattern recurs ≥3× and composition can't solve it. Until then, compose existing components. |
| When to bend a token | absent | The rule + the escape hatch: how a one-off override is approved + how it gets back into the system. |
| Productivity claim | absent | Honest about the gain (e.g. "halves new-page time", "cuts CSS regression incidents by ~80%"). Cited or marked as hypothesis. |

## The depth checklist (run BEFORE writing the block)

1. **Catalogue URL** present and pointing at a live, public deployment (not a stale local URL); every `component_spec` has an absolute `preview_url`.
2. **Token tree** per axis — name + canonical value + where it's defined.
3. **Token-to-consumer contract** stated (CSS variable scheme, utility mapping, theme keys — whatever the stack uses).
4. **Component inventory** with coverage and named gaps.
5. **Component contract** — the requirements every component must meet.
6. **Theming strategy** — what works today, what's planned.
7. **Accessibility floor** — WCAG level + keyboard nav + ARIA + testing tool.
8. **Extension rules** — when to add new, when to compose, when to bend.
9. **The productivity / quality claim**, honestly cited or marked as hypothesis.
10. **Links** — tech_stack (the component library), ADR for the design-system choice, the `brand_visual_identity` block if the project has one (via `visual_identity_ref`).

## Push-back prompts (run AFTER drafting)

- **"Are the catalogue URL and every `preview_url` live?"** If they 404, the block is drift.
- **"Did I name the tokens, or did I name the CSS framework?"** The framework is the implementation, not the token model. Name the canonical axes.
- **"Did I commit to an accessibility level?"** A11y without a stated WCAG level is aspirational. Pick one.
- **"What's *not* covered?"** Honest coverage gaps are more useful than a polished overview. Name them.
- **"What's the rule for adding a new component?"** Without one, new components multiply ad-hoc and the system entropy grows.
- **"What's the productivity claim — and is it honest?"** "Halves new-page time" needs a comparison baseline. If you don't have one, mark it as hypothesis.
- **"Am I sure this is the design system rulebook and not `tech_stack` or the brand's visual identity?"** Tech stack = what you built it with (the CSS framework, the component library). Visual identity (a `brand_visual_identity` block, also filed under the `design_system` entity) = the *aesthetic* (color palette philosophy, type voice). The design system rulebook = the rules connecting tokens to components to usage.

## Evidence pool — where to mine

All in the project's own repo or graph:

- **The token source** — wherever the project defines tokens (a theme or framework config, a global stylesheet with CSS variables, a tokens JSON, a native theme file). The `tech_stack` block should say which.
- **The component folder** — the actual component inventory.
- **The existing `component_spec` blocks** and their `preview_url`s — what's documented vs. what's missing. If the project has a Storybook, its stories count too.
- **The `brand_visual_identity` block**, if any — should agree with the token palette.
- **Linked ADRs** — choice of component library, theming approach.
- **External rationale** — Nielsen / Norman on design systems; Brad Frost on Atomic Design; Google's Material productivity claims. Cite them when invoking general principles, mark as general industry evidence (not project-specific) — see `references/evidence.md` for the curated EVD-BLD-014–018 entries.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | `storybook_link` block with placeholder URL ("https://example.com/storybook"), no body, no contract. |
| **drafted** | Real catalogue URL. Token tree filled. Component contract stated. Accessibility floor stated. Extension rules stated. **≥2 captioned + narrated `~~~flow` diagrams (component hierarchy + token flow).** ≥500 words in body. Linked to tech_stack + ADR. |
| **validated** | Drafted + `component_spec` with a live preview for ≥80% of shipped components + a11y testing in CI + at least one productivity claim with a cited baseline + the visual identity agrees. |

## Push-back lines to use on yourself (or to surface to the user)

- *"Your catalogue URL is `example.com`. That's a stub marker — replace it with the real one or the block is drift."*
- *"You named the component library three times and never named a single token. The reader can't extend the system from your block."*
- *"Your WCAG floor is unstated. That means 'aspirational a11y', which means 'no a11y'. Pick a level."*
- *"You haven't said when to add a new component. Without a rule, the inventory grows ad-hoc and design debt accumulates silently."*
- *"You linked zero ADRs. Choice of component library + theming approach + a11y level all deserve ADRs. Which exists?"*

## Anti-patterns to refuse

- **The URL-only block.** Just a catalogue link with no body. Refuse — force the rulebook.
- **The aspirational a11y.** "We care about accessibility" with no WCAG level. Force a commitment.
- **The vanity claim.** "Saves hundreds of hours" with no baseline. Force a citation or downgrade to hypothesis.
- **The component-library worship.** "[Library] is best." Force the trade-off: what it loses that the alternatives (a headless primitive library, a full kit like Material, hand-built) gain.
- **The orphan design system.** No link to the visual identity or brand. The aesthetic philosophy in brand should match the token palette here.

## Small visuals — two diagrams every design_system block benefits from

Tokens + components are inherently spatial. A non-tech reader cannot infer the system from a paragraph.

### Diagram 1 — Component hierarchy (atoms → molecules → patterns)

Show the layered composition, with coverage per layer. Use `component` for in-house, `external` for library imports. The example below shows one stack (a copy-paste React component kit); name the project's own source instead.

````
~~~flow
title: Component hierarchy
direction: TB
nodes:
  - { id: atoms, label: "Atoms", sub: "button · input · label · …", role: container }
  - { id: lib, label: "Component library", sub: "e.g. shadcn/ui, Vuetify, native kit", role: external }
  - { id: molecules, label: "Molecules", sub: "form-field · popover · dialog · …", role: container }
  - { id: patterns, label: "Patterns", sub: "checkout · search · settings", role: container }
  - { id: app, label: "App pages", role: external }
edges:
  - { from: lib, to: atoms, label: "imported + tweaked" }
  - { from: atoms, to: molecules, label: "composed into" }
  - { from: molecules, to: patterns, label: "composed into" }
  - { from: patterns, to: app, label: "consumed by" }
~~~
````

### Diagram 2 — Token-to-consumer contract (how tokens reach components)

Show: token source → whatever turns tokens into something consumable (a framework config, a build step, a theme object) → CSS variables or theme keys → component consumption. Critical for explaining the no-hardcoded-pixels rule. The example below is a utility-CSS web stack (Tailwind); swap the middle nodes for the project's own pipeline.

````
~~~flow
title: Token flow
direction: LR
nodes:
  - { id: tokens, label: "Brand tokens", sub: "color · type · space · radius · shadow", role: external }
  - { id: tw, label: "tailwind.config.ts", sub: "example: utility-CSS stack", role: component }
  - { id: vars, label: "CSS variables", sub: "global stylesheet", role: component }
  - { id: util, label: "Tailwind utilities", sub: "p-2 · text-sm · bg-stone-50", role: component }
  - { id: comp, label: "Components", role: container }
edges:
  - { from: tokens, to: tw, label: "registered as" }
  - { from: tw, to: vars, label: "generates" }
  - { from: tw, to: util, label: "exposes" }
  - { from: util, to: comp, label: "consumed via className" }
  - { from: vars, to: comp, label: "consumed via var(--…)" }
~~~
````

Each diagram gets setup + narration. The narration is where you flag gaps honestly ("Notice the patterns layer has no live previews yet — that's the current 0% coverage gap").

**Mermaid is NOT enabled in EpicContext.** Use `~~~flow` tilde fences. See `architecture.md` for the full role palette.

## Output schema (markdown body)

```
### Tokens
- Color: …
- Type: …
- Space: …
- Radius: …
- Shadow: …
- Motion: …

### Token-to-consumer contract

### Component inventory
- **Atoms:** … (coverage X%)
- **Molecules:** … (coverage Y%)
- **Patterns:** … (coverage Z%)

### Component contract

### Theming strategy

### Accessibility floor

### Preview coverage

### When to add a new component

### When to bend a token

### Productivity / quality claim
```

## Required connections (graph-level)

A drafted `storybook_link` (design_system) block must:

- Link **tech_stack** (the underlying component library + styling tool).
- Link **at least one ADR** (component-library choice, theming choice, or a11y commitment).
- Link the **`brand_visual_identity`** block via `visual_identity_ref` when the project has one (the aesthetic philosophy should match the token palette).

A design system with no brand link is unmoored from the project's voice. A design system with no ADR is undocumented.
