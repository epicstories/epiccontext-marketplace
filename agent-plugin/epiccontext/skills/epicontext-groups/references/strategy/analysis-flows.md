# Analysis Flows — Strategy Group

Three flows: diagnose, summarize, recommend. Strategy-specific.

## Flow 1: Diagnose

### A. Diagnose from the graph

Common diagnoses:

**Strategy-execution drift** — Current work doesn't trace to strategy.
- Pull all roadmap items; check linked_strategies. Items without strategic linkage are flags.
- Pull all features (Product group); cross-reference to roadmap. Features being built that aren't on roadmap are unsanctioned work.
- Pull strategy itself; check date of last review. Stale strategy is also a form of drift.

**OGSM failure modes** — Goals without numbers, measures not tracked, cascade breaks.
- Pull OGSM; check each Goal has a number and date. Each Measure has a data source.
- Trace each Measure upward — does it actually serve its Strategy? Each Strategy serve its Goal?

**Business model assumptions untested** — Listed assumptions, no testing recorded.
- Pull business model; check `assumptions_to_test` field. Items not yet tested after 6+ months are stale.

**Roadmap inflation** — Too many items in Now.
- Pull roadmap; count items in current horizon. >5-7 items in Now is overcommitment.

### B. Diagnose from raw input

Inputs: strategy decks, leadership memos, planning workshops, board minutes.

Process:
1. Extract candidate entities (objectives → OGSM, decisions → business cases, etc.)
2. Test against existing strategy: does new input confirm, refine, or contradict?
3. Surface contradictions explicitly — they're the most valuable signals.

### Evidence-sufficiency gates

Before declaring a strategy diagnosis:
- [ ] Multiple signals across multiple entities or time periods
- [ ] Tested against alternative explanation (is this drift, or is the strategy itself wrong?)
- [ ] Connected to specific affected items (strategy, OGSM Goal, roadmap item)
- [ ] Recent enough that current state is reflected (no 12-month-old assumptions claimed current)

If gates fail, the honest output is "tentative finding."

## Flow 2: Summarize

Three audience formats (same as other groups). Strategy summaries have specific cadences:

**Internal:** Used during quarterly planning, monthly check-ins. Under 100 words. Bet, current state, key signal, next move.

**Team:** Used at strategy reviews, all-hands, planning sessions. 200-350 words. The bet, what's working, what's not, recommended adjustment.

**Client:** Used in strategic reviews, partnership conversations. 1-2 pages. The strategy, the operating frame (OGSM), what we're declining, what's at stake. Always include "what would change our mind" — it's the integrity of strategic thinking.

## Flow 3: Recommend action

Default: recommend ONE action, explain why, name tradeoffs.

Strategy recommendations have a special calibration scale:

**Smallest — adjust roadmap sequence.** Defer item, accelerate item, swap items. Reversible within a quarter.

**Medium — revise OGSM.** Add a Strategy, change a Measure, raise/lower a Goal. Reversible at quarterly review.

**Larger — revise business model.** New revenue stream, change pricing, sunset a customer segment. Multi-quarter implications.

**Largest — revise strategy itself.** New audience, new mechanism, abandoned bet. Years of implication; rarely correct.

Match recommendation size to evidence strength. Tentative diagnosis → smallest reasonable change. High-confidence diagnosis → can scale up if needed, but bias toward smaller-reversible always.

## Red Flags

**🚩 About to recommend "pivot strategy" from a quarter of mediocre data.**
Stop. Strategy pivots have huge cost. Most underperformance is execution drift or OGSM mis-calibration, not strategic error. Check those before recommending strategy revision.

**🚩 OGSM "rewrite" recommendation that loses prior measure history.**
Stop. New OGSMs that drop old measures lose the ability to compare. Refine within the existing frame where possible; rewrite only when the refinement isn't possible.

**🚩 "We should pursue [new market]" without showing what gets declined.**
Stop. Adding a market means deferring something else. Strategy is choices. If the recommendation doesn't name what we're not doing, it's not a strategic recommendation.

**🚩 Business case missing alternatives.**
Stop. A business case without alternatives is a sales pitch. Generate at least 2-3, including do-nothing.

**🚩 Recommendation built from one stakeholder's strong opinion.**
Stop. Strong opinions are useful inputs, not evidence. Triangulate.

**🚩 About to declare strategy "validated" because nothing has gone wrong yet.**
Stop. Strategy is validated when assumptions have been tested and held, OR when major events have hit and the strategy adapted successfully. Absence of disaster is not validation.

**🚩 Roadmap item in Now without OGSM linkage.**
Stop. Why is this work happening? If the answer isn't a Strategy in OGSM, either the OGSM is missing something, or the work shouldn't be in Now.

**🚩 Hedging language doing the work of evidence.**
Stop. "We might want to consider potentially adjusting…" is confidence-laundering. State the diagnosis directly or state the uncertainty directly.

**🚩 Premortem skipped on a major decision.**
Stop. Before approving a large bet, ask: "Imagine this failed. Why did it fail?" The answer surfaces risks the optimistic case missed.

## When to refuse to analyze

- Strategy "review" requested without access to actual evidence (analytics, customer research, market data)
- "Pivot recommendation" requested without testing existing strategy first
- Roadmap rebuild requested as a workshop output without OGSM link
- Business case requested for a decision already made

Honest output: "Not enough evidence at this confidence level. Here's what we'd need: [list]."

---

## Cross-group considerations

Strategy-group signals (OGSM at risk, competitor moves, business model strain) decide what counts as a "real" problem in the other groups. Strategy is where trade-offs ultimately resolve. See `epicontext-analysis/ANALYSIS.md` for the full method.

**Signals that typically originate here:**
- OGSM measure trending below target with quarter ending
- Competitor launches a product or makes a move
- Business model showing strain (margin compression, customer concentration, funnel cost)
- New market opportunity surfaced
- Stakeholder pressure to "do something" about a perceived gap

**Pull from these groups before judging:**
- **Users (personas, JTBDs, customer insight):** is the persona shifting? Are JTBDs evolving? Is the "competitor threat" actually serving a different JTBD than we serve?
- **Performance KPIs:** does the data confirm the strategic concern, or is it stakeholder anxiety?
- **Brand positioning:** does the proposed strategic response erode positioning, or sharpen it?
- **Build / Roadmap:** can we deliver if we pivot? At what cost?
- **Product overview + features:** does the strategic shift require product changes, or is it a positioning/messaging shift?

**Trade-off types specific to this group:**
- Stay course vs pivot (cost of being wrong in either direction)
- Match competitor vs hold differentiation (strategic discipline as default)
- Double down on what's working vs hedge with optionality
- Serve adjacent persona vs preserve focus
- Now vs later (timing as strategy choice — see `decisions/now-vs-later.md`)

**Default classification questions:**
- Is the signal real, or stakeholder-noise driven? (Check Performance + Users first)
- Does the proposed response serve our bet, or theirs? (Strategic discipline default)
- What does the bet say should happen here? (If it's tracking the bet, "intentional" not "problem")
- What would have to be true for the response to be wrong? (Reversal condition)
