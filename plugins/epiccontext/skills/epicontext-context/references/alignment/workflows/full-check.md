---
description: Run complete alignment validation across all sections

allowed-tools: Read
---

# Full Alignment Check

## Process

1. Load the graph via MCP: `get_v3_overview`, `list_v3_entities`
   (or `get_book`), plus `detect_drift` and `check_project_health`.
   Don't read a `CONTEXT/` folder — it is at most a read-only projection.
2. For each block:
   - Check required `_ref` fields resolve (`missing_required_connections`)
   - Flag placeholder text and stub maturity on `origin: default`
   - Compare against the repo where the block describes code
3. Write the repairs (`update_block` / `create_block`, each with a
   `reason`), then report.

## Report Format

```
## Context Alignment Report

### Repaired ([count])
### Needs a human decision ([count])
### Clean
```
