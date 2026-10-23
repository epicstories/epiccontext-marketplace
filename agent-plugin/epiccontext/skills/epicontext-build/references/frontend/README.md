# Epic Context — Frontend

Build distinctive, production-grade interfaces grounded in the project's
own design system, brand, and IA — all of which live in the graph, not
in local files. **And: every page you build lands in the graph as a
`content_page` block in the same change, and every UI surface you build
has a `component_spec`.** Context-as-you-build, not context-after-the-fact.

These rules are stack-neutral. The project's `tech_stack` block says what
it is built in; read it before assuming anything. For stack-specific
how-tos (one stack each, clearly labelled) see
`references/frontend/framework-selection/` — e.g. `react-nextjs.md`.

## When to use

- Building or refining a component, page, or flow — in whatever
  framework the project uses
- Styling with the project's design tokens
- Implementing a `feature` block in code
- Writing copy for UI surfaces (pulls tone/voice from the graph)
- Wiring a page route to its `ia_tree` entry and `content_page` block
- **Choosing or reviewing a framework** — a new prototype, "what should we
  build this in?", "is this overkill?": read
  `references/frontend/framework-selection/README.md` (the overkill ladder,
  build-health checks, one file per framework: `angular.md`, `astro.md`,
  `htmx-server-rendered.md`, `react-nextjs.md`, `solid.md`,
  `svelte-sveltekit.md`, `vue-nuxt.md`) and record the choice as an ADR.

## How to read project context

The graph is the source of truth. Pull from MCP — not from any local
`CONTEXT/` folder, which at most is a read-only projection:

| You need                   | MCP tool                                       |
|----------------------------|------------------------------------------------|
| Design system, tokens, component specs | `get_v3_entity entity=design_system` |
| Brand voice (writing copy) | `get_v3_entity entity=tone_of_voice`           |
| Messaging / value props    | `get_v3_entity entity=messaging`               |
| Site structure / nav       | `get_v3_entity entity=information_architecture`|
| Page copy and images       | `get_v3_entity entity=content`                 |
| Tech stack conventions     | `get_v3_entity entity=tech_stack`              |
| Feature you're building    | `get_block key=<feature-key>`                  |
| Everything for one task    | `get_briefing(task_type: "ui-component" or "ui-page", target)` |

Pair with the Product expert (`epicontext-product`: features, content, IA) and the Brand expert (`epicontext-brand`: voice) — and
always with `epicontext-design`: it judges the direction before you build, and the result after (its test step, the
craft floor, the principles). This skill builds what it approved; it does not judge design itself.

## Design philosophy

- **All UI is built from components.** This is the standing rule for
  every project, not a preference. Before writing any interface, read
  the project's design system — its `component_spec` blocks — and
  compose from what exists, including the big surfaces: boards, maps,
  chat, editors are design-system citizens exactly like Button. When a
  page needs something no component covers, **add or extend a component
  and its spec**, never inline a bespoke one-off in the page. Pages are
  compositions; components are where UI lives. That keeps every page
  tweakable centrally and lets the next AI session reuse yesterday's
  work instead of re-inventing it slightly differently.
- **Hold the rule with a check, not with review.** Where the project has
  a design audit or lint rule (literal colours, off-scale spacing,
  hand-rolled `<button>` / `<input>` / `<select>` / `<textarea>` outside
  the component library), never raise its baseline to get a change
  through — use the component. When your change *lowers* a number, lower
  the baseline in the same commit so the gain is locked in. If the
  project has no such check yet, propose one (see Playbook A in
  `epicontext-design/references/design-system-standards.md`).
  `check_project_health` covers the graph side: missing specs, specs
  without a visible preview, broken `uses` chains.
- **The base inventory and the documentation bar live in
  `epicontext-design/references/design-system-standards.md`.** Before
  building a screen for a project with a thin design system, check the
  mandatory base is present (Button, Card, Table, Dialog, …) and add
  what's missing *to the system* first — with spec and variants — never
  inline. A new look for an existing component is a new documented
  variant, not a one-off.
- **Dense content has three recurring micro-patterns.** Reaching for a
  raw element inside a board or panel is almost always one of: an
  icon-only action with a required accessible label (IconButton), an
  inline edit field where a name is displayed (InlineInput), or a
  low-emphasis "add a card / reset" affordance (GhostAction). If the
  system lacks them, add them as components with specs.
- **Use tokens, not hex codes.** Use the token names from the project's
  own token source — whatever its `design_system` / `tech_stack` blocks
  record: CSS custom properties, a Tailwind config, a theme object
  (MUI, styled-components), SCSS variables, native asset catalogs. A
  literal colour is only acceptable where tokens physically cannot reach
  (HTML email, colour interpolation math) — and then it carries a
  reasoned allow-comment the project's audit recognises, so the
  exception shows its reason instead of a permanent error people learn
  to skim past.
- **Match the project's voice.** Read `tone_of_voice` and write microcopy
  in that voice — not generic SaaS English.
- **Respect IA.** A page's URL, breadcrumb, and on-page nav must line up
  with the `ia_tree` node it implements.
- **Accessibility (WCAG 2.1 AA) is non-negotiable.** Labelled controls,
  visible focus, sufficient contrast, semantic HTML.
- **Avoid AI-generic aesthetics.** Framework-default styling, gradient
  buttons, emoji-led headings, "innovative" / "seamless" / "intuitive"
  copy. Look at competitors in the graph and pick a distinctive
  direction.

## Copy + images live in the content_page body — not in code

A page's headline, microcopy, button labels, image paths — the
*actual content that ships* — lives in the matching `content_page`
block's markdown `body`. Code reads from it; code does not invent
it. The body shape is:

```markdown
## Context summary
…2–4 sentences…
Touches: [Product Owner](/<org>/<project>/users/product-owner), [Context map](/<org>/<project>/product/context-map).
(Write references as REAL markdown links to each block's editor route,
never bare `persona/<key>` text — bare text is not a link and renders
as plain text in the book.)

## Page copy

### Hero
**Headline:** Stop documenting context. Start a connected one.
**Sub:** EpicContext gives your AI agents a single source of truth.
**Primary CTA:** Get started → /sign-up

### Feature grid
**Feature 1 — Title:** Context Map
**Feature 1 — Body:** The graph as a navigable canvas…

## Images
- ![Hero illustration](/images/hero.png) — top of the page, full bleed
- ![Feature 1 thumbnail](/images/context-map.png) — left column on desktop
```

When you implement the page:

1. **Pull the body** via the page's `content_page` block (`get_block`).
2. **Don't invent the copy** — take it from the body sections
   (`**Headline:**`, `**Sub:**`, …). Two ways, per what the project's
   `tech_stack` records:
   - **Runtime read** — fetch the block at build or request time from
     the EpicContext API
     (`GET https://www.epiccontext.com/api/v1/projects/<id>/blocks/<key>`
     with the project's API key) and render each labelled value into
     the component. An edit in the book then reflects in the product
     without a code change — the "almost a CMS" promise.
   - **Transcribed** — copy the values into the code from `get_block`.
     The body stays the source: when copy changes, change the body
     first, then the code, in the same change.
3. **Image paths** in the markup should match the paths in the body's
   `## Images` section. The body is the asset manifest for the page.
4. **The author edits copy in the book** (the block's markdown body),
   not in your code.

If something on the page isn't in the body, the body is wrong. Write
the change to add it; don't ship the discrepancy.

## Context-as-you-build — pages land in the graph

**If you build a page in code and don't write a matching
`content_page` block, you've created drift in the first commit.**

For every page or major UI surface you build:

1. **Pull the `content_page` block first** — `search_blocks` for one
   whose `slug` matches the route you're building. If it exists, read
   it for intended description, target audience, and `feature_refs`.
   Build to that.
2. **If no page block exists, create one in the same change.** Call
   `create_block` with type `content_page` and a `reason`:
   - `key`: kebab-case page slug (e.g. `account-billing`)
   - `name`: human page name (e.g. "Account · Billing")
   - `slug`: the actual route (e.g. `/account/billing`)
   - `description`: 1–3 sentence stub — what the page does for the
     user (markdown, lands in `body`)
   - `feature_refs`: at least one feature the page surfaces — a
     **required** connection; a page without it is flagged
   - `persona_refs`: the persona(s) most likely to land here
   - `page_type`: `landing` / `detail` / `flow_step` / `dashboard` /
     `settings` / `error` / `other`
3. **Update the project's `ia_tree`** (`update_block`, with a reason)
   to slot the new page in the right spot. Don't leave it floating.
4. **Give the screen a page-layer `component_spec`** (`layer: page`,
   `route` = the slug, `uses` naming its components) so the screen is
   walkable from its page into the design system.
5. **Cite the page block in your trace** (see below). The
   `content_page` is what binds the code to the feature, persona,
   journey step, and KPIs that touch the page.

Trigger refusal: if the user asks you to build a page without giving
you a feature it should surface, push back. A page without a feature is
empty scaffolding. Either get the feature first, or write a stub
feature alongside the page (same change, same reason) so the spine
stays connected.

## Every UI surface has a component_spec with a live preview

The project's design system is the **documented system in the graph**
(ADR-045): one `component_spec` per component, pattern and screen,
carrying layer, when to use / when not to, variants, anatomy, measured
spec tables, accessibility notes and `uses`. The running app is a
moving target; the spec is the contract a developer builds from.

Before you write UI code:

1. **Read the specs** via `get_v3_entity entity=design_system`. Reuse
   before you build: if a component exists, use it. Don't ship a
   parallel implementation of an existing primitive — flag the
   duplication and either use the existing one or extend it.
2. **Read tokens from the project's token source, not from prose.**
   The `design_system` / `tech_stack` blocks say where tokens live in
   this project's repo. Use them by name. If a token doesn't exist for
   what you need, add it to that source — and to the fundamentals spec
   — rather than pasting the raw value. Downstream agents read named
   tokens; raw values are invisible to them.
3. **Every new component gets its `component_spec` in the same change,
   with a live `preview_url`** — an absolute, publicly readable URL that
   mounts the real component with realistic sample data, plus one
   `preview_url` per variant. Where the preview comes from is the
   project's choice:
   - **A preview route in the project's own deploy** reading a registry
     the app itself imports — the default for new projects (template:
     https://www.epiccontext.com/templates/epiccontext-preview/README.md).
   - **An existing Storybook** — equally valid under the same rules:
     public absolute story-iframe URLs, never paths, never behind Basic
     Auth. Not required, and not "the source of truth" — the spec is.
4. **Never re-sketch a component in a preview.** Mount the real one.
   The full rule, and the fields that make a spec visible, are in
   `epicontext-design/references/design-system-standards.md`.
5. **Specs carry the *why* and the measurements, not a shadow
   inventory.** Don't keep a markdown list of every token or prop in a
   free-text block — the specs and the code hold that, and any shadow
   drifts.

For the *why* behind taking design systems seriously — productivity
data, defect-density research, accessibility compounding — see
`epicontext-design/references/entities/design-system.md` and evidence
EVD-BLD-014 to EVD-BLD-018 in `epicontext-build/references/evidence.md`.
Short version: studies put productivity gains at 30–50% once a system is
mature, IBM Carbon measured 47% faster UI builds, and reused components
carry measurably lower defect density.

## When the graph is incomplete

Don't fabricate. If a design token or brand fragment is missing:
1. Note the gap in your output.
2. Write what the missing block should contain with `update_block` /
   `create_block`, with a `reason` naming what you're building and what
   you read. It lands directly and shows in the changes feed, where it
   can be reverted.
3. If you can't ground a value at all, use a clearly marked placeholder
   and leave the block at `maturity: stub` so the gap stays visible.

## Output traceability

Every component / page you ship should cite the blocks it implements:

```markdown
**Trace:**
- Page: content/account-billing (content_page)
- Feature: features/folder-sync
- IA node: ia_tree → /account/billing
- Component specs: design_system/billing-summary, design_system/button
- Design tokens: design_system (color.brand.primary, …)
- Tone of voice: tone_of_voice (per "warm but precise" rule)
- Persona: personas/product-team-with-claude-code
```

The page block is the anchor. Every other reference in the trace either
lives on the page (features, content, components) or applies to it
(personas, tone, journey step).

## Anti-patterns to refuse

- Hardcoded colors / spacing / typography
- Building a UI component without its `component_spec` (with a live
  `preview_url`) in the same change
- Maintaining a markdown shadow of the component inventory (component
  lists, prop tables, token enumerations) beside the specs
- Shipping a second implementation of a component that already exists
- Assuming a stack — React, Tailwind, Storybook or anything else —
  that the project's `tech_stack` block doesn't record
- "AI slop" UI: generic gradients, illustrations, vague copy
- Building a feature with no `feature` block in the graph
- Building a page without a matching `content_page` block written in
  the same change
- Building UI that doesn't trace to an `ia_tree` entry
- Asking the user to read a `CONTEXT/` folder — pull from MCP instead
