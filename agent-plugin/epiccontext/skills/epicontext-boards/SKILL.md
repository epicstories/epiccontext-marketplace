---
name: epicontext-boards
description: >
  Use when the user mentions Miro, FigJam, a whiteboard, workshop board,
  sticky session, journey walkthrough, or brainstorming from the graph.
  Projects graph content onto FigJam (Figma MCP) or Miro (mcp.miro.com)
  boards for workshops, reviews and walkthroughs, then harvests what the
  session adds back into the graph.
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.contenthash: "8156350627f56e98"
---

# EpicContext → whiteboards (FigJam, Miro)

The board sibling of `epicontext-design/references/figma-sync.md`, with
the priorities reversed: **there, the design is the contract; here, the
content is.** A workshop board exists so people can read real project
knowledge and add to it — nobody tweaks pixels on a sticky.

## The three rules

1. **The graph is the source — never retype.** Read the block
   (`get_block`) and project it: a journey's phases become sections *in
   the phase colors stored on the block*, its cards become stickies,
   its citations stay citations. Content invented for the board is
   content the graph cannot vouch for.
2. **Every board carries its provenance — that is the branding.** More
   than a logo: the reader must be able to trace every sticky home.
3. **The board is a projection; the session's output flows back.**
   Reserve a visually distinct sticky color for participant input, and
   after the session read the board and `ingest_text` the additions —
   one change batch, one-click revert. A board that never flows back is
   a photo of a meeting.

## The branding kit

As first applied on a FigJam test board (write the text in the
session's language):

| Element | What it is |
|---|---|
| Title | Block name + purpose, Inter Bold 44, ink `#1C1917` |
| **Source line** | `EpicContext · org/project · type/key · evidence · date` — directly under the title, muted. The single most important branding element: it makes the board auditable. |
| Section colors | The phase/zone colors stored ON the block — never invented |
| Sticky semantics | grey = header/step · red = pain · green = gain · yellow = insight · **blue = participant input** (the harvest color) |
| Legend | One muted line explaining the colors + the ask ("add blue stickies…") |
| Footer | "Made with EpicContext — this board is a projection of the graph. Blue stickies are read back into the graph after the session." |
| Logo | Optional; upload the SVG (`upload_assets` on FigJam, image-URL on Miro). The source line matters more. |

## Context as Epic Context's card

When a board shows *who it is for and where it sits* (a persona, a journey,
a feature, a decision) beside the workshop content, that context is Epic
Context's own card, not a hand-made summary:

- `get_context_card(key, highlight?)` returns the card's `data` and `url`.
  Build it in the board's own shapes, in this order: the eyebrow
  (`<TYPE> · EPIC CONTEXT`), the title; a persona's role, quote and
  sections; a journey's phase bands with steps and moods (the
  `highlight`ed one marked); a block's summary and maturity. End with the
  source line and the `url` as a link on the title and the source line.
- The board's look (its fonts, its colours, Miro's named sticky colours);
  the card's structure and wording stay Epic Context's.
- In a Figma design file (not FigJam) place the card's `svg` itself —
  `epicontext-design/references/context-cards.md`.

## What maps to what

| Graph shape | Board projection |
|---|---|
| `journey_map` (timeline) | Sections per phase (phase colors), stickies per step: header + pains + gains + insight |
| `swot / bmc / ogsm` (canvas) | Sections per zone, one sticky per card |
| `persona` | One section per persona: header + goals/frustrations stickies |
| `roadmap` | Sections per horizon, cards per item |
| `kanban_board` | Sections per column |

## Tool specifics

**FigJam — available today** through the Figma MCP connector. Load the
`figma-use` skill first; then: `create_new_file` with
`editorType: "figjam"`, and `use_figma` on the `/board/` URL.
- FigJam-only nodes: `createSticky`, `createConnector`,
  `createShapeWithText`, `createSection`. Most design nodes are
  blocked; `figma.createPage()` throws.
- `sticky.text.characters` (via the `text` sub-node), fills for color,
  `isWideWidth` for headers/insights. Sections take plain-frame
  children — position by x/y.
- Screenshot per section to verify; a whole FigJam page has no single
  node to capture.

**Miro — official MCP at `mcp.miro.com`** — lessons from the first
real board (First-Time Setup Journey workshop, 2026-09-01: 6 phase
frames + wrap-up, 87 items, one call, zero failures):

- **It is an SVG DSL, not per-item calls.** The whole board is ONE
  `canvas_create_from_svg` payload in the "Canvas Composer" format.
  `canvas_get_canvas_composer_skill` is MANDATORY first — it is the
  spec, and it is long; don't guess the format from SVG knowledge.
- **Frames**: `<g transform="translate(x,y)" data-frame="Title">` with
  `<rect data-type="frame">` as first child at 0,0; every child
  coordinate is frame-relative. Frames take only `fill` — no stroke,
  no radius. Phase headers are therefore a colored rect INSIDE the
  frame (the graph-tint bar), not frame styling.
- **Stickies take NAMED colors only** (`light_green`, `light_pink`,
  `light_yellow`, `blue`, `green`, …), never hex — hex is for shapes.
  Fixed geometry: 199×228 square / 350×228 wide; the board snaps
  other sizes. Slight x/y offsets (6–10px) make clusters read as
  human, per the composer's own guidance.
- **Labels live in `data-content`** on the shape (centered, supports
  `<b>`/`<br>` escaped) — never a text element overlaid on a shape.
  **Escape `&` `<` `>` in every attribute and body**: one raw `&`
  fails the entire SVG and nothing is created.
- **Facilitation widgets are custom widgets** and they are the reason
  to prefer Miro for live sessions: `dot_voting`,
  `alignment_scale` (low/neutral/high labels), `poll`, `estimates`,
  countdown `action_button`. Natural sizes; author without
  width/height and never stretch. `fill`/`stroke` on them is ignored
  (harmless notice) — omit.
- **Z-order = creation order**; connectors before the shapes they
  join. **Updates** iterate from the returned `result_svg` (server
  stamps `data-miro-id`); patch semantics, explicit
  `data-deleted="true"` to remove. Never invent a miro-id.
- **Flow**: `board_create` (confirm with the user first — it cannot
  be undone) → one `canvas_create_from_svg` → `board_show` once at
  the end; the panel shows it, so don't restate the link.
- Sticky-drop zones want real emptiness: a dashed `fill="none"` rect
  several stickies tall, labeled from a small `<text>` just above it.
  The example blue sticky in the first zone teaches the color rule
  faster than the legend does.

Second board (an onboarding-journey rebuild, 2026-09-02) added:

- **MIRROR THE SHAPE'S DATA MODEL — the structure rule.** A journey on
  a board carries the SAME separation as the journey in the book:
  steps as columns, and **Does / Feels / Insight as labeled lanes
  reading straight across** (lane labels on a left rail, identical
  lane y-positions in every phase frame so the rows align board-wide).
  One sticky color per lane: gray = Does, green tints = Feels-gains
  (darker = stronger), light_pink = Feels-pains, light_yellow =
  Insight, blue reserved for participants. Same for any shape: a
  kanban keeps its columns, a canvas its zones. The board is not a
  look-alike of the component (it is not Figma) — it is the same
  *data discipline* in Miro's idiom. When the graph block carries
  phase colors, use exactly those for the phase headers.
- **The logo: `image_create`, not the SVG `<image>`.** The composer's
  image element came back "unsupported new item skipped" for both SVG
  and PNG on this workspace — the dedicated `image_create` tool with a
  public URL works. Use the raster mark at
  `https://www.epiccontext.com/Images/EpicContextLogo_small.png`
  (Miro refuses the .svg), top-left beside the title, width ~90.
  `image_create` coordinates are board-absolute with the CENTER at
  (0,0) — the same space the composer's absolute coordinates land in,
  so a composer position translates directly (pass the image's
  center point).
- **Delete in SMALL batches.** One update carrying 87 delete stubs
  timed out into "Miro did not confirm whether item deletion
  succeeded" for 20 of them — and those items were NOT deleted.
  Batches of ~7 delete cleanly, frames included. Rebuild flow that
  works: create the new content first, then delete the old in small
  batches, verifying with `board_list_items` between rounds.
- **A `<text>` position patch is ignored** — with an empty body AND
  with the body restated, the diff reports 0 updated. To relocate a
  text, delete it and recreate at the new spot. Shapes and frames
  move fine via patch (frame = transform + non-empty `data-frame`).
- `board_update_metadata` renames the board when its subject changes —
  a rebuilt board keeping its old name is a provenance lie.

## The harvest (after the session)

1. Read the board (FigJam: `use_figma` traversal of stickies by color;
   Miro: list/search items).
2. Collect ONLY the participant-color stickies, each with its
   section/phase for context.
3. `ingest_text` with the session named as source — one
   `change_batch_id`, so the whole harvest reverts in one action if it
   landed wrong.
4. Tell the user what landed where, and link the changes feed.
