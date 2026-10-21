# KPIs & Measurement

Per discipline, split into **leading** (predict outcomes, act early), **lagging** (confirm results), **vanity** (refuse — move regardless of success), and **decision-driving** (what actually informs a call). Mirrors the Performance group's leading-vs-lagging discipline (`epicontext-groups/references/performance/decisions/lead-vs-lag-indicator.md`).

> **Golden rule:** measure **clicks/conversions (not impressions)** and **AI mention/citation share**; **incrementality-test all automation.** Tracked ≠ improved.

---

## SEO (Organic)

| Class | Metrics |
|---|---|
| **Leading** | rankings/positions, indexation, CWV pass rate, content velocity, referring domains earned |
| **Lagging** | organic **clicks** (not impressions), organic conversions, assisted revenue |
| **Vanity — refuse** | impressions (especially 2025+, EVD-SO-028), keyword counts, Domain Authority in isolation |
| **Decision-driving** | clicks, conversions, revenue per page |

Why impressions are vanity now: 2025 GSC pollution (&num=100 exploit killed Sept 12 2025; logging error since May 13 2025) + the Great Decoupling (impressions rise with AIO presence while clicks fall). Clicks/GA4 sessions/conversions stay clean.

---

## SEA (Paid Search)

| Class | Metrics |
|---|---|
| **Leading** | Quality Score *components* (expected CTR, ad relevance, landing-page experience), impression share, search-term relevance, CTR |
| **Lagging** | CPA, ROAS, conversion volume, **incremental ROAS (iROAS)** |
| **Vanity — refuse** | raw clicks/impressions, **blended ROAS** (inflated by brand) |
| **Decision-driving** | iROAS, new-customer CPA, profit |

- Optimize Quality Score's *inputs*, never the 1–10 number itself (EVD-SO-010).
- Always report **iROAS** for branded spend — median is ~0.70x, below breakeven (EVD-SO-014). Blended ROAS hides this.

---

## GEO / AEO (no clean analytics yet — use a basket)

No single clean metric exists; track a basket and re-audit monthly.

- **Mention rate** — % of relevant prompts where the brand appears.
- **Share of voice** — your mentions vs competitors in AI answers.
- **Citation rate / citation share** — % of relevant AI responses citing your content.
- **Citation accuracy / sentiment** — is the AI describing you correctly and positively?
- **AI-referral traffic & conversions** — GA4 custom channel; supplement with post-purchase surveys (AI influence is often mis-attributed to branded organic).
- **Branded search volume trend** — a proxy for growing AI influence even when referral isn't directly visible (EVD-SO-016).

| Class | Metrics |
|---|---|
| **Leading** | mention rate, citation share, earned mentions, YouTube presence |
| **Lagging** | AI-referral conversions, branded-search lift |
| **Vanity — refuse** | a raw "AI visibility score" with no action attached |

**Measurement caveats baked in:** 40–60% of AI responses lack visible attribution; much AI traffic shows as "direct" (referral header stripped); small denominators make %s volatile (EVD-SO-022). Prefer tools that surface the actual cited URLs (actionable) over those that only emit a score.

---

## Where these live in the graph

- SEO/SEA/GEO targets → **`kpi`** blocks (Performance group), each with owner, target, cadence, and — where relevant — an **experiment** (A/B, geo-holdout). Trace every KPI to an OGSM measure.
- The AI prompt library + mention/citation tracking → a **`feedback`** block on channel `aeo` (Performance group). See `epicontext-groups/references/performance/examples/aeo-tracking-setup.md`.
- AI-referral GA4 channel definition → an **`analytics`** block.
