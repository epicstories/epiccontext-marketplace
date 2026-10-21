# Strategic Options — Guided Methodology

> **When the entity skill loads this:** the user faces a strategic
> choice with multiple paths — "should we go enterprise or stay SMB?",
> "build, buy, or partner?", "now or later?", "this market or that
> market?". Also when promoting a `business_case` block and the
> "Alternatives Considered" section is empty or thin.
>
> **Dialogic by design.** The methodology forces the AI to facilitate
> a structured comparison, not produce a finished recommendation. The
> output the user remembers is the conversation that surfaced the
> trade-offs, not the matrix.

## Inputs the AI verifies first

1. **The decision under review** — must be specific enough to be
   wrong. "Grow faster" is not a decision; "enter the enterprise
   segment in Q3" is.
2. **The strategy it serves** — a `product_strategy_canvas` or `ogsm`
   block referenced (or scaffolded as a stub if missing).
3. **The personas at stake** — at least one `persona` block. If the
   user can't name them, **stop**: *"Which persona's behaviour does
   this decision change? If we can't name them, the options will be
   indistinguishable to us anyway."*

## The guided workflow

### Step 1 — Frame the decision sharply

**Ask the user:**

> *"Complete this sentence: 'By [date], we will either do X, Y, or Z.'
> The dates and the alternatives need to be specific enough that
> someone could disagree."*

**Stop conditions:**
- Specific decision verb (enter / kill / hold / pivot / launch).
- Specific timeframe (this quarter / by Q4 / before pilot ends).
- Specific bounded scope (which segment, which geography, which
  capability).

**If vague:** *"That sounds like an aspiration ('grow B2B'). The
decision is the choice between paths. Which paths are we choosing
between, by when?"*

### Step 2 — Generate meaningfully-different options

**Anti-pattern to refuse:** three options that are the same path
with different speeds. ("Go fast, go medium, go slow" is one option,
not three.)

**Quality criteria for each option:**
- A different **mechanism** (how value is created)
- A different **audience** (who pays / who uses)
- A different **resource shape** (what capabilities are needed)

**Ask the user:**

> *"Sketch each option in one line: '[Verb] [audience] via [mechanism],
> using [resource shape], by [date].' If two options share the same
> mechanism + audience, they're variants of one option, not separate
> options. We need genuinely different paths."*

Aim for **3 options**. If the user proposes more, force ranking: *"If
we could only seriously consider three, which three?"*

**Always include "do nothing" or "delay 6 months" as one of the
options** — without it, the comparison is rigged. Then explicitly
discuss the cost of inaction.

### Step 3 — Define decision criteria (no boilerplate)

Don't reach for the standard "feasibility / impact / risk" template.
Force criteria that are specific to THIS decision.

**Ask the user:**

> *"For this decision specifically, what would be true on the other
> side that tells us we chose right? Name 3–5 things, each measurable
> or observable. The criteria should be specific to this decision —
> 'high impact' is not specific; '£200k in pilot revenue by Q2' is."*

Categories the user may draw from but should NOT default to:

- Strategic fit (does it serve the OGSM Goals?)
- Speed to first revenue (or first signal)
- Defensibility (how copyable is the wedge?)
- Resource consumption (cash + people + founder time)
- Reversibility (if it fails, what does recovery cost?)

### Step 4 — Score each option × criterion

Build a matrix. Score each cell 1–5 with a **one-sentence rationale**
based on cited graph evidence — never just a number.

| Option | Strategic fit | Speed | Defensibility | Cost | Reversibility |
|---|---|---|---|---|---|

**Crucial rule:** every score cites a block.

> Example cell: "Speed: 4/5 — per `business_case/primary-business-case`
> the pilot is 8 weeks; per `research/yc-w24-cohort` similar B2B
> launches landed first revenue in 6–10 weeks."

If a cell has no cited evidence, **mark it as ?** and add a Step 6
test to validate before deciding.

### Step 5 — Explore hybrids + sequencing

After the matrix, **ask the user:**

> *"Can we sequence two of these — start with option A as a pilot, with
> a kill-or-double signal that triggers option B? Or is one path
> incompatible with the others (going enterprise now closes the SMB
> door)?"*

Document **either** the hybrid sequence (path + kill/double trigger)
**or** the exclusivity (why one option closes another's door).

### Step 6 — Recommend a path + name what would change our mind

The AI proposes the recommendation **answer-first**:

> *"Recommendation: pursue Option B (enter enterprise Q3 with the
> existing platform, no new product surface). The matrix shows it
> dominates on strategic fit + defensibility while being cheaper on
> cash than Option C. The trade-off: 6-month delay on SMB growth."*

Then **immediately** state the reversal condition:

> *"What would change our mind: if [observable evidence] shows up by
> [date]. Then we'd switch to [option A / hold]."*

## Refinement loop

After producing the recommendation, **ask the user:**

> *"Three checks before I write this to the graph:
> (a) which option did I weaken with bias — usually the one the user
> doesn't want?
> (b) which scoring cell has no evidence cited and should be tested
> first?
> (c) which criterion got too much weight because it's measurable,
> versus a softer one that actually matters more?"*

Minimum 1 iteration. If the user accepts on first reply, force the
question anyway — bias detection requires it.

## Quality bar (don't write the block until ALL pass)

- ✓ Every score in the matrix cites at least one block from the graph
  (no un-evidenced numbers).
- ✓ "Do nothing" / "delay" appears as an explicit option, scored.
- ✓ The recommendation includes a named, observable reversal condition.

If any fails, the work stays in conversation; nothing lands in the
graph yet.

## What this produces in the graph

> **Required structured fields (top-level, not just body) — schema
> gatekeeper will reject without these:**
> - `business_case`: `executive_summary`, `problem_statement`,
>   `confidence_level` (low/medium/high), `status`
>   (draft/review/approved/rejected). Populate alongside `body`.
> - `decision` (the meta-decision ADR): `date`, `context`, `decision`,
>   `rationale`, `alternatives_considered`.

- **Write:** `update_block` / `create_block` on a `business_case` block (create or
  update — usually update when the strategy already has one).
- **block_type:** `business_case`
- **value** structure (what the write carries):
  - `executive_summary`: the answer-first recommendation + reversal
    condition
  - `body`: includes the full options matrix with cited scores, the
    hybrid/exclusivity logic, and the named alternatives considered
- **`reason` must cite:** the strategy block, every persona block,
  every score-justifying block (research/customer_insight/competitor/
  feedback).
- **maturity:** `drafted` (validation requires the chosen path's first
  outcomes to land back as research/feedback).
- **Also write:** a `decision` ADR recording the *meta* decision of
  "we evaluated N options, chose X, on this date, by this method" so
  future readers see the audit trail not just the result.

## Anti-patterns to refuse

- Three options that are the same path with different intensity.
- A matrix with no cited evidence per cell.
- A recommendation without a named reversal condition. Refuse:
  *"What observable thing would change your mind? Without that, this
  is a preference, not a decision."*
- Hiding "do nothing" because it's awkward. Always include it.
- Skipping Step 5. Most real strategies are a sequenced hybrid, not
  a pure pick — naming the sequence is half the value.
- Producing the matrix without the refinement loop. Bias hides in
  the columns the AI scored without asking.
