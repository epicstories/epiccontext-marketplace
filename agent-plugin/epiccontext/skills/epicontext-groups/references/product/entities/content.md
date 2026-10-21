# Content Page

A **page in the product** — its purpose, the persona that arrives there, the features it renders, the journey steps it serves, and the canonical copy on it. `content_page` blocks anchor the spine of the graph: IA nodes resolve to them, journey steps bind to them via `route`, the widget's "This page" panel shows what graph slice describes them.

A real content_page block lets a designer build the screen, an AI populate the copy, and the widget show the stakeholder what entity this page is.

## Why most content_page blocks are too thin

Classic failure: a page name + a one-line description. No persona, no purpose, no features, no copy. A real content_page links the **persona arriving**, the **journey step it serves**, the **features rendered**, the **canonical copy** (with glossary refs), and a **context summary** of the graph slice that describes it.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Slug + name | "/page" | Real route + human-readable name. |
| Purpose | "A page." | One paragraph: what this page is for + who arrives + what they do here. |
| Persona arriving | absent | Linked primary persona. |
| Journey step served | absent | Linked journey step (with route binding). |
| Features rendered | absent | Linked feature blocks that appear here. |
| Canonical copy | absent | H1, subhead, key CTAs, empty states. Glossary terms used inline. |
| Context summary | absent | The slice of the graph that describes this page (AI-generated where available; see CLAUDE.md "Per-page context summary"). |

## Depth checklist (BEFORE writing)

1. **Slug + name.**
2. **Purpose** named.
3. **Persona arriving + journey step served.**
4. **≥1 feature linked.**
5. **Canonical copy drafted** (H1 + key CTAs + empty state).
6. **Glossary refs** marked.

## Small visual — page context

A small flow showing the graph slice that describes the page.

````
~~~flow
title: Page context
direction: TB
nodes:
  - { id: page, label: "[Page name]", sub: "/[slug]", role: container }
  - { id: persona, label: "Persona", role: person }
  - { id: step, label: "Journey step", role: component }
  - { id: feature, label: "Feature", role: external }
  - { id: kpi, label: "KPI", role: external }
edges:
  - { from: persona, to: page, label: "arrives" }
  - { from: step, to: page, label: "renders" }
  - { from: page, to: feature, label: "exposes" }
  - { from: feature, to: kpi, label: "tracked by" }
~~~
````

Setup + narration.

## Push-back prompts (AFTER drafting)

- **"Who arrives here?"** Persona-blind pages serve no journey.
- **"Which features render here?"** Feature-less pages are decoration.
- **"Is the H1 using glossary terms?"** Cross-check.
- **"What's the empty state?"** Most pages die there.
- **"Does the IA know this page?"** Cross-check ia_tree.

## Evidence pool

- **Linked persona + journey step.**
- **Linked features.**
- **Linked glossary** for canonical terms.
- **IA tree node** matching this slug.
- **The actual `app/.../page.tsx` file** — does the code agree?

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder description). |
| **drafted** | Slug + purpose + linked persona + journey step + ≥1 feature + canonical copy + page-context diagram. ≥300 words. |
| **validated** | Drafted + live page deployed + analytics confirm persona arrives + copy reviewed against tone + ≥1 widget comment captured (or marked "no comments yet"). |

## Anti-patterns to refuse

- **The orphan page.** No journey, no feature, no persona. Why does it exist?
- **The copy-less page.** No H1 / CTA defined. Force them.
- **The IA-disconnected page.** Page exists but not in the tree.
- **The empty-state-blind page.** Force the empty state.

## Output schema (markdown body)

```
### Slug + name
### Purpose
### Persona arriving + journey step served
### Features rendered
### Canonical copy (H1, subhead, CTAs, empty states)
### Page context
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `content_page` block must:

- Link **persona** + **journey step** + **≥1 feature**.
- Be referenced *by* the **ia_tree** node.
- Optionally link **glossary terms** appearing in canonical copy.

A page not in the IA tree is unreachable from the spine.
