# Example: KPI With Full Trace

A KPI defined with full upstream linkage (OGSM) and downstream linkage (decision-trigger). Demonstrates the principle: every KPI should answer "if this number moved, what would we do differently?"

```yaml
id: kpi-rebook-conversion-rate
type: kpi
maturity: drafted
last_reviewed: 2026-04-30

name: "Rebook conversion rate"
short_description: "Of customers who initiate a rebook flow, the percentage who complete a booking"

# PRECISE DEFINITION (computability matters)
formula: "booking_completed (where is_rebook=true) / booking_started (where entry_point=rebook)"
calculation_window: "Rolling 30 days"
exclusions: "Excludes test bookings (test_account=true); excludes bookings cancelled within 1 hour of creation"

# UPSTREAM LINKAGE (this KPI exists to serve OGSM)
linked_ogsm_measure: meas-1-1-1-1
linked_ogsm_goal: goal-1-1
linked_ogsm_strategy: str-1-1-1
linked_strategy: strategy-services-led-quality

# BASELINE AND TARGET
baseline:
  value: "42%"
  date: "2026-Q1"
  context: "Pre-redesign of rebook flow; therapist-specific booking not yet shipped"

target:
  value: ">60%"
  date: "2026-Q4"
  rationale: "Aligned with goal-1-1 (85% overall rebook rate); therapist-specific booking flow expected to be primary driver"
  stretch: ">65%"

current:
  value: "47%"
  as_of: "2026-04-30"
  trend: "Improving — started 42% in Q1, 44% in early Q2, 47% by end of April"
  trend_significance: "Statistically meaningful improvement; sample size adequate (1,200+ rebook attempts/month)"

# OPERATIONAL DETAIL
cadence: monthly
review_meeting: "First Monday of each month, 30-min team sync"
owner: "Robert"
secondary_owner: "Frenz (technical investigation if needed)"

# DATA SOURCE
source:
  type: analytics
  primary_tool: PostHog
  dashboard: "Rebook funnel — production"
  query_method: "Pre-built funnel; verifiable by raw event query"
  data_freshness: "Updated hourly; reviewed monthly"
  data_quality_check: "Sampled three months; no double-counting; matches Stripe payment records"

# DECISION-TRIGGERS (this is the heart of the KPI)
action_thresholds:
  - threshold: "Below 42% baseline for 2 consecutive months"
    severity: high
    action: |
      DIAGNOSE before reacting. Possibilities:
      1. Rebook flow has broken (technical regression) — check error rates first
      2. Q1 baseline was an anomaly — check seasonality data
      3. Therapist-specific booking has issues — check usage of that flow specifically
      4. External factor (competitor, market change) — compare to traffic sources
      
      Action only after diagnosis, not from raw number.
      
  - threshold: "Above 60% target for 2 consecutive months"
    severity: positive
    action: "Raise target. Consider what should be optimized next. Document what we did right (for replay)."
    
  - threshold: "47-55% range for sustained period"
    severity: medium
    action: "Hold steady; trust the trajectory. No reactive changes."

# CROSS-LINKAGE
linked_features:
  - feature-therapist-specific-booking  # primary lever
  - feature-rebook-with-same             # secondary lever
linked_personas:
  - persona-recovering-rachel  # primary persona this serves

related_insights:
  - insight-therapist-specific-booking  # the diagnosis behind why this metric matters

# RISK FACTORS
known_caveats:
  - "Sample size: ~1,200 rebook attempts/month; statistical noise is meaningful at >5% movements"
  - "Doesn't capture rebook intent that doesn't enter the flow (e.g., customer thinks about rebooking but never starts)"
  - "Doesn't distinguish 'first rebook' from 'nth rebook' — both bucketed together"

next_review: 2026-05-30

notes: |
  This KPI is the operational expression of the provider-continuity strategy. 
  If the strategy is working, this number moves up. If it doesn't move despite 
  the therapist-specific-booking feature shipping, the strategy needs review 
  (not just the KPI). Important: don't tweak the KPI to make it look better —
  the KPI exists to test the strategy, not to defend it.
```

## What this example demonstrates

**Trace upward to OGSM is required.** This KPI doesn't exist for itself — it serves a specific OGSM Measure, which serves a Goal, which serves a Strategy. Without that trace, it's a metric that exists for measurement's sake.

**Decision-triggers are the heart.** The most important field is `action_thresholds`. If the number moves, what do we do? If you can't answer that, the KPI is decoration. Note: actions specify *diagnosis first, then action* — not knee-jerk responses.

**Baseline + current + target tell a story.** 42% → 47% → 60% is a journey. The trend interpretation matters as much as the snapshot.

**Caveats are explicit.** Sample size, what's not captured, statistical noise. KPIs presented without caveats invite over-interpretation.

**The notes field has the philosophical anchor.** "Don't tweak the KPI to make it look better — the KPI exists to test the strategy, not to defend it." This guards against Goodhart's Law (when a measure becomes a target, it ceases to be a good measure).

## How to adapt

For your KPI:
1. Trace upward — find or create the OGSM Measure it serves
2. Define the formula precisely (so anyone can reproduce the number)
3. Set baseline + target with rationale
4. Set monthly/weekly review cadence
5. Name an owner
6. **Define action thresholds** — the most important step
7. Cross-link to features, insights, personas
8. Note known caveats (sample size, exclusions, what's not captured)

## Common adaptations

**For B2B SaaS:**
- KPIs often have longer review cadences (monthly to quarterly)
- Action thresholds tied to retention cohorts, not single-point movements
- Account-level metrics important alongside user-level

**For e-commerce:**
- Daily review cadences common for high-volume metrics
- Seasonality requires year-over-year comparisons, not just trend lines
- Statistical significance matters at smaller % movements due to volume

**For services (like Asana Wellness):**
- Smaller samples mean larger noise; require longer windows or wider thresholds
- KPIs tied to operational quality (not just volume) are critical
- Customer-specific KPIs (rebook rate) often more important than aggregate metrics

## Sources

- Doerr — *Measure What Matters* — OKRs and decision-trigger principles
- Croll & Yoskovitz — *Lean Analytics* — actionable vs. vanity metrics
- EVD-PER-001 — Vanity metrics vs. actionable metrics
- EVD-PER-002 — Leading vs. lagging indicators
