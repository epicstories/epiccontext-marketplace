---
name: epicontext-context
description: >
  Use to make and keep the brain right: a fresh project or empty organisation
  ("where do I start?", "I just signed up"), "fill in / populate the
  context", a health check or audit before a release, orphans, broken _ref
  links, stubs, graph-vs-repo drift, the edges a block needs, glossary terms,
  section guides and project rules. Writes the fixes with a reason.
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.contenthash: "5506e5d5c9f2c368"
---

# Epic Context — Making and keeping the brain right

The graph is only worth reading when it is **real, connected and current**.
This skill holds the five jobs that make it so: the kickoff of a fresh
project, the fill pass, the alignment-and-repair pass, the connection rules,
and the constitution (the rules, terms and section guides that bind the rest).
What each entity should *say* is in its expert (`epicontext-brand` … `epicontext-performance`); this skill is about
the whole graph at once.

Every path below is inside this skill's folder. For `get_skill`, put
`epicontext-context/` in front and drop `.md`:
`get_skill("epicontext-context/references/fill/README")`.

## When to use this skill → which reference

| The moment | Read |
|---|---|
| A freshly scaffolded project (every block a stub), an empty organisation, "what do I do now?", "where do I start?" | `references/kickoff/README.md` — the first hour; the organisation first: `references/kickoff/organisation-first.md` |
| "Fill in / populate / complete the context", "bring it up to date", the start of working a project, a graph that looks thin | `references/fill/README.md` — the proactive pass, one sweep |
| A health check, an audit, before a release, orphans, broken `_ref` fields, placeholders, drift between graph and repo | `references/alignment/README.md` — find the breaks, write the repairs; step by step: `references/alignment/workflows/` (`full-check`, `check-links`, `find-orphans`) |
| Creating or updating any block, fixing a missing link, "which edges does this need?" | `references/connections/README.md` — the required and recommended edges |
| A domain term, a section's local rules, a project-level constraint that binds future work | `references/constitution/README.md`; routines: `references/constitution/workflows/` |

Kickoff is the 30-minute version (make three things real); fill is the
two-hour version (make everything rich). When in doubt, offer the fill pass:
*"The graph has 18 stub nodes I can fill from the repo right now — shall I?"*

## Core principle

**The brain does the work, not the user.** Don't drag facts out one prompt
at a time and don't stop at a report. Survey the whole graph, gather the
evidence (the repo, the existing graph, the organisation's shared context,
real research), write rich connected drafts and the repairs in one pass —
each with a `reason` — and hand the person one summary to review.

Three things stay true while you do it:

- **Evidence, never invention.** A claim comes from somewhere you can name;
  what is unknowable (the bet, a real interview quote, a figure) stays a
  marked gap or an `assumed` hypothesis. The numbers are never invented.
- **Edges first.** A node with a rich body and no edges is invisible. Wire
  its required edges, then the relevant recommended ones, then the body.
- **Stub is the floor.** A stub is a valid start, not a failure — but the
  moment evidence exists, the node goes to drafted in the same pass.

## The order on a new project

1. **The organisation first** — when its shared context is empty: brand,
   shared personas, glossary (kickoff step 0). Projects inherit them.
2. **Three anchors** — a persona, the bet, the first feature (kickoff).
3. **The fill pass** — every other stub, from the repo and the graph.
4. **Alignment** — links, orphans, thin nodes, drift; repairs written.
5. **Constitution as rules emerge** — a term gets a glossary entry with
   its origin; a section rule goes in its `section_guide`; a rule the team
   agreed goes to `save_rule`.

## The tools you'll use

| To | Call |
|---|---|
| Know the state | `get_orientation`, `get_v3_overview` |
| Load the graph | `get_book` (everything) or `list_v3_entities` (with `missing_required_connections` per block) |
| Find what is broken | `check_project_health`, `detect_drift` |
| Find a block | `search_blocks`, `get_v3_entity`, `get_block` |
| What the project inherits | `get_org_context` (org blocks, overrides, the drift report) |
| Write | `create_block` / `update_block` (`fields:` merges and keeps refs) with a `reason` and the `briefing_id`; bulk material: `ingest_text` |
| Say what a link means | `link_blocks` (`supports`, `supersedes`, `contradicts`, `governs`, …) |
| Promote with proof | `mark_validated` with the evidence |
| A rule or a learning | `save_rule` / `log_learning` |

## The required connections, in short

Every block type has required outgoing `_ref` edges — feature →
product_overview, jtbd / journey_map → persona, content_page → feature[],
kpi → feature[], campaign → marketing_strategy + channel[], and about twenty
more. **Pass them on `create_block`**, pick the target by the
primary-or-first convention (`primary-…`, then the bare type name, then the
oldest), and fill the recommended cross-links when the relationship is real.
The full table, the two flows (scaffold, block creation) and the anti-patterns:
`references/connections/README.md`.

## The hard rules — keep these in view

1. **Write the fix, don't list it.** An audit that ends in a report is half
   a job. Everything fixable from evidence is written in the same pass.
2. **Every write has a `reason`** naming what was missing and where the
   evidence came from. Each change can be undone from the changes feed; an
   `ingest_text` run shares one batch, so it reverts in one action.
3. **Never invent.** No fabricated competitor, quote, figure or decision.
   A gap is honest and fixable; a plausible wrong fact is neither.
4. **Locks are absolute.** A locked block refuses every writer: tell the
   person it is locked; never work around it.
5. **Inherit, don't copy.** The organisation's brand, design system, shared
   personas and glossary are read as the project's own (`[org]`). Differ per
   field with `override_block` and a reason; a block that is really the
   organisation's moves there with `move_block_to_org`.
6. **The graph is the source of truth.** Read it over MCP; never audit a
   local `CONTEXT/` folder — it is at best a stale projection.
7. **What needs a person goes to that person.** Decisions you can't make
   from evidence end as `hand_off` cards for a named member, not as a list
   in the chat (`epicontext-suite`).
8. **Glossary terms cite their origin** (research, founder, industry) and a
   `section_guide` names the rule it enforces — never placeholder text.

## Report — one review, not twenty

Close every pass with: the repairs and drafts written (counts per group,
and where to review or undo them: the changes feed), the few points that need a human decision (handed
off), and what is clean. Give the `url` of what you wrote. The formats are
in `references/fill/README.md` and `references/alignment/README.md`.

## Anti-patterns to refuse

- Filling the body of a node and leaving its edges empty.
- Twenty questions to the user before writing anything the repo already answers.
- A checklist of problems with no repairs written.
- Promoting a block to validated without evidence.
- Treating epics, stories and tasks as the brain's job — they are cards
  on the board (`epicontext-suite/references/feature-to-work.md`).
- Copying an org block into a project to "fill" it.

## Pairs with

`epicontext-core` (always), the experts (what each entity should
say and its depth bar), the five-step analysis in `epicontext-core` (when a finding is a tension
to weigh rather than a break to fix), `epicontext-suite` (where what is left
for people goes).
