# Positioning Workshop — Guided Methodology

> **Trigger:** the user wants to define or refresh brand positioning, or
> is promoting `brand_positioning` past `stub`. Also: when messaging
> feels generic, the strategy keeps shifting framing, or a competitor
> just moved.
>
> **Dialogic.** The AI facilitates a 6-step positioning conversation
> with the user. Output: a `brand_positioning` block with cited
> evidence per axis and a named "frame of reference" the AI couldn't
> have invented alone.

## Inputs the AI verifies first

1. **At least one persona** at maturity ≥ drafted. Without it,
   positioning is theatre. *Stop and ask:* "Who is this for? If we
   don't have a primary persona, let's scaffold one first."
2. **At least one competitor** block (drafted is fine). Positioning
   without alternatives names what's it different from? Without them
   we end up in self-referential ad copy.
3. **Existing `vision` block.** Positioning expresses vision; ungrounded
   positioning drifts.

## The guided workflow

### Step 1 — Frame of reference

**Ask the user:**

> *"When the persona is choosing what to buy, what category does their
> mind drop you into? Be honest — if they think you're 'just another
> notes app', that's the frame. If they bracket you with consulting
> firms, that's a different frame."*

**Stop condition:** named category + 2–4 named alternatives the
persona actually considers (not aspirational ones).

**Critical:** name each alternative with **specificity that survives
time** — product + URL + version/date. *"Superhuman (superhuman.com,
Aug 2026 build)"*, not just *"Superhuman"*. Alternative claims change
every quarter ("AI is generic" was true for Superhuman in early 2025,
not anymore). Without version-stamping the frame goes stale silently
and the positioning misfires the moment the comparable updates.

**If vague:** *"Pull a recent customer conversation or sales call. Which
products came up by name, with which date? Those are the alternatives,
version-stamped."*

### Step 2 — Target persona narrow-down

The persona block is broad; positioning needs a sharper target.

> *"Of the persona's situations / contexts / moments, which is the one
> where they MOST need us? Not all of them — the moment where the
> persona absolutely cannot tolerate the alternatives' shortcomings."*

Quote the persona's verbatim words from research blocks (cited). If
quoted words aren't available, **flag the gap**: *"We don't have a
verbatim quote here. Should we do a 30-minute persona-validating
interview before we commit?"*

### Step 3 — Differentiation axes (3 max, MECE)

**Ask the user:**

> *"Name 2–3 axes where you genuinely differ from the alternatives.
> Each axis is a dimension where the persona could place all your
> competitors AND you on a spectrum, and you'd sit somewhere obviously
> different."*

**MECE check:** each axis should describe a different DIMENSION of value
(speed vs depth, focus vs breadth, expert vs accessible). Two axes
describing the same thing in different words is one axis.

**Anti-pattern to refuse:** "we're more X" without naming the
spectrum. "Better UX" is not an axis; "designed for solo founders vs
enterprise teams" is.

### Step 4 — Proof points per axis (cited)

For each axis, force at least one cited proof point:

| Axis | Proof point | Source block (cited) |
|---|---|---|

Acceptable proof types:
- A specific feature block that demonstrates the axis
- A customer_insight or feedback block where someone described the
  difference in their own words
- A competitor block whose body explicitly names a gap we fill
- A research finding (with cited study)

If a proof point has no source block, mark it `?` and write the
evidence block (research, insight, competitor) first.

### Step 5 — Positioning statement (one sentence)

The output is one sentence the persona could repeat back, in the form:

> *"For [persona/situation], [brand] is the [category] that [unique
> mechanism], unlike [alternative] which [limit]."*

**Ask the user, reading it back:**

> *"Would the persona say this in their own words? If they wouldn't, the
> language is from us, not them. Rewrite in their voice."*

The sentence must be SPECIFIC enough to disagree with. *"Be the
trusted choice"* is not. *"For solo product designers facing AI-
context drift, EpicContext is the schema-validated graph that lets
every AI client share the same project context, unlike notes apps
which let context drift silently."* is.

### Step 6 — Anti-positioning (2+ filters)

**Ask the user:**

> *"What are we EXPLICITLY NOT? Name 2 things customers might confuse
> us with, and the filter that kicks each one out. Without this, the
> positioning is a wish; with it, it's a commitment."*

Examples:
- *"We are NOT a note-taking app. If you want to bullet-list your
  meeting notes, that's Notion."*
- *"We are NOT a Notion-for-teams. We're product-context, not
  knowledge-management."*

## Refinement loop

After producing the statement, **ask the user:**

> *"Three checks:
> (a) Which axis am I weakest on — where would the persona say
> 'they're not actually different there'?
> (b) Which alternative did I treat unfairly to make us look better?
> (c) If I had to drop one axis, which would I drop?"*

Iterate at least once. Rejecting one axis is a strong signal the
positioning is honest.

## Quality bar (don't write the block until ALL pass)

- ✓ Positioning statement fits the *"For X, brand is the Y that Z,
  unlike A which B"* shape, with named X / Y / Z / A / B.
- ✓ Every axis has at least one cited proof point.
- ✓ Anti-positioning names ≥ 2 specific exclusions, not generic ones.

## What this produces in the graph

> **Required structured fields (top-level, not just body) — schema
> gatekeeper rejections cost a retry:**
> - `brand_positioning`: `brand_name`, `why_purpose`, `how_approach`,
>   `what_offering`. Plus required canonical `vision_ref`.
> - The positioning statement, axes, proof points, and anti-positioning
>   live in `body`; the structured fields above are the schema-required
>   mirror for rapid lookup.

- **Write:** `update_block` / `create_block` on a `brand_positioning` block.
- **Required refs:** `vision_ref` (the vision this expresses).
- **Recommended refs:** `personas_ref` (the targeted persona),
  links to the competitor blocks named in the frame of reference.
- **value** structure (what the write carries):
  - `body`: frame of reference + target persona narrow-down + axes
    table + positioning statement + anti-positioning + cited proof
    points
- **`reason` must cite:** the persona block (verbatim quotes if
  available), competitor blocks, vision, and any research that
  validated the axes.
- **maturity:** `drafted` (validation requires the positioning to
  show up in actual sales/marketing language and land — a
  customer_insight or feedback block confirming).

## Anti-patterns to refuse

- Positioning without a named persona narrow-down.
- Axes that aren't dimensions (just "we're better at X").
- Proof points without cited source blocks.
- Anti-positioning that's vague ("we're not for everyone").
- Skipping the refinement loop. Honest positioning surfaces when the
  user is forced to name what they'd drop.
