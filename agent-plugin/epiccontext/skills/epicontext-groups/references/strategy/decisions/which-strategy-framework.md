# Decision Tree: Which Strategy Framework?

A dozen strategy frameworks exist because they answer different questions. Picking the wrong one wastes the team's time and produces a polished artifact that doesn't actually inform the decision at hand.

This tree picks the framework based on the **question**, not the framework's prestige.

## Start here

```
├─ Question is about WHERE to compete (market choice)?
│   ├─ "Which markets/segments should we serve?" → Ansoff Matrix
│   ├─ "How attractive is this industry structurally?" → Porter's Five Forces
│   ├─ "Where does the value sit in our value chain over time?" → Wardley Mapping
│   └─ "What macro forces affect this market?" → PESTLE
│
├─ Question is about HOW to compete (positioning, differentiation)?
│   ├─ "How do we position vs. alternatives?" → April Dunford 5+1 (best for B2B tech)
│   ├─ "How do we cross the chasm to mainstream?" → Geoffrey Moore positioning
│   ├─ "What's our value proposition for this customer?" → Strategyzer Value Proposition Canvas
│   └─ "What's our overall strategy theory?" → Roger Martin Playing to Win cascade
│
├─ Question is about THE BUSINESS MODEL (how we make money)?
│   ├─ "What are all the moving parts?" → Business Model Canvas (Osterwalder)
│   ├─ "Early-stage startup with high uncertainty?" → Lean Canvas (Maurya)
│   └─ "What's the unit economics picture?" → CAC/LTV/Payback/Rule of 40
│
├─ Question is about EXECUTION (turning strategy into action)?
│   ├─ "What does success look like, and what do we measure?" → OGSM or OKRs
│   ├─ "How do we sequence work?" → Now/Next/Later (Bastow)
│   └─ "What outcomes do we drive next?" → Outcome-focused roadmap
│
├─ Question is about STRATEGIC HEALTH (current state)?
│   ├─ "What's our strategic state?" → SWOT (with caveats — see below)
│   ├─ "How are we doing on strategic execution?" → Strategy Map / Balanced Scorecard
│   └─ "Are our strategy and operations aligned?" → Hoshin Kanri / X-Matrix
│
└─ Question is about CHOICE (specific decision)?
    ├─ "Build, buy, or partner?" → see decisions/build-vs-buy-vs-partner.md
    ├─ "Focus or expand?" → see decisions/focus-vs-expand.md
    └─ "Now or later?" → see decisions/now-vs-later.md
```

## Framework cheat sheet

### Ansoff Matrix
**Question:** Where should we grow?
**Output:** 2×2 (existing/new market × existing/new product). Four growth options: market penetration, market development, product development, diversification.
**When it shines:** Considering expansion paths.
**Limitations:** Assumes market and product are clean axes; doesn't address how to compete in chosen quadrant.

### Porter's Five Forces
**Question:** How attractive is this industry?
**Output:** Analysis of: rivalry, supplier power, buyer power, threat of substitutes, threat of new entrants.
**When it shines:** Industry-level analysis; deciding whether to enter or exit a market.
**Limitations:** Static (doesn't capture how dynamics evolve); industry-defining is itself a choice; less useful for already-committed-to-this-market situations.

### Wardley Mapping
**Question:** What's evolving and where should we focus?
**Output:** Map with user needs at top, components arranged by value chain (vertical) and evolution stage (horizontal: genesis → custom-built → product → commodity).
**When it shines:** Tech-heavy industries where component evolution affects strategy; build-vs-buy at scale.
**Limitations:** Steep learning curve; mapping is the easy part — making decisions from the map is the hard part.

### PESTLE
**Question:** What macro forces shape our market?
**Output:** Inventory of Political, Economic, Social, Technological, Legal, Environmental factors.
**When it shines:** Long-horizon planning; entering new geographies; regulatory-heavy industries.
**Limitations:** Inventory ≠ insight. Easy to produce, hard to act on.

### April Dunford 5+1 Positioning
**Question:** How should customers think about us?
**Output:** Competitive alternatives, unique attributes, value (so what?), best-fit customers, market category, (optional: trends).
**When it shines:** B2B tech where positioning is the bottleneck for sales/marketing.
**Limitations:** Dunford herself notes the framework is heaviest in B2B tech; consumer brands often lead with category and brand-building over positioning structure.

### Geoffrey Moore Crossing the Chasm
**Question:** How do we move from early adopters to mainstream?
**Output:** Beachhead segment, whole product, positioning statement, distribution.
**When it shines:** Tech products at the inflection point between early adopters and mainstream.
**Limitations:** Specific to disruptive tech adoption curves; not all products follow this pattern.

### Roger Martin Playing to Win
**Question:** What's our strategy theory?
**Output:** Five cascading choices: winning aspiration, where to play, how to win, capabilities required, management systems.
**When it shines:** Senior-level strategic conversations; aligning leadership on coherent theory.
**Limitations:** Abstract; needs translation into operational frameworks (OKRs/OGSM).

### Business Model Canvas
**Question:** What are the moving parts of our business model?
**Output:** 9 blocks: customer segments, value propositions, channels, customer relationships, revenue streams, key resources, key activities, key partnerships, cost structure.
**When it shines:** Mapping existing business or designing new one; communicating model to stakeholders.
**Limitations:** Snapshot, not strategy. Doesn't tell you what's important; everything looks equally weighted.

### Lean Canvas
**Question:** What's the high-uncertainty startup hypothesis?
**Output:** 9 blocks adapted from BMC: problem, solution, key metrics, unique value proposition, unfair advantage, channels, customer segments, cost structure, revenue streams.
**When it shines:** Early-stage ventures with high uncertainty; replaces "key partnerships" with "problem" and "key activities" with "solution" — the things that actually matter pre-PMF.
**Limitations:** Same snapshot critique as BMC.

### OGSM / OKRs
**Question:** What does success look like in this period?
**Output:** Objective, Goals, Strategies, Measures (OGSM); or Objectives + Key Results (OKRs).
**When it shines:** Operationalizing strategy quarterly. OKRs better for outcome teams; OGSM better for stable orgs needing strategy + measure tied together.
**Limitations:** Cargo-cult risk — teams adopt format without changing how they actually decide.

### SWOT
**Question:** What's our strategic situation?
**Output:** Strengths, Weaknesses, Opportunities, Threats.
**When it shines:** Quick group-level conversation starter.
**Limitations:** Often produces consensus-bland inventory rather than strategic insight. Use it as an input, never as the strategy itself.

## When NOT to use a framework

**You already know the answer.** Don't run a SWOT to confirm what the team's been saying for six months. Just decide.

**The decision is reversible and small.** Don't Wardley-map a Friday afternoon experiment.

**Frameworks create paralysis.** "We need to do a competitive analysis first" can be a way of avoiding the decision. Set a time-box: 1 week max for a strategic framework, often 1–2 days is enough.

**Compositing frameworks for prestige.** A 60-slide deck with SWOT + Porter + PESTLE + Ansoff + BMC + OKRs reads as thorough and is usually evidence the team can't pick a lens. Pick one or two; cite the rest as inputs.

## Common failure modes

**Framework as deliverable.** The output is a deck, not a decision.

**No diagnosis before framework.** Rumelt's point: strategy starts with diagnosis. Frameworks are tools to test/refine the diagnosis, not substitute for it.

**Mismatched scope.** Using Porter's Five Forces to decide whether to add a feature. Wrong altitude.

**Cargo cult OKRs.** Output-flavored "key results" (ship 5 features) that aren't outcomes (lift activation by 15%). Process is performed; thinking isn't done.

**Strategic ritual replacing strategic thinking.** Annual offsite produces SWOT slides; team returns to the same execution. The format consumed the substance.

## Quick guide

| If you're asking... | Use |
|---------------------|-----|
| "Should we enter this market?" | Porter's Five Forces + Wardley |
| "How do we position?" | Dunford 5+1 (B2B tech) or Moore (chasm-crossing) |
| "What's our growth path?" | Ansoff Matrix |
| "How does our business work?" | BMC (mature) or Lean Canvas (early-stage) |
| "What's our strategy?" | Roger Martin Playing to Win |
| "What does success look like Q3?" | OGSM or OKRs |
| "Where to focus next?" | Now/Next/Later |
| "What macro forces are coming?" | PESTLE |
| "What's our strategic situation?" | Use as input, not output: light SWOT into a strategy choice |

## Sources

- Roger Martin & A.G. Lafley — *Playing to Win* (2013)
- Richard Rumelt — *Good Strategy / Bad Strategy* (2011)
- Michael Porter — *Competitive Strategy* (1980); *What is Strategy?* (HBR 1996)
- Simon Wardley — *Wardley Mapping* (Medium / Creative Commons book)
- April Dunford — *Obviously Awesome* (2019); *Sales Pitch* (2023)
- Geoffrey Moore — *Crossing the Chasm* (3rd ed., 2014)
- Alex Osterwalder — *Business Model Generation* (2010); *Value Proposition Design* (2014)
- Ash Maurya — *Running Lean* (2nd ed., 2012)
- John Doerr — *Measure What Matters* (2018) — OKRs
- Janel Bastow — Now/Next/Later format (ProdPad, 2012)
- Paweł Huryn — *PM Skills Marketplace* (phuryn/pm-skills) — operational implementations
- Anthropic Knowledge Work Plugins — competitive-analysis skill (operational baseline)

## Related

- `../entities/strategy.md` — strategy as artifact
- `../entities/business-model.md` — model artifact
- `../entities/ogsm.md` — execution layer
- `../decisions/build-vs-buy-vs-partner.md`, `focus-vs-expand.md`, `now-vs-later.md` — specific choices
