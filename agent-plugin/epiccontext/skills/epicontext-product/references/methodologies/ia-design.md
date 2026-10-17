# Information Architecture Design — Guided Methodology

> **Trigger:** the user is designing or auditing a sitemap / navigation
> tree, promoting `ia_tree` past `stub`, or asking "how should this
> product be structured?". Also: when content pages exist but no
> `ia_tree` ties them together, or when navigation is bloated and
> users can't find things.
>
> **Dialogic.** The AI co-designs the IA by walking persona journeys
> through candidate structures, not by inventing taxonomies in
> isolation. Output: an `ia_tree` block + a list of `content_page`
> blocks each pinned to its IA node.

## Inputs the AI verifies first

1. **At least one persona + one journey_map.** IA without journeys is
   organisational chart fantasy. *Stop:* "Whose path through this
   product are we structuring? Without a journey, we'll build the
   sitemap for ourselves."
2. **The features the IA exposes.** Pull every feature block; the IA
   makes them findable.
3. **The product overview.** The IA should reflect the product's
   value, not its internal team structure.

## The guided workflow

### Step 1 — Frame the IA's job

**Ask the user:**

> *"What's the ONE most important thing this IA needs to do? Help new
> users self-onboard? Help power users navigate fast? Help marketing
> drive conversion? Pick one — the IA optimises for one job and
> tolerates the others."*

**Stop condition:** named primary job + named secondary job (tolerated
not optimised). Without this, IA-by-committee produces a wishlist
with no shape.

### Step 2 — Card-sort with the persona

Walk the features. For each, ask the persona's voice (cited from the
persona block):

> *"When [persona] arrives wanting to [primary job], where do they
> expect to find [feature X]? Use their words — would they say
> 'analytics', 'reports', 'insights', 'dashboard'?"*

Build candidate parent categories. Each parent must be in the
persona's vocabulary, not the team's.

**Anti-pattern to refuse:** mirroring the team's org chart.
"Engineering / Design / Product" as top-level categories is for the
team; the persona doesn't care.

### Step 3 — Test against journey paths

For each `journey_map` step, simulate the navigation:

| Step | Persona's intent | Where IA puts the answer | Hops from home |
|---|---|---|---|

Three hops is the gentle limit. More than three means the IA is
hiding the answer. **Ask the user about each > 3-hop path:**

> *"This takes 4 clicks. Is it OK because it's a deep-power-user task,
> or are we burying something the persona expects fast?"*

### Step 4 — MECE check on top-level categories

The top level must be MECE: every persona task fits exactly one
category. **If two categories could contain the same task, the IA
will leak users between them — fix.**

**Anti-pattern to refuse:** "More" or "Other" buckets at the top
level. That's an admission the IA isn't MECE. Force the user to
split or merge.

Target: **5–7 top-level items.** More than 7 is harder to scan; less
than 5 usually means a category is over-loaded.

### Step 5 — Page-per-node + content_page binding

Every leaf in the IA tree should have a `content_page` block (or be
scaffolded as one in the same update_block). Pages without IA homes
are orphans; IA leaves without pages are vapour.

**Ask the user:**

> *"Walk the leaves. Which already have a `content_page` block? Which
> need one scaffolded? Which are 'we'll build this later' — flag those
> as `planned` so we don't ship the IA pretending they exist."*

**Canonical marker:** the `ia_tree` shape now supports a `(planned)` /
`(todo)` / `(deprecated)` suffix after a node label. The parser
strips it and stores it on the tree node as `status`. Example:

```markdown
- Settings (/settings) {section}
  - Profile (/settings/profile) {page}
  - Billing (planned) {page}
  - Audit log (todo) {page}
```

The `planned` / `todo` markers survive a parse round-trip, so
renderers can dim unbuilt leaves and audit tools can flag the gap.

### Step 6 — Validate by walking the journey end-to-end

Take the primary `journey_map`. Walk every step. At each step the
persona should be one click from the next correct destination. If
not, the IA fails the journey it was designed for.

> *"Walk Step 1 → Step 2 → Step 3. At each hop, the next destination
> is in the IA — yes / no? Where it's not, the IA hides the journey."*

## Refinement loop

After producing the IA, **ask the user:**

> *"Three checks:
> (a) Which top-level category am I keeping because the team likes the
> word, not because the persona uses it?
> (b) Which leaf is hidden 4+ clicks deep that the persona expected
> shallow?
> (c) Which category is empty or near-empty — is it a real concept or
> placeholder?"*

Iterate at least once. The "kept for the team's sake" question
surfaces the IA's hidden organisational politics.

## Quality bar (don't write the block until ALL pass)

- ✓ Top level is MECE, 5–7 items, in the persona's vocabulary.
- ✓ Every primary-journey step is reachable in ≤ 3 clicks from home.
- ✓ Every leaf either has a `content_page` block or is explicitly
  marked `planned`.

## What this produces in the graph

> **Required structured fields (top-level, not just body) — schema
> gatekeeper rejections cost a retry:**
> - `ia_tree`: `body` carries the nested bullet list (canonical tree
>   shape); `product_ref` is required.
> - `content_page`: `name`, plus required `feature_refs[]` (canonical
>   connection). Leaf labels like `Billing (planned)` round-trip
>   through the tree parser.

- **Write:** `update_block` / `create_block` on the `ia_tree` block + possibly
  several new `content_page` scaffolds for missing leaves.
- **Required refs:** `product_ref` (the product this IAs).
- **Recommended refs:** `personas_ref` on the IA (which personas it
  serves), `journey_pages_ref` on the journey_map (the pages the
  journey passes through).
- **value** structure (what the write carries):
  - `body`: the tree shape (nested bullet list with `(/route)` per
    node) + the primary/secondary job named at the top + journey
    walk-through notes
- **`reason` must cite:** the persona block, the journey_map block,
  every feature block placed in the tree, the product_overview block.
- **maturity:** `drafted` once the tree validates against the
  primary journey. `validated` requires real navigation data
  (analytics) showing users find their target in ≤ 3 clicks at the
  expected rate.

## The IA tree must NAME the pages, or the site map falls back (MANDATORY)

The book's "application, screen by screen" board arranges itself from
the best IA tree — but only when that tree's nodes carry the routes of
the actual `content_page` blocks (`(/route)` after each node). A tree
that describes navigation in prose without routes covers nothing, the
board falls back to grouping by route prefix, and on a project whose
routes share one prefix that fallback is a single unreadable column of
every screen (seen on Edge: 34 screens, one strip).

So when you write or update an `ia_tree`:

1. **Every node that is a screen carries its route** — `Kavelpagina
   (/kavel/:id)` — matching the `content_page` slugs exactly.
2. **Coverage is the bar**: the tree should name at least the screens
   that exist as content pages. The board picks the best tree by
   coverage (≥3 named and ≥¼ of the pages); below that it steps aside.
3. **Positions make it a flow map.** Add `position: {x, y}` per node
   in `value.tree` and the board obeys your layout — six lanes with
   coordinates beats any derived arrangement. This is how a journey
   reads as a journey instead of a taxonomy.
4. After writing the tree, open the project's content section in the
   book and check the board header: it names the tree it used. If it
   says "grouped by what their routes have in common", your tree
   didn't cover the pages — fix the routes, not the board.

## Anti-patterns to refuse

- An `ia_tree` whose nodes carry no `(/route)` markers — it cannot
  drive the site map, which is half its job.
- IA mirroring team org chart instead of persona language.
- "More" / "Other" / "Misc" buckets at the top level.
- Leaves with no `content_page` block AND no `planned` marker.
- Designing the IA without walking a journey through it.
- Skipping the team-language check in the refinement loop. Most IA
  drift starts there.
