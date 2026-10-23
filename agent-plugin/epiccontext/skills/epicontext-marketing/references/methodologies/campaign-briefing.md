# Campaign Briefing — Guided Methodology

> **Trigger:** the user is starting a new marketing campaign or
> promoting a `campaign` block past `stub`. Also when the user says
> "we should run a campaign on X" — before any content is created.
>
> **Dialogic.** The AI runs a structured briefing conversation with
> the user. Output: a `campaign` block grounded in OGSM + persona +
> messaging, with KPIs and a hypothesis the team will actually test.

## Inputs the AI verifies first

1. **The `marketing_strategy` block.** A campaign without a strategy
   is opportunism. *Stop:* "What strategy does this campaign serve? If
   we don't have a marketing_strategy block, let's scaffold one
   first."
2. **The `ogsm` block.** Every campaign moves an OGSM Goal — name
   which.
3. **At least one persona + the messaging_framework.** A campaign
   without a target persona is shouting; without messaging it
   invents positioning on the fly.

## The guided workflow

### Step 1 — Anchor: which OGSM Goal does this move?

**Ask the user:**

> *"Which OGSM Goal does this campaign serve? Read it back verbatim.
> If the answer is 'general awareness' or 'pipeline', push: which
> SPECIFIC number does this campaign move?"*

**Stop condition:** named OGSM Goal + the numeric outcome the
campaign contributes to (signups / qualified leads / MRR
incremental / pipeline value).

If no OGSM Goal fits, **refuse**: "If no OGSM Goal moves, why are we
running this? Either name the goal or kick this back to strategy."

### Step 2 — Target persona narrow-down

The campaign isn't for "everyone in our ICP" — narrow to ONE primary
persona + at most one secondary.

**Ask the user:**

> *"Which persona's behaviour does this campaign change? Pick one.
> Not 'product teams' — say 'Marcus, the solo founder using Claude
> Code daily'."*

Anchor to the persona block by key. If verbatim quotes exist in the
persona body, the campaign hook MUST come from those words.

### Step 3 — Hook + key message from messaging_framework

The hook is the line that earns attention. The key message is the
single takeaway.

**Ask the user — and refuse to invent:**

> *"Open the `messaging_framework` block. Which value prop or proof
> point are we leading with? The hook is a sharper restatement, in
> the persona's voice, of one of the value props. NOT a new claim
> invented for the campaign."*

If the messaging framework doesn't have the right value prop, the
campaign briefing isn't the place to invent one — write the change to
the messaging_framework instead, then continue here.

### Step 4 — Channels (≤ 4, each backed by a channel block)

**Ask the user:**

> *"Pick 2–4 channels we lead with. Each must have its own `channel`
> block already in the graph, with a named persona it reaches. If a
> channel block doesn't exist, scaffold it in the same update_block
> — a campaign on an unscaffolded channel is fiction."*

For each channel, force:
- Why this channel for this persona (cite the channel block's
  `personas_ref`)
- Cadence + owner from the channel block
- What format suits the channel

**Anti-pattern to refuse:** "we'll be on all channels". Force focus.

### Step 5 — Hypothesis + KPIs

The campaign is a bet. State it as a hypothesis:

> *"We believe [target persona] will [action] when shown [hook +
> proof] on [channels], producing [numeric outcome] by [date].
> Confidence: low / med / high — and why."*

KPIs:

| Metric | Source (cited KPI block) | Threshold |
|---|---|---|

Each KPI references an existing `kpi` block. If a needed KPI doesn't
exist, scaffold it in the same update_block (and link the
`epicontext-performance/references/methodologies/kpi-architecture.md` methodology).

### Step 6 — Budget + wrap-up plan

The two least-fun sections. Hold them.

**Ask the user:**

> *"What's the budget (time + money + opportunity cost — what we're
> NOT doing while running this)? And what's the wrap-up cadence —
> when do we look at the KPIs and decide kill / double / hold?"*

Wrap-up cadence must be specific (weekly Thursday review / mid-
campaign at week 4 / post-campaign within 7 days of end_date).

## Refinement loop

After producing the brief, **ask the user:**

> *"Three checks:
> (a) Which channel did I pick because we're already on it, not
> because it reaches the persona?
> (b) Which hook is invented rather than sourced from
> messaging_framework?
> (c) Which KPI sounds measurable but isn't — what dashboard
> actually shows it?"*

Iterate at least once. The "already on it" question surfaces lazy
channel selection.

## Quality bar (don't write the block until ALL pass)

- ✓ Named OGSM Goal + numeric outcome contributed.
- ✓ Single primary persona + at most one secondary, cited.
- ✓ Hook + key message sourced from `messaging_framework`, not invented.
- ✓ Each channel has its own `channel` block (existing or scaffolded
  in the same pass) with `personas_ref` populated.
- ✓ Hypothesis stated explicitly + confidence labelled honestly.
- ✓ Wrap-up cadence with a specific date.

## What this produces in the graph

> **Required structured fields (top-level, not just body) — schema
> gatekeeper rejections cost a retry round-trip if missing:**
> - `campaign`: `name`, `goal` (the outcome, not activity), `status`
>   (planned/in_flight/live/wrapped/archived; default "planned"),
>   plus optional `start_date`, `end_date`, `budget`, `hypothesis`.
> - `channel`: `name`, `channel_type` (organic_social / paid_social /
>   paid_search / seo / email / newsletter / podcast / event /
>   partnership / pr / outbound / other), plus
>   recommended `owner`, `cadence`, `cost_model`, `notes`.
> - `content_piece`: `title`, `format` (blog / landing / video / etc).
> - `kpi`: `metric_name`, `features_ref`. See
>   `epicontext-performance/references/methodologies/kpi-architecture.md` if
>   scaffolding a new KPI.

- **Write:** `update_block` / `create_block` on a `campaign` block (create or
  update from stub) + occasional scaffolds for missing
  `channel` / `kpi` blocks.
- **Required refs:** `strategy_ref` (the marketing_strategy this
  serves), `channels_ref` (channels the campaign runs on).
- **Recommended refs:** `content_refs` (content_piece blocks
  produced for this campaign), `kpis_ref` (KPIs moved), `personas_ref`.
- **value** structure (what the write carries):
  - `name`, `goal` (outcome), `start_date`, `end_date`, `status`
  - `hypothesis` (what we believe + confidence)
  - `body`: OGSM anchor + persona narrow-down + hook + key message
    (cited from messaging) + channel rationale (cited from channel
    blocks) + KPI table (cited from kpi blocks) + budget + wrap-up
    cadence
- **`reason` must cite:** the OGSM block, the persona, the
  messaging_framework, every channel block named, every KPI block
  named.
- **maturity:** `drafted` when all 6 quality bar checks pass.
  `validated` when the campaign WRAPS with the actual outcome cited
  back against the hypothesis (whether it hit or missed).

## Anti-patterns to refuse

- Campaigns without a named OGSM Goal.
- "Awareness" as an outcome — name the number.
- Hook invented for the campaign instead of sourced from messaging.
- Channels picked because "we're already there" instead of "they
  reach this persona".
- KPI tables citing no actual kpi blocks.
- Campaigns with no wrap-up cadence — they never get reviewed and
  die as ghosts.
- Skipping the refinement loop. Lazy channel + invented hook hide
  there.
