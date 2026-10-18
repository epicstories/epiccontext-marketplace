# Markdown conventions per shape — use what the book renders natively

## The readability rule — a rule, not advice

Every block is read by people who did not write it and by agents with a
token budget. Four requirements, on every block:

1. **Open with one key sentence** — what this block says, decides or is
   for. A reader who stops there has the point.
2. **Compare in a table.** Two or more things side by side are a table,
   not paragraphs.
3. **One drawing where there is structure** — a flow, a pipeline, layers,
   a journey: one `~~~flow` (or the shape's own board), not three.
4. **Name the sources.** Research, a decision, a transcript, a person:
   say where a claim comes from, or call it an assumption.

A roadmap phase also carries its milestone: a `Done when:` (or
`Klaar als:`) line directly under the phase heading, saying what must be
true for the phase to count as finished. The book shows it beside the
phase.

## First: reach for the visual that fits

EpicContext ships a small set of rendered primitives. They are not
decoration — each one is the difference between a reader scanning an
answer and a reader parsing a paragraph. **You are expected to use
them.** A block that could have carried a chart, a diagram or a
framework and instead carries three paragraphs of prose is a block that
under-delivers, even when the prose is good.

| If the block is about… | Reach for | Fence / form |
|---|---|---|
| A number over time, or against a target | a chart | `~~~chart` |
| How pieces connect, or a flow through a system | a diagram | `~~~flow` |
| A framework with real geometry (BMC, SWOT, Porter's, OGSM) | the canvas shape | H2 per zone, bullets per card |
| A journey, a roadmap, an impact/effort grid | the timeline shape | H2 per phase + a table |
| A hierarchy (IA, taxonomy) | the tree shape | nested bullets |
| Work in columns (a board) | the kanban shape | H2 per column |
| Something another block already says well | an embed | `~~~embed` |
| Brand colours | swatches | `~~~palette` |
| Typefaces | a specimen | `~~~type` |
| A logo, pattern, icon set or example of the brand in use | pictures | `~~~gallery` |
| What to do and not to do with an asset | a do / don't pair | `~~~dodont` |
| How the project's Design pages should look | the theme | `~~~theme` (visual identity only) |
| An argument, a decision, a definition | prose | headings + paragraphs |

Two rules govern all of them:

1. **The visual has to carry information the prose doesn't.** A chart of
   two points, a diagram of two boxes, a canvas with one filled zone —
   each is worse than the sentence it replaced.
2. **Never invent the numbers or the boxes to justify the visual.** If
   the graph has no measures for this flow, write the prose and leave the
   chart out. A fabricated trend is the single most damaging thing you
   can put in a context graph, because it looks like evidence.

Every block's body is plain markdown (ADR-043): the Source view edits
it as text, and the Context Book renders it as components. The body is
the canonical source. **Don't invent custom shape syntax — use the
markdown features and named fences that already render visually.**

| Shape (entity examples) | Write the body as | Renders in the book as |
|---|---|---|
| **prose** (vision, positioning, decision, content_page, feature) | Headings, paragraphs, bullets, blockquotes — standard markdown | Standard prose |
| **timeline** (journey_map, roadmap, impact_effort_matrix) | One H2 per phase. Inside each phase, a **markdown table** with columns: `Step \| Happiness \| Actions \| Experience \| Insights`. Use 😀 🙂 😐 🙁 😣 emoji for happiness; append `(+N)` to keep the exact score (e.g. `🙂 (+2)`). **Depth bar for journey_map**: 3-7 phases × 2-5 steps each with a varied emotional arc (see `epicontext-users/references/entities/journey-map.md` for the worked example). | A grid: steps across as columns, each lane (Does / Feels / Insight) as a row |
| **canvas** (BMC, SWOT, OGSM, Porter's, strategic_group_map, obeya, one_pager) | One H2 per zone. Bullet list under each zone with one bullet per card. Indent further bullets for card body / detail. | The real framework geometry in the book — see below |
| **kanban** (kanban_board) | One H2 per column. Bullet list of cards under each. | H2 + bulleted lists (same shape as canvas) |
| **tree** (ia_tree, taxonomy) | Nested bullet list. Optionally `(/url)` after each node to mark a route. | Native nested list |
| **diagram** (architecture_diagram, c4 sketches) | A `~~~flow` fenced block with YAML `nodes` + `edges` (mermaid is no longer supported). | A server-rendered SVG diagram (C4 notation when `level:` is set) |
| **media** (images, screenshots, hero illustrations) | `![alt text](/path/to/image.png)` standard markdown image | Rendered image inline |
| **code samples** (api_endpoint, api_spec, data_schema) | Fenced code blocks with language tag — ` ```ts `, ` ```sql `, ` ```json ` | Syntax-highlighted code |

**Why this matters**: every AI agent writing a block must produce
markdown that uses the right rendered primitive. A journey
map written as bullet lists looks like text; the same journey map
written as a markdown table renders as a real table the user can scan
phase by phase. A C4 diagram written as ASCII art is unreadable; the
same diagram in `~~~flow` renders as proper boxes-and-arrows.

## Flow best practices — an overview, not spaghetti

Learned from diagrams that shipped as both (the Yellowbello content
pipeline read as scatter until its lanes rendered):

1. **Lanes are the clarity.** A pipeline or layered system gets
   `groups:` with `kind: lane` — one lane per stage or team, every
   node assigned via `group:`. The lanes are usually the reason the
   picture beats the prose.
2. **At most ~12 nodes per fence.** More is two diagrams pretending
   to be one — split by C4 level or by phase.
3. **One direction** — `TB` for pipelines/layers, `LR` for request
   flows.
4. **Label the meaningful edges only.** In a fan-out, label the first
   edge; parallel repeats stay quiet.
5. **`sub` ≤ 5 words.** Schedules, counts and caveats belong in the
   prose under the figure.
6. **Two or three roles per diagram.** Role = colour; six colours
   mean none of them signal anything.
7. **Lanes read in the order you declare them.** List `groups:` top to
   bottom (or left to right) in reading order; the renderer keeps that
   order whatever the edges suggest.
8. **A node may carry a short multi-line `description`** — up to five
   lines; use a YAML block (`description: |`) or `\n` for deliberate
   breaks. Longer than that belongs in the prose under the figure.

Older blocks may carry a body derived from legacy structured fields.
For **newly authored** content, prefer the forms above over those
legacy serialisations — markdown tables beat bullet conventions because
the user sees an actual table.

## Canvas frameworks — name the zones conventionally

The Context Book draws Business Model Canvas, SWOT and Porter's Five
Forces in their real geometry rather than as stacked lists, because the
arrangement carries the meaning. Zones are matched to slots by keyword,
so use the conventional names:

| Framework | Zone H2s (keyword matched, so wording can vary around these) |
|---|---|
| `business_model_canvas` | Key Partners · Key Activities · Key Resources · Value Propositions · Customer Relationships · Channels · Customer Segments · Cost Structure · Revenue Streams |
| `swot_analysis` | Strengths · Weaknesses · Opportunities · Threats |
| `porters_five_forces` | Competitive Rivalry · Threat of New Entrants · Bargaining Power of Suppliers · Bargaining Power of Buyers · Threat of Substitutes |

A zone that matches nothing still renders, below the framework — so an
extra "Assumptions" section is never lost. Leaving a zone out leaves a
visibly empty box, which is the honest result: a canvas with no revenue
streams is telling the reader something.

## Measures — write the numbers so they can be drawn

For `kpi`, `metric` and `north_star`, the book pulls the two figures
that matter to the top and draws the gap between them. Give it
something to read:

```
**Current:** 412 active projects
**Target:** 1,000 by Q4
```

Bold-labelled values in the body work, and so do the structured
`current_value` / `target` fields — set whichever is natural, the book
reads both.

A markdown table of periods and values is charted automatically beside
the table:

```
| Month | Signups | Activated |
|---|---|---|
| January | 120 | 41 |
| February | 180 | 78 |
```

The chart only appears when every populated cell in a column parses as
a number and there are at least two rows. Mixing "120" and "strong
month" in one column means no chart for that column, which is correct —
so keep commentary in its own column or in prose.

## Chart primitive — `~~~chart`

Any block may carry a chart. It is not a finance-only fence: a journey
with drop-off per step, a feature with adoption over time, a persona
with segment size, a campaign with cost per acquisition — all of them
read better as a shape than as a list of numbers.

~~~chart
title: Drop-off through onboarding
kind: column
unit: "%"
target: { value: 80, label: Goal }
categories: [Sign-up, Create project, Scaffold, First export]
series:
  - { name: Reach this step, values: [100, 74, 61, 38] }
~~~

| Question the block is answering | Kind |
|---|---|
| Is this rising or falling? | `line` |
| How do a few things compare? | `column` — `bar` when labels are long |
| What is the total made of, over time? | `stacked` |
| How did one period split? | `donut` — a single period only, never a trend |

Conventions:

- Set `unit` once, on the chart, not inside each value.
- Set `target` (synonym `budget`) wherever a goal or ceiling exists —
  most numbers are only meaningful read *against* something.
- A period you don't have is `n/a`, never `0`. A zero draws a collapse
  that didn't happen.
- Keep a forecast in its own series and name it as one. Never blend it
  into actuals.

A plain markdown table of periods and values is **also** charted
automatically beside the table (see "Measures" above), so a simple
series doesn't need a fence at all. Reach for `~~~chart` when you want
a specific kind, a target line, or several series.

### Where the numbers come from

Charts are only as honest as their source. Before writing one:

1. **Read the graph for real measures.** `kpi`, `metric`, `north_star`,
   `analytics` and `feedback` blocks are where a project's numbers live.
   `customer_insight` and `research` often carry them in prose.
2. **Cite the source** in a line under the chart — which block, which
   period. A reader who can't trace a number can't act on it.
3. **If there is no measure, write no chart.** Say what would need to be
   measured instead: "No instrumentation on this flow yet — the drop-off
   between Scaffold and First export is the number to capture." That
   sentence is worth more than an invented bar.

## Diagram primitive — `~~~flow`

`~~~flow` is EpicContext's **only** diagram fence. The book renders it
as a diagram and the markdown body stays canonical for AI. (Mermaid was
removed — it's no longer rendered. Do not author `~~~mermaid` blocks.)

The `~~~flow` block takes a YAML body with `nodes` + `edges`:

```
~~~flow
direction: LR
nodes:
  - { id: po,        label: "Product Owner",       role: person }
  - { id: dev,       label: "AI-assisted developer", role: person }
  - { id: ec,        label: "EpicContext",         role: system }
  - { id: claude,    label: "Claude / Cursor",     role: external }
  - { id: db,        label: "PostgreSQL",          role: db }
edges:
  - { from: po,     to: ec,     label: "edits blocks via web UI" }
  - { from: dev,    to: claude, label: "codes with" }
  - { from: claude, to: ec,     label: "MCP / OAuth" }
  - { from: ec,     to: db,     label: "stores blocks + versions" }
~~~
```

**Node roles** (each maps to one card-theme colour + shape, so both mean something):

| Role | Use for | Shape | Default stereotype |
|---|---|---|---|
| `person` | Users / actors | box with a head | `[Person]` |
| `system` | The system-of-interest | rounded rect | `[Software System]` |
| `external` | External SaaS / third parties | dashed rounded rect | `[External System]` |
| `db` | Database / storage | cylinder | `[Database]` |
| `container` | Deployable inside the system boundary | rounded rect | `[Container]` |
| `component` | Module / library inside a container | rounded rect | `[Component]` |
| `process` | Generic step | rounded rect | none |
| `decision` | Branch | diamond | none |
| `start` / `end` | Flow endpoints | stadium (pill) | none |

Colours come from the `--flow-*` design tokens, so diagrams follow dark
mode. The four flowchart roles carry no stereotype on purpose — a
diamond labelled `[Decision]` is noise.

**Top-level options**:
- `direction: LR | TB | RL | BT` — layout direction (default LR).
- `title: "…"` — optional, rendered above the diagram.
- `subtitle: "…"` — one line of scope or audience under the title.
- `level: context | container | component` — marks the diagram as a C4
  view. Captions it and turns on the key.
- `legend: true | false` — override the key. On by default at a C4
  level, off otherwise.
- `nodes[].sub: "…"` — legacy alias for `description`.
- `edges[].style: solid | dashed | dotted` — line style.

### C4 diagrams — use the notation, not just the boxes

For anything architectural, author it as C4. What makes a C4 diagram
readable by someone who didn't draw it is the notation, and the
renderer produces all of it from these fields:

```
~~~flow
title: EpicContext — container view
subtitle: How the pieces talk, and over what
level: container
direction: TB

groups:
  - { id: sys, label: EpicContext, sub: "[System Boundary]" }

nodes:
  - id: designer
    label: Product designer
    role: person
    description: Writes and reviews the project's context
  - id: web
    label: Web application
    role: container
    technology: "Next.js 16, React"
    description: Book, editor and dashboards
    group: sys
  - id: db
    label: Graph database
    role: db
    technology: "PostgreSQL"
    group: sys

edges:
  - { from: designer, to: web, label: "Reads and edits context", technology: "HTTPS" }
  - { from: web, to: db, label: "Reads from and writes to", technology: "SQL/TCP" }
~~~
```

- **`technology`** on a node becomes the C4 stereotype:
  `[Container: Next.js 16]`. On an edge it becomes the bracketed
  protocol line under the label — that's what turns "these two talk"
  into something an engineer can act on. **Always set it** at container
  and component level.
- **`description`** is one short sentence on what the element does.
  Prefer it over packing detail into the label.
- **`stereotype`** overrides the derived text, or `false` suppresses it.
  Rarely needed.
- **`groups` + `nodes[].group`** draw a dashed C4 boundary with the
  label at the bottom-left. Use `kind: lane` instead for a user flow
  where the band a step sits in says who is acting.
- **`role: external`** draws a dashed border — the convention for
  something outside what this team owns.

Split by level rather than cramming: one `level: context` diagram
naming the actors and neighbouring systems, one `level: container` for
the deployables, and a `level: component` only for the container that
warrants it.

**Request flows** (what used to be a mermaid `sequenceDiagram`): model
as an LR `~~~flow` — one edge per call, dashed edges for the return
path. Or describe the steps in prose if a diagram adds nothing.

**Data models** (what used to be a mermaid `erDiagram`): sketch the
entities as `db`/`component` nodes with labelled relation edges, or
list them in prose. There is no separate ER renderer.

**Label rules**:
- One short noun phrase per node label ("Web app", "MCP server"). Don't
  pack tech-stack detail or subtitles into the label.
- Tech-stack detail (`Next.js`, `/api/mcp`, `PostgREST + Realtime`)
  belongs on edge labels or in the block's prose, not in the node label.
- Pick the `role` that fits — readers decode the shape + colour at a
  glance, so the role choice carries meaning.

### Diagram review checklist

Before shipping a `~~~flow` block, confirm:

- [ ] **Every edge is labelled** — unlabelled arrows force the reader to
  guess intent.
- [ ] **Three to seven nodes per diagram** — beyond that, split into
  separate `~~~flow` blocks (system context + container view + request
  flow) rather than cramming.
- [ ] **One purpose per diagram** — system context, container detail,
  request flow, data model. Don't mix.
- [ ] **Roles mean something** — person/system/external/db chosen for
  meaning, not decoration.

## Embed primitive — `~~~embed`

Show another block inside this page, read-only, in place. What a Figma
link does inside a Confluence page: you're explaining something, and the
clearest way to explain it is the artefact itself rather than a link that
costs the reader their position.

~~~embed
block: ai-developer-workflow
caption: How a developer actually uses this
~~~

A bare key on its own line works too:

~~~embed
ai-developer-workflow
~~~

**How it renders.** The referenced block draws through its *own* book
template — a journey renders as the journey timeline, an architecture
block as its C4 diagram, a KPI as its metric card. There is one renderer
per block type, so an embed can never drift from the page it points at.

**It is a reference, not a copy.** Resolved at request time from the
graph, so editing the source block updates every page that embeds it.
That is the whole difference between an embed and a paste.

### When to reach for it

- A feature page that is much clearer with the journey it serves shown
  underneath it
- An ADR whose consequences are best read against the architecture
  diagram it changed
- A page-level overview that wants the running-cost chart in place rather
  than as a link
- Anywhere you were about to write "see the X block" and the reader would
  have to leave to follow it

### When not to

- **Don't embed instead of writing.** A page that is three embeds and no
  prose has explained nothing — the embeds support an argument, they
  aren't the argument.
- **Don't embed something the reader is already looking at.** An embed on
  the same page as its target is noise.
- **Don't chain them.** Embeds render two levels deep and then stop, so a
  block that embeds a block that embeds a block will show a "open it to
  read further" note rather than the content.
- **Don't use it to duplicate.** If the content genuinely belongs on this
  page, write it here; if it belongs to the other block, embed it.

### Rules

- The block must be in **this project's** graph. An embed can only ever
  show what the reader is already entitled to see, so it can't reach
  across projects.
- A cycle (a block embedding itself, directly or through another) renders
  a note instead of recursing.
- A caption is optional and should say *why the reader is being shown
  this*, not repeat the block's name — the frame already carries that.
- An embedded block that hasn't been written yet says so rather than
  rendering an empty frame.

## Design primitives — show the brand, don't describe it

The Design group is a brandbook as well as a design system. Its pages
read as pictures: swatches, specimens, the logo on its grounds, crossed-
out misuses. Five fences draw them. Values are YAML; anything the book
cannot use (a colour that is not a hex, an image url that is not https
or a site path) is reported under the figure and left out.

~~~~
~~~palette
title: Primary colours
colors:
  - { name: Edge Green, hex: "#005555", role: "Primary — text, logo", note: "PMS 3292" }
  - { name: Edge Lime, hex: "#c8e600", role: "Accents" }
~~~

~~~type
fonts_from: google        # load the families from Google Fonts
fonts:
  - { role: Headlines, family: Space Grotesk, weights: [500, 700], sample: "your retail media orchestrator" }
  - { role: Body copy, family: Inter, weights: [400, 600] }
~~~

~~~gallery
title: Logo — colour versions
columns: 3                # 1–4
ratio: 4/3                # 1/1, 4/3, 16/9, 3/4
items:
  - { src: /brand/logo.svg, caption: On beige, background: "#fff7ee" }
  - { src: /brand/logo-white.svg, caption: On green, background: "#005555" }
~~~

~~~dodont
do:
  - text: Use the approved colour versions
dont:
  - { text: Rotate or stretch the logo, src: /brand/logo-rotated.png }
~~~

~~~theme
background: "#fff7ee"     # the Design pages' ground
surface: "#ffffff"        # cards and panels
ink: "#005555"            # text: must reach 4.5:1 on both
accent: "#005555"         # buttons, links, focus
heading_font: Space Grotesk
body_font: Inter
fonts: google
cover: /brand/pattern.svg # the Design cover's image
~~~
~~~~

Rules:

- **The theme lives in the visual identity** and dresses only the Design
  group. Ink below WCAG AA on the background or surface is refused —
  the pages stay neutral and the figure says why. Never write CSS.
- **Images are small and yours**: SVG first, PNG/JPG/WebP as examples.
  Put them in with `upload_asset` (SVG as text, images as base64) and
  use the url it returns. The master files (AI, INDD, Figma) stay where
  they live; link them.
- One asset per `brand_asset` block, one example per `design_application`.
  The chapter a block reads under comes from its type; set
  `chapter: foundations | brand-assets | components | guidelines |
  applications` in its value to file it elsewhere.

## Entity overviews — the intro on each group page

Every entity page in the book (OGSM, Persona, Feature, …) opens with two
layers:

1. **This project's intro** — a `section_guide` block keyed after the
   entity. Yours to write.
2. **The canonical explainer** — what the artefact is and what good looks
   like. Built in, identical in every project, always present so a page
   is never bare.

The second one means you never have to explain what OGSM is. The first
one is where the value is: what *this* project's OGSM is trying to do
this year, which of these six personas actually drives decisions, why
the roadmap is sequenced the way it is.

Create it as a `section_guide` block with the key set to the entity id —
`ogsm`, `persona`, `information-architecture`. (`<entity>-overview`,
`-guide` and `-intro` are also accepted; kebab-case and snake_case both
resolve.) The body is markdown and renders above the list of pages.

**Write it when you have something to say that the list doesn't.** Good
entity intros:

- Name the shape of what's below — "four personas, but Sarah and Marcus
  drive every prioritisation call; the other two are addressable, not
  targeted."
- Say what's deliberately absent — "no enterprise persona: that segment
  is out of scope until the permissions work lands."
- Point at the tension — "these KPIs were set before the pricing change
  and two of them no longer measure anything anyone can move."
- Carry a chart or an embed where one earns its place, exactly as on any
  other page.

**Don't** restate what the entity is (the canonical layer does that),
and don't write one just to fill the slot. A generic paragraph above the
list is worse than the canonical explainer alone, because it displaces
something a reader would have learned from.
