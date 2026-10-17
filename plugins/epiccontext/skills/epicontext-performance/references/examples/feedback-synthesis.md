# Example: Feedback Synthesis

Taking raw feedback signals to themes to insights. Demonstrates the action loop that prevents feedback from becoming a graveyard.

## Context

A small services business (Asana Wellness) has been collecting feedback for a quarter through three channels:
- Post-treatment NPS survey (n=164 responses, 28% response rate)
- Google reviews (12 new reviews this quarter)
- Customer support emails (47 inbound)

Without synthesis, this is just three data piles. With synthesis, it becomes signal.

## The synthesis process

```yaml
id: feedback-synthesis-2026-Q1
type: feedback_synthesis
date: 2026-04-15
period: 2026-Q1
owner: Robert

# RAW INPUT VOLUMES
inputs:
  nps_responses:
    total: 164
    response_rate: "28%"
    promoters: 89  # 9-10
    passives: 52  # 7-8
    detractors: 23  # 0-6
    nps_score: "+40"  # (89-23)/164 * 100
    
  google_reviews:
    new_this_quarter: 12
    average_rating: 4.7
    breakdown:
      5_star: 9
      4_star: 2
      3_star: 1
      below_3: 0
      
  support_emails:
    total: 47
    by_category:
      booking_help: 18
      cancellation_request: 12
      gift_voucher_question: 8
      pricing_question: 5
      feedback_compliment: 3
      complaint: 1

# THEME EXTRACTION (the synthesis work)
themes:
  - theme: "Therapist relationship is THE thing"
    signal_count: 47  # across all channels
    sources:
      - nps_comments: 38  # quotes mentioning specific therapists positively
      - google_reviews: 7  # explicit therapist-by-name mentions
      - support_emails: 2  # asking how to ensure same therapist next time
    representative_quotes:
      - source: nps_q1_response_044
        quote: "Lisa is amazing. I've been going to her for two years and she remembers exactly what works for me."
      - source: google_review_2026-03-15
        quote: "Same therapist every visit makes such a difference. I trust them with my recovery."
      - source: support_email_2026-02-08
        quote: "Just want to make sure I'm always booked with [therapist] — is there a way to set that as default?"
    insight_significance: "Confirms primary positioning anchor; aligns with Q1 research insight on provider continuity"
    cross_reference: insight-therapist-specific-booking
    
  - theme: "Booking flow friction (specifically rebook)"
    signal_count: 19
    sources:
      - nps_comments: 8  # passives mentioning booking annoyance
      - support_emails: 11  # actual help requests
    representative_quotes:
      - source: nps_q1_response_087
        quote: "Love the place, the rebooking process could be better. I always end up calling instead."
      - source: support_email_2026-03-22
        quote: "How do I rebook with the same therapist? I can't find it on the site."
    insight_significance: "Direct evidence for the feature being built (therapist-specific booking flow)"
    cross_reference: feature-therapist-specific-booking
    
  - theme: "Pricing transparency appreciated"
    signal_count: 14
    sources:
      - nps_comments: 9
      - google_reviews: 3
      - support_emails: 2
    representative_quotes:
      - source: google_review_2026-02-10
        quote: "Pricing shown upfront, no surprises, no upselling. Refreshing."
      - source: nps_q1_response_112
        quote: "I appreciate that you don't pressure me to buy packages."
    insight_significance: "Validates 'no upsells' positioning; this is a real differentiator"
    cross_reference: positioning  # Brand group
    
  - theme: "Gift voucher process unclear"
    signal_count: 11
    sources:
      - support_emails: 8  # explicit confusion about gift vouchers
      - nps_comments: 2  # gift purchasers mentioning friction
      - google_reviews: 1
    representative_quotes:
      - source: support_email_2026-01-18
        quote: "How do I check the balance on a gift voucher? I can't see it anywhere."
      - source: support_email_2026-03-04
        quote: "Can the recipient choose any therapist or only specific ones?"
    insight_significance: "Underserved persona; persona-gift-purchaser has friction we haven't addressed"
    cross_reference: persona-gift-purchaser
    
  - theme: "Single complaint: late therapist"
    signal_count: 1
    sources:
      - support_emails: 1
    notes: "Single instance, addressed directly, no pattern. Not synthesized as a theme — just operational."

# DETRACTOR ANALYSIS (the 23 NPS detractors deserve specific attention)
detractor_analysis:
  total: 23
  themes_identified:
    - "Booking flow frustration": 14 detractors  # major theme
    - "Hard to switch therapist when needed": 4 detractors  # ironic given continuity is our strength
    - "Wait time at appointment": 3 detractors
    - "Other / vague": 2 detractors
  observation: |
    The "hard to switch therapist when needed" detractor cluster is interesting.
    Customers who normally appreciate continuity also want a low-friction way to 
    try a different therapist when their usual one is unavailable. This is a
    NEW signal — wasn't in the original Q1 research. Worth follow-up interview.
    
  follow_up_action:
    - action: "Recruit 3-5 detractors who mentioned 'hard to switch' for 30-min interviews"
    - target_date: "2026-05-15"
    - owner: "Robert"

# SYNTHESIS → ACTION LOOP
actions_recommended:
  - action: "Continue therapist-specific booking flow build (already in Now bucket)"
    evidence: "Theme 1 + Theme 2 (66 signals) directly support this"
    owner: "Robert + Frenz"
    
  - action: "Investigate gift voucher friction"
    evidence: "Theme 4 (11 signals); persona-gift-purchaser underserved"
    owner: "Robert"
    proposed_next_step: "Audit current gift voucher flow; interview 2-3 recent gift purchasers"
    estimated_priority: medium
    
  - action: "Follow-up interviews with 'switch therapist' detractor cluster"
    evidence: "Detractor analysis surfaced new signal not in Q1 research"
    owner: "Robert"
    target_date: "2026-05-15"
    
  - action: "Document 'pricing transparency' as a confirmed positioning anchor"
    evidence: "Theme 3 (14 signals)"
    owner: "Robert"
    proposed_next_step: "Update Brand group positioning entity to include this as validated"

# WHAT WE'RE NOT ACTING ON (and why)
not_acting_on:
  - signal: "Single late-therapist complaint"
    reason: "Operational issue, addressed directly. Not a pattern."
    
  - signal: "Wait time mentioned by 3 detractors"
    reason: "Below threshold for systemic action; monitor next quarter"

# CROSS-LINKAGE
linked_insights_created:
  - insight-pricing-transparency-validated  # NEW from Theme 3
  - insight-gift-voucher-friction          # NEW from Theme 4
  - insight-switching-friction             # NEW from detractor analysis (tentative)
  
linked_existing_insights_strengthened:
  - insight-therapist-specific-booking     # Themes 1 + 2 confirm

linked_features:
  - feature-therapist-specific-booking     # already in Now
  - feature-gift-voucher-flow              # new candidate for Next

review_at: 2026-07-15  # next quarter
```

## What this example demonstrates

**Synthesis is the work; collection is just data.** 164 NPS responses + 12 reviews + 47 support emails is just 223 raw signals. Synthesis turns them into 4 themes with action implications.

**Themes have signal counts and representative quotes.** Both the *how many* (47 signals across channels for Theme 1) and the *what they actually said* (specific quotes with source IDs) matter. Counts without quotes are abstractions; quotes without counts are anecdotes.

**Detractor analysis is separate.** The 23 detractors deserve specific attention, not just inclusion in the overall NPS calculation. The "hard to switch therapist" cluster is a new signal — not visible in aggregate analysis.

**Action loop is explicit.** Each synthesized theme leads to either an action (with owner and date) or an explicit "not acting on" with reason. This prevents the data graveyard pattern.

**New insights are flagged.** The synthesis surfaces three candidate new insights that didn't exist before. These flow into the Users group's customer_insight entity.

**Cross-linkage matters.** Themes connect to existing insights (strengthening or contradicting), to features (validating roadmap items), to personas (revealing under-served segments). Without cross-linkage, synthesis stays isolated.

## How to adapt

For your project:
1. Inventory raw input volumes per channel
2. Extract themes by signal count and sources
3. Pull representative quotes (with source IDs for traceability)
4. Analyze detractors / negative signals separately
5. Map themes to action recommendations with owners
6. Explicitly note what you're NOT acting on, and why
7. Cross-link to existing insights, features, personas

## Common adaptations

**For B2B SaaS:**
- Synthesis should also include sales calls / win-loss interviews
- Themes often differ between user personas and buyer personas
- Customer success notes are a major channel

**For high-volume consumer products:**
- Sample raw signals (don't try to read all 10,000)
- Use sentiment analysis as filter, not as conclusion
- Detractor follow-up may not be feasible for every complaint; sample

**For multi-location services:**
- Synthesize per-location AND aggregate
- Differences between locations are signals (operational variation, manager quality, etc.)

## Sources

- EVD-PER-005 — VoC programs need explicit action loops (McKinsey)
- EVD-PER-004 — NPS limitations (use as one signal, not the only one)
- EVD-USR-005 — Switch interviews surface unmet jobs (Christensen) — same methodology applies to detractor follow-up
