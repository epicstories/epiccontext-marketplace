# Example: Positioning for Services-Led Brand

A positioning entity for a wellness service business demonstrating Dunford's approach.

```yaml
id: positioning
type: positioning
maturity: drafted
last_reviewed: 2026-04-30

competitive_frame:
  category: "Recurring wellness studio"
  alternatives_considered:
    - competitor-premium-chain-x
    - competitor-independent-therapists
    - competitor-self-care-default
  primary_persona: persona-recovering-rachel

statement: "We're the recurring wellness studio for working professionals who want the same trusted therapist every visit, unlike premium chains where any therapist could be available, and unlike independent practitioners who are hard to book reliably. We win by combining provider continuity with frictionless booking."

we_win_on:
  - dimension: "Provider continuity"
    evidence: "Q1 2026 customer research: 100% of regulars name this as the top criterion"
    note: "Premium chains structurally can't match this; independents do but lose on convenience"
    
  - dimension: "Booking convenience while preserving relationship"
    evidence: "User testing shows we're 3x faster than independent-therapist booking"
    
  - dimension: "Quality consistency at small scale"
    evidence: "Operational quality bar at max 3 locations through 2027"

we_dont_compete_on:
  - dimension: "Number of locations"
    note: "Premium chains will always have more"
    
  - dimension: "Price (lowest)"
    note: "Slight premium aligned with quality positioning"
    
  - dimension: "Same-day availability"
    note: "Operational quality cost too high; not aligned with positioning"
    
  - dimension: "Service variety / breadth"
    note: "Specialized in core treatments; we don't offer tangential services"

unique_mechanism: "Therapist-relationship-first booking flow + max 3-location quality ceiling"

linked_vision: vision
linked_strategy: strategy-services-led-quality
linked_personas: [persona-recovering-rachel]
linked_competitors:
  - competitor-premium-chain-x
  - competitor-independent-therapists
  - competitor-self-care-default
linked_messaging: messaging
```

## What this example demonstrates

**The competitive frame is broad.** Includes premium chains (direct), independent therapists (substitute), and self-care/doing-nothing (indirect). Most positioning errors come from too narrow a competitive frame.

**The statement uses Dunford's structure.** Category for audience who want X, unlike alternatives that limitation, we mechanism. Clear, falsifiable, competitive.

**Win-on dimensions have evidence.** Not "we say we're better at X" — actually better, with research backing.

**Don't-compete-on dimensions are explicit.** This is what makes it positioning rather than aspiration. Naming what we don't compete on is what gives positioning teeth.

**Mechanism is specific.** Two concrete things, not "great service." Each could be tested.

## How to adapt

For your project:
1. Identify the competitive frame — including substitutes and indirects
2. Find dimensions that matter to customers (research-driven)
3. Identify which dimensions you genuinely win (evidence-backed)
4. Name what you don't compete on (this is the hardest part)
5. State the unique mechanism specifically

## Common adaptations

**For B2B SaaS:**
- Category often more contested (many tools claim same category)
- Win-on dimensions usually around integration depth, vertical specialization, or workflow fit
- Don't-compete-on often includes feature breadth, lowest price

**For e-commerce brands:**
- Category framed by use occasion or customer mindset
- Win-on usually around design language, sustainability, sourcing, or specific use case
- Don't-compete-on often includes selection breadth, lowest price, mass appeal

## Sources

- Dunford, *Obviously Awesome* (the foundational source)
- EVD-BRD-001 — Positioning is the most leveraged brand decision
- EVD-BRD-004 — Specific positioning beats generic
