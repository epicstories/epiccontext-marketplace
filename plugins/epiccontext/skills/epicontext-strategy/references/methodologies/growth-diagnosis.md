# Growth Diagnosis — Guided Methodology

> **When the entity skill loads this:** the user reports stalled or
> disappointing growth — "we're not growing", "revenue plateaued",
> "the team disagrees on the real problem", "what's broken?". Use
> for acquisition, conversion, activation, retention, expansion, or
> capacity diagnoses.
>
> **Dialogic.** The AI runs a structured root-cause conversation
> with the user. The output is the named binding constraint plus
> 1–2 tests to remove it — NOT a list of every weakness.

## Inputs the AI verifies first

1. **The growth target + current baseline** — what number did we
   expect, what's happening instead. If the user only has a feeling
   ("we feel slow"), stop and ask: *"What's the gap in numbers? Target
   vs actual, by date. Without a quantified gap we'll diagnose
   symptoms, not the constraint."*
2. **At least one `kpi` or `metric` block** — the diagnosis needs
   measurable evidence.
3. **The personas** — to know whose behaviour we're trying to change.

## The guided workflow

### Step 1 — Quantify the gap

**Ask the user:**

> *"Fill the blanks: 'We expected [X] by [date]; we have [Y]. The gap
> is [delta] [percentage].' Both numbers must come from the graph —
> a KPI block, analytics_event block, or feedback evidence."*

If the user can't fill it, the diagnosis is premature — go back to
KPI architecture first.

### Step 2 — Build a MECE growth driver tree (the AARRR funnel adapted)

For B2B / product-led growth, the tree is typically:

```
Growth = Acquisition × Activation × Retention × Revenue × Referral
                          (multiplicative — every stage compounds)
  Acquisition: New persona-fit visitors / week
    → Channel breakdown: organic, paid, partnerships, founder-led
  Activation: % visitors completing the key action
    → Sub-steps: signup → onboard → first key action completed
  Retention: % week-4 active
    → Cohorts: by persona, by channel, by feature usage
  Revenue: ARR added / month from existing customers
    → Expansion: upgrades, cross-sells
  Referral: WOM coefficient (referrals / customer)
```

**Adapt** to the user's business model — services-led, marketplaces,
freemium-vs-paid, B2C-vs-B2B all need different tree shapes. The user
tells you the shape; you don't impose one.

**MECE check:** every cause of growth-not-happening fits exactly one
branch. If a cause straddles ("our messaging is wrong" affects both
acquisition AND activation), split it: *"Messaging-too-vague-at-ad =
acquisition. Messaging-doesn't-convert-on-landing = activation."*

### Step 3 — Walk the tree with evidence

**For each branch, ask the user:**

> *"What's the current number for [branch]? What was it 90 days ago?
> 180 days ago? And what's the realistic ceiling — what would peers
> in [industry / channel] achieve?"*

Three columns per branch:

| Branch | Current | 90 days ago | Realistic ceiling | Gap to ceiling |
|---|---|---|---|---|

If a branch has no numbers ("we don't measure activation"), **flag
it loudly** — you can't diagnose what isn't measured. Either commit
to measuring it (Step 5 below makes this a update_block) or
acknowledge the diagnosis has a blind spot.

### Step 4 — Identify the binding constraint

The Theory of Constraints rule: **the system's growth equals the
weakest link's throughput.** Find the ONE branch where the
current-vs-ceiling gap is biggest AND where fixing it has the
largest multiplicative effect.

**Anti-pattern to refuse:** producing a list of 10 weaknesses. Push
the user:

> *"If you could only fix ONE branch this quarter, which one would
> move the gap the most? Show me the math: if [branch] went from
> [current] to [realistic ceiling], the total growth equation
> changes from [gap] to [new gap]. Now do that for the second
> candidate. Which compounds harder?"*

The binding constraint is the answer. Single. Named.

### Step 5 — Distinguish root cause from symptom

The binding constraint is WHERE growth breaks. But the **root cause**
is WHY it breaks. Don't stop at the symptom.

**Ask the user:**

> *"You named [activation rate] as the binding constraint. Why is
> activation low? Five whys: keep asking 'why' until you hit
> something you could actually change — a copy choice, a step in
> the flow, a missing feature, a misaligned persona target. The
> root cause is the thing where changing X changes Y."*

Capture the chain:
- Symptom: Activation rate 18%
- Why: Users abandon the scaffold step
- Why: They don't understand what gets created
- Why: The CTA says "Scaffold project" not "Create the 33 anchor blocks"
- **Root cause: Onboarding copy is jargon-heavy and the value is invisible**

The root cause is what we test against.

### Step 6 — Recommend 1–2 high-impact tests

For the root cause, propose **at most 2** tests. Per test:

| Test | Hypothesis | What we'd ship | Success threshold | Time-boxed by |
|---|---|---|---|---|

**Refuse to propose more than 2.** If the user wants 5, force a
ranking: *"Which two would you stop everything to ship this week?"*

## Refinement loop

After producing the diagnosis, **ask the user:**

> *"Three checks before we write this to the graph:
> (a) which branch did I skip because we don't measure it? Should we
> commit to measuring it?
> (b) did I confuse symptom with root cause anywhere? Push 'why' one
> more level on the binding constraint.
> (c) which proposed test is wishful — what's the failure mode I'm
> not naming?"*

Loop at least once. The bias-detection question forces the AI off
its first instinct.

## Quality bar (don't write to the graph until ALL pass)

- ✓ The gap is quantified (target, actual, delta) with cited evidence.
- ✓ The driver tree is MECE.
- ✓ Exactly ONE binding constraint named, with a sketched math of
  the multiplicative effect of fixing it.
- ✓ Root cause distinguished from symptom (≥ 3 levels of "why").
- ✓ At most 2 tests proposed; each has a numeric success threshold +
  time-box.

If any fails, the diagnosis stays in conversation.

## What this produces in the graph

> **Use the `customer_insight` block type, NOT `insight`** — the latter
> is for PostHog analytics charts. Required structured fields
> (top-level, not just body):
> - `customer_insight`: `signal` (in persona's frame), `so_what`
>   (decision implication), `confidence`
>   (hypothesis/low/medium/high). Plus required `personas_ref`.
> - `decision`: `date`, `context`, `decision`, `rationale`,
>   `alternatives_considered`.

- **Tools:** `update_block` / `create_block` — typically a `customer_insight`
  block recording the diagnosis (the chain from symptom to root
  cause) + a `decision` block recording the test plan.
- **value** for the insight:
  - `body`: the gap, the driver tree, the binding constraint, the
    why-chain to root cause
  - `chart_type`: typically `events_over_time` or `funnel`
  - `features_ref`: the feature(s) where the constraint lives
- **value** for the decision:
  - the test recommendations as the "Decision"
  - the success thresholds as the "What would change our mind"
- **the write's `reason` must cite:** the KPI/metric blocks providing evidence,
  the persona blocks affected, the feature blocks touching the
  binding constraint.
- **maturity:** `drafted` (validation requires the test to ship AND
  the outcome to land back as `research` or `feedback`).
- **Also consider:** updates to the relevant KPI blocks if the
  diagnosis revealed unmeasured branches — add those
  metrics so the next diagnosis has data.

## Anti-patterns to refuse

- Diagnosing without a quantified gap.
- Producing a list of "10 things to fix." Force the binding
  constraint.
- Stopping at symptom ("activation is low" without why-chain).
- Five tests instead of two. Force ranking.
- Skipping the un-measured branch flag — the diagnosis must name
  what we don't know.
- Recommending sweeping reorganisations ("change the team
  structure") when the binding constraint is a copy choice. Match
  the size of the fix to the size of the constraint.
- Producing the diagnosis without the refinement loop. The most
  comfortable diagnosis is rarely the right one.
