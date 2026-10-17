---
description: Validate all cross-references between blocks

allowed-tools: Read
---

# Check Links

Read the graph via MCP — not a `CONTEXT/` folder (at most a read-only
projection).

1. `detect_drift` — lists broken references (a `_ref` pointing at a
   deleted or renamed key) and invariant violations.
2. `list_v3_entities` — each block's `missing_required_connections`
   count; the required edges themselves are listed in
   `epicontext-connections`.
3. Repair each break with `update_block` (re-point or fill the ref),
   with a `reason`.
