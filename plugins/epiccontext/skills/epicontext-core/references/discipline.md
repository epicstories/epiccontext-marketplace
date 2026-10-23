# The Discipline Contract

> Every skill in EpicContext operates under the same six discipline norms.
> These are the McKinsey-style consulting principles, adapted to our
> graph-shaped work. If the work you're about to land in the graph
> doesn't pass these six, hold the update_block and iterate.

The norms exist because the graph schema is the **floor**, not the
ceiling. The schema gatekeeper stops nonsense from landing. The
discipline below is what makes the work worth landing.

## The six norms

### 1. MECE — Mutually Exclusive, Collectively Exhaustive

Whenever you categorise (alternatives, options, KPIs, risks,
personas, growth-funnel branches, scenario categories), apply MECE.

- **Mutually exclusive:** each item fits exactly one category. If an
  item could sit in two, split it into two items.
- **Collectively exhaustive:** if a category has zero items, ask
  yourself out loud: *"Is this category genuinely empty, or have we
  just not surfaced anything there?"* — then answer in your reply.

State the MECE check in your output. Example: *"Categorised across
[A / B / C / D]; nothing fits two; [B] currently empty because [reason]."*

### 2. Answer-first

Every reply, summary, recommendation, ADR, or graph write opens
with the conclusion. Evidence and trade-offs follow.

- **Sentence 1** is the recommendation, the verdict, or the proposed
  decision. Specific enough to disagree with.
- **Everything after** is the supporting evidence, the trade-offs,
  the alternatives considered, the reversal condition.

Never make the reader wait for the answer. If you don't have one yet,
say so first: *"I can't recommend yet because [the gap]. Here's what
we'd need to close it."*

### 3. Evidence-aware

Every claim cites the block that supports it, or names the gap.

- **Cited:** *"Per `research/rescuetime-2025`, 89% of email checks are
  non-actionable."*
- **Gap-named:** *"The graph holds no validated evidence for this; I
  recommend a research block first."*

No claims from training without citation. No numbers without source.
If a scoring cell, a comparison, or a recommendation rests on un-cited
evidence, mark it as `?` and queue a test rather than papering over it.

### 4. Assumption-conscious

Before recommending, name the load-bearing assumptions.

- **Explicit assumptions** are things the strategy / decision / plan
  STATES as a belief. Surface them.
- **Implicit assumptions** are things the work depends on but doesn't
  state. These are the dangerous ones. Surface them too.

For high-stakes work, load `epicontext-strategy/references/methodologies/assumption-audit.md` and
run the full workflow. For everything else, end your recommendation
with: *"This assumes [X], [Y], [Z]. If any is wrong, the
recommendation flips to [W]."*

### 5. Executive-readable

Output should be scannable in 60 seconds and decision-useful in 5
minutes.

- **One-sentence headline** in sentence 1.
- **Tables when comparing**, prose when arguing.
- **No jargon without definition** — if the domain has a term, define
  it on first use OR link the `glossary` block.
- **No filler** ("It is worth noting that…", "In this context, it is
  important to…"). Cut it.

Quality bar: would a busy founder skim this and know what to do? If
not, rewrite the headline.

### 6. Specific enough to act on

A recommendation, a decision, a strategy, a goal — none of these
exist as words until they're specific enough that someone could
disagree.

- **Verb + audience + mechanism + timeframe.** Not "grow B2B" but
  "enter team-inbox segment in Q3 via the existing AI-triage feature,
  validated by 200 qualified pilots by end of September."
- **Numbers, dates, names.** Not "soon" but "by Q3 close." Not "the
  team" but "Robert and Marcus." Not "high impact" but "moves
  activation from 18% → 30%."
- **Reversal condition.** What observable thing would change the
  decision? Without this, it's a preference, not a commitment.

If the work isn't specific enough to disagree with, it's not yet
specific enough to land in the graph as `drafted`.

## How the discipline shows up in skills

| Norm | Where it bites in the skill flow |
|---|---|
| MECE | Every classification / category list / driver tree |
| Answer-first | Every summary, recommendation, ADR opening |
| Evidence-aware | Every score, claim, comparison cell in a update_block rationale |
| Assumption-conscious | Promoting a block past `drafted`; high-stakes decisions |
| Executive-readable | Every reply to the user; every block body |
| Specific-enough | Every entity at maturity ≥ `drafted` |

## How it interacts with the maturity contract

| Maturity | Discipline level |
|---|---|
| `stub` | Scaffold body, no discipline applied yet — placeholder content |
| `drafted` | All 6 norms applied to the content; quality bar from the relevant methodology met |
| `validated` | Drafted + proven by ≥ 2 supporting blocks (research, decisions, production use) and an actual outcome cited |

Discipline is the gate from stub → drafted. Evidence accumulation is
the gate from drafted → validated. Skipping discipline to "ship
faster" produces blocks that look drafted but rot into stubs the
next time someone reads them.

## When to refuse silently vs flag the gap

- **Refuse silently** when the user asks for something that would
  violate the schema gatekeeper (missing required ref, invalid
  field). Suggest the fix instead.
- **Flag the gap** when the user asks for a recommendation but
  the graph holds no evidence. Say so: *"The graph holds no
  validated evidence for [claim]. I can scaffold a research block
  to close the gap, or proceed with the assumption labelled as
  unverified — your call."*

Never invent evidence from training to fill the gap. The whole
point of the discipline is that the graph is the source of truth;
trained text is not.
