---
description: Validate a constitution block in the project graph
argument-hint: [block key]
---

# Check Constitution block

Works on the project graph through the Epic Context MCP tools, not on local files. A `CONTEXT/` folder, if the project has one, is a read-only projection of the graph — don't edit it.

## Target
`get_block key=$ARGUMENTS` (pass `section` if the key is ambiguous).

## Validate
- The body follows the shape and depth checklist in this skill's entity
  reference for that block type — no placeholder text (`TBD`,
  `Replace with…`).
- Every `_ref` field resolves to an existing block; the required
  connections for the type (see `epicontext-connections`) are present (`detect_drift` reports broken
  references and invariant violations).
- `maturity` matches the evidence: `validated` only with research, a
  decision, or production use behind it.

Report findings; fix them with `update_block` and a `reason` when the
fix is clear from the graph or the repo.
