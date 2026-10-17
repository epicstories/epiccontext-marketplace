# Figma ↔ design system — the fidelity contract

The loop: generate a component into Figma (Code to Canvas via the Figma
MCP), tweak it there, bring the tweak back into the code and the graph.
The loop only works under one rule, learned by breaking it on the very
first try:

**The design is the contract — in both directions.**

The first generation of the journey track produced a plausible kanban
board: colored column headers, cards with +/− rows. Readable, tidy, and
*nothing like the component*. The agent had read the journey's data and
invented a layout for it. For a tweak-in-Figma workflow that output is
worse than useless — every tweak made there is a tweak to a design that
does not exist.

## Generating: code → Figma

1. **Read the source before drawing anything.** The component's real
   file (via the spec's `source_path`), its `component_spec` (specs
   tables, variants, `uses`), and its rendered preview. Extract the
   actual values: layout constants, paddings, radii, font sizes, line
   heights, token colors. EpicContext's own journey track, for
   example, is
   `LABEL_COLUMN 76 / STEP_WIDTH 256 / STEP_GAP 16 / CURVE_HEIGHT 96`
   with the sentiment curve's bezier math in its layout module — all of
   it reproducible exactly, none of it guessable.
2. **Tokens, not approximations.** Convert the project's tokens (CSS
   HSL, theme values, whatever its token source holds) to Figma RGB
   precisely. Stock palette steps by their real hex — in a Tailwind
   project `sky-500`, `violet-500`… — opacities included (Tailwind's
   `/60`, `/15` become paint opacity).
3. **Build a component, not frames.** `figma.createComponent()`, named
   layers matching the code's structure, auto-layout wherever children
   relate. Variants become a component set.
4. **Verify against the original.** Screenshot the Figma result and
   compare with the rendered component (preview route or book page).
   Clipped text, drifted spacing and misplaced curves are visible in a
   side-by-side and invisible in the code that produced them.
5. **Write `figma_url` back on the spec in the same run.** The schema
   offers the field; the page renders it as "Open in Figma". A
   generated file without the link is knowledge in one person's drafts
   — the link is what makes the mirror shared.

## Returning: Figma → code

6. **The tweak lands in the same component.** Read the changed frame
   (get_design_context / get_screenshot), translate the delta into the
   existing component's own vocabulary — its tokens, its constants —
   and update the code, the `component_spec` (specs tables, variants)
   and, where it applies, the seed. Never build a lookalike next to
   the original.
7. **Code stays canonical (ADR-045).** Figma is where a tweak is
   *tried*; the system is where it *lands*. After the code changes,
   regenerate or update the Figma component so the mirror is true
   again — a stale mirror is the drift this whole system exists to
   prevent.

## Structure for growth — build the component like the divs

Pixel fidelity is half the contract. The other half surfaced on the
very next review: the 1:1 journey track was rebuilt as **lane rows**
(visually identical to the CSS grid) and was therefore dead — adding a
step meant editing four separate rows. In the code, a step is one
element; in Figma it must be too.

**The structural unit is the unit of addition.** Ask: what does someone
add when they extend this? For a journey it is a *step*. That unit
becomes the Figma component (`Journey / Step`: header + one cell per
lane); everything around it is containers that derive their size from
content:

- **Wrappers hug, spanners fill.** The phase pill is `FILL` across its
  steps row; the phase hugs its steps; the track hugs its phases. Drop
  in a step instance and the pill stretches over it, the phase widens,
  the track widens — exactly `layOutTimeline` deriving phase width in
  code. Growth-tested by actually adding a step before calling it done.
- **Figma has no grid — cross-column row alignment comes from per-lane
  `minHeight`** on the cells (and a matching label column). Rows stay
  aligned until content overflows a min, which is also when a designer
  would want to see it.
- **Empty is hidden, not deleted.** Instances cannot gain children, so
  the master carries every optional part (badge, insight card) and an
  instance *hides* what its lane has nothing to say. A gap is the
  truth; a deleted layer is an instance that can never say it later.
- **Assemble with instances, keep masters editable.** Children cannot
  be added inside an instance — so the repeatable unit is the
  component, and the track/flow around it is an editable master or a
  plain frame someone duplicates per flow.
- **Name what is data-driven and will not reflow.** The sentiment
  curve is bezier math over step scores; moving or adding steps does
  not move it. Say so in the component description and regenerate it
  after structural edits, rather than letting it silently lie.
- **When structure and design conflict, neither yields — use a
  reserved zone plus an overlay.** The restructure moved the phase
  pills below the curve, and that was silently accepted as a
  trade-off. It is not one: the design always matches. The pattern
  that gives both: each growing container reserves the graphic's room
  in its flow (a fixed-height `curve-zone` between pill and steps),
  and the graphic itself is drawn once, absolutely positioned over
  the zone. Flow keeps growing; the drawing keeps its place in the
  reading order.

## Details behave like the code builds them — not just look like it

Two findings from the same review, both invisible in a screenshot and
obvious the moment someone opens the file:

- **Alignment is a per-element check, against the render.** The step
  header was top-aligned in Figma because the code says `items-start`
  — but the code never *shows* that: its cards are exactly
  content-height, so the text reads as centred. Figma's `minHeight`
  introduces slack the code doesn't have, and under slack the declared
  alignment and the visible alignment diverge. Match what the render
  shows (centre, here), not what the stylesheet says.
- **A detail that must track content size lives in the flow, never on
  "ignore layout".** The card's coloured left edge is a CSS
  `border-left` — it participates in layout by definition. Rebuilt as
  an absolute rectangle with STRETCH constraints it froze at 2×19 on a
  53px card, because constraints do not track a hugging auto-layout
  parent. The flow-native equivalent: the card is a horizontal layout
  of `[accent (2 wide, FILL height), content column]` — border-box
  math intact (2px accent + 12px padding = the same inset), and the
  accent can never be the wrong height again. Absolutes are for true
  overlays only (the curve), and those are documented as such.

The general form: for every CSS mechanism the component uses
(border-left, flex stretch, grid, z-index), find the Figma construct
with the **same behaviour**, not the same look on first render.

**This file is a living log.** Every Figma review that finds drift adds
its rule here — that is the deal that keeps the mirror honest.

## Mechanics worth remembering

- Figma normalizes `vectorPaths` to the node's origin: build paths
  with coordinates relative to their own minimum and position the node
  at that minimum, or the curve lands shifted.
- `resize()` pins sizing to FIXED — set `layoutSizingVertical = "HUG"`
  *after* appending, or wrapped text clips.
- CSS `border-left` accents have no Figma equivalent on a stroked
  frame: use an absolute-positioned 2px rectangle inside the card.
- An empty cell is a gap, not an empty box — same rule as the
  component itself.
- `figma.createAutoLayout()` defaults to a **white fill**. Structural
  wrappers (body, phases, steps rows) are scaffolding, not surfaces —
  clear their fills, or they paint over any absolutely-positioned
  overlay behind them. This is how the curve "disappeared" once.
- A `[name=...]` query selector does not match names containing
  spaces/colons (`phase: Discover`) — find those by traversal.
- Changing `layoutMode` on an existing frame resets its `layoutSizing`
  — re-pin FILL/HUG after the switch, or the frame collapses to hug.
