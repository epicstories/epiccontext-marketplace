# Evidence Library — Performance Group

Cited data points for measurement, KPI, and feedback decisions. Includes the AEO/AI search visibility sources held back from earlier groups.

---

## Measurement principles

### EVD-PER-001 — Vanity metrics vs. actionable metrics
- **Claim:** Croll & Yoskovitz: actionable metrics tie to specific decisions; vanity metrics make people feel good without informing action. Total registered users is usually vanity; weekly active users tied to a feature is usually actionable.
- **Source:** Alistair Croll & Benjamin Yoskovitz — *Lean Analytics* (2013)
- **Citation:** Croll & Yoskovitz, *Lean Analytics: Use Data to Build a Better Startup Faster*
- **Used in:** kpi, decisions/measure-or-not

### EVD-PER-002 — Leading vs. lagging indicators
- **Claim:** Lagging indicators measure outcomes (revenue, retention); leading indicators predict outcomes (active usage, time-to-first-value). Healthy measurement systems track both — leading lets you act early; lagging confirms results.
- **Source:** Norton & Kaplan — *Balanced Scorecard*; widely adopted in management accounting
- **Citation:** Norton & Kaplan, *The Balanced Scorecard*
- **Used in:** kpi, decisions/leading-vs-lagging

### EVD-PER-003 — One Metric That Matters principle
- **Claim:** Croll & Yoskovitz: at any given stage, one metric should dominate team focus. Multiple "primary" metrics dilute attention. The OMTM evolves as the project does.
- **Source:** Croll & Yoskovitz — *Lean Analytics*
- **Citation:** Croll & Yoskovitz, *Lean Analytics*
- **Used in:** kpi

---

## Voice of customer

### EVD-PER-004 — NPS limitations and proper use
- **Claim:** NPS (Reichheld 2003) is useful as a directional retention signal but unreliable as the sole CX measure. Subject to cultural variation (Europe vs. US scoring norms differ); subject to selection bias (engaged customers respond more); not predictive at low N.
- **Source:** Frederick Reichheld (original); Marketing Science Institute critiques
- **Citation:** Reichheld, "The One Number You Need to Grow" (HBR, 2003); various academic critiques
- **Caveat:** NPS is widely used; its limitations are also widely documented. Use as one signal, not the only one.
- **Used in:** feedback, kpi

### EVD-PER-005 — VoC programs need explicit action loops
- **Claim:** McKinsey research: most VoC programs fail not because data isn't collected but because there's no documented action loop from signal → response. Programs with named owners and review cadences outperform.
- **Source:** McKinsey & Company
- **Citation:** [McKinsey — Prediction: The Future of CX](https://www.mckinsey.com/capabilities/growth-marketing-and-sales/our-insights/prediction-the-future-of-cx)
- **Used in:** feedback
- **Cross-reference:** Same source as EVD-USR-011 (Users group)

---

## AEO / AI search visibility

### EVD-PER-006 — 86% of AI citations from brand-managed sources
- **Claim:** Yext analyzed 6.8 million AI citations across ChatGPT, Gemini, and Perplexity (July-August 2025) across 1.6 million queries per model. Found that 86% of citations come from sources brands already control, such as websites and listings.
- **Source:** Yext, "AI Citations" research (October 2025)
- **Citation:** [Yext — AI Citations Research](https://www.yext.com/about/news-media/ai-citations-release)
- **Methodology:** 6.8 million AI citations collected from 1.6 million queries per model across ChatGPT, Gemini, and Perplexity between July 1 and August 31, 2025. Queries structured to test four intent quadrants (branded/unbranded × objective/subjective) across four industries: retail, financial services, healthcare, and food service.
- **Caveat:** Yext is a commercial AI visibility platform — primary-source research with commercial interest. Methodology and scale are credible; treat conclusions as directional and verify against independent studies as they emerge.
- **Used in:** feedback (AEO section)

### EVD-PER-007 — Verification behavior after AI recommendation
- **Claim:** Only 6.7% of AI users act on a recommendation without doing any additional research. The other 93% take at least one more step, searching Google, visiting the brand's website, clicking through the AI's cited sources, or checking reviews. Verification rates are nearly identical across trust levels — high-trust users verify almost as often as neutral users.
- **Source:** Yext consumer survey (n=1,120 US consumers)
- **Citation:** [Yext — Search Is Everywhere](https://www.yext.com/blog/search-is-everywhere-so-are-winning-brands)
- **Implication:** AI recommendation is not the finish line. Brand discoverability across all surfaces (website, listings, reviews) still determines conversion.
- **Caveat:** Single-vendor research; US-only sample; treat as directional.
- **Used in:** feedback (AEO section), brand (positioning)

### EVD-PER-008 — Different AI models source differently
- **Claim:** Each model sources its responses differently. Sometimes dramatically so. ChatGPT, Gemini, Claude, and Perplexity each weight different source types differently — implying that AI visibility is multi-channel, not single-channel.
- **Source:** Yext AI Citation Research (analyzed 17.2 million citations)
- **Citation:** [Yext — Search Is Everywhere](https://www.yext.com/blog/search-is-everywhere-so-are-winning-brands)
- **Caveat:** Vendor research. Treat the directional finding (different models source differently) as more reliable than specific percentages.
- **Used in:** feedback

### EVD-PER-009 — Profile completeness and freshness drive ranking
- **Claim:** What the higher-ranking brands had in common wasn't better star ratings. Managed brands averaged slightly lower star ratings (3.57) than their unmanaged counterparts (3.82), yet still ranked higher. The signal was profile completeness, data freshness, and active synchronization — not sentiment.
- **Source:** Yext Elo research (21.6 million Google search results)
- **Citation:** [Yext — Search Is Everywhere](https://www.yext.com/blog/search-is-everywhere-so-are-winning-brands)
- **Implication:** For the wellness business specifically — making sure listings (Google Business Profile, etc.) are complete and current matters more than chasing perfect ratings.
- **Used in:** feedback, brand

### EVD-PER-010 — AI search adoption is rapid but not yet universal
- **Claim:** Yext + Researchscape survey (n=2,237, US/UK/France/Germany, March-April 2025) found 75% of people use AI tools more than they did a year ago, and nearly half use AI search daily or more. At the same time, traditional search volume is on the decline.
- **Source:** Yext partnership with Researchscape (March-April 2025)
- **Citation:** [Yext — Rise of AI Search Archetypes](https://www.yext.com/content/yext-report-rise-of-ai-search-archetypes)
- **Caveat:** Survey of online buyers who used voice or conversational AI in the past three months — selection bias toward AI-aware users. The directional finding (rising AI search use, declining traditional search) is consistent with other industry data.
- **Used in:** feedback, brand

### EVD-PER-011 — Trustworthy online controlled experiments (Kohavi et al.)
- **Claim:** Kohavi, Tang, and Xu's *Trustworthy Online Controlled Experiments* (2020) is the canonical reference for A/B testing at scale. Key findings: most experiments fail to reach statistical significance and that's expected (you're testing risky ideas); peeking at results inflates false-positive rate from 5% to 25-50% in practice; sample-ratio mismatch (SRM) detects allocation problems and should be checked first; even at companies with mature experimentation programs, ~80% of ideas tested fail to improve key metrics. Recommends pre-registration, guardrails, and skepticism toward "wins."
- **Source:** Ronny Kohavi (Microsoft, then Airbnb), Diane Tang (Google), Ya Xu (LinkedIn) — practitioners with billions of experiments between them
- **Citation:** Kohavi, R., Tang, D., & Xu, Y. (2020). *Trustworthy Online Controlled Experiments: A Practical Guide to A/B Testing*. Cambridge University Press.
- **Caveat:** Heavy on rigor; small teams running ~5-10 experiments per quarter can simplify, but the underlying statistical principles still apply.
- **Used in:** experiment, which-metric-framework

### EVD-PER-012 — North Star Metric framework (Sean Ellis / Amplitude)
- **Claim:** Sean Ellis's North Star Metric framework: pick a single metric that (1) represents customer-perceived value, (2) predicts long-term business growth, (3) is actionable by teams. Examples: Airbnb's "nights booked," Spotify's "time spent listening," Slack's "weekly active connected teams." When done well, eliminates KPI sprawl and allows decentralized prioritization (every team asks "does this move the North Star?"). When done poorly, can mask negative effects on guardrail dimensions.
- **Source:** Sean Ellis (Growthhackers.com); popularized by Amplitude's product analytics work
- **Citation:** Ellis, S., & Brown, M. (2017). *Hacking Growth: How Today's Fastest-Growing Companies Drive Breakout Success*. Currency. Also: [Amplitude — The North Star Playbook](https://amplitude.com/north-star).
- **Caveat:** Practitioner framework. Choosing the wrong North Star (e.g., a vanity metric like total registered users) is worse than no North Star.
- **Used in:** kpi, which-metric-framework

### EVD-PER-013 — Pirate Metrics — AARRR (Dave McClure)
- **Claim:** Dave McClure's Pirate Metrics framework maps the customer lifecycle into 5 stages: Acquisition (visitors), Activation (first valuable experience), Retention (came back), Referral (told others), Revenue (paid). Designed to identify funnel bottlenecks — companies often focus on Acquisition when Activation or Retention is the actual leak. Each stage has a conversion rate to the next; the bottleneck stage is where to focus.
- **Source:** Dave McClure (500 Startups, now Practical Venture Capital) — 2007 talk that went viral
- **Citation:** [Original "Startup Metrics for Pirates" SlideShare (2007)](https://www.slideshare.net/dmc500hats/startup-metrics-for-pirates-long-version); reproduced in many subsequent talks and posts.
- **Caveat:** Designed for B2C SaaS / consumer apps with a clean funnel. Less directly applicable to B2B enterprise (long, multi-stakeholder cycles) or hardware/services. The order also isn't always linear in modern product-led models.
- **Used in:** kpi, which-metric-framework

### EVD-PER-014 — Performance analytics operational framework (Anthropic)
- **Claim:** Anthropic's official Marketing plugin includes a performance-analytics skill that operationalizes campaign and product metric analysis: identify what's working, calculate ROI, find optimization opportunities. Provides a reusable structure for performance reports that works across HubSpot, Amplitude, Klaviyo, Ahrefs, SimilarWeb data sources. Demonstrates that performance analytics needs structured outputs (decision-ready findings, not raw data dumps) and a repeatable analysis loop.
- **Source:** Anthropic — Knowledge Work Plugins (open source, Apache 2.0)
- **Citation:** [anthropics/knowledge-work-plugins — marketing/skills/performance-analytics](https://github.com/anthropics/knowledge-work-plugins/tree/main/marketing/skills/performance-analytics)
- **Caveat:** One operational implementation; the underlying principles (decision-ready output, repeatable loop) generalize beyond this specific skill.
- **Used in:** kpi, analytics, feedback

---

## Trusted sources

- **Croll & Yoskovitz** — *Lean Analytics* (vanity vs. actionable; OMTM)
- **Norton & Kaplan** — *Balanced Scorecard* (leading vs. lagging)
- **Reichheld** — NPS (with documented limitations)
- **McKinsey** — VoC program research (action loops)
- **Yext** — AI citation research (vendor with primary research; treat directionally; cross-verify when independent studies emerge)
- **Avinash Kaushik** — *Web Analytics 2.0* (analytics methodology)
- **Stanford HAI** — AI behavior research (broader context)
- **Ronny Kohavi, Diane Tang, Ya Xu** — *Trustworthy Online Controlled Experiments* — A/B testing canonical reference
- **Sean Ellis** — North Star Metric framework
- **Dave McClure** — Pirate Metrics (AARRR)
- **Andy Grove** — *High Output Management* — original OKRs
- **John Doerr** — *Measure What Matters* — modern OKRs
- **Christina Wodtke** — *Radical Focus* — OKRs in practice
- **Kerry Rodden et al. (Google)** — HEART framework
- **Anthropic Knowledge Work Plugins / performance-analytics** — operational performance reporting
- **Paweł Huryn** — phuryn/pm-skills (metrics-dashboard, ab-test-analysis, north-star-metric)

## Sources to monitor (not yet citing)

- **Searchable.com** — AEO platform; references Yext, Stanford HAI, and others. When citing AEO data, prefer the underlying primary sources (Yext, Stanford) rather than aggregator content.
- **Semrush AEO research** — emerging; verify methodology before citing.
- **Stanford HAI surveys on LLM search behavior** — academic; check for relevance as research matures.

## What's NOT in this library

- Marketing claims from analytics vendors without primary research
- Single-blog AEO claims without methodology
- Specific lift numbers from case studies (treat as illustrative, not generalizable)
- AI-generated statistics about AI behavior (recursive uncertainty)
