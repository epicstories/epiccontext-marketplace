# Example: Business Model for Hybrid Service Business

A business model for a wellness service that books online and delivers in person.

```yaml
id: business-model-hybrid-service
type: business_model
maturity: drafted
last_reviewed: 2026-04-30

value_proposition:
  primary: "Reliable, high-quality recurring wellness treatments with the same trusted therapist, booked in seconds"
  jtbd_served: jtbd-recurring-maintenance

revenue_streams:
  - stream: "Per-treatment booking"
    type: transactional
    pricing: "€85 / treatment (single)"
    contribution: "70% of revenue"
  - stream: "Package sales"
    type: prepaid
    pricing: "€800 / 10-treatment package (saves €50)"
    contribution: "20%"
  - stream: "Gift vouchers"
    type: prepaid
    pricing: "Variable, single-treatment or package"
    contribution: "10%"

cost_structure:
  fixed:
    - cost: "Studio lease"
      note: "Largest fixed cost; scales per location"
    - cost: "Booking platform / SaaS subscriptions"
      note: "Modest"
    - cost: "Insurance, utilities, supplies"
      note: "Modest"
  variable:
    - cost: "Therapist payment"
      per_unit: "~48% of treatment revenue"
    - cost: "Payment processing"
      per_unit: "~2%"
    - cost: "Booking SMS / email transactional"
      per_unit: "Small per-event"
  unit_economics:
    revenue_per_treatment: "€85"
    cost_per_treatment_variable: "~€42"
    contribution_margin: "~50%"
    note: "Fixed costs are absorbed by treatment volume; break-even depends on monthly volume per location"

customer_segments:
  - segment: "Recurring maintenance customers"
    persona: persona-recovering-rachel
    contribution: "70% of revenue"
    acquisition_cost: "Low (referral-driven)"
    retention: "Strong (provider continuity)"
  - segment: "First-visit customers (referred or organic)"
    persona: persona-first-time-customer
    contribution: "20%"
    acquisition_cost: "Medium (search + word of mouth)"
    conversion_to_recurring: "~60% of first-visit customers become recurring after 3 visits"
  - segment: "Gift purchasers"
    persona: persona-gift-purchaser
    contribution: "10%"
    note: "Often the gift recipient becomes a customer (referral side-effect)"

channels:
  - channel: "Direct online booking"
    importance: primary
    cost: low_marginal
  - channel: "Walk-in / phone"
    importance: secondary
    cost: medium  # staff time
  - channel: "Word-of-mouth referral"
    importance: primary
    cost: very_low  # but requires existing customers to share
  - channel: "Search (organic + paid)"
    importance: secondary
    cost: medium  # paid search budget

key_resources:
  - "Trained therapists (the moat — recruitment + retention is critical)"
  - "Studio space and prime location"
  - "Booking platform with provider-continuity capability"
  - "Customer database and treatment history (memory of preferences)"
  - "Brand reputation in local market"

key_activities:
  - "Recruit and retain quality therapists"
  - "Maintain quality consistency across treatments"
  - "Manage booking platform and customer relationships"
  - "Marketing for new customer acquisition (especially referral surfacing)"
  - "Operations: scheduling, supplies, intake"

key_partnerships:
  - "Payment processor"
  - "Studio landlord"
  - "Booking platform provider (currently in-house, may externalize)"

linked_strategy: strategy-services-led-quality
linked_jtbds: [jtbd-recurring-maintenance, jtbd-find-trusted-provider]

assumptions_to_test:
  - "Referral-driven acquisition stays the dominant channel as we approach 2-3 locations"
  - "Variable cost ratio (~52%) holds at higher volume per location"
  - "Customers tolerate slight premium pricing for consistency advantage"
  - "Therapist recruitment scales — we can find 2-3 more senior therapists at our quality bar"
```

## What this example demonstrates

**Revenue streams broken down with contribution.** Not just listed; each stream has a percentage of total. Lets the team see where revenue actually comes from.

**Cost structure split fixed/variable.** Critical for understanding scale economics. Variable costs that scale with volume are fundamentally different from fixed costs that don't.

**Unit economics named.** ~€42 cost per ~€85 revenue → ~50% contribution. This is the math behind the business; without it, the model is hand-wavy.

**Segments tied to personas.** Each segment links to a real persona from Users group. Disconnect would be a flag.

**Assumptions explicit and testable.** Every assumption has a way to be tested. These become the things to watch as the business grows.

**Detailed numbers kept out.** "Largest fixed cost" / "modest" rather than specific euros. Detailed financial actuals live in personal finance system; the graph holds structure.

## How to adapt

For your business:
1. Start with the value prop — tied to a JTBD
2. List actual revenue streams with rough contribution percentages
3. Split costs fixed/variable; capture unit economics where they exist
4. Tie segments to personas
5. List channels honestly — which actually drive customers, which are noise
6. Identify key resources, activities, partnerships
7. Name testable assumptions

## Common adaptations

**For SaaS:**
- Revenue streams: subscription tiers, usage overage, professional services
- Costs: hosting, COGS, customer success
- Unit economics: CAC, LTV, payback period

**For e-commerce:**
- Revenue: product margins, shipping, subscriptions
- Costs: COGS, fulfillment, marketing
- Unit economics: contribution margin per order, repeat purchase rate

**For consultancies:**
- Revenue: project fees, retainer, productized services
- Costs: salaries (largest variable), tools, overhead
- Unit economics: utilization, margin per engagement

## Sources

- Osterwalder, *Business Model Generation*
- Maurya, *Running Lean*
- EVD-STR-005, EVD-STR-006
