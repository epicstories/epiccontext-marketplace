# Information Architecture (IA)

The **navigable structure of the product** — what pages exist, how they nest, what they're called. The IA tree is the spine of the prototype: every `content_page` block, every journey-step route, every widget context-tab path resolves against it.

A real IA block is a tree where every node names a route, a purpose, and (where applicable) the persona who arrives there.

## Why most IA blocks are too thin

Classic failure: a flat list of pages without nesting, no routes, no purpose per node. A real IA shows the *journey through the product* as a structure — and surfaces which paths the user actually walks vs. which are dead ends.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Tree structure | flat list | Nested tree with depth reflecting actual navigation. |
| Routes per node | absent | Each node carries `(/route)` matching content_page slugs. |
| Purpose per node | absent | One-line "what this page is for + who arrives here." |
| Persona entry points | absent | Per persona: where they enter, what they look for. |
| Empty/dead branches | absent | Honest about pages that don't yet exist (TODO) or are deprecated. |

## Depth checklist (BEFORE writing)

1. **Tree nested** to actual depth.
2. **Routes on every node** (or `(TODO)` if not yet built).
3. **Purpose** per node.
4. **Persona entry points** marked.
5. **Linked content_page** per IA node.

## Push-back prompts (AFTER drafting)

- **"Is the depth right?"** Flat = lying about nesting. Force the real structure.
- **"Do routes match content_pages?"** Mismatches = drift.
- **"Where does each persona enter?"** Persona-blind IA is a flat sitemap.
- **"Which branches are empty / dead?"** Honest about gaps.

## Evidence pool

- **Linked content_page blocks** — what pages exist.
- **Live `app/` routes** — what the app actually serves.
- **Journey-map steps** — which routes do journeys touch?
- **Analytics events** — which pages are actually visited.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (empty tree). |
| **drafted** | Tree nested + routes + purpose + persona entry points + linked content_pages. |
| **validated** | Drafted + ≥1 navigation test confirms the structure + journey blocks resolve cleanly + no dead branches. |

## Anti-patterns to refuse

- **The flat IA.** Just a list. Force nesting.
- **The route-less IA.** Doesn't bind to content_pages. Refuse.
- **The persona-blind IA.** No entry points.
- **The aspirational IA.** Includes pages that don't exist and aren't marked TODO.

## Output schema (markdown body)

Use the **tree shape** convention — nested bullet list with `(/route)` per node.

```
- Home (/)
  - About (/about) — persona: visitor
  - Product (/product) — persona: evaluator
    - Pricing (/pricing)
    - Features (/features)
- Dashboard (/dashboard) — persona: customer
  - Project view (/[org]/[project])
```

## Required connections (graph-level)

A drafted `ia_tree` block must:

- Link **content_page blocks** for every node.
- Be referenced *by* **journey_map steps** (their `route` should resolve here).

An IA where journey steps don't resolve produces drift flags.
