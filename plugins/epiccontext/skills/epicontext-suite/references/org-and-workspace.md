# The organisation's shared context and its workspaces

An organisation in Epic Context has one **shared context** — its org
project — and any number of **workspaces** (projects): one per product,
site or tool. What the organisation decides once lives in the shared
context; every workspace inherits it.

## What lives where

| In the shared context (the org project) | In a workspace |
|---|---|
| The organisation's decisions and ADRs, and the plans that govern its work | The decisions that only concern this product |
| The suite itself: which tools, how the team works | This product's features, pages, IA, content |
| The brand: vision, positioning, tone of voice, messaging, visual identity | This product's positioning nuance — as an override, with a reason |
| The design system | Components only this product has |
| Shared personas, the glossary | Personas and terms only this product needs |
| Legal and org-wide constraints | This product's stack, architecture, running cost, KPIs |

A workspace reads every org block as its own, marked `[org]` (with its
origin per value). The org book is at `/<org>/book`.

## Where to start

- **A question about the organisation** — its strategy, its tools, how the
  team works, an idea for a new product or tool — starts in the shared
  context. Read the ADRs and plans that govern the subject before you
  propose anything.
- **A question about one product** starts in its workspace, which already
  carries the shared context.
- **No project in view** (a chat, a plan, research): `get_orientation`
  without a `project_id` lists the organisations you are in, each one's
  shared context and its workspaces, and where to look first.

## Working with inherited blocks

| You want to | Call |
|---|---|
| See what a workspace inherits, its overrides and the drift | `get_org_context` |
| Differ from an org block in this workspace only, per field | `override_block` with a reason — never copy the block |
| Read an org block at a fixed version instead of live | `pin_org_block` (`follow_live: true` to unpin) |
| Move a block that is really the organisation's | `move_block_to_org` (owners and admins; brand, design-system and decision blocks are locked on arrival) |
| Find overrides two or more workspaces make the same way | `propose_promotions` — writes a proposal for the block's owner; never changes the org block |
| Create the shared context if it doesn't exist | `ensure_org_project` (owners and admins) |

The drift report (in `get_org_context`) shows pinned blocks the
organisation has changed since, overrides made against an older version,
and workspace blocks that duplicate an org block without saying so — each
a thing to repair.

## Rules

1. **Inherit, don't copy.** A copied org block is a conflict the drift
   report flags; an override says what differs and why.
2. **The organisation first.** When the shared context is still empty, its
   brand, personas and glossary come before a workspace's own anchors
   (`epicontext-context/references/kickoff/organisation-first.md`).
3. **Locks hold.** Brand, design-system and decision blocks moved to the
   organisation are locked: a change goes through an owner.
4. **Write where the work is about.** On a connection without a bound
   project, pass the `project_id` of the shared context for
   organisation-wide work and of the workspace for product work — for
   blocks, plans and hand-offs alike.
