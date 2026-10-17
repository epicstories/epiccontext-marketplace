# Design-system standards — structure, page anatomy, and the spec bar

> The operating standard for EVERY design system EpicContext touches —
> EpicContext's own chapter, and every client project. Three jobs:
> **set up a new design system**, **pull an existing UI back into one
> system**, and **document it so a developer can build from it without
> opening the running app**.
>
> The non-negotiable: **ALWAYS one system. No hard-coded values, no
> variant that lives outside the design system.**
>
> Grounded in the live documentation of NS Nessie (design.ns.nl), Uber
> Base (base.uber.com), Material Design 3 (m3.material.io), IBM Carbon
> (carbondesignsystem.com), Atlassian (atlassian.design) and Shopify
> Polaris, read page-by-page 2026-08-27, plus the zeroheight Design
> Systems Report 2026 (n=147) for adoption evidence.

## What a design system site is FOR

Four readers, four different arrivals. A system that serves only the
first is the one nobody adopts.

| Reader | Their question | What serves them |
|---|---|---|
| **Designer**, half-formed need | "I need to warn someone" | Function-grouped components, thumbnail grids, **synonyms** ("also known as: CTA") |
| **Developer**, implementing now | "Give me the import, the props, the token, the height" | Code tab, props table, **spec tables** |
| **Reviewer / content / a11y** | "Are we allowed to do X?" | Do/Don't pairs, explicit *When not to use*, stated rationale |
| **Adopter** | "Does this exist yet, and where?" | Availability table per platform, status, changelog |

**The adoption numbers that should change your priorities** (zeroheight
2026): only **7%** of teams report full adoption. What drives it is
**component completeness (79%)**, not documentation (45%). But **55%
are dissatisfied with their own docs**, and the three things most
systems skip — accessibility guidance (59% have it), UX patterns (56%),
content guidelines (38%) — are exactly the three NS, Carbon and Base
treat as top-level citizens. Completeness first; then be the system
that documents the parts everyone else skips.

## Why the system, not the prototype, is the source of truth

The recurring developer complaint: *"the prototype keeps changing, so I
don't know what the component actually is."* That is the job the system
exists to do. A prototype shows the **current state** of one screen; a
design system states the **contract** — every variant that exists, and
the measurements that make it that component rather than a similar
rectangle.

A component page that cannot answer "what are all the variants?" and
"how tall is it, what's the padding, what's the minimum touch target?"
has not replaced the prototype, and the developer is right to keep
asking. **Variant coverage and a spec table are not polish. They are
the feature.**

## The information architecture

**Four or five top-level doors, never more.** Nessie ships four. The
convergent shape across all six reference systems:

```
Design System
├── Get started          role-scoped: for designers / for developers / for content
├── Foundations          the visual language — colour, type, icons, layout, motion
├── Guidelines           cross-cutting rules — principles, accessibility, content
├── Components           grouped BY FUNCTION (see below)
└── Patterns             multi-component solutions: forms, empty states, page templates
```

Rules that come with it:

- **Components are grouped by function, never alphabetically-flat and
  never by atomic layer.** Base: Action / Input & control / Data display
  / Feedback & status / Surfaces / Navigation / Data & tables.
  Atlassian and Polaris do the same. *No public reference system groups
  by atoms/molecules/organisms* — that taxonomy describes composition,
  not intent, so it fails the way people search: a designer thinks "I
  need to warn the user", not "I need a molecule". Keep the atomic
  layer **on the page**, where it explains the build-up.
- **Accessibility and content live in Guidelines, not scattered per
  component.** Nessie explicitly migrated per-component copywriting to a
  central Content section — treat that migration as the lesson and
  centralise from the start, leaving a short excerpt on each component.
- **Tokens are separate from Foundations.** Nessie and Carbon both do
  this: Foundations is human-facing ("here is our colour language"),
  Tokens is machine-facing ("here are the named values").
- **Group index pages are thumbnail grids, not text lists.** Carbon and
  M3 both render ~40 components as recognisable cards. You find a
  component by shape faster than by reading names.
- **A status column kills the "is this real yet?" question.** Nessie's
  pattern index is a table of `Page | Status | Last edited | Owner`.

## The component page — four tabs, in this order

Every reference system splits **design guidance** from **visual spec**
from **code**. That is the strongest cross-system signal there is.

| System | Their tabs |
|---|---|
| Nessie | Example · Guidelines · Copywriting · Develop |
| Base | Usage · Content · Status & resources |
| Material 3 | Overview · Specs · Guidelines · Accessibility |
| Carbon | Usage · Style · Code · Accessibility |
| Atlassian | Examples · Code · Usage · Changelog |

### Tab 1 — Overview
1. Name + **one-sentence purpose**.
2. Status badge (stable / beta / deprecated).
3. **Also known as** — synonyms, because people search the word they
   already have ("Action, call to action, CTA" — Base).
4. **Live interactive example**, with a variant selector.
5. **Availability**: `Type | Resource | Status` — design library,
   each implementation target.

### Tab 2 — Guidelines
1. **Usage** — what it is for, as a list.
2. **When to use** and **When not to use** — two explicit headings.
3. **Anatomy** — a labelled diagram, every part marked required or
   optional (Carbon labels them A / B / C).
4. **Variants** — a table: `Variant | Rendered example | Use for`.
5. **Sizes** — `Size | Use case`.
6. **Behaviour** — loading, pressed, selected, empty.
7. **States** — enabled / hover / focus / pressed / disabled, rendered.
8. **Best practices** — each rule a heading with a Do / Don't pair.
9. **Placement and alignment.**
10. **Rationale callouts where you deviate from convention.** Nessie's
    is the model: it doesn't just omit disabled buttons, it explains
    why in three reasons and links the argument.
11. **Accessibility** — touch targets *with numbers*, accessible-name
    rule, keyboard behaviour, the token pair that guarantees contrast.
12. **Related components**, cross-linked.

### Tab 3 — Specs (the Carbon model — copy these schemas verbatim)

Read the measurements off the shipping component's class strings, never
from the design file and never from memory. The tables and the code
then cannot disagree without someone noticing, which is the only reason
a reader should believe them. Key every value to the token that governs
it where one exists: a token survives a theme change, a copied hex does
not.

This is the tab that replaces the prototype as the source of truth.

| Section | Table |
|---|---|
| Colour | `Element \| Property \| Colour token` |
| Interactive states | `State \| Element \| Property \| Colour token` |
| Typography | `Element \| Font-size (px/rem) \| Weight \| Type token` |
| Structure | `Element \| Property \| px / rem \| Spacing token` |
| Size | `Variant \| Size \| Height (px / rem)` |
| Shape | `Size \| Corner radius` |
| Targets | Minimum touch/click target, minimum spacing between instances |

Real rows, so the bar is unambiguous — Carbon's Button:
`Label | text-color | $text-on-color` ·
`Button without icon | padding-left | 16 / 1 | $spacing-05` ·
`Icon | svg | 16 x 16 | –` ·
`Small | 32 / 2`, `Medium | 40 / 2.5`, `Large | 48 / 3`.

**Key every row to a token, not a raw value.** A token survives a theme
change; a hex in a table is wrong the first time the theme moves.

Concrete target numbers to state, not imply: Nessie's buttons are
**48px** high on small viewports, **56px** on large, compact **32px
with a 48px touch target via padding**, **min-width 80px**, **≥8px
between targets** (they use 16px). Base cites **48×48 touch / 28×28
pointer**, linked to WCAG 2.2 AA target-size minimum.

### Tab 4 — Code
Framework-agnostic snippet first, then per-framework. A **props table**
(`Name | Description | Type | Default`), methods/events, and a
changelog.

## Showing every variant

Three approaches exist; use the first, then the third.

1. **Variant table — name + rendered example + when to use.** Nessie,
   Base and Carbon all do this. It answers "what exists" and "which do
   I pick" in one scan. **This is the required minimum.**
2. Named example gallery with per-example code (Polaris lists 18 for
   Button). Good; more scrolling.
3. Interactive props playground — answers "what happens if I combine
   compact + inverted + icon-only". Never the overview on its own:
   Carbon's own embed says it "contains only a preview".

For components whose variants are **use cases** rather than props —
Table is the canonical example — show each use case: plain reading
table, numeric/dense, selectable rows, empty state, footer totals.

## Colour: brand first, tokens second

Fundamentals opens with **the brand's colours**, not with token roles.

A semantic pair (`--primary` on `--primary-foreground`, and the contrast
it achieves) answers "what is this colour FOR". That is a reference for
building, and it belongs on the tokens page where someone goes to look a
value up. Leading with it answers a question nobody opened the page to
ask — the reaction it earns is *"the palette is not working for me
because it is showing token"*.

So state the layers in this order, and show them in this order:

```
brand colours  →  section/theme ramps  →  semantic tokens  →  components
```

**The brand layer is:**

- **The colours in the mark.** Sample them from the actual logo file
  rather than trusting a memory or a brand deck — then match each to its
  nearest step in the project's colour system and note both. For
  EpicContext the mark is `sky-300`, `fuchsia-300` and `amber-300`, and
  the sampled pixels sit within one or two hex digits of those.
- **Ink and paper.** The near-black used for text and the surface it
  sits on — the two colours a product is overwhelmingly made of. Say so
  explicitly, because the brand hues are accents and a screen that
  reaches for them everywhere stops looking like the brand.
- **Black and white**, and what each is reserved for. EpicContext's ink
  is `stone-800`, not `#000` — pure black is for the mark's sparkle.
- **The ramps**, shown as ranges rather than single chips. A "shade
  range" cannot be conveyed by one swatch, and the range is the point.

**Prefer stock palette steps over bespoke hexes.** If the logo was drawn
from Tailwind (or any published scale), name the steps: the ramps around
each hue already exist, already have tested contrast, and need no scale
of your own. A bespoke `#7fd4fc` that is one digit off `sky-300` is a
maintenance liability for no gain.

**Keep the accessibility check visible.** Moving contrast detail to the
tokens page is right; moving the *count of failing pairs* out of sight is
not. A failure nobody navigates to is a failure nobody fixes — surface
"N pairs below AA" on the Fundamentals door itself.

## Foundations — what belongs there

Nessie's Fundamentals: Logo/Assets · Colour · Typography · Icons ·
Composition (Layout for Web, Layout for App) · Style · Motion.
Carbon's Elements: 2x Grid · Colour · Icons · Pictograms · Motion ·
Spacing · Themes · Typography.

Minimum for an EpicContext project: **colour roles (light + dark), type
scale, spacing scale, radius, elevation, iconography, motion
durations** — and the section/theme system if the product has one.

### Fundamentals are WRITTEN, not derived (MANDATORY for client projects)

A project's Fundamentals page renders **what is in the graph** — it is
not derived from the project's code — and a
session that documents 17 components and writes zero fundamentals
leaves that door showing one dashed placeholder next to a full
Components door. Seen in the field (Edge, AuctionMaster).

The rule: the same session that writes component specs writes the
fundamentals, as `component_spec` blocks with `group: fundamentals`:

- **Colour system** — brand hues with hex, ink & paper, the ramps,
  sampled from the project's actual stylesheet or theme file — wherever
  that project keeps them: Tailwind config / CSS variables, MUI
  `theme.palette`, SCSS tokens, styled-components theme, a plain
  `:root` block. Not every project is Next.js or Tailwind; the rule is
  framework-neutral, the source is whatever the code actually reads.
  Name every token; a swatch without a name cannot be referenced.
- **Typography** — faces, the scale with px/rem, weights, where each
  step is used.
- **Spacing** — the grid (4px? 8px?) and its steps, named as the
  developer types them.

`check_project_health` reports component specs beside an empty
Fundamentals door as a finding. Don't wait for it.

### The front page is doors, not an essay

The chapter overview renders its three door cards first, but a long
overview body still makes the page read as an essay with navigation
attached. Keep the design-system overview to ~150 words: what the
system is, where the code lives, one line per door. The four-layer
story, the audit results, the history — all of that is **Guidelines**
content. If the overview needs a scroll to reach prose you wrote,
move that prose.

## The mandatory base — what every project ships with

A design system without these is not ready to build screens. Grouped
the way the menu should group them.

| Group | Components (must exist and be specced) |
|---|---|
| **Actions** | Button (all variants), IconButton, GhostAction, Link |
| **Inputs & controls** | Input, Textarea, InlineInput, Select, Checkbox, Switch, Radio, Slider, Label, Field pattern |
| **Containment** | Card, Separator, Accordion/Collapsible, ScrollArea, **Table (with use-case variants)** |
| **Communication** | Badge, Alert, Toast, Tooltip, Progress, Skeleton, EmptyState |
| **Navigation** | Tabs, DropdownMenu, Breadcrumb, Pagination, Command palette |
| **Overlays** | Dialog, AlertDialog, Popover, Sheet |
| **Data display** | Avatar, Chart wrapper, StatRow/KPI tile |
| **Product surfaces** | The organisation's own big components — boards, maps, editors, panels |

Rules with the inventory:

- **Missing base component = create it in the system first**, then use
  it. Never inline the one-off. (EpicContext learned it on its own
  app: Table was missing, so nothing documented tables; four boards hand-rolled icon
  buttons because IconButton didn't exist.)
- **Product surfaces are first-class.** Nessie documents Route (which
  stations a train stops at) and Rush (how busy it is) with the same
  page anatomy as Button. A design system is not only buttons — the
  product's defining surfaces are citizens.
- Every spec declares its layer and what it is **built from** (`uses`),
  so pages decompose to atoms the way a Figma file's instances do.
  That is construction metadata **on the page**, not the menu axis.

## The preview rule — never re-sketch (MANDATORY)

**Every preview mounts the real component. Never redraw a component or a
page in detail — no fake buttons, no fake copy, no "simple version to
show the idea".**

If a component is documented, its preview imports the component the
product imports and feeds it sample data.

**One thing is allowed, and only one: an abstract wireframe.** Plain
shapes showing how a page is divided — where the regions are and roughly
what proportion each takes — with a region name and *nothing else*. No
imitation controls, no sample copy inside the shapes, no attempt to look
like the screen.

The line is imitation versus abstraction:

| Allowed — a wireframe | Banned — a redraw |
|---|---|
| Says "this page is a wide reading column with a narrow companion" | Says "this is what the page looks like" |
| Grey blocks with a region label | Fake buttons, fake breadcrumbs, fake card titles |
| Obviously a diagram | Plausibly a screenshot, and wrong |
| Cannot be mistaken for the product | Mistaken for the product, then trusted |

A wireframe cannot lie about detail because it makes no claim about
detail. A redraw makes the claim and then fails to keep it. That is the
whole distinction — abstraction is honest, imitation is not.

Why it is absolute rather than a preference:

1. **A sketch cannot be wrong.** Nothing about a drawing of grey boxes
   can contradict the component it claims to show, so it stays
   plausible forever while the real thing moves on without it. A real
   mount breaks visibly the week the component changes, and visibly
   broken is what gets fixed. Falsifiability is the whole value.
2. **Sketches look bad, and that costs trust.** EpicContext's own
   drawn page previews were the thing a reader pointed at and said this
   is not what the page looks like. A design system that shows crude
   approximations teaches people not to believe anything it shows —
   including the parts that are accurate.
3. **The judgement being asked of the reader is a design judgement.**
   "Is this layout right?" cannot be answered against boxes. Real
   components with real content is the only rendering that supports the
   decision the page exists for.

**Sample content must be realistic, not lorem ipsum.** A persona named
"Sarah — agency lead", a KPI with a plausible number, a journey with
real step names. Placeholder text hides exactly the problems a preview
exists to reveal: how the layout behaves at real word lengths, whether
a long name truncates, whether a number column aligns. Never invent
*measured* numbers and present them as real (see the numbers rule
elsewhere in this skill) — sample data is clearly sample, but it is
shaped like the truth.

**When a surface genuinely cannot be mounted** — a page is a whole
route with its own data and auth — the order of preference is:

1. **Link to the real screen.** Always correct, never stale, zero
   maintenance. A page spec carries a `route` and renders an "Open the
   real page" affordance.
2. **Embed the real screen** (same-origin iframe) where the platform
   allows it. Still the real thing, and visual.
3. **A screenshot, generated automatically** in CI from the running
   app, never hand-placed. A hand-updated screenshot is a sketch with
   extra steps: it goes stale silently.
4. **An abstract wireframe** beside the link, per the rule above —
   regions and proportions only. This is what a reader needs to
   understand a page's *structure*, which a link alone does not give
   them at a glance.

A detailed redraw is not on this list at any position.

**Delete the sketching primitives from the codebase.** As long as a
`MiniBox` / `PageFrame` helper exists, the next contributor will reach
for it under time pressure. We removed ours; the rule now enforces
itself because there is nothing to draw with.

## Page-layer specs

Pages get the same anatomy one level up, and one extra rule learned the
hard way: **a page preview must be a recognisable miniature of the real
screen** — real chrome, real component arrangement, sample content. A
schematic is acceptable when it is *labelled as* a layout diagram and
teaches the regions. What is not acceptable is a picture that looks
like the product but isn't: a reader who compares it to the running app
and finds them different stops trusting every other page too.

Prefer, in order: (1) the real components rendered at reduced scale,
(2) an explicitly-labelled layout schematic, (3) nothing.

### MANDATORY for every client project: `preview_url`

The book's built-in preview registry holds **only EpicContext's own
components**, looked up by a string key. A client project's Button lives
in a client repo, so setting `preview` on its spec renders **nothing**,
and it fails *silently*.

This is not hypothetical. AuctionMaster shipped seventeen specs with
every variant carefully described, and the chapter showed no components
at all. Prose about a Button is not a design system.

So for every client project:

| Field | What to set |
|---|---|
| `preview_url` | The component in isolation — the **absolute URL** of the project's public preview route. `https://your-app.example.com/__ec/preview?key=button` |
| `variants` | `[{ name, preview_url, when }]` — **one entry per variant, each with its own URL**. "Six variants" in a sentence is the thing being replaced. |
| `group` | The functional group, so the chapter's navigation works |

**The preview route, for a new project.** One page in the project's own
deploy that renders one entry from the registry the application already
imports — route and registry are at
https://www.epiccontext.com/templates/epiccontext-preview/README.md, ready to
copy (React / Next.js template; same ~30-line shape in any framework). A story file is
a second declaration of the component and drifts from it; a registry
entry is the component.

**It must be an absolute URL to a publicly readable route.** A path is
refused rather than repaired. Paths used to be routed through the
project's prototype proxy so a protected surface could still be framed,
and that cannot work: a framed document does not send cookies with all
of its sub-resources, and `@font-face` requests are anonymous by
specification, so they reached the proxy with no session and came back
as a sign-in page —

```
OTS parsing error: invalid sfntVersion: 1008813135   // the bytes "<!DO"
```

If the deploy runs the gate, open the one route:
`EPICCONTEXT_GATE_PUBLIC_PATHS=/__ec/preview/`. It has no data, no
session and no API; the app around it stays shut. Confirm it in an
incognito window before wiring any spec to it.

**Project already has a Storybook?** Keep it if it serves the team —
an existing Storybook is a legitimate preview source under the same
rules: every component still gets its `component_spec`, and
`preview_url` points at the story's own public **absolute** iframe URL
(`https://…/iframe.html?id=button--primary&viewMode=story`), never a
path and never behind Basic Auth. What cost a client project weeks of
empty frames was the path/proxy mechanism, not Storybook (ADR-047).
For a new project, still prefer the registry route above.

### MANDATORY: the composition chain — `uses` on everything composed

One screen exists in three places at once: as a route in the running
app, as a `content_page` (why it exists), and as a page-layer
`component_spec` (what it is built from). The chain that binds them:

```
prototype screen  ←app URL + slug→   content_page
content_page      ←slug = route→     page-layer component_spec
page spec         ←uses→             its components
component         ←uses→             the atoms underneath
journey step      ←route→            the content_page it visits
```

Every hop is a link in the book, and every hop is checked. The rules
that keep it walkable:

- **Every component in the codebase gets a spec — no component is too
  small.** A chip, a pill, an icon button: if the app renders it, the
  system documents it. "Too small to document" is how a design system
  becomes a list of big things over an inventory of unnamed ones.
- **Every spec above atom level declares `uses`**, naming the keys of
  the specs it is built from. A composition without named parts cannot
  be walked down to its atoms.
- **Every key in `uses` must itself be a spec.** A key nothing
  documents renders as a dashed "no spec" chip that links nowhere —
  visible on the page and reported by health. Write the missing spec or
  fix the key; never name what you will not document.
- **Every screen gets a page-layer spec** — `layer: page`, `route` set
  to the content page's slug, `uses` naming the components on it, a
  `wireframe` for its regions. This is the spec that makes a screen
  walkable from its context page into the design system.

Write the whole inventory in ONE pass, bottom-up: atoms first, then the
molecules that name them, then organisms, then the page specs. Writing
top-down leaves `uses` pointing at specs that do not exist yet, and
every intermediate state shows broken chips.

**Check your work.** `check_project_health` now flags a `component_spec`
with no visible preview, one that declares variants but renders none, a
screen no page spec documents, a `uses` key nothing documents, and a
composed component with no `uses` at all. If the report is clean, the
chain is genuinely walkable.

**Build the preview from the page's own class strings.** Not similar
markup — the same element structure and the same classes, with fixed
content in place of live data. This sounds pedantic and is the whole
point: a preview drawn out of little grey stand-in boxes stays
*plausible* forever, because nothing about it can contradict the page.
One that shares the real markup goes visibly wrong the week the page
changes, and visibly wrong is what gets fixed.

**Re-read the route before you trust a page spec.** Page specs rot
faster than component specs, because a product reorganises screens far
more often than it reorganises its buttons. EpicContext's own
"Project dashboard" spec described a group-overview grid for months
after the route had become a redirect to the book cover — the spec, its
preview and the audit all agreed with each other and none of them
agreed with the app. When a page spec and its `sourcePath` disagree,
the source wins and the spec is rewritten, not patched.

**When a screen is renamed or retired, keep the old name findable.**
Put it in `alsoKnownAs` and say in the body why the old screen is gone.
Someone will search for "dashboard" for years; landing them on a 404
teaches nothing, and landing them on the page that replaced it teaches
them the decision.

## Playbook A — set up a NEW design system

1. **Foundations first**: mint tokens from the brand block (or the
   neutral defaults), light + dark, before any component work.
2. **Scaffold the mandatory base** — specs and previews included. Stub
   maturity is fine; missing is not.
3. **Wire a check on day one**, in the project's own CI — a lint rule
   or audit script for literal colours, raw palette values and
   off-scale spacing, plus a count of raw primitives (`<button>`,
   `<input>`… outside the component library) ratcheted at baseline
   **0**. A greenfield project never accumulates the debt.
4. **First screens compose only** — a page needing something new adds
   the component + spec in the same change.
5. **Document product surfaces as they appear** (the Route/Rush rule).
6. **Spec tables from the first component**, not "later". Retrofitting
   measurements across 50 components is the job nobody does.

## Playbook B — pull an EXISTING UI back into one system

The order that worked on EpicContext itself (its ADR-039, the
component-rule ratchet):

1. **Measure**: run the audit + a raw-primitive scan; count dead files.
2. **Delete the dead stratum** — zero-importer files carry a huge share
   of the noise and cost nothing to remove.
3. **Find the missing molecules**: the worst offenders hand-roll the
   same two or three micro-patterns; mint those and migrate the worst
   files as the worked example.
4. **Ratchet**: check in the measured baseline; fail on any increase;
   lower it with every cleanup.
5. **Spec the exported, reused components**, then migrate the literal
   colour long tail mechanically.
6. **Regroup the menu by function** before adding more components — a
   flat list of 50 is where a system stops being browsable.

## The one-system mandate (verbatim, for every project)

- All UI is built from components; pages are compositions.
- No hard-coded colours, spacing, or type off the scale — tokens only,
  `design-audit-allow <rule> — <reason>` for the rare true exception.
- **No variant outside the system**: a new look for an existing
  component is a new documented variant, added to the component and its
  spec first, then used. A variant invented inline in a page is the
  seed of the next mess.
- The project's check makes this mandatory: numbers only go down.
  `check_project_health` holds the graph side (specs, previews, `uses`).
