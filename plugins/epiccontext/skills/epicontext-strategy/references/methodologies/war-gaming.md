# War Gaming — Guided Methodology

> **When the entity skill loads this:** before committing to a strategy
> that could be disrupted by competitor moves, market shifts,
> regulation, execution failure, customer response, or capital
> constraints. Also when the user asks "what could break this?",
> "what's our defensive plan?", "how do we know if we're losing?".
>
> **Dialogic.** The AI runs the war-game as a structured conversation
> with the user playing each adversary in turn. The output is a
> playbook bound to early-warning signals already in the graph
> (analytics, feedback, competitor blocks).

## Inputs the AI verifies first

1. **The strategy under test** — `product_strategy_canvas` or
   `business_case` at maturity ≥ drafted, with a *named bet* (not a
   vibe).
2. **At least one competitor block** — without rivals, three of the
   six scenario categories collapse. If none exists, **stop and ask**:
   *"To war-game competitor moves, we need at least one named rival.
   Want me to scaffold a stub competitor block first, or are we
   genuinely playing against no rivals (market-creation play)?"*
3. **KPIs that would move** — at least one `kpi` or `analytics_event`
   block. The war-game is useless if we can't say *what we'd watch*.

## The guided workflow

### Step 1 — Define the strategy precisely + the period

**Ask the user:**

> *"What's the bet, in one sentence, and what's the window of exposure?
> 'We bet on team-inbox over the next 9 months by leading with AI
> triage' is testable. 'Grow B2B' is not."*

Record verbatim. The war-game scenarios will attack THIS sentence.

### Step 2 — Identify scenario dimensions

Six categories must each have at least one scenario explored. If the
user can't generate one for a category, push:

| Category | Question to surface a scenario |
|---|---|
| **Competitor** | Which rival could copy the wedge in < 6 months? What's their incentive? |
| **Customer** | What changes the persona's behaviour — pricing pressure, alternative tool, switching cost? |
| **Market** | What macro shift could halve / double demand? |
| **Regulatory** | What rule change in our jurisdiction would force a rebuild? |
| **Operational** | What single point of failure (team, infra, key partner) breaks the plan? |
| **Financial** | What runway / margin / pricing model collapse trigger could force a pivot? |

For each category, **ask the user:**

> *"Play [the competitor / a regulator / your worst customer day]. What
> would you do to hurt us? Be specific."*

### Step 3 — Build three scenario tiers per category

For each scenario surfaced, force the user into three intensities:

- **Base** — the most likely version of this scenario.
- **Adverse** — the painful but plausible version.
- **Aggressive** — the rare-but-existential version. (The one the AI
  is most tempted to dismiss; don't.)

**Anti-pattern to refuse:** dismissing the aggressive scenario as
"won't happen." Force: *"What probability would you assign? If it's
above 5%, we war-game it. If 5% would still kill the company, we
war-game it regardless of probability."*

### Step 4 — Assess impact on economics + strategic logic

For each scenario, fill a row in the **Scenarios table**:

| Scenario | Trigger event | Impact on OGSM goal | Likelihood | Severity (if hit) |
|---|---|---|---|---|

Impact must cite the specific `ogsm` goal it threatens. If a scenario
doesn't threaten any current OGSM goal, **flag it**: *"This scenario
hits a metric we're not tracking. Either it doesn't matter, or our
OGSM is missing the right goal — which is it?"*

### Step 5 — Identify early-warning signals

The most actionable part. For each high-severity or high-likelihood
scenario, **ask the user:**

> *"What's the EARLIEST observable signal this is happening? Not the
> aftermath — the leading indicator. Should already be visible in
> our analytics, support tickets, sales calls, or in the competitor's
> public moves."*

Build a **Vulnerabilities table**:

| Weak point | Why it's a weak point | Mitigation owner | Mitigation action |
|---|---|---|---|

Then the **Response Playbook table** — the value of the war-game:

| Observable signal | Who watches it | Threshold to act | Pre-decided response |
|---|---|---|---|

**Quality criterion:** every signal must be measurable from data the
team can actually see. "We'll know when we see it" is a refusal-
worthy answer. Push: *"In which dashboard, in which channel, at what
threshold?"*

### Step 6 — Recommend defensive + offensive responses

Defensive: what we do when a signal hits.
Offensive: what we do PRE-EMPTIVELY because the war-game showed a
vulnerability.

**Ask the user:**

> *"Which response is worth doing NOW, before the signal hits, because
> we're a sitting duck if we wait? And which response is fine to keep
> as a pre-planned trigger?"*

Pre-emptive moves go into the roadmap. Triggered responses go into
the response playbook.

### Step 7 — Bind every signal to an existing or new KPI block

> **This step is the war-game's main payoff.** Without it the
> playbook never fires in practice — signals sit in the ADR body and
> no instrumentation actually watches for them. Agent 2 caught the
> earlier version of this methodology treating KPI binding as a side
> effect; promoted to a numbered step.

For every early-warning signal from Step 5, **ask the user:**

> *"Which existing `kpi` or `analytics_event` block carries this
> signal? Pull its key. If no existing block measures it, we scaffold
> a new one in this same update_block."*

Build the binding table:

| Signal | Existing KPI block (key) | Threshold | If new: what we'd add |
|---|---|---|---|

Then write (each with a `reason`):
- An `update_block` on each existing KPI block to add the threshold + the
  ADR reference (cite the war-game ADR's block_key in the KPI body).
- A `create_block` for any new KPI / analytics_event blocks needed. Each
  cites the war-game ADR as its `decision_ref` and the affected
  feature(s) as `features_ref`.

**Hand off to `kpi-architecture.md`** under
`epicontext-performance/references/methodologies/` for any new KPI
that needs the full driver-tree + owner + cadence treatment. Don't
inline-design KPIs here.

The deliverable from this step is the signal→KPI table, not prose —
the AI writes ≥1 KPI update or new KPI per early-warning signal
identified in Step 5.

## Refinement loop

After producing the playbook, **ask the user:**

> *"Three checks:
> (a) which scenario am I treating too lightly because it's
> uncomfortable to admit?
> (b) which signal is unmeasurable from where we actually look —
> meaning we'd never see it in time?
> (c) which response is theatre — sounds defensive but doesn't
> actually change what we'd do?"*

Iterate until at least one scenario gets harder, one signal gets
more observable, or one response gets cut.

## Quality bar (don't write to the graph until ALL pass)

- ✓ Each of the six categories has at least one scenario explored.
- ✓ Every early-warning signal is tied to a specific data source the
  team can actually see (dashboard, channel, repo, KPI block).
- ✓ At least one PRE-EMPTIVE action lands on the roadmap (not just
  reactive triggers).

If any fails, run the loop again or scope down.

## What this produces in the graph

- **Tools:** `update_block` / `create_block` — typically TWO blocks:
  1. A `decision` (ADR) recording the war-game: scenarios explored,
     vulnerabilities found, response playbook, pre-emptive actions.
  2. Updates to one or more `kpi` blocks to add the early-warning
     signals as tracked metrics (so the trigger fires automatically).
- **Optionally:** updates to `roadmap` if pre-emptive actions land,
  and `competitor` blocks enriched with the "Likely moves" from the
  exercise.
- **the write's `reason` must cite:** the strategy block, every competitor
  block, every OGSM goal impacted, every KPI block referenced.
- **maturity:** `drafted` (validation requires at least one signal
  to fire AND the playbook response to execute as planned).

## Anti-patterns to refuse

- Skipping the aggressive scenario tier because it's uncomfortable.
- Signals that aren't observable from the team's actual data sources.
- A playbook with no PRE-EMPTIVE actions — all defensive. Pre-emption
  is the war-game's main payoff; without it the exercise is theatre.
- Closing the war-game without updating the KPI blocks to track the
  early-warning signals. If the signals aren't tracked, the playbook
  never fires.
- Producing the playbook silently — the conversation is where
  inconvenient scenarios surface. Without the refinement loop, the AI
  hides them.
