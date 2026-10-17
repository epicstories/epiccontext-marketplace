---
description: List all business strategy blocks in the project graph
---

# List Strategy blocks

Works on the project graph through the Epic Context MCP tools, not on local files. A `CONTEXT/` folder, if the project has one, is a read-only projection of the graph — don't edit it.

1. Call `list_blocks` once per section: `business_strategy`, `product`, `development`.
   (`list_v3_entities` with the group filter gives the same blocks grouped
   by entity, with maturity.)
2. For each block extract: name, type, key, maturity.

Format as a table, grouped by entity. Flag every block still at `stub`.
