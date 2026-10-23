# Analysis: Reasoning Across the Graph

After scaffolding (every entity stubbed from defaults) and specialization (entities upgraded to drafted/validated as research and decisions arrive), the third mode of work is **analysis** — using the linked graph to find what's actually going on, decide what's a real problem, and recommend action.

This document is the methodology. Each group's `analysis-flows.md` applies it within that group; this file establishes the cross-group pattern they all share.

## The principle

**The truth lives in the connections, not in any single entity.**

A user pain in isolation might mean nothing. Connected to strategy and business model, it might be acceptable. Connected to performance data and competitors, it might be the most important problem in the project. A feature with low usage might be broken — or might be deprecated and nobody marked it. A KPI dropping might be a problem — or might be the *intended* result of a strategic shift.

The analysis pattern is: **traverse before judging.**

## When to use this pattern

- Stakeholder asks "is this a problem?"
- Survey, NPS, AI search visibility, or feedback signal looks alarming
- A KPI drops or surprises
- Stakeholders disagree about what to fix
- Periodic review of where the project actually stands
- A competitor moves and you're deciding whether to react
- A client asks "given everything you know, what should we focus on?"

## The five-step pattern

### 1. State the signal precisely

What did you see? Where? When? How big? Avoid mood ("things feel off"). Quote numbers and direct words where possible.

> ✅ "Quarterly customer survey: 30% of Asana Wellness customers say treatments feel rushed; n=147; data range Q1 2026."
>
> ❌ "Customers seem unhappy with treatment quality."

### 2. Traverse the linked context

Pull every connected entity across all eight groups. The graph traversal is the work — don't analyze in isolation.

For a Users-group signal, traverse outward:

```
[signal: customer survey shows X]
    │
    ├─→ Persona linked to the survey: who said this? Target persona or not?
    │
    ├─→ JTBD the persona is hiring for: does the signal match the job?
    │
    ├─→ Journey map: where in the journey does this pain land?
    │
    ├─→ Feature(s) linked to that journey phase: are they doing their job?
    │
    ├─→ Strategy + OGSM: is this signal aligned with or against the strategic bet?
    │
    ├─→ Business model: does the obvious fix break the model?
    │
    ├─→ Brand positioning: does the signal pull toward or away from how we show up?
    │
    ├─→ Performance data: what do KPIs say about this same area?
    │
    └─→ Competitors: is this a category problem or specific to us?
```

The same traversal pattern applies starting from any group. If the signal originates in Performance ("KPI X is down 20%"), traverse to Strategy (is this measure on an OGSM?), Users (which segment is this?), Brand (does the messaging match what's measured?), Build (recent infrastructure changes?), Product (which features feed this metric?).

### 3. Identify tensions

Where does the linked context disagree? Tensions are signals — they're often where the real insight lives.

Common tension types:
- **Users vs Strategy:** customers want X; strategy says no
- **Brand vs Performance:** voice principles say A; engagement data favors B
- **Users vs Build:** users need feature; tech debt makes it expensive
- **Strategy vs Performance:** OGSM target at risk; pivoting threatens the bet
- **Product vs Brand:** UX flow works; copy drifted from voice
- **Users vs Users:** target persona wants A; non-target persona wants B and is louder

Name the tension explicitly. Don't smooth it over.

### 4. Classify the signal (MECE)

Once tensions are surfaced, classify:

| Classification | Meaning | Action |
|----------------|---------|--------|
| **Real problem to fix** | Signal aligns with strategy AND traverses to other groups confirming impact | Recommend fix with priority |
| **Acceptable trade-off** | Signal is real but conflicts with strategy/business model in a way the strategy explicitly accepts | Document as known trade-off; don't fix |
| **Drift to reconcile** | Two parts of the graph have desynced; nobody decided this should happen | Reconcile (which is true now?), then commit either side |
| **Wrong-persona signal** | Signal is real for non-target audience; serving them would erode positioning | Note the segment; decide whether to serve them as secondary or accept |
| **Vanity / noise** | Signal doesn't traverse to any meaningful entity in other groups | Stop measuring or stop discussing; reallocate attention |

**MECE check — required before moving on.** Each tension you surfaced
in Step 3 must land in *exactly one* bucket. If a tension fits two,
split it ("X for persona A is a real problem; X for persona B is a
wrong-persona signal"). If a bucket is empty, name it in your output:
*"No tensions classified as [drift / vanity]; confirmed nothing here
rather than overlooked."* A signal can sit in more than one bucket for
different audiences — document the audience split explicitly.

See `epicontext-core/references/discipline.md` § MECE for the norm
and what to do when categories overlap.

### 5. Recommend — answer-first, with explicit trade-offs named

**Sentence 1 is the recommendation.** Not the context, not the
classification, not the evidence. The verdict comes first; everything
after is justification. See `epicontext-core/references/discipline.md`
§ Answer-first.

The recommendation block has five lines, in this order:

- **What's recommended** (concrete action — verb + audience + mechanism + timeframe)
- **Which classification** drove it (from Step 4's MECE table)
- **What's traded off** (named, not hidden)
- **What changes if the trade-off becomes unacceptable** (escape valve / reversal condition — observable + dated)
- **Where the decision lives** (which entity gets updated, by whom)

> ✅ "Recommend: introduce a 90-minute premium treatment tier at €110, alongside existing 60-minute at €80.
>
> Classification: real signal, served via product change rather than redesign of the standard offering.
>
> Trade-off: complexity in scheduling and pricing communication. Operations capacity may need adjustment.
>
> Reverse if: under 8% of customers book the premium tier within 90 days, or operations capacity becomes a bottleneck. Revert to single tier and address through education on what's covered.
>
> Decision lives in: Strategy (business_model.md) with input from Users (persona-recurring-service-customer), commits to Product (overview.md capability map)."

> ❌ "Customers want longer treatments; we should offer longer treatments."

## Common cross-group tension archetypes

These show up across many projects. When you spot one, the analysis often follows a known shape.

### "Customer wants" vs "strategic position"

**Pattern:** Survey or qualitative signal shows users want something that conflicts with the positioning.

**Traverse:** Users (which persona — target or not?) → Strategy (does the bet accommodate this?) → Brand (does the want pull positioning toward generic or away from differentiation?)

**Resolutions:**
- Premium tier (serve the want at higher price; preserve standard offering)
- Education (the want is misperception; address with content/copy)
- Accept and decline (the want comes from non-target persona; serving it erodes focus)
- Pivot (the want signals a strategy shift worth considering)

### "Metric down" vs "intentional shift"

**Pattern:** A KPI drops; surface reading is "problem"; deeper traversal shows it's the consequence of a strategic decision.

**Traverse:** Performance (which KPI exactly?) → Strategy/OGSM (is this measure on an objective? what does the strategy say should happen here?) → Roadmap (was something deprecated that fed this metric?)

**Resolution:** Document as intentional in the KPI's notes; replace with a measure that reflects the new strategy.

### "Brand voice" vs "user efficiency"

**Pattern:** Voice principles say warm/personal; users in transactional flows want speed and clarity.

**Traverse:** Brand (what do voice principles actually say? do they have register variation?) → Users (which JTBD — exploratory or transactional?) → Product (which IA node — content or task?) → Performance (engagement/completion metrics by flow type)

**Resolution:** Voice with register — warm in exploratory/discovery surfaces, direct in transactional. Voice principles get a register dimension. Both stay true; neither gets abandoned.

### "Feature requested" vs "build cost"

**Pattern:** Users ask for feature X; Build says architecture rework needed; Product asks "how important is this really?"

**Traverse:** Users (severity, frequency, persona) → Strategy/OGSM (does this serve a current goal?) → Build (architecture cost; ADR if material) → Performance (current pain visible in metrics?) → Roadmap (where does this fit in time?)

**Resolution options:**
- Workaround that addresses 70% of pain at 20% of cost (often best)
- Defer and document (acknowledge real signal; not now)
- Accept the cost (high impact on a strategic goal)
- Reject and reposition (this is a non-target persona signal)

### "Competitor moves" vs "strategic discipline"

**Pattern:** Competitor launches X; pressure to match.

**Traverse:** Competitor (linked JTBD) → Strategy (does X serve our strategic bet, or theirs?) → Users (do our personas hire for the JTBD X solves?) → Brand positioning (does matching X collapse our differentiation?)

**Resolution:** Default to "no match" unless traversal confirms strategic alignment. Strategic discipline > reactive feature-matching.

## Worked example: Asana Wellness customer survey signal

**Signal (Step 1):** Q1 2026 customer survey shows 30% of customers (n=147) want longer treatment slots. Direct quote: "I felt rushed; would pay more for a longer session."

**Traversal (Step 2):**

- *Persona linked:* recurring-service-customer (the primary persona) — they're the ones answering the survey.
- *JTBD:* "Maintain my wellbeing through consistent treatment with a provider I trust." Not "get the most thorough single treatment possible."
- *Journey:* The survey response lands in the "during treatment" phase, where slot length is a constraint.
- *Feature:* Booking flow defaults to 60-minute slots; no premium-length option exists.
- *Strategy:* Provider continuity, max 3 locations, quality-led — explicit "not high volume."
- *OGSM:* Q1 revenue target requires ~30 treatments/day across providers.
- *Business model:* Per-treatment pricing, fixed price per slot type.
- *Brand:* "Quality, calm, expert" — *not* "rushed."
- *Performance:* Rebooking rate strong (good sign); NPS at 47 (good); this 30% is *not* defecting — they're loyal.
- *Competitor:* Single-location boutiques offer 90-minute "deep" treatments at premium price.

**Tensions (Step 3):**

- Users (30% want longer) vs Business model (slot length determines revenue per provider).
- Brand promise ("calm, expert") vs Customer experience ("felt rushed") — these *should* align; the gap is real.
- Strategy (quality-led) vs Operations (current 60-min default optimizes throughput, not depth).

**Classification (Step 4):**

- Not "vanity / noise" — 30% is large; rebooking signal confirms loyalty (so they're target persona, not departing); brand-promise gap is real.
- Not "wrong persona" — these are recurring-service customers, exactly the target.
- Not "drift" — no part of the graph claims long slots exist.
- **Real problem to fix, served via product change** — the strategic bet (quality-led, max 3 locations) actually *favors* a premium long-slot tier; it's on-strategy, not against it. Adding the tier strengthens differentiation versus generic 60-min wellness chains.

**Recommendation (Step 5):**

> Introduce 90-minute premium tier at €110 alongside existing 60-minute at €80. Limit to 3 slots/day per provider initially.
>
> **Classification:** Real signal, served via product addition. On-strategy because depth > volume is the existing bet.
>
> **Trade-off:** Scheduling complexity (two slot types); marketing/communication about when each is right; operations capacity if uptake is high.
>
> **Reverse if:** Under 8% premium-tier uptake within 90 days; OR operations strain pushes provider continuity below current bar.
>
> **Decision lives in:** Strategy (business_model.md — pricing tier addition) with input from Users (persona-recurring-service-customer JTBD refinement) and Product (overview.md capability map; new feature in feature.md). KPI added in Performance (premium-tier-uptake.md).

The recommendation isn't "fix" or "ignore" — it's a specific product change with explicit conditions for reversal, and it touches four groups in the graph because the truth required all four.

## Anti-patterns

**Treating one group's signal as the whole truth.** Customer surveys read in isolation. KPIs analyzed without strategic context. "Users said X, so we should do X" — without checking whether X serves the strategic bet or breaks the business model.

**"Yes" to every customer pain.** Customers always have wants. Serving every want is how products lose differentiation and businesses lose discipline. The traversal is what separates real problems from infinite-want.

**"No" to every user signal because of business reasons.** The opposite failure: hiding behind "we're positioned premium" or "that's not our persona" to avoid hard work. The traversal should be honest both directions.

**Recommending without naming the trade-off.** "We should do X." OK — but what does X cost? What does X break? What does the graph traversal say happens elsewhere? If a recommendation has no trade-off, the analysis is incomplete.

**Skipping the reversal condition.** Real recommendations specify what would make us reverse them. "Reverse if uptake < 8% in 90 days" makes the bet explicit. Without it, the decision becomes folklore.

**Confusing drift with disagreement.** Drift is "two parts of the graph desynced; we didn't decide this." Tension is "two parts of the graph were never going to fully agree." Different responses: drift gets reconciled; tension gets explicitly accepted.

**Analysis as procrastination.** Sometimes the answer is obvious; the signal is small; the cost of delay exceeds the cost of being wrong. Don't traverse infinitely. Match analysis depth to stake size — same principle as `epicontext-users/references/decisions/research-vs-ship.md` for research investment.

## How this fits the workflow

The one-pager describes three modes the graph supports:

1. **Scaffold** — every entity stubbed at project kickoff from sensible defaults.
2. **Specialize** — entities upgrade from stub to drafted to validated as research, decisions, and production use accumulate.
3. **Analyze** — use the populated graph to find tensions, decide problems vs trade-offs, recommend action.

This document is mode 3. It runs throughout the project lifetime, not just at the end. After every batch of specialization, ask the analysis question: given what we now know, what tensions exist, and which are problems vs accepted trade-offs?

The graph isn't just a record-keeping device. It's a thinking tool. The analysis pattern is how the thinking happens.

## Per-group entry points

Each group's `analysis-flows.md` file applies this pattern to signals that originate in or land in that group:

- `epicontext-users/references/analysis-flows.md` — customer survey, persona drift, journey friction, JTBD shift
- `epicontext-product/references/analysis-flows.md` — feature usage, IA findability, content drift, glossary inconsistency
- `epicontext-strategy/references/analysis-flows.md` — OGSM at risk, competitor moves, business model strain
- `epicontext-brand/references/analysis-flows.md` — voice drift, positioning erosion, messaging not landing
- `epicontext-build/references/analysis-flows.md` — performance regression, tech debt, security/legal exposure, accessibility gaps
- `epicontext-performance/references/analysis-flows.md` — KPI shifts, AEO visibility, feedback synthesis

Each group's flows include a **Cross-group considerations** section listing the most common signals that originate there and which other groups' context to pull. Read the per-group file when the signal is local; read this file when reasoning across groups.
