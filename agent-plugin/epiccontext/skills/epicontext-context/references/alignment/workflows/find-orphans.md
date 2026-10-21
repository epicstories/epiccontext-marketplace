---
description: Find blocks without required parent links

allowed-tools: Read
---

# Find Orphan Blocks

Via MCP (`list_v3_entities`, `get_book`, `check_project_health`), find:
- Blocks with `missing_required_connections` > 0
- Blocks with no inbound and no outbound edges
- Journey maps without `personas_ref`; features without a JTBD, persona
  or `content_page`

Write the missing link with `update_block` and a `reason`
(`references/connections/README.md` names the right target).
