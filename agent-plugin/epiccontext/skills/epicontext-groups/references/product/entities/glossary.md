# Glossary

The **canonical terms** this product uses — name, definition, the variants the brand explicitly avoids, and the places the term lives. A real glossary is the AI's single source for any copy decision involving the term.

A real glossary block isn't a dictionary; it's an *agreement*. Once a term is canonical, every surface (UI, marketing, docs, journeys) must use it consistently.

## Why most glossary blocks are too thin

Classic failure: a list of terms + definitions. No "do not say" list, no origin (where did this term come from?), no link to surfaces that use it. A real glossary names **what we avoid**, **why this term beat the alternatives**, and **where the term appears** so a rename has visible blast radius.

## The depth bar

| Section per term | Stub | Drafted |
|---|---|---|
| Term | "Project" | Canonical noun + part of speech + casing rule. |
| Definition | one line | One paragraph: what it means here, what it does NOT mean. |
| Avoid (do not say) | absent | Variants we don't use + why. |
| Origin | absent | Where the term came from — research, founder choice, industry convention. |
| Used in | absent | Linked content_pages + features + journeys that use it. |
| Translation | absent | If the product is multilingual, the canonical translation per locale. |

## Depth checklist (BEFORE writing)

1. **Each term** has definition + avoid + origin.
2. **Links to surfaces** that use it.
3. **Casing + part of speech** stated.
4. **Translations** where applicable.

## Push-back prompts (AFTER drafting)

- **"What do we NOT say?"** Without avoid-list, drift creeps in.
- **"Where does this term appear?"** A glossary entry no one cites is unused.
- **"Where did the term come from?"** Origin makes the term defensible.
- **"Are content_pages and features consistent?"** Cross-check.

## Evidence pool

- **Linked content_pages + features** — where the term appears.
- **Live copy in app + marketing site** — what's actually being used.
- **Linked research / customer_insight** — does the persona use this term?

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (one placeholder term). |
| **drafted** | ≥5 canonical terms with definition + avoid + origin + linked surfaces. |
| **validated** | Drafted + live copy audit confirms ≥90% adherence + ≥1 customer_insight confirms persona uses the term. |

## Anti-patterns to refuse

- **The dictionary glossary.** Just term + definition. Refuse.
- **The avoid-free glossary.** No drift prevention.
- **The orphan glossary.** No linked surfaces.
- **The aspirational glossary.** Doesn't match live copy.

## Output schema (markdown body)

Use the **list shape** convention — markdown table per term group OR a list with `Term | Definition | Avoid | Used in` rows.

```
## Core terms
| Term | Definition | Avoid | Origin | Used in |
|---|---|---|---|---|

## Domain terms
| ... |
```

## Required connections (graph-level)

A drafted `glossary` block must:

- Have **≥5 terms** linked to **content_pages** that use them.
- Be referenced *by* **messaging** (canonical terms feed messaging) and **tone_of_voice**.

A glossary with no surfaces using its terms is decoration.
