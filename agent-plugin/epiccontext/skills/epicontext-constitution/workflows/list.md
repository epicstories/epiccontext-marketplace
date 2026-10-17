---
description: List all constitution blocks in the project graph
---

# List Constitution blocks

Works on the project graph through the Epic Context MCP tools, not on local files. A `CONTEXT/` folder, if the project has one, is a read-only projection of the graph — don't edit it.

1. `list_blocks type=glossary` — every glossary term.
2. `list_blocks type=section_guide` — one guide per section.
3. For each block extract: name, type, section, key, maturity.

Format as a table. Flag every block still at `stub` and every term
without a cited origin.
