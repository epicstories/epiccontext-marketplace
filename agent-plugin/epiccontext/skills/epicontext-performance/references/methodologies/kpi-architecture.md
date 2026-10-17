# KPI Architecture — Guided Methodology

> **When the entity skill loads this:** the user is designing or
> auditing the KPI system — "what should we measure?", "our metrics
> are noisy / backward / disconnected", "what's vanity vs real?", or
> promoting a `kpi` or `north_star` block past `stub`.
>
> **Dialogic.** The AI runs a structured KPI design conversation with
> the user. Result: a small, decision-linked KPI system bound to
> owners and a review cadence — not a dashboard of everything.

## Inputs the AI verifies first

1. **The OGSM** — `ogsm` block ≥ drafted with at least one Goal. Without
   it there's no anchor for "what decision does this metric serve?"
2. **At least one feature** — `feature` block (KPIs measure feature
   impact). If none exists, **stop**: *"To architect KPIs, we need at
   least one feature to measure. Want me to scaffold a primary-feature
   stub first?"*
3. **The personas** — `persona` blocks. A KPI without a persona is
   vanity ("monthly active users" of whom?).

## The guided workflow (six steps)

### Step 1 — Anchor every KPI to a decision

**Ask the user:**

> *"For each KPI we'll design, tell me the decision it informs. If you
> can't name the decision — 'we'd raise prices', 'we'd kill the
> feature', 'we'd double down on this segment' — then the metric is
> vanity and we'll cut it."*

This is the hardest gate. Hold it. Reject any KPI that doesn't
ladder to a named decision.

**Example acceptable answers:**
- "Activation rate" informs *whether the onboarding flow needs a
  rebuild* at < 30%.
- "NPS by persona" informs *which persona to focus next quarter*.

**Example rejections:**
- "MAU" — what decision? "We'd track growth." That's not a decision.
- "Page views" — when would the number change what we do?

### Step 2 — Build the value driver tree (MECE)

A KPI system is a TREE, not a list. Start at the top:

> **North star** — the outcome the company exists to maximise (e.g.
> *"projects whose graph reflects a healthy product after 30 days"*).

Then break it into drivers — each driver is something the team can
influence:

```
North star = New healthy projects
  → Acquisition driver: signups / week
    → Channel breakdown: organic / paid / referral
  → Activation driver: % signups completing scaffold + first block write
  → Retention driver: % active in week-4
```

**MECE check:** drivers are exhaustive (every cause of the north star
moving is captured) AND mutually exclusive (a single cause shows up
in only one driver). If a metric belongs in two drivers, the tree
is wrong — refactor.

**Ask the user at each level:**

> *"Did we miss a driver? If [outcome] doubled tomorrow, what's the
> ONE most likely cause? Is it captured in the tree?"*

### Step 3 — Classify every metric: outcome / driver / activity

For each metric in the tree, tag it:

| Type | Meaning | Frequency to act on |
|---|---|---|
| **Outcome (lagging)** | Result the business cares about (revenue, retention, NPS) | Monthly / quarterly |
| **Driver (leading)** | Behaviour that moves outcomes (activation rate, time-to-value) | Weekly |
| **Activity** | What we DO (posts published, features shipped) | Daily — never report this up |

**Anti-pattern to refuse:** reporting activity metrics as KPIs.
*"Number of blog posts published"* is activity, not a KPI. Either
upgrade to a driver ("signups from blog content / week") or drop it
from the executive view.

### Step 4 — Cull vanity metrics

**Ask the user about every metric in the proposed system:**

> *"If this metric went up 30%, would we change what we do? If it
> went down 30%, would we change what we do? If both answers are
> 'no', it's vanity. Cut it."*

Examples to cut:
- Total signups (vs *qualified* signups by ICP)
- Sessions per user (vs *time-to-key-action*)
- Followers, likes, impressions (vs *qualified inbound from the
  channel*)

Target: **fewer than 10 KPIs across the executive surface.** Each
driver tree level can have more locally, but executives see ≤ 10.

### Step 5 — Assign owners, thresholds, review cadence

For each surviving KPI, force the user to fill:

| KPI | Owner (person) | Lower threshold | Upper threshold | Reviewed |
|---|---|---|---|---|

- **Owner is a person, not "the team."** Without a named owner the
  metric drifts.
- **Thresholds** are the trigger to escalate / celebrate / act. If
  there's no threshold, the metric is just a number.
- **Reviewed** is a cadence (weekly Mon standup / monthly business
  review / quarterly board). If a KPI has no review cadence, **cut
  it**: nobody watches it.

### Step 6 — Design the dashboard + governance rhythm

**Ask the user:**

> *"What's the operating rhythm that turns these numbers into
> decisions? When do we look, who's in the room, and what's the
> decision menu — kill / invest / hold / escalate?"*

The output is a 1-page "rhythm" doc: what gets reviewed weekly /
monthly / quarterly, who attends, what decisions each meeting is
empowered to make. Without this, the KPI system is reports nobody
reads.

## Refinement loop

After producing the architecture, **ask the user:**

> *"Four checks before we write this to the graph:
> (a) which KPI did I keep that has no real decision attached?
> (b) which driver tree level is missing a branch — what cause of
> [north star] moving is not in the tree?
> (c) which owner is "the team" or empty? Who's the actual person?
> (d) which threshold did I leave blank or vague ('looks healthy')?"*

Iterate until at least one KPI is cut AND at least one owner gains a
name AND at least one threshold becomes a number.

## Quality bar (don't write the block until ALL pass)

- ✓ Every KPI is anchored to a named decision.
- ✓ The driver tree is MECE — every metric belongs to exactly one
  level, no causes of the north star are missing.
- ✓ Every KPI has a named-person owner and numeric thresholds.
- ✓ Executive surface has ≤ 10 KPIs total.
- ✓ A governance rhythm (review cadence + decision menu) exists.

If any fails, the architecture stays in conversation; the graph
doesn't get updated yet.

## What this produces in the graph

> **Required structured fields (top-level, not just body) — schema
> gatekeeper rejections cost a retry:**
> - `kpi`: `metric_name`. Plus required canonical `features_ref[]`.
>   Recommended top-level: `target`, `cadence`, `owner`,
>   `threshold_low`, `threshold_high`.
> - `north_star`: `metric_name`, `description`. Both required; `formula`
>   recommended. Section: `performance`.
> - The driver tree + decision-anchor + governance rhythm live in the
>   `body` markdown.

- **Write:** `update_block` / `create_block` on one or more `kpi` blocks (create
  or update) + one `north_star` block (the tree root).
- **value** per KPI:
  - `metric_name`, `definition`, `unit`, `target`, `threshold_low`,
    `threshold_high`, `owner`, `cadence`
  - `body`: the position in the driver tree + the decision it
    informs + how it's calculated + edge cases
  - `features_ref`: which feature(s) move this metric
  - `ogsm_ref`: which OGSM goal it ladders to
- **`reason` must cite:** the OGSM block (mandatory), the feature
  blocks measured, the persona blocks the metric is about.
- **maturity:** `drafted` initially. `validated` only when the KPI has
  driven at least one real decision (logged as a `decision` block
  citing the KPI's threshold breach).
- **Also write:** a `decision` block recording the KPI architecture
  decision itself — what we measured, why, what we explicitly chose
  NOT to measure (the cull list).

## Anti-patterns to refuse

- Any KPI without a named decision it informs.
- Any KPI without a named-person owner.
- An "executive dashboard" with 30+ metrics. Force a cull.
- Activity metrics reported as KPIs to leadership.
- A driver tree with no MECE check — the AI must explicitly say
  "the tree is MECE because [reason]" or "the tree has a gap at
  [level]."
- Producing the system silently. The conversation is where vanity
  hides; without the refinement loop, the AI lets it survive.
