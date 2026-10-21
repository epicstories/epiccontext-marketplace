# Links are the brain — the navigation contract

**The graph is only as useful as its links.** A block sitting alone in
the database — even with perfect content — is invisible to any AI agent
navigating the project. Agents reach context by following links: they
start somewhere (a feature, a page, a persona) and walk outward to find
every related block. **A block with no edges does not exist for the AI.**

This is why every canonical entity has *required* outgoing connections:

- `feature.product_ref` → product_overview
- `jtbd.personas_ref` → persona[]
- `journey_map.personas_ref` → persona[]
- `content_page.feature_refs` → feature[]
- `kpi.features_ref` → feature[]
- `feedback.features_ref` → feature[]
- `analytics_event.feature_ref` → feature
- `tech_stack.product_ref` → product_overview
- `architecture_diagram.tech_stack_ref` → tech_stack
- `competitor.strategy_ref` → product_strategy_canvas
- (~20 more — the full table is in the `epicontext-context` (connections) skill)

These aren't suggestions. The scaffold pre-wires them between the
starter blocks, the editor and `check_project_health` flag a block that
misses one, and the context map shows orphan nodes as a visible drift
signal.

## Your responsibility when you create or update a block

**Every write must leave the graph more connected, not less.** Specifically:

1. **Always set the required `_ref` fields.** If you don't know the right
   target, pick the most likely primary block (`primary-<type>`, else the
   block keyed as the bare type name, else the oldest of that type) —
   never leave required refs empty.

2. **Set non-required but relevant refs too.** Canonical-required is
   the *minimum*. The user's stance is explicit: *"I want the entire
   project context to be easy navigable by AI. Following the links
   that are set, so nothing is overlooked. It's like a brain that is
   connected."* If a new persona is created, link it to the JTBDs they
   have, the journey maps they appear in, the personas they're a
   sibling/competitor to. If a new feature is created, link it to the
   JTBDs it serves, the personas it benefits, the decisions that
   shaped it, the KPIs that measure it.

3. **Repair dangling refs.** When you delete a block, scan inbound refs
   and re-point them to a real target. When you rename a key (forbidden
   in v3 — keys are immutable — but if it ever happens via migration),
   update every inbound ref.

4. **Refresh, don't replace.** When you `update_block` with a full
   `value:` payload, you'll overwrite the `_ref` fields the previous
   author or the scaffold set. Prefer the partial-merge form (`fields:`)
   when you only mean to change content, not links. Only use full
   `value:` when you're explicitly re-doing the block's structure and
   intend to re-write its links.

## Project Health checks orphans and broken refs

A block with 0 inbound + 0 outbound refs is an **orphan** — it lives
in the database but no walker reaches it. Project Health flags orphans
as `recommended action: link or delete`. If a
block has no real home, it has no value.

Run `check_project_health` (MCP) or `/context align` to surface
orphans + broken refs + dimensional health.

## Why this matters operationally

The context map's visible orphan count is the canary. When it climbs,
AI agents start losing the ability to navigate the project: a new
agent session opens, calls `list_v3_entities` or walks from a known
anchor, and stops at the unlinked node. Anything past it is invisible.
That's how features ship without trace, decisions disappear, content
drifts.

Treat the graph like a brain: every neuron worth keeping is wired to
something.
