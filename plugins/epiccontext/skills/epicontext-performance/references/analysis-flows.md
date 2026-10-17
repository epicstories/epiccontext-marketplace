# Analysis Flows — Performance Group

## Flow 1: Diagnose

### A. Diagnose from the graph

Common Performance diagnoses:

**Vanity metrics on the dashboard** — KPIs without OGSM linkage.
- Pull all KPIs. Check linked_ogsm_measure. Empty → vanity candidate.
- Often these are tracked because they're easy to measure, not because they matter.
- Decision: drop or connect to a strategic measure.

**Measurement gaps** — OGSM Measures with no instrumentation.
- Pull OGSM (Strategy group). For each Measure, check if a KPI exists.
- Measures without KPIs are strategic blind spots.
- Often analytics is missing the underlying events.

**Feedback graveyards** — Channels collecting signals nobody acts on.
- Pull feedback entity. Check action_loop for each channel.
- "We collect NPS" without "and act on it" is a graveyard.
- Look for old signals never categorized, never triaged.

**Dashboard drift** — Reports that nobody actually looks at.
- For each KPI, check `last_reviewed`. Long-stale KPIs are dashboard drift.
- Either the KPI has lost relevance (sunset it) or nobody's accountable (assign owner).

**AEO blind spot** — No measurement of AI search visibility.
- For projects where AI search is becoming a customer touchpoint, having no AEO measurement at all is a gap.
- Note: AEO methodology is new; basic visibility tracking is more important than sophisticated measurement.

### B. Diagnose from raw input

Inputs: dashboard exports, NPS export, support ticket batch, AEO query results.

Process:
1. Aggregate raw signals; categorize using customer_insight scheme
2. Cross-reference against existing KPIs and OGSM measures
3. Flag gaps (signals that don't correspond to anything tracked) and drift (KPIs moving in unexpected ways)

### Evidence-sufficiency gates

Before declaring a Performance diagnosis:
- [ ] Multiple measurement points (not single week)
- [ ] Compared to baseline (else "performance" is meaningless)
- [ ] Tested against alternative explanation (was this seasonal? a one-off campaign? a feature change?)
- [ ] Connected to specific KPIs and OGSM links

## Flow 2: Summarize

Three audience formats:

**Internal:** Quick state. Under 100 words. Top KPI status, key signal, next action.

**Team:** State of measurement. 200-350 words. KPIs hitting/missing, key feedback patterns, recommended action. Include numbers AND interpretation — raw numbers without context mislead.

**Client:** 1-2 pages. Numbers, interpretation, what's going well, what isn't, recommended action. Always include comparison to baseline and target. Honesty about misses is what builds credibility — papering over failures destroys it.

## Flow 3: Recommend action

Default: recommend ONE action, explain why, name tradeoffs.

Performance recommendations split into types:

**Add measurement** — instrument something that's currently a blind spot. Cost: engineering time to instrument; risk: cargo-cult if done without strategic anchor.

**Stop measuring** — sunset a vanity metric or stale KPI. Cost: stakeholder discomfort; benefit: dashboard signal-to-noise improves.

**Change target** — raise (because performance is consistently above) or lower (because target was unrealistic). Cost: optics, especially if lowering; benefit: targets that match reality drive better decisions.

**Change cadence** — review more often (when fast change matters) or less often (when noise dominates). Common: monthly is too rare for fast-moving metrics, too frequent for slow-moving ones.

**Close a feedback loop** — go from collecting signal to acting on it. Cost: triage time; benefit: customers see their feedback matter.

Match recommendation size to evidence strength.

## Red Flags

**🚩 About to add a new KPI without OGSM linkage.**
Stop. New metrics need strategic justification. If you can't trace it to OGSM, it's decoration.

**🚩 Recommending action from one week of data.**
Stop. Most metrics are noisy at one-week resolution. Need at least 4-8 weeks for meaningful signal on most consumer metrics.

**🚩 Performance "improvement" claim without checking baseline.**
Stop. "X went up 15%!" — from what? Baseline matters or the claim is meaningless.

**🚩 Vanity metric being defended because "stakeholders look at it."**
Stop. Stakeholders looking at the wrong thing is the problem to solve, not a justification.

**🚩 Feedback signal treated as insight without triangulation.**
Stop. Single signals are stubs (use customer_insight maturity discipline). Don't escalate.

**🚩 AEO recommendation based on one quarter of vendor research.**
Stop. AEO methodology is new. Treat findings directionally. Don't restructure content strategy on Yext or any other single source.

**🚩 NPS treated as the only CX measure.**
Stop. NPS has documented limitations. Triangulate with other signals (reviews, support tickets, behavioral metrics).

**🚩 About to recommend a dashboard rebuild.**
Stop. Dashboards rarely solve measurement problems. Usually the issue is upstream (missing instrumentation, missing KPI definitions, no action loop). Fix upstream first.

**🚩 Hedging language doing the work of evidence.**
Stop. "Some metrics may potentially be trending in a direction that could indicate…" — be specific or be silent.

## When to refuse

- Performance "review" requested without access to actual data
- Recommendations to add KPIs without ties to OGSM
- AEO claims requested without verifiable methodology
- Dashboard recommendations without diagnosing whether the dashboard is the actual problem

Honest output: "Not enough evidence at this confidence level. Here's what we'd need: [list]."

---

## Cross-group considerations

Performance-group signals (KPI shifts, AEO visibility, feedback synthesis) are the most likely to mislead in isolation. A metric movement means very different things depending on what it's connected to in the rest of the graph. See `../../../ANALYSIS.md` for the full method.

**Signals that typically originate here:**
- KPI dropping, plateauing, or surprising
- AI search visibility (AEO) shifting
- Feedback (NPS, reviews, AI mentions) trending
- A/B test result that contradicts qualitative belief
- Funnel drop-off at a specific step

**Pull from these groups before judging:**
- **Strategy + OGSM:** is this measure on a current objective? If not, the "drop" might be irrelevant. If yes, it's high-stakes.
- **Users (persona, JTBD):** which segment is moving? Target persona drop is different from non-target persona drop.
- **Brand:** does messaging match what's being measured? (Voice misalignment shows up as engagement loss)
- **Product (feature, IA):** which features feed this metric? Which IA path leads here?
- **Build:** recent infrastructure changes? Performance regression that explains a behavioral metric?

**Trade-off types specific to this group:**
- Real problem vs vanity metric (does the metric trace to an OGSM measure?)
- Fix the metric vs fix what it measures (gaming numbers vs improving the underlying)
- Quant signal vs qual signal (when they disagree, which is right?)
- Lead vs lag indicators (see `decisions/lead-vs-lag-indicator.md`)
- Investigate vs accept (small movements often noise; large movements demand traversal)

**Default classification questions:**
- Is this measure on an OGSM? (If not — should we still be tracking it?)
- Was this drop intentional? (Strategic shift, deprecation, infrastructure change?)
- Which persona segment is moving? (Aggregate metrics hide segment dynamics)
- Does qualitative feedback corroborate? (Or contradict — both are signals)
- Is the action loop documented? (If no — collecting data without learning)
