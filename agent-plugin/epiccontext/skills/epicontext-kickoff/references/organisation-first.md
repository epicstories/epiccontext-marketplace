# Organisation first — filling the shared context

Every project of an organisation inherits the organisation's shared
context: its brand, its design system, the personas the projects share
and the glossary. Those blocks are written once, there, and every
project reads them as its own, marked `[org]`. This reference is the
detail behind Step 0 of the kickoff.

## How to tell where you are

| `get_org_context` / `get_orientation` says | Do |
|---|---|
| No shared context for the organisation | `ensure_org_project`, then fill it (below) |
| Shared context exists, every block a stub or none at all | Fill it (below) before the project trio |
| Shared context written | Go to the project kickoff; inherit, override where the project differs |
| You are in the shared context itself | Fill it; there is no project trio here |

## What to fill, in this order

`get_briefing("org-setup")` lists the same slots and reports which are
missing. Write each with a `reason`, at `assumed` until evidence backs it.

1. **Vision** — what the organisation is for, in one sentence the user
   would say out loud. Every project's strategy points at it.
2. **Positioning** — where the organisation stands against the
   alternatives, and for whom.
3. **Tone of voice** — how it speaks: three to five traits, each with a
   do and a don't.
4. **Visual identity / design system** — the colour system, type and
   spacing as named tokens with their values, from the organisation's
   stylesheet or brand guide. Never invent a value: no source, no token.
5. **Shared personas** — the people several projects serve. A persona
   only one project serves belongs to that project.
6. **Glossary** — the organisation's own words, each with a definition
   and the words it replaces.

Ask, don't invent: *"Is this how the whole organisation talks, or only
this product?"* sorts a block into the shared context or the project.

## Blocks that are in the wrong place

- **A project block that is really the organisation's** — a brand voice
  written in the first project, a colour system every app uses:
  `move_block_to_org` with a reason. Don't copy it; a copy drifts.
- **A project that differs from the organisation** — a product with its
  own tone for a different audience: `override_block` on the inherited
  block, only the fields that differ, with a reason. The project still
  reads everything else from the organisation.
- **The same override in two or more projects** — that is a proposal to
  the organisation (`propose_promotions`), for the owner of the shared
  block to decide.

## When to stop

The shared context is ready for the project kickoff when vision,
positioning, tone of voice and at least one persona are past `stub`.
The design system and glossary can follow; name them in the next-work
list rather than inventing them to finish the hour.
