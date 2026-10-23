# Example: OGSM Quarterly

A full OGSM cascade with measurable goals, distinct strategies, and tracked measures. Demonstrates the 3-3-3-3 cap and proper cascade.

```yaml
id: ogsm-2026-q2-q4
type: ogsm
maturity: drafted
last_reviewed: 2026-04-30
review_cadence: quarterly
period: "2026 Q2-Q4"

linked_strategy: strategy-services-led-quality

objectives:
  - id: obj-1
    text: "Become the trusted provider for recurring wellness in the Randstad"
    goals:
      - id: goal-1-1
        text: "Achieve 85% rebooking rate by end of 2026"
        baseline: "72% as of 2026-Q1"
        current: "78% as of 2026-Q2"
        strategies:
          - id: str-1-1-1
            text: "Win on provider continuity through therapist-specific booking"
            measures:
              - id: meas-1-1-1-1
                text: "Therapist-specific rebookings as % of total rebookings"
                target: ">60% by 2026-Q4"
                current: "42%"
                cadence: monthly
                source: analytics
              - id: meas-1-1-1-2
                text: "Average time-to-rebook (intent → confirmation)"
                target: "Under 2 minutes by 2026-Q4"
                current: "4.5 minutes"
                cadence: monthly
                source: analytics
          - id: str-1-1-2
            text: "Maintain quality consistency across all therapists"
            measures:
              - id: meas-1-1-2-1
                text: "Treatment NPS by therapist (variance)"
                target: "All therapists >50 NPS, no therapist 20+ points below mean"
                current: "Mean 58, lowest 41"
                cadence: monthly
                source: post_treatment_survey
      - id: goal-1-2
        text: "Generate 50% of new customer acquisition through referrals by Q4"
        baseline: "32% as of Q1"
        strategies:
          - id: str-1-2-1
            text: "Build referral surface into post-treatment moments"
            measures:
              - id: meas-1-2-1-1
                text: "Referral codes shared per active customer"
                target: ">0.4 referrals shared per customer per quarter"
                cadence: monthly
                source: referral_tracking

  - id: obj-2
    text: "Sustain healthy unit economics as we scale toward 2 locations"
    goals:
      - id: goal-2-1
        text: "Maintain contribution margin >48% through 2026"
        baseline: "50% as of Q1"
        strategies:
          - id: str-2-1-1
            text: "Hold therapist payment ratio while improving booking efficiency"
            measures:
              - id: meas-2-1-1-1
                text: "Treatments per therapist per month"
                target: "Maintain at current levels (~50/month) while scaling"
                cadence: monthly
                source: scheduling_data
      - id: goal-2-2
        text: "Validate location-2 feasibility model by Q4"
        strategies:
          - id: str-2-2-1
            text: "Simulate operations and economics for proposed second location"
            measures:
              - id: meas-2-2-1-1
                text: "Feasibility study completion with go/no-go recommendation"
                target: "Completed by 2026-Q4 with explicit decision"
                cadence: quarterly
                source: business_case

  - id: obj-3
    text: "Strengthen the team's ability to deliver consistent quality"
    goals:
      - id: goal-3-1
        text: "Onboard 1-2 additional senior therapists by Q3"
        strategies:
          - id: str-3-1-1
            text: "Targeted recruitment through referrals and existing network"
            measures:
              - id: meas-3-1-1-1
                text: "Number of new senior therapists onboarded"
                target: "1-2 by 2026-Q3"
                cadence: quarterly
                source: hr_records

linked_roadmap: roadmap-2026
linked_business_cases: [bc-therapist-specific-booking]
```

## What this example demonstrates

**The cascade is complete.** Every Measure traces upward through Strategy → Goal → Objective. If the cascade breaks, the OGSM is incoherent.

**Goals are numerical and time-bound.** "Achieve 85% rebooking rate by end of 2026" — disagreeable, measurable, dated. "Improve customer experience" would be a non-goal.

**Strategies are distinct.** Within Goal 1-1, "provider-continuity booking" and "quality consistency across therapists" are two distinct mechanisms with two distinct measure sets. They could be separate; they're related but not the same.

**Measures have data sources.** "Source: analytics" / "Source: post_treatment_survey" — every measure is instrumented, not aspirational.

**Current values shown alongside targets.** Lets the team see progress, not just goals.

**Tight cap respected.** 3 objectives total, 1-2 goals each, 1-2 strategies each, 1-2 measures each. Operable, not aspirational. (Practitioner standard is one Objective with 3-6 each below; this example shows three lower-level OGSMs rolling up — appropriate for a more complex business.)

## How to adapt

For your project:
1. Start with linked strategy. Don't write OGSM without it.
2. Write 1-3 objectives — directional, what we're becoming.
3. Each objective gets 1-3 numerical, time-bound goals.
4. Each goal gets 1-3 distinct strategies (mechanisms).
5. Each strategy gets 1-3 measures with real data sources.
6. Cross-check the cascade — does each measure actually serve its strategy?
7. Cap at 3-3-3-3.

## Sources

- Doerr, *Measure What Matters*
- OGSM practitioner methodology
- EVD-STR-007 — Cap at 3-3-3-3
- EVD-STR-008 — Goals must be measurable
