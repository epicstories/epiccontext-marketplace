# ADR Workshop — Guided Methodology

> **Trigger:** the user is about to make (or recently made) a
> non-trivial technical decision — framework, library, infrastructure,
> data shape, API contract. Also: when an existing `decision` block
> should move from `stub` → `drafted`, or when an ADR is being
> updated / superseded.
>
> **Dialogic.** The AI walks the user through a decision-memo
> conversation. Output: a `decision` (ADR) block in the answer-first
> shape — the same headings the scaffolded `decision` block's body
> already carries (read it with `get_block` first).

## Inputs the AI verifies first

1. **The `tech_stack` block.** Any technical decision sits inside the
   current stack — referencing it grounds the ADR. *Stop if missing:*
   "Without the tech_stack block, we'd ADR in a vacuum. Should we
   scaffold one first?"
2. **The relevant feature(s) / architecture block.** Decisions serve
   features and/or constrain architecture. Name which.
3. **Existing related ADRs.** Run `get_evidence_for(entity:
   "decision")` to find ADRs that might be superseded or referenced.

## The guided workflow

### Step 1 — Decision-required, answer-first

Skip Status, skip Context. Open with:

> *"Complete: 'I propose [verb] [scope] by [date]'. Specific enough that
> someone could disagree. Then immediately: 'I need [reader] to do
> [action]'."*

Example accepted:
> *"I propose adopting pgvector for the semantic compass, replacing
> ts_rank_cd ranking, by next sprint. I need Robert to apply the
> migration; the team to switch the embedding lookup; no other
> blockers."*

Rejected:
> *"We should consider AI for search."* — not specific.

This becomes the Decision (sentence 1) and Decision Required (line 2)
of the ADR.

### Step 2 — Context: why this is on the table NOW

**Ask the user:**

> *"What surfaced this decision? What's been tried? What's the cost of
> doing nothing? Three paragraphs max — the reader needs to know why
> we couldn't keep ignoring it."*

Force a specific trigger: a metric crossed a threshold, a customer
escalated, a deadline appeared, a piece of infrastructure broke. If
the answer is "we just thought it was time", **flag it**: "Decisions
without triggers tend to be optional. Is this actually decisional
right now, or could it wait?"

### Step 3 — Alternatives considered (MECE, ≥ 3 including "do nothing")

**Ask the user:**

> *"List 3 paths. Each must be meaningfully different — different
> mechanism, target, or resource shape. 'Do nothing' is always
> included. For each: what it would cost, what it would unlock, what
> would make us reconsider."*

**Anti-pattern to refuse:** three options where two are the same path
with different speeds. Force genuine difference.

| Alternative | What it would cost | What it would unlock | Why declined |
|---|---|---|---|

### Step 4 — Rationale: the trade-off we accept

The hard step. **Ask the user:**

> *"What are we GIVING UP to get what we want? Every honest decision
> has a trade-off named. If you can't name what we sacrifice, we
> haven't actually decided — we've just expressed a preference."*

Examples:
- *"We accept higher cold-start latency to get smarter ranking."*
- *"We accept locking into pgvector (vs portable alternatives) for
  60% lower query time."*

If the user says "no trade-off, this is all upside", **push**:
"That's the rationale failure mode. There's always a trade-off. What
about cost, complexity, lock-in, team learning curve, hiring pool?"

### Step 5 — Consequences (positive / negative / neutral, ≥ 1 each)

Force a balanced view:

- **Positive:** what does this enable that wasn't possible before?
- **Negative:** what does this make harder or impossible?
- **Neutral:** what changes shape but doesn't get better or worse?

The negative is the most-forgotten section. Hold it.

### Step 6 — Reversal condition + Next Steps

The two most ignored sections — and the ones that distinguish a
decision from a preference.

**Reversal condition:**

> *"If [observable evidence] shows up by [date], we will reconsider
> [and switch to alternative X]. The evidence must be measurable from
> data we actually see (dashboard, ticket, KPI), not 'a feeling'."*

**Next Steps:**

| Action | Owner (person) | Done by |
|---|---|---|

Every Next Step has a named-person owner and a date. "TBD owner" or
"the team" — refuse: "Who specifically? An action without an owner
doesn't ship."

## Refinement loop

After producing the ADR, **ask the user:**

> *"Three checks:
> (a) Which alternative did I scope down to make our chosen option
> look obviously better?
> (b) Which trade-off did I hide because it's awkward?
> (c) Which Next Step has 'TBD' or 'the team' as owner — who's the
> actual person?"*

Iterate. The "hide the trade-off" question is non-negotiable.

## Quality bar (don't write the block until ALL pass)

- ✓ Sentence 1 is the Decision, specific enough to disagree with.
- ✓ ≥ 3 alternatives including "do nothing", meaningfully different.
- ✓ Trade-off explicitly named in the rationale.
- ✓ Reversal condition observable + dated.
- ✓ Every Next Step has a named-person owner + a date.

## What this produces in the graph

> **Required structured fields (top-level, NOT just in body) — schema
> gatekeeper will reject without these:**
> - `decision`: `date` (YYYY-MM-DD), `context`, `decision`, `rationale`,
>   `alternatives_considered`, `consequences`. The markdown body
>   follows the answer-first scaffold shape (Decision-first), but the
>   schema needs these as discrete fields too.
> - `status` (the decision's own lifecycle field): "accepted" once the
>   decision is taken (default "proposed").

- **Tool:** `update_block` / `create_block` on a `decision` block (create).
- **Required refs:** `tech_stack_ref` (the stack this concerns).
- **Recommended refs:** linked feature(s), affected architecture
  blocks, prior ADRs being superseded (`superseded_by_ref`).
- **value** structure (what the write carries): matches the answer-first
  scaffold body of a `decision` block — Decision →
  Decision Required → Status → Context → Alternatives → Rationale →
  Consequences → Reversal condition → Next Steps + owner → Links.
- **the write's `reason` must cite:** the tech_stack block, the related feature
  / architecture blocks, any prior ADRs.
- **maturity:** `drafted` when all 5 quality bar checks pass.
  `validated` when status = accepted + a downstream block (feature
  / tech_stack / architecture) explicitly references this ADR.

## Anti-patterns to refuse

- ADRs that open with Status / Context instead of Decision.
- "We should consider…" non-decisions.
- Three alternatives that are the same path at different speeds.
- Trade-offs hidden behind upside language.
- Reversal conditions that aren't observable.
- Next Steps with no named-person owner.
- Skipping the refinement loop. Inconvenient trade-offs only surface
  when the user is forced to look at them.
