---
description: Create a new brand block in the project graph
argument-hint: [name]
---

# Create Brand block

Works on the project graph through the Epic Context MCP tools, not on local files. A `CONTEXT/` folder, if the project has one, is a read-only projection of the graph — don't edit it.

## Block types
- Section `brand`: `vision`, `brand_positioning`, `tone_of_voice`, `messaging_framework`, `brand_visual_identity` (maps to the design_system entity), `brand_moodboard` (maps to the design_system entity)

## Steps
1. `list_blocks` / `search_blocks` first — if the block (or its scaffold
   stub) already exists, `update_block` it instead of creating a twin.
2. Read this skill's entity reference for the type and run its depth
   checklist; the required connections per type are in
   `epicontext-context` (connections).
3. `create_block` with `section`, `type`, a kebab-case `key`, `name`,
   the markdown `body`, the `_ref` fields that connect it, and a
   one- or two-sentence `reason`. Omit `maturity` to let it derive, or
   set it explicitly (`stub` / `drafted` / `validated`).
4. The write lands immediately and shows in the changes feed with your
   reason. If the schema gatekeeper rejects it, the result names each
   field in `validation_issues` — fix those and retry. Act on any
   `hint` the result returns.
