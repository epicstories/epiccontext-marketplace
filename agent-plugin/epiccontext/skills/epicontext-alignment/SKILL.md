---
name: epicontext-alignment
description: >
  Use for project health checks, before releases, or when hunting
  orphan / unlinked nodes, broken _ref fields, thin stub or placeholder
  nodes, or drift between the graph and the repo. Audits the graph via
  MCP, then WRITES the repairs, each with a reason and each undoable
  from the changes feed — it doesn't just report. Pairs with epicontext-fill,
  epicontext-connections and epicontext-core.
allowed-tools: Read, Grep, Glob
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.contenthash: "bfb250c495b5ffa6"
---

# EpicContext — Alignment & Repair

> **An audit that ends in a report is half a job. Find the breaks, then
> write the fixes in the same pass.**

> **First know the required edges.** The table of required and
> recommended edges is in `epicontext-connections`; `list_v3_entities`
> reports `missing_required_connections` per block, and
> `check_project_health` / `detect_drift` flag the rest. (If the project
> keeps a `canonical-linking-spine` diagram block, `get_block` on it gives
> a handy picture — solid = required, dashed = recommended.) A node with
> every required edge populated is structurally healthy; one that also
> has most recommended edges is well-connected; one missing required
> edges is a real audit failure.

This skill checks that a project's graph holds together — every required
link resolves, no node is orphaned, no node is a thin placeholder, and the
graph matches the repo — and then **writes the changes that repair what
it finds**, each with a `reason`. It does not write a checklist and stop.

The graph is the source of truth (read it via MCP). **Do not** audit a
`CONTEXT/` folder — where one exists it is only an optional, read-only
projection of the graph, and it can be stale.

## How to run

1. Load the graph: `get_v3_overview` (maturity by group) +
   `list_v3_entities` (every block with its `maturity`, `origin`, body
   and `missing_required_connections` count) — or `get_book` for
   everything in one call. Add `detect_drift` and `check_project_health`
   for broken references and invariant violations.
2. Run the checks below over the loaded graph.
3. For everything fixable from evidence, **write the change** (`update_block` / `create_block`)
   in the same pass — don't just list it.
4. Summarise: what you repaired, and the few things that
   need a human decision.

## The checks → the repair

### 1. Link integrity (broken / missing refs)
- Every required outgoing `_ref` (see `epicontext-connections`) resolves to
  a real block of the right type. A ref pointing at a deleted/renamed key
  is broken.
- **Repair:** `update_block` to re-point the ref to the correct
  existing block (primary-or-first strategy), or fills the empty required
  ref. Never leave a required ref dangling.

### 2. Orphans (nodes with no edges)
- A node with zero inbound and zero outbound edges is invisible to graph
  traversal — "context that isn't linked doesn't exist."
- **Repair:** write the link(s) it should have — the required parent at
  minimum, plus any relevant non-required edges (`epicontext-connections`).

### 3. Thin nodes (stub / placeholder / empty)
- Flag any node that is `maturity: stub` + `origin: default`, has an empty
  body, or still contains scaffold filler (`Replace with…`, `TBD`, `TODO`,
  `[fill in]`, or a single vague sentence).
- **Repair:** this is the proactive fill pass — hand off to / run
  `epicontext-fill`: mine the repo and the existing graph and write a
  rich `drafted` body. Don't report "stub" and move on.

### 4. Completeness (required fields per shape)
- Persona: real goals AND frustrations. User story: acceptance criteria.
  Decision: context, decision, rationale. Feature: what it does + status.
- **Repair:** `update_block` to fill the missing sections from
  evidence; flag only what's genuinely unknowable.

### 5. Drift (graph vs repo)
- A feature marked `draft` whose code is live in `main`; a `tech_stack`
  that no longer matches `package.json`; a journey step whose `route`
  doesn't exist in the route tree; a retired block type.
- **Repair:** `update_block` to re-sync the node to what the repo
  actually says (the dogfooding rule, `epicontext-core`).

### 6. Format / honesty
- Keys kebab-case; `validated` maturity only with real evidence (never
  `validated` on `origin: default`).
- **Repair:** write the correction; downgrade dishonest maturity (the
  `maturity` param of `update_block`).

## Output — repairs first, then the short list

```
## Alignment pass — <project>

### Repairs written (each with a reason)
- Re-pointed feature/checkout `kpi_ref` → kpi/checkout-conversion (was broken)
- Linked orphan glossary/sla → product_overview
- Filled 6 stub Build nodes from the repo (see epicontext-fill batch)

### Needs a human decision
- vision — needs the one-line product bet (repo & graph are silent)
- persona/buyer frustrations — needs a real interview

### Clean
- All Strategy refs resolve; no orphans in Users.
```

The writes land immediately and show up in the changes feed
(`/[org]/[project]/changes`) with each reason beside its diff; the user
can undo any one of them from there (a bulk `ingest_text` run reverts
as one batch). The audit's
value is the fixes, not the checklist.

## Anti-patterns to refuse
- **Reporting without repairing.** If it's fixable from evidence, write
  the fix. A bare report is the old, useless behavior.
- **Auditing a `CONTEXT/` folder.** It is at most a read-only
  projection; read the graph via MCP.
- **Working around a lock.** A locked block refuses every writer; list it
  under "Needs a human decision" instead.
- **Asking the human to fix what the repo already answers.** Mine first.
- **Leaving a required ref dangling** because "the target's unclear" — pick
  the primary-or-first canonical target.
