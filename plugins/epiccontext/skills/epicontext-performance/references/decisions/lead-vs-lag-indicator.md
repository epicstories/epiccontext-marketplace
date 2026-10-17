# Decision Tree: Lead vs. Lag Indicator?

Picking measures that *predict* outcomes (leading) vs. those that *confirm* outcomes (lagging). Healthy measurement uses both. Wrong selection produces measurement that's late, useless, or both.

## Start here

**For a candidate metric, ask:**

```
├─ Does this metric move BEFORE the outcome we care about?
│   └─ YES → Leading indicator (predicts; can act on early)
│
├─ Does this metric move AT THE SAME TIME OR AFTER the outcome?
│   └─ YES → Lagging indicator (confirms; cannot act on early)
│
└─ Is this a metric of activity that doesn't connect to outcome?
    └─ YES → Vanity metric (probably not a real measure)
```

## Examples by category

### Lagging indicators (confirm)

| Metric | What it confirms |
|--------|-----------------|
| Revenue | Demand x Pricing x Conversion all worked |
| Customer retention rate | Product-market fit retained over time |
| Net Promoter Score | Aggregate satisfaction |
| Annual recurring revenue | Sustained value delivery |
| Profit margin | Operations + pricing + cost all aligned |

**Strengths:** Lagging indicators are real outcomes. They're what investors, boards, and stakeholders ultimately care about.

**Weaknesses:** By the time they move, the cause has already happened. You can't act on a lagging indicator to influence its current quarter.

### Leading indicators (predict)

| Metric | What it predicts |
|--------|-----------------|
| Time-to-first-value | Likelihood of activation |
| Active usage in week 1 | Likelihood of week-4 retention |
| Search-to-booking ratio | Future conversion |
| Therapist-specific rebook usage | Future overall rebook rate |
| Customer support ticket volume on a feature | Future complaints / churn |
| AEO mention rate | Future organic search-driven discovery |

**Strengths:** Leading indicators give you time. Acting on them can change the lagging indicator.

**Weaknesses:** Leading indicators can be wrong. They're predictive, not confirmatory. Too much focus on leading can produce optimization for the proxy rather than the outcome.

### Vanity metrics (avoid)

| Metric | Why it's vanity |
|--------|-----------------|
| Total registered users | Most never come back; doesn't predict revenue |
| Total page views | Doesn't connect to action |
| Social media followers | Doesn't predict customers |
| Total emails sent | Activity, not outcome |
| Total downloads (without engagement) | One-time event |

**Why vanity metrics are dangerous:** They're easy to grow and feel good when they grow. Teams optimize for them and the real outcomes don't move.

## How to choose for a specific OGSM Goal

**Step 1: What's the OGSM Goal?**
Example: "Achieve 85% rebooking rate by end of 2026"

**Step 2: What's the lagging indicator?**
Same as the goal: rebooking rate. Confirms whether you achieved the goal.

**Step 3: What predicts the lagging indicator?**
Candidates:
- Therapist-specific rebook flow usage (leading)
- Time-to-rebook from intent to confirmation (leading)
- Support tickets in "cannot find therapist" category (leading — fewer tickets predicts higher rebook rate)
- Customer NPS at 30-day mark (leading — happier customers rebook more)

**Step 4: Pick a balanced set.**
Recommendation: 1 lagging + 2-3 leading. The lagging confirms; the leading let you act early.

## When leading indicators mislead

Leading indicators can fail in three ways:

**False signal.** The leading indicator moves but the lagging doesn't follow. The relationship was spurious or has broken.

**Goodhart's Law.** Once the leading indicator becomes a target, it stops being a good measure. Teams game it without producing the outcome.

**Local optimization.** The leading indicator improves but creates problems elsewhere. Example: optimizing time-to-first-value by hiding complexity, then customers churn at month 3 when complexity hits.

**Mitigation:** Always pair leading with lagging. If the leading moves but the lagging doesn't, the leading is wrong.

## When lagging indicators mislead

**Lag too long to react.** Annual retention told you 12 months later. By then, the cause is forgotten.

**Aggregate hides segments.** Total NPS is 50 (great!) but new customer NPS is 30 (signal of churn coming). Aggregate lagging indicators can mask segment-level leading signals.

**Mitigation:** Don't rely solely on lagging. Always have leading indicators that fire earlier.

## Quick guide

| Situation | Lean toward |
|-----------|-------------|
| You need to act this quarter | Leading indicator |
| You need to confirm a strategy worked | Lagging indicator |
| You're testing a new feature | Leading indicator (early signal) |
| You're reviewing the year | Lagging indicators dominant |
| You're not sure which | Pair: 1 lagging + 2-3 leading |

## Common failure modes this tree prevents

- **Lagging-only measurement** — outcomes confirmed too late to act
- **Leading-only measurement** — proxies optimized; outcomes don't follow
- **Vanity metrics replacing real measures** — feel good, predict nothing
- **No connection to OGSM** — metrics exist for their own sake
- **Goodhart's Law** — once a leading indicator becomes a target, gameable

## Sources

- Norton & Kaplan — *Balanced Scorecard* (leading vs. lagging framework)
- Croll & Yoskovitz — *Lean Analytics* (vanity vs. actionable metrics)
- EVD-PER-001 — Vanity vs. actionable metrics
- EVD-PER-002 — Leading vs. lagging indicators
- Goodhart's Law (originally on monetary policy; adopted in measurement theory)
