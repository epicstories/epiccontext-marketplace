---
name: epicontext-core
description: >
  Use on EVERY task in an EpicContext-managed project — always relevant.
  The 5-step workflow (orient, read, write with a reason, connect, land),
  how to talk to the user about EpicContext, the hard gates (schema
  gatekeeper, locks, Stop hook), the coverage mandates, and which skill
  or reference to load next.
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.contenthash: "98b29388e648f7bf"
---

# EpicContext — Core Rules

EpicContext is the single source of truth for everything a digital
product needs alongside its code. The graph (34 canonical entities
across 8 groups: **Brand · Strategy · Users · Product · Design ·
Build · Marketing · Performance**) holds what the product is for, who it's
for, how it works, how it grows, and how it's doing. The codebase
implements that intent.

Your job: **read the graph, do the work, write changes that trace
back to the graph**. Never invent context the graph doesn't have; never
change it without saying why.

## The 5-step workflow — your whole job, in one place

Every task that touches an EpicContext project runs through this
pipeline. Each step is one tool call. Skip a step and the gates will
catch you.

```
1. ORIENT    — know the binding (project + state) before turn 1
2. READ      — load relevant context for the task in ONE call
3. WRITE     — change the graph directly, saying why in `reason`
4. CONNECT   — every block ships with its required edges + relevant ones
5. LAND      — durable outputs (plans, reviews, reports, decisions) are
               IN the graph before the session ends — never only in chat
```

### Step 1 — ORIENT

Before your first response, know the binding: which project, what
state, what changed recently.

- The `.epicontext` file at repo root carries the binding (project id,
  slug, URL, MCP API key).
- A SessionStart banner or UserPromptSubmit hook may surface this. If
  not, call `get_orientation`: it ends with the **next step** for the project's
  state (shared context, scaffold, kickoff or `get_briefing`). Follow it.
- **On your first response, name the binding to the user.** Layer 1
  visibility — see "How you talk to the user" below.

### Step 2 — READ before any write

Call `get_briefing` before you write. It returns the blocks every task of
that type must see (for `ui-component`: stack profile, component spec,
colour system, tone, page pattern) in full, then related blocks as
excerpts within a token budget, each as `key@version`, plus what the
graph is missing. Same input, same briefing.

```
get_briefing(task_type: "ui-component", target: "Table component", task: "add row selection")
```

Task types: `ui-component`, `ui-page`, `content`, `strategy`,
`research`, `build-backend`, `org-setup`, `general`. Keep the `briefing_id` it
returns. A block named in your task is found by name or alias ("Table
component" finds Table). For the whole picture, `get_book`. A required
slot reported missing means the graph does not know — say so, never fill
the gap from general knowledge.

### Step 3 — WRITE, and say why

Writes land immediately (ADR-027, the write-with-reason contract).
There is no proposal queue — it was retired because it went unread, and
an unread queue silently drops contributions where an unread feed drops
none.

```
update_block(key, body, reason, briefing_id)
create_block(section, type, key, name, value, body, reason, briefing_id)
ingest_text(text, source: "transcript")      // bulk material
save_rule(rule) / log_learning(learning)     // no briefing needed
```

**Pass the `briefing_id`.** Core blocks (the canonical entities) expect a
recent briefing: the server warns, or in projects that enforce it
refuses, and names the exact `get_briefing` call to make. **A rule or a
learning goes to `save_rule` / `log_learning`, never to a local memory
file** — one call, free text, it lands as an assumption every co-worker's
session can find.

**Always pass a `reason`.** One or two sentences on why you made the
change. It is recorded on the version snapshot and shown in the
project's changes feed (`/<org>/<project>/changes`) beside the diff —
it is what a human reads when deciding whether to keep your edit. A
change with no reason is a change someone has to reverse-engineer.

A bulk `ingest_text` run shares one `change_batch_id`, so the whole
ingest reverts in a single action. (What replaced the old queue's
protections: `references/where-context-lives.md`.)

**Locks are the only hard gate.** If a write is refused because a block
is locked, do not work around it — tell the user the block is locked and
that an owner has to unlock it, edit, and re-lock. Sensitive content
(`legal`, `research`, anything counsel-reviewed) belongs behind a lock,
which is enforced, rather than behind a convention, which is not.

**The schema gatekeeper still runs on every write.** An invalid value is
rejected at the boundary with `validation_issues` — fix and retry rather
than working around it.

**Every write result carries a `url`** — the book page. Open it in your
browser pane beside the chat, like an artifact; no browser → give the url.

### Step 4 — CONNECT (links are the brain)

Every write must leave the graph more connected, not less.

- **Required `_ref` fields** — every block type has required outgoing
  edges (feature → product_overview, jtbd → persona, content_page →
  feature[], …). Pass them on `create_block`; the full table lives in
  `epicontext-connections`. A missing required edge is flagged by
  `check_project_health` as an incomplete node.
- **Recommended cross-links** (non-required) are your judgement —
  fill them when the relationship is real. A new persona should link
  to the JTBDs they have, the journey maps they appear in, the
  features they benefit from.
- **Repair dangling refs** when you delete or rename a block — scan
  inbound refs and re-point.
- **Refresh, don't replace** on `update_block` — partial-merge
  (`fields:`) preserves existing `_ref` fields; full `value:` rewrites
  them.
- **Say what a link means** with `link_blocks`: `supports` (evidence),
  `supersedes` (replaces — the old block stays as history), `contradicts`,
  `governs`, `decides`, `implements`, `derived_from`. Never overwrite what
  is replaced: supersede it.

Detail and rationale: `references/links-are-the-brain.md`.

### Step 5 — LAND session outputs (the collaboration mandate)

EpicContext is a tool to work **together** — designers, developers,
business. A plan that lives only in this chat, an artifact, or a loose
file is invisible to every co-worker's session (it has happened: a
co-worker's AI honestly reported a plan "not recorded in EpicContext").

So, before a session that produced a **durable deliverable** ends,
that deliverable is written to the graph:

| You produced | It lands as |
|---|---|
| The plan of the work you are doing (every build has one) | on the board with `share_plan`, kept current as steps finish; a plan others must read also as a `document` (category: plan) |
| What is left for a person (an action, a decision, a question) | `hand_off` — a card for a named member, never a list in the chat |
| Notes along the way (a session log, meeting notes) | `write_note` |
| A review / audit / report | `document` (category: review / report) |
| A rule the team agreed, a learning | `save_rule` / `log_learning` |
| A decision, made or recommended | `decision` (ADR form) |
| A shipped capability | `feature` (+ the code rule from Step 3) |
| Raw session material (transcript, workshop, long thread) | `ingest_text` |

Rules:

- **The chat message is a projection of the block, not a replacement
  for it.** Summarize in chat; the graph holds the source of truth.
- **Hand out the EpicContext URL, not an export.** After landing, give
  the `url` from the write result — the block's book page for members.
  For someone outside the project, a read-only share link (the Share
  button on the block's book page). The share page is live: readers
  always see the current version. A Claude artifact or PDF is a frozen
  copy — use one only as a working preview before the content has
  landed, never as the deliverable.
- Land it **in the same session**, with a `reason` — a co-worker's
  next session must find it without asking you.
- If a write is refused (a lock, or a key without write scope), say so
  in your receipt and put the exact content you meant to write in your
  reply, so the user can land it or unlock the block.
- A session that produced nothing durable (pure Q&A, exploration,
  a code-only change already covered by Step 3) has nothing to land —
  say so explicitly if asked.

Enforced by the Stop hook (see "The hard gates"). Which tool is for what: `references/the-suite.md`.

## Readability — a rule, not advice

Every block opens with one key sentence. Compare in a table, show
structure in one drawing (`~~~flow`), name the sources. A roadmap phase
carries a `Done when:` line. Detail: `references/markdown-conventions.md`.

## The evidence rule — quote the graph, don't assert

Before you recommend an action (ship X, kill Y, change Z) or claim a
fact about the project, **pull the evidence the graph holds about
the target** and quote at least one piece in your reply:

```
get_evidence_for(block_key: "primary-feature")
get_evidence_for(entity: "persona")
```

It returns every `research`, `customer_insight`, `feedback`, and
`decision` block referencing the target — quote them: *"Per
research/rescuetime-2025 (89% of email checks non-actionable) and
customer_insight/trust-the-inbox, the bet on AI triage is right."* If
it returns nothing, **say so explicitly** ("the graph holds no evidence
for this — I'd add a research block first") rather than asserting from
training. Cite as `key@version`, name an assumed block as an assumption,
and run `check_citations` on an answer before you give it.

**Where things live.** Brand, design system, shared personas and glossary live in the organisation's
shared context; every project reads them as its own, marked `[org]` (`get_org_context`). Never copy or edit
one here: differ per field with `override_block` and a reason; a block that is really the organisation's goes there with `move_block_to_org`.

## How you talk to the user

The user can't see your tool calls — they see your text. Make the
binding visible and give them receipts.

### Layer 1 — open every session by naming the binding

On your **first response** in any EpicContext-bound repo, name the
project in plain text:

> *"Connected to EpicContext: \<Project Name\> (\<org-slug\>/\<project-slug\>). Let me read context for your task first…"*

Saying nothing about the binding is the failure mode — the user has no
way to tell if EpicContext is wired up.

### Layer 2 — give a receipt after any write

After a task that changed the graph, close with a short receipt:

> *"📋 EpicContext: read \<feature/X, persona/Y, decision/Z\>. Wrote \<N\> blocks — see /\<org\>/\<project\>/changes to review or undo. Updated \<M\> links."*


## The hard gates

The workflow above doesn't depend on the agent remembering — three
gates enforce it at the moment a shortcut would otherwise succeed.

| Gate | Where | Triggers on | Effect |
|---|---|---|---|
| **Write gate** | server, MCP | a core-block write without a recent `briefing_id` | warns, or refuses where the project enforces it |
| **Schema gatekeeper** | server, on every write path | every write | rejects invalid values with `validation_issues` |
| **Locks** | server, per block or passage | every write | refuses *every* caller on a locked block or passage |
| **Stop hooks** | the Epic Context plugin for Claude Code | session end | block once (each) if product code or a deliverable landed without a graph write, or a plan was not shared / nothing was handed off — if nothing needs updating, say so and stop |

## The coverage mandates — what must always exist

Treat a violation like a failing test. Full detail:
`references/coverage-mandates.md`.

1. **Every page, known and ordered** — every screen has a
   `content_page` whose `slug` matches its route, with a context
   summary and its links.
2. **Every UI surface, a documented and visible component** — a
   `component_spec` per surface, whatever the stack, with an absolute,
   public `preview_url` per variant (ADR-045), and a walkable `uses`
   chain from page-layer spec down to atoms.
3. **Every journey step on a screen, linked to its page** — the step's
   `route` selects a `content_page`.

When you build something new, the mandate tells you what else you now
owe: a new route owes a page block AND a page-layer spec; new UI owes a
spec that names its parts; a new journey owes its steps' pages.

## Pointer table — where the detail lives

Load these only when you're doing that specific work. Don't read
them all at session start.

| Working on… | Reference |
|---|---|
| **The discipline contract (MECE / answer-first / evidence-aware / assumption-conscious / executive-readable / specific-enough)** | **`references/discipline.md` — ALWAYS load when about to recommend, classify, summarise, or write to the graph** |
| Setting up a new project (where components live, prototype access) | `epicontext-design/references/project-setup.md` |
| How the graph is organised (spine + overarching) | `references/spine-and-overarching.md` |
| Where context lives + MCP tool table + locks | `references/where-context-lives.md` |
| The coverage mandates in full | `references/coverage-mandates.md` |
| Filling stubs from the repo (derive-don't-stub) | `references/fill-from-repo.md` |
| Citing the graph in code / copy / ADRs | `references/traceability.md` |
| Connection rules (links are the brain — detail) | `references/links-are-the-brain.md` |
| Per-shape markdown conventions + `~~~flow` / `~~~chart` fences | `references/markdown-conventions.md` |
| Pages-with-code rule + page-summary contract | `references/context-as-you-build.md` |
| Logging friction as a skill delta (self-improvement loop) | `references/self-improvement-loop.md` |

## Which skill for what

The full map of the other skills: `references/skill-map.md`. Group
skills own their entities; `epicontext-connections` owns the edges.

## When the graph is missing or wrong

If the graph is incomplete — a feature has no JTBD link, an ADR
contradicts the tech stack, a KPI has no measurement — **don't
fabricate**. Either:

1. Write the fix, with a `reason` naming what was missing, OR
2. Note the gap in your output and stop until the user resolves it.

You can do quality work on top of an incomplete graph as long as you
are explicit about what you assumed.
