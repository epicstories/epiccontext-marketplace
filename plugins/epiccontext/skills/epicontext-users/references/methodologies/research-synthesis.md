# Research Synthesis — Guided Methodology

> **Trigger:** the user has just finished interviews, a survey, support-
> ticket review, or any batch of raw user input, and asks "now what?".
> Also when promoting a `research` block past `stub` AND when the
> user wants to extract insights into `customer_insight` / `jtbd` /
> `persona` updates.
>
> **Dialogic.** The AI co-synthesizes findings WITH the user. The
> output is a small number of named insights, each backed by ≥ 3
> independent signals, each landing in the right entity.

## Inputs the AI verifies first

1. **At least one `research` block** with raw material — transcripts,
   survey data, ticket dumps, NPS comments — in the `body` or
   referenced files. If just a vibe ("we did some interviews"), stop:
   *"Paste the actual signals. Synthesis without source material is
   confirmation bias."*
2. **The persona(s) it's about.** Without anchoring to a named
   persona, "users" becomes the dangerous abstraction.
3. **The strategy or feature it informs.** Research without a decision
   it serves drifts into "interesting." Force the user to name what
   the synthesis is FOR.

## The guided workflow

### Step 1 — Frame the question the synthesis serves

**Ask the user:**

> *"What decision is this synthesis going to inform? Be specific —
> 'we'd ship feature X', 'we'd kill segment Y', 'we'd reword
> messaging for persona Z'. If you can't name the decision, the
> synthesis is data hoarding."*

Record the decision verbatim. Every insight that doesn't speak to
the decision goes in a `parking_lot` section (we don't discard, but
we don't promote either).

### Step 2 — Extract signals (verbatim, not paraphrased)

Walk the raw material. For every passage, ask:

- What did they SAY (verbatim, in their words)?
- What did they DO (action / behaviour observed)?
- What did they NOT say (gaps that surprised us)?

Build a signals table:

| Signal | Source (block/interview/ticket id) | Verbatim or action | Persona |
|---|---|---|---|

**Anti-pattern to refuse:** paraphrasing into nice-sounding insights at
this step. Paraphrasing kills the texture that makes insights
trustable. Quote verbatim — and if there's no verbatim source,
**flag it**: *"We have no actual quote. Should we go back to the
recording or are we inventing?"*

### Step 3 — Affinity cluster (MECE)

Group signals by theme. Each signal lands in exactly ONE cluster.

> *"Read the signals out loud. Which ones are SAYING THE SAME THING in
> different words? Cluster them. Then label each cluster in 3–5 words
> using the persona's vocabulary, not ours."*

**MECE check:**
- Mutually exclusive: a signal in two clusters means the clusters
  aren't well-named — split or rename.
- Collectively exhaustive: clusters cover the bulk; leftover signals
  go in `parking_lot`.

Target: 3–6 clusters. If you end up with 12, you're describing
sub-patterns; merge to themes.

### Step 4 — Triangulation rule

For each cluster to become an insight, it needs **≥ 3 independent
signals**. Independence means:
- different source (different person / different ticket / different
  survey row), AND
- different time (not all in one interview wave), OR
- different elicitation method (interview + analytics + ticket).

**Ask the user about each cluster:**

> *"Do we have 3+ independent signals here? If 2 of 3 came from the
> same interview, that's still effectively one signal. If yes, this
> is an insight. If no, it's a hypothesis to test."*

Insights with < 3 signals stay as `hypothesis` — still useful, but
they write the changes with `maturity: stub`, not `drafted`.

### Step 5 — Name each insight in the persona's frame

Format: *"[Persona] reports that [observed pattern] because [their
stated reason or our inferred mechanism]. So what: [the decision
implication]."*

**Anti-pattern to refuse:** insights that are restatements of the
signals. *"Users want it faster"* is not an insight; *"Solo founders
abandon onboarding at the scaffold step because the value of 33
stub blocks isn't visible until they're filled — so we should show
one filled example before the scaffold"* is.

### Step 6 — Route each insight to the right entity

Per insight, decide what update_block(s) it produces:

| Insight type | Lands as | Entity |
|---|---|---|
| Behaviour pattern about a persona | update / new persona body | `persona` |
| A job they're trying to get done | new / update | `jtbd` |
| A journey friction point | update | `journey_map` |
| A specific finding-with-action | new | `customer_insight` |
| Feature implication | update | `feature` |
| Surprise that changes positioning | new | `decision` ADR |

The synthesis usually produces 2–5 block writes, not 20. Force focus.

## Refinement loop

After producing the insights, **ask the user:**

> *"Three checks:
> (a) Which insight am I most confident in but least cited — risk of
> bias?
> (b) Which surprise (something the data showed that I didn't
> expect) did I tone down because it was uncomfortable?
> (c) Which insight is really a hypothesis I'm dressing up as a
> finding?"*

Iterate. The "tone down the surprise" question is non-negotiable —
the most valuable insights are usually the ones the team didn't
want.

## Quality bar (don't write the block until ALL pass)

- ✓ Every insight cites ≥ 3 independent signals OR is labelled as
  `hypothesis`.
- ✓ The persona is named on every insight (not "users").
- ✓ Each insight ends with a "So what" — the decision implication.

## What this produces in the graph

> **Use the `customer_insight` block type, NOT `insight`.** The latter
> is for PostHog analytics charts (requires chart_type/chart_title);
> the former is the purpose-built research-finding entity. Routing
> findings into `insight` will fail validation.
>
> **Required structured fields (top-level, not just body):**
> - `customer_insight`: `signal` (in persona's frame), `so_what`
>   (decision implication), `confidence`
>   (hypothesis/low/medium/high). Plus `personas_ref` (required
>   canonical link).
> - `user_research` update: `body` carries the synthesis ladder
>   (raw → signals → clusters → insights). Top-level `title` if
>   creating a new research block.

- **Write:** several `update_block` / `create_block`s — usually one updated
  `user_research` block (the synthesis ladder up of raw → signals →
  clusters → insights) + 2–5 new `customer_insight` blocks +
  occasional updates to `persona` / `jtbd` / `journey_map`.
- **Required refs on each insight:** the persona, the source
  research block.
- **Recommended refs:** the feature / decision the insight informs.
- **`reason` must cite:** the research block by key, the verbatim
  quotes (in the body), each signal's source.
- **maturity:** insights with 3+ independent signals → `drafted`.
  Hypotheses → `stub` with a clear test plan.

## Anti-patterns to refuse

- Paraphrasing signals at Step 2 — kills texture.
- Insights without a "So what" — orphaned interestingness.
- Single-source insights claimed as findings.
- 20-insight syntheses. If everything is an insight, nothing is.
- Skipping the surprise-tone-down question. The discomfort IS the
  signal.
