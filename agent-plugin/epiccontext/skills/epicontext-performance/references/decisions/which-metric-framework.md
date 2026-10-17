# Decision Tree: Which Metric Framework?

Several frameworks claim to organize what to measure: North Star, OKRs, OGSM, Pirate Metrics (AARRR), Balanced Scorecard, HEART, Lean Analytics. Each has a sweet spot. Picking wrong produces dashboards nobody trusts and metrics that don't drive decisions.

This tree picks the framework based on what you're trying to accomplish, not which framework is trendiest.

## Start here

```
├─ You need ONE metric to align the company on?
│   → North Star Metric
│
├─ You need quarterly goals tied to ambitious objectives?
│   → OKRs (Objectives and Key Results)
│
├─ You need a strategy + execution layer in one document?
│   → OGSM (Objectives, Goals, Strategies, Measures)
│
├─ You need to map the customer lifecycle and where to focus?
│   → Pirate Metrics (AARRR: Acquisition, Activation, Retention, Referral, Revenue)
│
├─ You need user-experience metrics specifically?
│   → HEART (Happiness, Engagement, Adoption, Retention, Task success)
│
├─ You need to align strategy across financial, customer, internal, and learning dimensions?
│   → Balanced Scorecard
│
└─ You're a startup with no business model yet?
    → Lean Analytics one-metric-that-matters by stage
```

## Framework cheat sheet

### North Star Metric (Sean Ellis, popularized by Amplitude/Mixpanel)

**What it does:** Identifies a single metric that captures the value the product delivers to customers — and predicts long-term company growth.

**Format:** "Weekly Active Conversationalist," "Monthly Connected Hosts," "Nights Booked." A leading-indicator metric that's customer-value-aligned.

**Sweet spot:** Product-led companies that need org-wide alignment. Eliminates KPI sprawl. Allows decentralized decision-making (every team can ask "does this move our North Star?").

**Limitations:** Reductive — can mask negative effects on other dimensions. Pair with guardrails. Choosing the wrong North Star (e.g., a vanity metric) is worse than no North Star.

**Test:** A North Star should pass three checks: (1) does this represent customer value, (2) does it predict business value, (3) is it actionable by teams?

### OKRs (Objectives and Key Results)

**What it does:** Set ambitious objectives and 3-5 measurable key results per objective. Quarterly cycle. Score 0.0-1.0 at end; 0.7 = success in classic Doerr framing.

**Sweet spot:** Knowledge-work organizations needing alignment + autonomy. Companies wanting stretch goals (where 100% completion suggests insufficient ambition).

**Limitations:** Cargo cult risk — orgs adopt format without changing how they decide. Output-flavored "key results" (ship 5 features) miss the point; outcomes (lift activation by 15%) is the goal. Conflating with performance reviews destroys ambition (people sandbag).

**Test:** Every key result must be measurable with a target value and date. If you can't tell if you hit it or not, it's not a KR.

### OGSM (Objectives, Goals, Strategies, Measures)

**What it does:** One objective (qualitative, aspirational), 3-6 goals (quantitative outcomes), 3-6 strategies (how we'll achieve goals), 3-6 measures per strategy. Originated 1950s Japan, formalized at P&G.

**Sweet spot:** Stable organizations needing strategy + execution in one document. Less ambitious than OKRs (closer to "commit to deliver this") but more strategic than KPI dashboards.

**Limitations:** Static — annual or quarterly cycle is too slow for fast-changing markets. Less flexibility than OKRs for emergent strategy.

**Test:** Pyramid logic must hold: each goal supports the objective; each strategy supports a goal; each measure tracks a strategy.

### Pirate Metrics — AARRR (Dave McClure)

**What it does:** Maps the customer lifecycle into 5 stages: Acquisition (visitors), Activation (first valuable experience), Retention (came back), Referral (told others), Revenue (paid). Identifies where the bottleneck is.

**Sweet spot:** Early-to-growth-stage SaaS, marketplaces, consumer apps. When you don't yet know which stage to focus on.

**Limitations:** Designed for B2C funnel-style products. Less applicable to B2B enterprise (long sales cycles, multiple decision-makers) or hardware/services. The order isn't always linear.

**Test:** Each metric should answer "what % of users in this stage move to the next?" Conversion rates, not absolute numbers.

### HEART (Google's UX framework)

**What it does:** Five UX metric categories: Happiness (subjective satisfaction), Engagement (depth of use), Adoption (new users), Retention (return rate), Task success (completion rate, errors, time).

**Sweet spot:** Product UX teams measuring experience quality. Complement to business metrics.

**Limitations:** Each category needs a specific metric (e.g., Happiness → CSAT, NPS, attitudinal surveys). The framework names categories, not specific metrics — implementation is where it's earned or lost.

**Test:** For each H-E-A-R-T category, you should have a specific metric, a baseline, and a target.

### Balanced Scorecard (Kaplan & Norton)

**What it does:** Aligns measurement across four perspectives: Financial, Customer, Internal Business Processes, Learning & Growth. Originally for executive dashboards.

**Sweet spot:** Large organizations needing executive-level multi-dimensional view. Public sector and non-profits where financial isn't the primary mission.

**Limitations:** Heavy. Often becomes a quarterly reporting burden disconnected from operational decisions. The four perspectives can ossify.

**Test:** Each perspective has 3-5 measures with strategic objectives, targets, and initiatives. If it's just numbers without "so what," you have a dashboard, not a scorecard.

### Lean Analytics one-metric-that-matters (OMTM)

**What it does:** Identifies, for each stage of a startup (empathy, stickiness, virality, revenue, scale), the ONE metric that matters. As you progress through stages, the OMTM changes.

**Sweet spot:** Startups pre-PMF or in early traction. Forces focus.

**Limitations:** Stage diagnosis is itself hard; teams often pick the wrong stage. Requires re-evaluating the OMTM as the company grows.

**Test:** Every meeting, every decision, every prioritization should reference the OMTM. If teams don't, it's not actually the OMTM.

## When to use multiple frameworks

**North Star + OKRs.** North Star at company level for alignment; OKRs at team level for execution. Common combination. Each team's OKRs ladder up to moving the North Star.

**Pirate Metrics + HEART.** Pirate Metrics for funnel stage diagnosis; HEART within each stage for UX quality. AARRR tells you where to focus; HEART tells you what's broken in that stage.

**OGSM + KPI dashboard.** OGSM as the strategy document (annual/quarterly); KPI dashboard as the operational view (daily/weekly).

## When NOT to use a framework

**Premature OKRs.** A 3-person team writing 5 objectives × 4 KRs = 20 measurable goals. Nothing actually gets done. Use simpler tracking until headcount justifies OKR overhead.

**North Star without clarity on what business model means by "value."** Pre-PMF companies sometimes pick a North Star that turns out to be a vanity metric. Lean Analytics OMTM may serve better at this stage.

**Balanced Scorecard for a 30-person startup.** Heavyweight reporting framework crushes small teams.

**Adding a framework because "we need metrics."** No framework saves you from the bigger problem: not knowing what success looks like. Get clarity on the goal first; then pick a framework to operationalize.

## Common failure modes

**Vanity North Star.** "Total registered users" — goes up forever, doesn't reflect engagement, doesn't predict revenue.

**OKRs as project list.** Key results that are deliverables ("Launch X, Ship Y, Build Z") instead of outcomes. The whole point is measurability of impact, not completion of tasks.

**OGSM as wallpaper.** Document exists; nobody references it during quarterly decisions. Symptom of strategy theater.

**HEART without instrumentation.** Categories named; no specific metrics defined; no data collected. The categories are the easy part.

**AARRR with no funnel data.** "Our acquisition is 10,000/month" without conversion to activation. The number alone doesn't tell you anything.

**Balanced Scorecard quarterly review with no actions.** Show the dashboard, nod, return to operations. Not a balanced scorecard — a dashboard with extra steps.

## Quick guide

| You're trying to... | Use |
|---------------------|-----|
| Align the org on one number | North Star Metric |
| Set ambitious quarterly goals | OKRs |
| Combine strategy + execution | OGSM |
| Find your funnel bottleneck | Pirate Metrics (AARRR) |
| Measure UX quality | HEART |
| Multi-dimensional executive view | Balanced Scorecard |
| Focus a startup pre-PMF | Lean Analytics OMTM |
| Operational daily/weekly tracking | KPI dashboard (any framework's metrics) |

## Sources

- Sean Ellis & Morgan Brown — *Hacking Growth* (2017) — North Star framework
- John Doerr — *Measure What Matters* (2018) — OKRs
- Andy Grove — *High Output Management* (1983) — original OKRs at Intel
- Christina Wodtke — *Radical Focus* (2nd ed., 2021) — OKRs in practice
- Dave McClure — Pirate Metrics (2007 talk; viral slideshare deck)
- Kerry Rodden et al. (Google) — [HEART framework paper (CHI 2010)](https://research.google/pubs/pub36299/)
- Robert Kaplan & David Norton — *The Balanced Scorecard* (1996)
- Alistair Croll & Benjamin Yoskovitz — *Lean Analytics* (2013) — OMTM by stage
- OGSM origin: 1950s Japan; formalized at P&G under A.G. Lafley
- Anthropic Knowledge Work Plugins / performance-analytics — operational reference
- Paweł Huryn — phuryn/pm-skills metrics-dashboard, north-star-metric (operational templates)

## Related

- `../entities/kpi.md` — KPI as artifact (any framework's measures live here)
- `../entities/kpi.md (experiment sub-form)` — testing whether a metric movement is causal
- `../entities/feedback.md` — qualitative complement to quantitative metrics
- `../../strategy-group/references/entities/ogsm.md` — Strategy group's OGSM (cross-reference)
