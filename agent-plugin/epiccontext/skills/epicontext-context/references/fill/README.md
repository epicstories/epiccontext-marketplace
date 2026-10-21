# EpicContext — The Proactive Context Pass

*Part of `epicontext-context` (`references/fill/README.md`), formerly the `epicontext-fill` skill. Paths below are relative to the `epicontext-context` folder: for `get_skill`, put `epicontext-context/` in front.*

> **Don't wait to be asked node-by-node. Survey the whole graph, then fill
> everything you can in one sweep.**

> **Fill the spine, not just the nodes.** Before writing anything, know
> the required and recommended edges — the table in
> `references/connections/README.md` (and, if the project keeps one, the
> `canonical-linking-spine` diagram block: solid = required, dashed =
> recommended). The fill pass works edges-first: for each empty / stub /
> placeholder block, populate its required edges first (wire to the
> primary anchor), then its recommended edges where the relationship is
> real, THEN its body content. A node filled with
> rich body but no edges is still invisible to the graph.

The single biggest complaint about context tools is that the human has to
drag every fact out of the AI one prompt at a time, and what comes back is
thin. This skill exists to kill that. When it's relevant, your job is not
"answer the one question" — it's **make the whole graph rich and current,
proactively**, and hand the user a single summary to review.

This is the difference between a tool the user *operates* and a tool that
*works for them*. Run the pass; produce the magic.

## When to run it (often without being told)

- **At the start of working any project** — before anything else, survey
  the graph so you know what's real and what's a placeholder.
- The user says *fill / populate / complete / enrich / "bring it to life"
  / "make it current" / "what's missing"*.
- You just connected a repo, ingested a document, or shipped a feature.
- The graph is mostly `stub` / `default` (a fresh scaffold).

If in doubt, offer it: *"The graph has 18 stub nodes I can fill from the
repo right now — want me to run a full context pass?"* — then do it.

## The pass — five steps, one sweep

### 1. Survey → build a worklist

Read the whole graph and bucket every node:

- `get_v3_overview` — maturity counts per group (where's the thin layer?).
- `list_v3_entities` — every block with `maturity`, `origin`, and `body`.
- `get_org_context` — what the project inherits from its organisation's
  shared context (brand, design system, shared personas, glossary),
  marked `[org]`.

**Inherited is not empty.** An entity the organisation provides is
covered here: skip it. Never fill a project stub for an entity the
organisation provides — that writes the organisation's context a second
time, and the copy drifts. Where this project really differs, use
`override_block` on the inherited block, only the fields that differ,
with a reason. Where the organisation's own block is a stub, fill it in
the shared context (or name it as a gap), not in the project.

A node needs work if ANY of these is true:
- **empty** — no body, or body is whitespace.
- **stub maturity** — `maturity: "stub"`.
- **default origin** — `origin: "default"` (pure scaffold, never specialized).
- **placeholder text** — the body still contains scaffold filler like
  `Replace with…`, `What this … and why`, `TBD`, `TODO`, `[fill in]`,
  `placeholder`, or a single generic sentence that says nothing specific
  to this project.
- **missing required connections** — `missing_required_connections > 0`.

A node that is schema-valid and non-empty is **not** automatically done —
a scaffold placeholder is "filled" but says nothing. Treat
`stub + default + filler text` as the top of the worklist.

### 2. Gather evidence (don't invent)

For each worklisted node, pull what's actually known from two sources:

- **The repo** — mine it per the table in
  `epicontext-core/references/fill-from-repo.md`: the dependency manifest
  (`package.json`, `pyproject.toml`, `go.mod`, …) and config → tech_stack; the route tree →
  ia_tree + content_page; migrations → data_model; route handlers →
  api_endpoint; components → feature; `README`/docs → overview, glossary;
  ADR folders / `CLAUDE.md` / notable commits → decision; deploy config →
  infrastructure / architecture.
- **The existing graph** — a real persona constrains the JTBDs; a shipped
  feature constrains the KPIs that measure it; the tech stack constrains
  the architecture. Read siblings before drafting.

If neither the repo nor the graph carries the answer, **leave it and flag
it** (step 5) — deriving from evidence is not the same as guessing.

#### Greenfield / from-idea projects (no repo yet)

When the project is just an idea (e.g. created via the `create_project`
MCP tool), there's no repo to mine — so **conduct real research instead of
inventing**:

- **Search the web** (WebSearch / WebFetch). Find the *actual* competitors,
  market size, audience, comparable products, pricing norms, and relevant
  regulations for the topic. Cite the source on the block (a real URL), so
  a `competitor` is a real company and a `kpi` benchmark is a real number.
- **Draft hypotheses, labelled as such.** Persona pains, JTBDs, and the
  product bet that you can't verify online are *assumptions* — write them,
  but mark them clearly ("Hypothesis — validate via interviews") and keep
  maturity at `stub` or `assumed` (with the hypothesis label in the
  body), never `validated`.
- **Write research tasks for the rest.** What can't be answered from the
  web or reasoning becomes a `research` entity describing the study to run
  (e.g. "5 discovery interviews with X"), not a fabricated finding.
- **Never invent a competitor, a statistic, or a quote.** A made-up fact in
  the graph is worse than a flagged gap — it gets trusted downstream. If
  the web doesn't confirm it, it's a hypothesis or a task, not a fact.

### 3. Draft richly — meet the depth bar, not the floor

For every worklisted node, write the change whose `body` is a real first
draft, not a sentence. The bar per shape (see `epicontext-core` →
"Markdown conventions" and the group skills' maturity tables):

- **prose** (vision, feature, decision, content_page…): every section the
  shape expects, each with specific content. A `feature` body names what
  it does, its status (`shipped` if it's in `main`), and how it works — 
  derived from the implementing code, not a generic line.
- **list** (glossary, kpi, persona…): the real rows, each with a real
  value — actual terms + definitions, actual KPI + target.
- **tree** (ia_tree): the actual sitemap from the route tree.
- **timeline / kanban / canvas**: the real phases / columns / zones with
  real cards.

**Maturity follows evidence.** Content derived from shipping code or real
research is `assumed` (or `validated` if proven in production) — set the
`maturity` param on the write, or omit it and a stub that gains real
content becomes `assumed` automatically; the write itself marks the block
`origin: specialized`. Never leave it at `stub` once you've filled it
from evidence. `stub` is the floor; `assumed` is the target.

### 4. Wire every node (links are the brain)

Fill required `_ref` fields AND the relevant non-required ones in the same
write — see `references/connections/README.md`. A filled node with no edges is
still half a block. Don't stop at the one required parent; link a node to
everything it actually touches.

### 5. Report the sweep — one review, not twenty

Write all the changes (`update_block` / `create_block`, each with a
`reason` that names its evidence — "from package.json and the deploy
workflow", "from the interview notes the user pasted"), then summarise in
ONE message:

- **Filled** — N nodes written from evidence, grouped by group, each one
  line. ("Build: tech_stack ← package.json; architecture_diagram ← app/
  + route handlers; data_model ← migrations.")
- **Wired** — connections added.
- **Genuine gaps** — the few nodes that need the user because the repo and
  graph are silent (e.g. "vision — needs your one-line product bet";
  "persona pains — needs a real interview"). Ask for these specifically,
  not for everything.

The writes land immediately. The user reviews them in one pass in the
changes feed (`/[org]/[project]/changes`), where every change sits beside
its reason and can be undone in one click (a bulk `ingest_text` run
reverts as one batch). A locked block refuses the write — list it under
the gaps instead of working around it. That's the sit-back moment: they
glance at a populated graph instead of dragging out facts one by one.

## Keep it current — the pass is also a refresh

Re-run the survey whenever the project changes. When code ships and the
matching node drifts (a feature went live but its block still says
"draft"; the stack changed but `tech_stack` is stale), the pass catches it
and writes the update in the same sweep. This is the dogfooding rule
(`epicontext-core`) made operational: code and context stay in lockstep
because you re-survey, not because someone remembers to ask.

## Anti-patterns to refuse

- **Filling one node and stopping** when ten others are stubs you could
  fill from the same evidence. Sweep the worklist.
- **Asking the user to fill what the repo already answers.** Mine first;
  only ask for what's genuinely unknowable from evidence.
- **Writing empty / placeholder creates** to "get the node on the board."
  A node is created filled, or not yet.
- **Twenty separate "I updated X" messages.** One sweep, one summary.
- **Inventing facts to avoid a gap.** Flag the gap; don't fabricate.
- **Filling a project stub the organisation already answers.** Skip the
  inherited entity; override only what really differs, with a reason.
- **Leaving maturity at `stub` after filling from evidence.** Promote it.
