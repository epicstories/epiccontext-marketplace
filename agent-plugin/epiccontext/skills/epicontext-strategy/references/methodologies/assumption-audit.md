# Assumption Audit — Guided Methodology

> **When the entity skill loads this:** before promoting `business_case` or
> `product_strategy_canvas` from `drafted` → `validated`, OR when the user
> asks "is this strategy actually sound?", "what could go wrong?", or
> any phrasing that signals high-stakes decision review.
>
> This is **dialogic**: the AI runs it WITH the user as a guided
> conversation, not as content production. McKinsey-style discipline
> applied to our graph: extract load-bearing assumptions, score them,
> convert weak ones into testable hypotheses, write the result to the
> graph with a `reason`.

## Inputs the AI verifies first (one-shot graph reads)

Before running the workflow, confirm via `get_briefing(task_type: "strategy")` that the
following exist. If missing, **stop and ask the user** before proceeding —
auditing assumptions on a non-existent strategy is theatre.

1. **The strategy under review** — a `product_strategy_canvas` or
   `business_case` block at maturity ≥ drafted.
2. **The personas it targets** — at least one `persona` referenced via
   `personas_ref` (or recoverable from the block body).
3. **The OGSM it serves** — `ogsm_ref` set, even if the OGSM itself is
   still drafted.

If any is missing, say to the user:

> *"Before I audit assumptions in [strategy], the graph is missing
> [persona / OGSM / business case]. Without it the audit can't trace
> whose pain the strategy depends on. Want me to scaffold a stub first,
> or skip this audit until that's in place?"*

## The guided workflow (six steps, each is a dialogue)

### Step 1 — Frame the decision the assumptions support

**Ask the user:**

> *"What's the decision this strategy is asking us to make? E.g. 'ship
> the team-inbox segment in Q3' or 'kill the consumer tier and double
> down on B2B.' One sentence."*

**Stop condition:** answer is a concrete commitment, not a vibe.
**If vague:** loop back: *"That's an aspiration. The decision is the
choice between doing X or not. Which option are we picking, and what
would we forgo?"*

Record the decision verbatim — it anchors every assumption you'll extract.

### Step 2 — Extract explicit + implicit assumptions

Walk the strategy block body + cited business_case + linked personas.
For every claim of the form "we believe X" or "we expect Y", surface
it. Crucially, also flag claims that are *implicit* — claims the
strategy is silent on but which must be true for the strategy to work.

**Ask the user after the first pass:**

> *"I extracted N explicit assumptions. I also see M implicit ones the
> strategy depends on but doesn't state. Want me to read those back so
> we can agree on which are load-bearing?"*

**Anti-pattern to refuse:** *"the market is big enough"* without naming
the size, segment, or evidence. Push: *"How big does it need to be for
this to work? What's the floor?"*

### Step 3 — Categorise (MECE)

Assign every assumption to exactly one of six categories:

| Category | What it covers |
|---|---|
| Market | TAM, growth, competitive structure, regulatory frame |
| Customer | Pain intensity, willingness to pay, alternative behaviour |
| Economic | Unit economics, CAC/LTV, gross margin, payback |
| Operational | Team capability, supply, infrastructure, latency |
| Competitive | Rival moves, defensibility, time-to-copy |
| Organisational | Founder capacity, hiring runway, board appetite |

**MECE check:** every assumption fits exactly one category. If an
assumption straddles two, **split it into two assumptions**. If a
category has zero assumptions, ask: *"We have no [competitive /
organisational / …] assumptions named. Is the strategy genuinely
independent of those, or have we just not stated them?"*

### Step 4 — Score importance × evidence

For each assumption, fill a 2×2:

- **Importance** (low / med / high) — if this assumption is wrong,
  does the strategy still work? *high = strategy fails.*
- **Evidence strength** (low / med / high) — what data, research,
  pilot, or precedent currently supports it?

**Ask the user for each high-importance + low-evidence assumption:**

> *"This is load-bearing — if it's wrong, [strategy] fails — and we have
> low evidence. Three options: (a) do we have data we haven't surfaced
> yet, (b) is there a cheap test we can run, or (c) should we treat
> this as a stop condition?"*

### Step 5 — Isolate the load-bearing few

Per the McKinsey 80/20 rule, the **top 3 load-bearing assumptions** are
the audit. List them plainly. If the user pushes back ("but there are
five"), respond: *"OK, but if we had to test only three before
committing, which three? The other two get watched, not tested."*

### Step 6 — Convert weak load-bearing assumptions into testable hypotheses

For each top-3 assumption with low evidence, produce a test plan in
this exact shape:

| Assumption | Hypothesis to test | Evidence we'd need | Test owner | If it fails, we will |
|---|---|---|---|---|

**Quality bar for each row:**
- "If it fails" must be a real action (kill / redesign / pause / pivot),
  not "we'll think about it."
- "Test owner" is a person, not "the team."
- "Evidence we'd need" is observable + measurable, not "more data."

## Refinement loop

After producing the audit, **ask the user:**

> *"This is my read. Before I write it to the graph: (a) which assumption
> did I miss, (b) which scoring is wrong, (c) which test plan is too
> vague to act on?"*

Iterate **at least once** even if the user says "looks good" — the
refinement loop catches the assumption the AI hid behind its own
language. Maximum 3 iterations; if not converged, write it anyway at
`drafted`, name the open disagreement in the `reason`, and let the
user adjudicate from the changes feed.

## Quality bar (don't claim drafted until ALL pass)

- ✓ Every load-bearing assumption has a test plan with named owner +
  observable evidence + "if it fails" action.
- ✓ At least one assumption is named that the strategy was silent on
  (implicit assumptions extracted, not just the explicit ones).
- ✓ The decision the strategy supports is recorded verbatim from the
  user, not paraphrased.

If any check fails, the block stays `drafted`. Only when all three
pass does it earn `validated`.

## What this produces in the graph

> **Required structured fields (top-level, not just in body) — schema
> gatekeeper will reject without these.** Always populate at the
> top level of the block's `value`, alongside `body`:
> - `decision` block: `date` (YYYY-MM-DD), `context`, `decision`,
>   `rationale`, `alternatives_considered`, `consequences`. The
>   markdown body is the rich version; these top-level fields are
>   the schema-required mirror.

- **Write:** `update_block` / `create_block` on a `decision` block — an ADR titled
  *"Assumption audit of [strategy] — [date]"*.
- **block_type:** `decision`
- **entity_class:** `decision`
- **body** structure:
  ```
  ### Status — accepted
  ### Context — strategy under review + decision it supports
  ### Decision — proceed / pause / test-first / redesign
  ### Rationale — top-3 load-bearing assumptions + scores
  ### Test plan — the table from Step 6
  ### Consequences — what we'll watch + when we re-audit
  ```
- **`reason` must cite:** the strategy block, every persona referenced,
  the OGSM, and any research/customer_insight that informed scoring.
- **maturity:** `drafted` (never `validated` from a single audit; that
  takes the actual test results landing back in the graph as research
  or feedback blocks).
- **Also write:** if the recommendation is "test first", a `research`
  block per high-priority test with the methodology + owner.

## Anti-patterns to refuse

- Producing the audit without the strategy/persona/OGSM inputs verified.
- Letting the user skip Step 4 (scoring) and jumping straight to a
  test plan — un-scored assumptions hide which are load-bearing.
- Listing > 5 load-bearing assumptions. If the user insists, force
  them to rank — "if we could only test three, which three?"
- A test plan whose "if it fails" action is "we will discuss" or
  "investigate further." Push back: *"What specifically changes?"*
- Producing the audit silently without the refinement loop. The
  point of dialogic methodology is that the dialogue surfaces the
  assumption the AI couldn't see alone.
