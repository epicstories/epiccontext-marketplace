# The canvas, the brandbook and Figma — the mechanics

How the design work is done in Epic Context: the `/design` canvas seeded with the graph, the Design group's five chapters, component anatomy, assets and landing a direction. Whether a design is good is judged with the loop in `SKILL.md`; this file is how the work gets made and landed.

Claude Code ships a `/design` skill: a multi-artboard canvas you can pan,
zoom, select elements in, and edit inline. It is very good, and it starts
from **nothing**. Every canvas session is self-contained — it doesn't know
the project's palette, its voice, who the screen is for, or which
components already exist.

That gap is the whole reason this skill exists. The model was never the
differentiator; the context is. This skill is the bridge: graph → canvas →
graph.

## The Design group is a brandbook — five chapters

Every project's Design group has the same five chapters, written or
not. Fill them; the suite's Design tool draws each one as it looks — components live, the palette, the type, the assets — and the book lists what is written.

| Chapter | Write | As |
|---|---|---|
| Foundations | Colours with roles, type, space/grid, shape, motion, layering | the `brand_visual_identity` body: `~~~palette`, `~~~type`, `~~~scale` (space, radius, borders, shadows, type sizes, motion), `~~~theme` |
| Brand assets | Logo + colour versions, clear space, min size, don'ts, lock-ups, name spelling, slogan, patterns, icons, illustration and photo style | one `brand_asset` per asset: `~~~gallery` + `~~~dodont` |
| Components | One spec per part, with **Anatomy & specs** | `component_spec` (see below) |
| Guidelines | Writing for the UI, accessibility, layout, do's and don'ts | `document` blocks |
| Applications | Decks, posters, social, e-mail, merch, screens | one `design_application` per example |

- **Theme the Design pages** with `~~~theme` in the visual identity:
  background, surface, ink, accent, heading/body font, a cover image.
  Ink must reach 4.5:1 or the pages stay neutral. Never write CSS.
- **Give the brand its own twist** in the same fence: `brand_ground` (the
  cover's colour), `chapter_grounds` (one colour per chapter, in order) and
  `element` (a brand element: a pattern, a shape or the mark, uploaded with
  `upload_asset`). Each ground carries ink or white in AA or it is left out.
  Bolder chapter grounds make it read as a brandbook; keep them to the
  palette.
- **Upload the images** with `upload_asset` (people use "Add an asset"
  in the book) — logos, patterns, icons, photos, examples. SVG where you
  have it.
- **Anatomy & specs on every component:** in `anatomy`, per part its
  `region` (Media / Header / Body / Footer), its purpose
  (`description`), and the foundations it uses — `typography`, `color`,
  `padding`, `margin`, `radius` — as tokens, never raw values where a
  token exists. Add `x`/`y` per part (percentages of the live
  preview) to number them on the real component; `anatomy_image` is
  only a fallback while no preview is wired. This is where Foundations come back in
  use; it never depends on a live preview measuring itself.

Fence syntax: `epicontext-core` → markdown conventions → Design primitives.

## The three-step loop

```
1. SEED     read the real tokens, voice and persona → brief the canvas
2. DESIGN   run /design with that seed, not a blank prompt
3. LAND     the chosen direction returns to the graph as a spec
```

Skipping step 1 gets you a generic-looking artboard. Skipping step 3 means
the design evaporates when the session ends — which is exactly the problem
the graph exists to solve.

## Step 1 — Seed the canvas

**Never open a canvas cold.** Before calling `/design`, gather:

| You need | Where from |
|---|---|
| Real token values | The project's own token source (CSS variables, Tailwind config, theme object — wherever its `design_system` / `tech_stack` blocks say), plus the fundamentals specs from `get_v3_entity entity=design_system` |
| Existing components | The `component_spec` blocks (`get_v3_entity entity=design_system`) and the component library in the project's repo |
| Brand voice | `get_v3_entity entity=tone_of_voice` |
| Positioning / messaging | `get_v3_entity entity=positioning`, `entity=messaging` |
| Who it's for | `get_v3_entity entity=persona` |
| Where it sits | `get_v3_entity entity=journey_map`, `entity=information_architecture` |
| Everything at once | `get_book group=brand` — one call for the whole brand layer |

Then write the seed into the `/design` prompt explicitly. Not "a pricing
page" — that produces Claude's house style. Instead:

> Three directions for the pricing page. Palette: `--primary` hsl(24 9.8% 10%),
> `--muted` hsl(60 4.8% 95.9%), `--success` hsl(84.8 85.2% 34.5%). Radius
> 0.5rem baseline. Type scale 14/16/18/24px, semibold headings.
> Spacing on the 4-based scale only. Voice: professional, direct, warm —
> no exclamation marks, no "supercharge". Reader is Sarah, a solo product
> designer choosing between tools in under 30 minutes; her decision
> criteria are time-to-first-value (40%) and MCP-native (30%). This is
> step 2 of the First Project Setup journey.

The difference between that and "design a pricing page" is the entire
value of the graph.

## Step 2 — Run the canvas

Call the built-in `/design` skill with the seed. It handles the artboards,
the canvas, and publishing.

**Rules that survive into the artboards:**

1. **Token values only.** Every colour, radius and spacing value in an
   artboard must trace to a real token. If the design needs something the
   scale doesn't have, that is a finding — the scale is wrong, or the
   design is off-system. Say which.
2. **Compose before inventing.** Check the component specs and the
   project's component library first. If a Button, Card or Dialog
   already exists, the artboard uses it. A new
   component earns its place only when the same pattern recurs ≥3× and
   composition can't solve it.
3. **Both themes.** The token set carries `.dark` counterparts. A
   direction that only works in light is half a direction.
4. **Contrast is checkable, so check it.** Compute the WCAG contrast
   ratio of every text/background token pair (any contrast checker
   will do). Don't ship an artboard whose text pair fails AA.
5. **Name the trade-off per direction.** Three artboards that differ only
   cosmetically aren't three directions. Each should embody a different
   bet — density vs. breathing room, familiarity vs. distinctiveness —
   and you should be able to say what each gives up.

## Step 3 — Land it in the graph

A canvas the client loved and nobody wrote down is a canvas you'll
redesign next quarter. When a direction is chosen:

**For a component or variant** → write a `component_spec` carrying what
the code alone can't hold: which layer it sits in (foundation / atom /
molecule / organism / pattern), when to use it, when *not* to, its
variants, its accessibility notes, and the rationale for the direction
that won.

**For a screen or page** → create or update the `content_page` block —
its copy, and a reference to the journey step and persona it serves.

**For a token that had to change** → do not quietly add it. A new token is
a design-system decision: record it (in the fundamentals spec, or a
`decision` block), say what it's for, and let the project's audit catch
anything that starts using an off-scale value instead.

Always write with a `reason` that names what you read. The write lands
directly and shows in the changes feed beside its reason, where it can be
reverted — a design write with no stated grounding is a guess.

## Enhancing an existing component

The highest-value use, and the one that compounds:

1. Read the current component in the project's repo and its
   `component_spec` if it has one.
2. Seed the canvas with the current implementation *plus* the token set,
   and ask for variants of the specific thing under question — the empty
   state, the loading state, the dense variant.
3. Pick, then **update the spec, not just the code**. A variant that
   exists in code but not in the spec is invisible to the next person and
   to the next AI session.

## Anti-patterns — refuse these

- **Designing without reading the tokens first.** The output looks
  plausible and matches nothing.
- **Inventing a hex code.** If it isn't a token it doesn't ship. Add
  the token to the system or use what exists.
- **Three directions that are one direction in three colours.** Vary the
  bet, not the hue.
- **Leaving the canvas as the deliverable.** The canvas is where you
  decide; the graph is where the decision lives.
- **Adding a component because it's a new screen.** New screens are the
  usual reason design systems rot. Compose.
- **Redrawing a persona or a journey beside a design.** Context in Figma
  is Epic Context's own card, placed with `get_context_card` and linked
  to the block; its colours and font may follow the design — see
  `references/context-cards.md`.

## Standing up a NEW project

Load `references/project-setup.md` first. It settles the two decisions
that are otherwise made by accident:

- **Do not build a NEW Storybook** — but a project that already has
  one keeps it as a valid preview source under the same rules (specs
  for every component, public absolute story-iframe URLs; see
  project-setup "Already have a Storybook?"). For new projects: the
  design system IS the product; the
  book is where it lives. Components are exposed through a registry the
  application itself imports plus a preview route in the prototype
  deploy — which makes "1:1 with the application" a property rather
  than a promise, and needs one build instead of two.
- **Do not use Basic Auth on a prototype.** Default public; when it
  needs protecting use the EpicContext gate, so the viewer signs in with
  the account that already has the project and arrives with its context
  beside it. Basic Auth also silently breaks every component preview: a
  browser refuses that prompt inside a cross-origin iframe.

## Setting up or repairing a whole design system

When the task is bigger than one screen — standing up a NEW project's
design system, or pulling an existing UI back into one system — load
`references/design-system-standards.md`. It carries:

- **The system outranks the prototype** (ADR-045). A running app is a
  moving target; the documented system is what a developer builds
  from. Specs carry *measured* dimensions — sizes and structure
  tables read off the shipping class strings, keyed to the token that
  governs each value.
- **The preview rule (MANDATORY): never re-sketch.** Every preview
  mounts the real component with realistic sample data. The one
  drawing allowed is an abstract wireframe — regions and proportions,
  a label naming what a region IS, nothing else. Pages that can't
  mount link to the real screen (`route` on the spec).
- **Colour: brand first, tokens second.** Fundamentals opens with the
  brand's colours (sampled from the actual mark, matched to stock
  palette steps), then section ramps, then the token layer — with the
  count of AA-failing pairs kept visible on the door.
- **The IA: three doors** — Fundamentals, Components, Guidelines —
  with components grouped by function (Actions, Inputs, Containment,
  …), never by atomic layer. The layer lives on the component page.
- **The mandatory base inventory** every project ships with, and the
  documentation bar (live preview, every variant with a when-to-use
  caption, states, built-from chips, accessibility contract).
- **Playbook A** (new system) and **Playbook B** (existing UI), plus
  the one-system mandate verbatim: every UI surface in the project has
  a `component_spec` — checked by `check_project_health` and the
  project's design audit, not by review.

### Two front-page failures seen in real projects (both now flagged)

1. **An empty Fundamentals door.** A project's fundamentals are not
   derived from its code; every project must WRITE its fundamentals
   into the graph, and in practice AI sessions document
   every component and skip this. The rule: a design system with
   component specs ships `component_spec` blocks with
   `group: fundamentals` — one for the colour system (brand hues, ink
   & paper, ramps, hex values from the project's own stylesheet or
   theme), one for typography, one for spacing. Copy the values in and
   name each token. `check_project_health` now reports a full
   Components door beside an empty Fundamentals door as a finding, not
   a style choice.
2. **A front page that buries its own doors.** The chapter overview's
   job is navigation; the book renders the three door cards above the
   overview body, but a long body still makes the page read as an
   essay. Keep the design-system overview to ~150 words — what the
   system is, where it lives, one line per door. The long story (four
   layers, history, audits) belongs in **Guidelines**, not on the
   front page. Reported from Edge: "de knoppen staan erg laag."

The reference is grounded in Material Design 3, Uber Base, and NS
Nessie (researched 2026-08-26) — including Nessie's Route/Rush lesson:
the product's own domain organisms are design-system citizens with
the same documentation anatomy as Button.

## How this fits together

- The **project's own token source** is the seed's source of truth, not
  a prose description — read the real values, with dark counterparts.
- The **Fundamentals door of the Context Book** is how the tokens are
  presented to a human. Artboards should look like they came from the
  same system that page documents.
- The built-in `/design` skill — do the canvas work there; this skill
  never reimplements it.
- Other references: `references/context-cards.md` (a persona, journey or
  any block beside a design, as Epic Context's card with a link),
  `references/figma-sync.md` (code ↔ Figma fidelity),
  `references/figma-export.md` (generating Figma from the library),
  `references/epiccontext-gate.md` (the installable gate).

## Pairs with

`epicontext-build` (frontend: building the chosen direction in the project's stack),
`epicontext-design/references/entities/design-system.md` (the design system entity and its depth bar),
`epicontext-brand/SKILL.md` (voice and positioning for the seed),
`epicontext-users/SKILL.md` (persona and journey for the brief),
`epicontext-core` (the read-then-write-with-reason workflow).
