# EpicContext Connections

*Part of `epicontext-context` (`references/connections/README.md`), formerly the `epicontext-connections` skill. Paths below are relative to the `epicontext-context` folder: for `get_skill`, put `epicontext-context/` in front.*

> **Context that isn't linked doesn't exist as context.**

Every block in the graph carries at least one mandatory edge — either
incoming (another block points at it) or outgoing (it points at another
block). A block with no edges is a floating note: invisible to the
graph, useless for AI navigation.

The table under "The mandatory edges" below is the client-facing list
of required and recommended edges. Some projects also keep a
`canonical-linking-spine` architecture_diagram block that draws them
(solid = required, dashed = recommended); if `get_block(key:
"canonical-linking-spine")` finds one, it's a handy picture — but the
table here and `check_project_health` are what you rely on.

## Links are the brain — the navigation contract

A graph is only useful when an AI agent can walk it. Agents reach
context by following edges: they start somewhere (a feature, a page,
a persona) and traverse outward. **An unlinked node is invisible to
this traversal — it might as well not exist.**

Internalize the user's framing: *"I want the entire project context
to be easy navigable by AI. Following the links that are set, so
nothing is overlooked. It's like a brain that is connected."*

Treat every block like a neuron. A neuron with no synapses is dead
tissue. A block with no edges is dead context.

### Two tiers of connection responsibility

1. **Canonical required (the floor).** Every block of a given type
   must populate the `_ref` fields listed in the table below. A
   missing required edge is flagged — in the editor and by
   `check_project_health` / `detect_drift` — as an incomplete node.
   Never ship below this floor.

2. **Relevant non-required (your judgment).** Canonical-required is
   the minimum, not the goal. After filling the required refs, scan
   the project for OTHER blocks the new one should logically connect
   to and wire them too. A new persona should also reference the
   JTBDs they have, the journey maps they appear in, the features they
   benefit from. A new feature should reference the JTBDs it serves,
   the decisions that shaped it, the KPIs that measure it.

Don't stop at the floor. The graph becomes useful as you wire the
optional-but-logical edges.

### When the user creates a block via "+ create connected"

The inline chat prompts you specifically on this. The right answer is
never "I'll just keep the required refs" — it's "let me also link this
to X, Y, Z because they're related." Search the project for related
blocks (`search_blocks`, `get_v3_entity`, by name or shared context)
and write every link that makes sense.

## The mandatory edges

| Block type | Required outgoing |
|---|---|
| brand_positioning | → vision (`vision_ref`) |
| tone_of_voice | → brand_positioning (`positioning_ref`) |
| messaging_framework | → brand_positioning, persona[] |
| brand_visual_identity | → brand_positioning |
| product_strategy_canvas, business_model_canvas, ogsm | → vision |
| product_overview | → vision |
| feature | → product_overview |
| ia_tree, glossary, taxonomy, tech_stack, legal_document, constraint, north_star | → product_overview |
| architecture_diagram, dev_setup, testing_strategy, running_costs | → tech_stack |
| budget | → running_costs |
| api_endpoint, api_spec, data_model, data_schema | → architecture_diagram |
| jtbd, journey_map, user_research | → persona |
| research_data, customer_insight | → persona[] |
| competitor | → product_strategy_canvas |
| content_page | → feature[] |
| analytics_event | → feature |
| metric, kpi, feedback, insight | → feature[] |
| feature_market_analysis | → feature[], competitor[] |
| business_case | → persona[], feature[] |
| figma_embed, storybook_link | → brand_visual_identity |
| marketing_strategy | → ogsm, messaging_framework, persona[] |
| campaign | → marketing_strategy, channel[] |
| channel | → persona[] |
| content_piece | → campaign, channel[] |
| epic | → product_overview |
| user_story | → epic, persona[] |
| task | → user_story |

The schema of each block type (including its `_ref` field names) is
returned by `get_block` on any existing block of that type and by
`get_v3_entity`; when unsure of a field name, read one first.

**Recommended cross-links (suggested, not required — but fill them when the
relationship is real, so the graph is a web, not just a one-parent spine):**

| From | Recommended → |
|---|---|
| competitor | → feature[] (features it's strong at / competes on) |
| product_strategy_canvas | → product_overview (the product the strategy is for) |
| journey_map | → content_page[] (pages the journey passes through; also derived from each step's route) |
| kpi | → ogsm (the OGSM objective/measure it tracks) |
| roadmap | → ogsm |
| decision (ADR) | → tech_stack (the stack it concerns), decision (`superseded_by_ref`) |
| customer_insight | → feature[], user_research |
| component_spec, storybook_link | → product_overview |
| marketing_strategy | → brand_positioning |
| campaign | → content_piece[], kpi[], persona[] |
| content_piece | → tone_of_voice, messaging_framework, feature[], persona[] |

Don't stop at the one required parent — link a node to **everything it
actually touches**.

Roots / hubs (no required outgoing — anchored by inbound only):
**vision, persona** — every other block of their group points up at them.

## Two flows

### 1. Scaffold (new project)

`scaffold_v3_project` (or `create_project`) creates a stub block for
every canonical entity and pre-wires the default edges between them
(positioning → vision, primary-feature → overview, primary-jtbd →
primary-persona, …). After scaffold the project is a connected graph,
not a pile of floating notes.

### 2. Block creation (post-scaffold)

When you `create_block`, **pass the required `_ref` fields yourself**.
Pick the target with the **primary-or-first** convention the scaffold
uses:

1. The block whose key starts with `primary-` (e.g. `primary-persona`).
2. Else the block keyed exactly as the bare type name (e.g. `vision`).
3. Else the earliest-created block of that type.

If the user already chose a target, respect it.

## When you (the AI) write to the graph

- Reading is free — `get_briefing`, `get_book`,
  `list_v3_entities`, `get_v3_entity`, `list_blocks`, `get_block`,
  `search_blocks`.
- Writing is direct — `create_block` / `update_block` / `ingest_text`,
  each with a `reason`; the write lands immediately and shows in the
  changes feed with one-click undo. When you create a block, **always
  include the required `_ref` fields** using existing block keys from
  the project graph. Single ref:
  `{"blockKey": "primary-persona", "blockType": "persona"}`. Array ref:
  `[{"blockKey": "primary-persona", "blockType": "persona"}, ...]`.
- When you update a block whose required refs are still empty, fill
  them too. Use `fields:` (partial merge) so you don't wipe refs another
  author set; a full `value:` replaces them.
- Run `check_project_health` after a batch of writes — it lists
  orphans and missing required edges.

## Anti-patterns to refuse

- Using `value.links[]` (universal links) for a connection that has
  a canonical typed counterpart. Universal links are for ad-hoc, free-
  form references; required edges are typed.
- Skipping the `_ref` field on a create because "we can fill it in
  later." Connections are part of what makes a block real.
- Overwriting existing refs with a full `value:` when you only meant to
  change content.

Maintainers changing the connection rules themselves: see
`references/connections/_maintainers/codebase.md`.
