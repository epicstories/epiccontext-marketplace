# Where context lives — MCP tools, writes and locks

Project context lives in the **graph**, served via the MCP server. The
graph is the source of truth. Do NOT work in a `CONTEXT/` folder — where
one exists it is an export of the graph (a download) and can be stale.

## Read tools (free — call these as much as you want)

Step 2 of the workflow (READ) usually means ONE call:
`get_briefing`. The table below is for when you need something
specific.

| You need | MCP tool |
|---|---|
| Briefing for a task (required blocks first, then a ranked walk) | `get_briefing` |
| The whole project context in one call | `get_book` |
| Project + recent state for orientation | `get_orientation` |
| What projects can I access | `list_projects` |
| Overview of one project (counts per maturity) | `get_v3_overview` |
| All entities in a project | `list_v3_entities` (optionally filter by group) |
| One entity (e.g. all personas) | `get_v3_entity entity=persona` |
| One specific block | `get_block key=<block-key>` |
| Search across blocks | `search_blocks query=...` |
| Evidence about a block or entity | `get_evidence_for` |
| What changed recently | `get_recent_changes` (the changes feed, as data) |
| Stakeholder comments on the widget | `list_comments` |
| Health, orphans, broken refs, drift | `check_project_health`, `detect_drift` |

## Write tools — direct, with a reason

Writes land immediately (ADR-027). Every write is validated by the
schema gatekeeper, recorded with its source and your `reason`, shown in
the changes feed at `/<org>/<project>/changes` beside the diff, and can
be undone there in one click.

| Tool | Use when |
|---|---|
| `update_block` / `create_block` | Any block change. Always include a `reason` citing the reads from step 2. Use `fields:` on update to merge rather than replace. Set `maturity` only when it's true (`validated` = proven by research, a decision, or production use). |
| `ingest_text` | Free-form input (transcript, email, deck text) you want turned into several block writes at once. The whole run shares one `change_batch_id` and reverts in a single action. |
| `ingest_comments` | Turn widget comments into graph writes the same way. |
| `lock_block` / `unlock_block` | Only when the user asks you to. |
| `delete_block` | Only on an explicit user instruction. It archives (restorable for 14 days). |

## What replaced the old review queue

Older material may mention proposing changes and waiting for review.
That queue is retired.

| Was | Now |
|---|---|
| pending review before a write landed | the **changes feed** — every write with its source, reason and diff, one click to undo |
| accept/drop individual proposals from a bulk ingest | one `change_batch_id` per run — the whole ingest reverts in a single action |
| entity types that could never be written directly | **locks**, per block — and a lock refuses *everyone*, including owners |

## Locks — the only hard gate

A locked block (or a locked passage of a body) refuses every writer,
including owners and admins. To change it, an owner unlocks it, edits,
and re-locks. If your write is refused because of a lock, do not route
around it — tell the user which block is locked and stop.

Content that is consequential to change silently belongs behind a lock:

- **`legal`** (Build group) — legal context is supposed to be slow to
  change; counsel-reviewed text should be locked (see
  `epicontext-build/references/entities/legal.md`).
- **`research`** (Users group) — research is the source layer that
  personas, JTBDs, and insights cite; silent updates leave downstream
  entities making claims against changed evidence (see
  `epicontext-users/references/entities/research.md`).

If one of these is not locked, you may write it — but say exactly what
you changed and why in the `reason`, and mention it in your receipt so
a human looks at it.
