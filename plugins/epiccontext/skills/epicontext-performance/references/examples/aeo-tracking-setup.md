# Example: AEO Tracking Setup

A minimum-viable Answer Engine Optimization (AEO) tracking setup for a small services business. Demonstrates how to track AI-search visibility without over-engineering.

## Context

AEO matters for businesses where customers might ask AI assistants questions like:
- "What's the best wellness studio in Heemstede?"
- "Where can I book a massage with the same therapist each time?"
- "Therapist with [specific specialty] near [location]"

If those queries return your brand, you win. If they return competitors, you don't. The question: how do you measure and act on this?

## The minimum viable setup

```yaml
id: feedback-aeo
type: feedback
maturity: drafted
last_reviewed: 2026-04-30
channel: aeo  # answer-engine optimization

description: "Track brand visibility and accuracy in AI-generated answers across major models"

scope:
  models_tracked:
    - chatgpt    # OpenAI / GPT-5.x
    - gemini     # Google
    - perplexity # Perplexity AI
    - claude     # Anthropic
  geographic_scope: "Netherlands (Randstad), with Heemstede as primary location"
  industries_relevant: "Wellness / massage therapy / recurring service"

# THE PROMPT LIBRARY (the foundation of AEO measurement)
tracked_prompts:
  - prompt: "Best wellness studio in Heemstede"
    intent: unbranded_subjective
    desired_outcome: "Asana Wellness in top 3 mentions, accurately described"
    review_cadence: monthly
    
  - prompt: "Where can I get massage therapy in Heemstede with the same therapist each visit"
    intent: unbranded_objective
    desired_outcome: "Asana Wellness mentioned with provider-continuity positioning intact"
    review_cadence: monthly
    
  - prompt: "Asana Wellness Heemstede"
    intent: branded_objective
    desired_outcome: "Accurate description of services, location, hours; no factual errors"
    review_cadence: monthly
    
  - prompt: "Is Asana Wellness good"
    intent: branded_subjective
    desired_outcome: "Sentiment positive or neutral; reviews/social proof referenced accurately"
    review_cadence: monthly
    
  - prompt: "Wellness studio with [therapist name]"
    intent: branded_objective_specific
    desired_outcome: "Therapist correctly attributed to studio; bookable indication"
    review_cadence: quarterly  # less critical

# WHAT WE TRACK PER PROMPT
metrics:
  - metric: "Mention rate"
    definition: "Of N runs of the prompt, how many included our brand"
    target: ">50% on branded queries; >25% on relevant unbranded queries"
    
  - metric: "Citation accuracy"
    definition: "When we're cited, is the information accurate? (location, services, hours, etc.)"
    target: "100% accuracy on factual fields"
    
  - metric: "Sentiment"
    definition: "Positive, neutral, or negative tone when mentioned"
    target: "Neutral or positive; flag any negative for diagnosis"
    
  - metric: "Citation source"
    definition: "Where did the AI get its information? (Our website, listings, third-party reviews, etc.)"
    insight_value: "Reveals which surfaces actually drive AI visibility"

# THE 86% INSIGHT (Yext research)
strategic_anchor: |
  Yext's 2025 AI citations research (6.8M citations, ChatGPT/Gemini/Perplexity, 
  July-August 2025) found 86% of AI citations come from brand-managed sources:
  - 44% from first-party websites
  - 42% from listings (Google Business Profile, Apple Business, etc.)
  - 8% from reviews/social
  - 2% from forums (Reddit, etc.) — much less than commonly assumed
  
  This means AEO is largely an operational discipline, not a mystery: keep your
  website, listings, and reviews accurate and current, and the AI tends to cite
  them. The gap is almost always operational.

# OPERATIONAL CHECKLIST (where the actual work happens)
brand_managed_sources_checklist:
  website:
    audit: "Is core service info (provider continuity, pricing, location) clearly stated?"
    schema_markup: "LocalBusiness schema present and accurate"
    update_frequency: "Quarterly review at minimum"
    
  google_business_profile:
    completeness: "100% — services, hours, photos, attributes"
    accuracy_check: "Monthly"
    review_response: "All reviews responded to within 7 days"
    
  apple_business_connect:
    presence: "Verified and complete"
    last_updated: "Quarterly"
    
  social_profiles:
    consistency: "Same name, address, hours across all"
    activity: "At least monthly posting (signals freshness to crawlers)"
    
  third_party_listings:
    monitoring: "Quarterly audit for accuracy on aggregator sites"
    correction_process: "Fix errors within 30 days"

# REVIEW PROCESS
review_cadence: monthly
review_method:
  - "Run each tracked prompt 3-5 times across each model"
  - "Record: was brand mentioned? accuracy of info? sentiment? sources cited?"
  - "Compare to previous month; flag changes"
  - "Diagnose changes: did we update something? Did a competitor? Did the model change?"
  - "Document and act"

owner: "Robert (monthly review); operational fixes delegated as needed"

# TOOL OPTIONS (vendor space is rapidly evolving)
tooling_options:
  - tier: "Free / DIY"
    approach: "Manually run prompts; record results in spreadsheet"
    cost: "Time only (~30 min/month)"
    fit: "Small business, low prompt count"
    
  - tier: "Free / freemium"
    tool: "HubSpot AEO Grader"
    approach: "Automated baseline scoring across models"
    cost: "Free 28-day trial; $50/month after"
    
  - tier: "Mid-tier"
    tools: ["Otterly.AI", "Goodie AI", "Scrunch", "AIclicks"]
    approach: "Automated tracking, citation analysis, recommendations"
    cost: "$99-400/month range"
    fit: "Growing businesses with multi-location or higher prompt volume"
    
  - tier: "Enterprise"
    tools: ["Yext Scout", "Semrush Enterprise AIO", "Adobe LLM Optimizer"]
    approach: "Comprehensive monitoring + execution tied to listings/content"
    cost: "Sales-led; quote-based"
    fit: "Multi-location brands, enterprise marketing teams"

caveats:
  - "AEO vendor space is rapidly evolving; revisit tooling decision quarterly"
  - "Vendor research (Yext, etc.) provides directional findings; verify against independent studies as they emerge"
  - "Different models source differently — single-model tracking misses the picture"
  - "Don't optimize for prompts you wouldn't bet on; pick prompts customers actually ask"

linked_brand_positioning: positioning  # AEO is a positioning measurement
linked_business_model: business-model  # discovery is a business-model question
linked_evidence:
  - EVD-PER-006  # 86% brand-managed sources
  - EVD-PER-007  # 93% verify after AI recommendation
  - EVD-PER-008  # different models source differently
  - EVD-PER-009  # profile completeness drives ranking
  - EVD-PER-010  # AI search adoption rapid
```

## What this example demonstrates

**Start with the prompt library.** AEO measurement begins with the questions customers actually ask AI assistants. Without a real prompt library, AEO tracking is performative.

**Yext's 86% finding reframes the discipline.** AEO isn't a mystery — most AI citations come from brand-managed sources (website, listings, reviews). This means AEO is operational discipline, not magic. The example reflects this with a heavy operational checklist.

**Track what's measurable, accept what isn't.** Mention rate, citation accuracy, sentiment, citation sources — measurable. The "general vibe" of AI conversations about your brand — not measurable; don't pretend.

**Tool tier matches business size.** A small services business doesn't need enterprise AEO tooling. The DIY tier (manual prompts in a spreadsheet) is genuinely viable for low prompt counts.

**Caveats are explicit.** The AEO vendor space is new, vendor research has commercial interest, models change over time. The example doesn't pretend any of this is settled.

## How to adapt

For your project:
1. Build the prompt library — what would customers ask AI?
2. Define metrics (mention rate, accuracy, sentiment, sources)
3. Audit brand-managed sources first (website, listings, reviews) — that's where 86% of citations come from
4. Pick tooling tier matching your prompt count and budget
5. Set monthly review cadence
6. Document and act on changes

## Common adaptations

**For B2B SaaS:**
- Prompts focus on category language ("best CRM for X", "alternatives to Y")
- Comparison queries especially important
- Wikipedia, G2, Capterra often cited heavily; manage those listings

**For multi-location consumer brands:**
- Location-level prompts critical ("X near me", "X in [city]")
- Listings (Google Business Profile, Apple) likely the dominant lever
- Yext or similar vendor probably justified

**For pure digital products:**
- Website schema markup more important than listings
- Documentation, support content, blog content drive citations
- Reddit/forums presence may be more relevant than for local businesses

## Sources

- EVD-PER-006 — Yext: 86% of AI citations from brand-managed sources (2025 study, 6.8M citations)
- EVD-PER-007 — Yext: 93% of AI users verify recommendations beyond the AI response
- EVD-PER-008 — Yext: Different AI models source differently
- EVD-PER-009 — Yext Elo: Profile completeness, not star ratings, drives ranking
- EVD-PER-010 — Yext + Researchscape: 75% use AI tools more than a year ago