---
name: epicontext-development
description: >
  Use when breaking a graph `feature` block into shippable work — user
  stories, tasks, impact/effort ranking, sprint sequencing. NOT for
  defining strategy or roadmap items (use epicontext-business-strategy)
  and NOT for the actual code work (use epicontext-frontend /
  epicontext-backend). The narrow job: feature → story stack with
  upstream JTBD/persona/page traces.
allowed-tools: Read, Grep, Glob
metadata:
  epic.requires: "feature,user_story,task"
  epic.version: "1.0.0"
  epic.contenthash: "5e19958e8e303cfe"
---

# Epic Context — Development Workflow

Translate a graph `feature` into a shippable story stack. Operates
**outside** the canonical 34 entities — `epic`, `user_story`, `task`,
`kanban_board`, `impact_effort_matrix` are workflow artefacts. They
live on the board in Kanban — `share_plan` puts the plan (a card per
story or task) there and keeps it current, `hand_off` gives a person
what is theirs — and in PR descriptions + git, not in the graph.

## When to use vs not

- **Use** to break a feature into stories + tasks, score impact/
  effort, sequence for the next sprint.
- **Not** for defining the roadmap itself — that's an entity in
  `epicontext-business-strategy`.
- **Not** for writing the code — that's `epicontext-frontend` /
  `epicontext-backend`.

## The planning rhythm

1. **Pull the feature**: `get_block(key: <feature-key>)`.
2. **Trace upstream**: every feature must link to a JTBD + persona.
   Missing? Write the missing links (`update_block` with a `reason`)
   BEFORE writing stories — code that
   doesn't trace to a user need is drift on day one.
3. **Trace downstream to pages**: every feature must link to ≥1
   `content_page`. Missing? **The first story is "Mint content_page
   for /the/route and bind to feature X"** — see `epicontext-frontend`
   for how to write the page block.
4. **Break down**: each story = one PR's-worth of work, named scope.
   UI-touching stories MUST include "and update / create the matching
   `content_page` block (and a `component_spec` for any new UI) in the
   same change" in acceptance criteria.
5. **Score impact/effort**: plot stories on a 2×2. Pick from high-
   impact / low-effort first.
6. **Roadmap commit**: selected stories land on the `roadmap` block.

## Output traceability

Every story cites upstream entities AND its page:

```markdown
**Trace:**
- Feature: feature/<key>
- Page(s): content_page/<slug>
- JTBD: jtbd/<key>
- Persona: persona/<key>
- Decision: decision/<adr-key> (if relevant)
```

A trace without a page entry means the story is floating — the
feature has no place to ship.

## The discipline contract

Every story passes the six norms in
`epicontext-core/references/discipline.md`. Especially:
**answer-first** (story title IS the verdict, not the task list);
**specific-enough** (verb + persona-visible value + smallest viable
scope); **MECE** (stories don't overlap each other within a feature).

## Anti-patterns to refuse

- Stories that don't trace to a JTBD.
- UI stories that don't name a `content_page` to mint/update.
- Roadmap items added without an impact-effort score.
- Treating `epic` / `user_story` / `task` as graph entities — they're
  cards on the board (`share_plan`) and PR/git artefacts.
