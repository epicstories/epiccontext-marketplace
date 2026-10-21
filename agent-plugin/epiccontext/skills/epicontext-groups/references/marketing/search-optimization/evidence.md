# Evidence Library — Search Optimization (SEO · SEA · GEO/AEO)

Cited data points for organic, paid, and AI-search decisions. **Current as of June 19, 2026.** Fast-moving facts are date-stamped; durable principles are flagged.

Each entry: **Claim** — Source (org/study, date) — *Why it matters* — *Confidence + caveat.*

**Confidence tiers** (gate ICE/RICE confidence to these):
- `hard_evidence` — peer-reviewed, rigorous behavioral datasets, large first-party platform studies, primary platform/analyst statements, commissioned conversion studies.
- `practitioner_consensus` — widely-held professional practice, not causally proven.
- `vendor_claim` — GEO/AEO-tool blogs, agency case studies, recycled figures. Treat skeptically; never the sole basis for a recommendation.

**Weighting rule:** independent + first-party platform data (Google, OpenAI, Pew, Princeton, Ahrefs first-party, Gartner, Deloitte) outranks GEO-vendor blogs.

---

## A. SEO (Organic)

### EVD-SO-001 — CTR by position (latest, and why there's no single curve)
- **Claim:** Position-1 organic CTR averages ~27.6% but ranges 19%–39.8% across studies by device and SERP composition; top-3 results capture ~68.7% of clicks. The curve now "bends" by SERP feature: featured snippet/AIO at top ≈ 38.9–42.9% for organic #1; local pack present ≈ 23.7%.
- **Source:** First Page Sage (2025, upd. May 2025); aggregated by theStacc, Indexsy, Inner Spark Creative (2025–26) across First Page Sage, Backlinko, SISTRIX, GrowthSRC.
- **Why it matters:** baseline for traffic forecasting and the value of a ranking.
- **Confidence:** `practitioner_consensus` — there is no longer a single CTR curve; never forecast from one.

### EVD-SO-002 — The CTR collapse from AI Overviews (hard, multi-study)
- **Claim:** Position-1 CTR drops sharply when an AIO appears. GrowthSRC (2025, 200k+ keywords): pos-1 −32% (28%→19%), pos-2 −39%; positions 6–10 *rose* ~30%. Ahrefs (Dec 2025, 300k keywords, GSC): pos-1 −58% with an AIO (up from −34.5% in Apr 2025); thins down-page (pos-2 −50.8%, pos-10 −19.4%). Seer (Sept 2025, 3,119 informational queries, 42 orgs): organic CTR −61%, paid −68% with AIO present.
- **Source:** GrowthSRC 2025; Ahrefs Dec 2025; Seer Interactive Sept 2025.
- **Why it matters:** rankings no longer predict traffic; models on 2020 curves overestimate top-position traffic by 30–40%.
- **Confidence:** `hard_evidence` — caveat: magnitude varies 15%–89% by study/query/window (DMG Media 89% worst case; Amsive −15.49% avg). Informational hit hardest; transactional/navigational rarely trigger AIOs.

### EVD-SO-003 — Zero-click & behavioral evidence (most rigorous dataset)
- **Claim:** Users clicked a traditional result in **8% of visits when an AI summary appeared vs 15% without** (~47% relative reduction); only **1%** clicked a link inside the summary; **26%** ended the session vs 16%; ~18% of searches produced an AI summary, 88% citing 3+ sources. Similarweb: zero-click rose 56%→69% (May 2024→May 2025).
- **Source:** Pew Research Center, "Do people click on links in Google AI summaries?" (Jul 22, 2025; 900 US adults, 68,879 searches, Mar 2025); Similarweb.
- **Why it matters:** the most credible real-browsing behavioral evidence for the zero-click shift.
- **Confidence:** `hard_evidence` — caveat: Google publicly rebutted Pew (Jul 22, 2025) as "flawed methodology and skewed queryset." Still the most methodologically rigorous behavioral dataset available.

### EVD-SO-004 — Being cited cushions the blow
- **Claim:** Being cited inside an AIO delivers ~35% more organic clicks (framed elsewhere as 120% more clicks per impression) and 91% more paid clicks vs not being cited.
- **Source:** Seer Interactive (2025).
- **Why it matters:** citation is the new "position zero."
- **Confidence:** `hard_evidence` (first-party dataset) — caveat: citation cushions rather than restores pre-AIO traffic.

### EVD-SO-005 — AI Overview prevalence (date-sensitive)
- **Claim:** AIO prevalence 6.49% (Jan 2025) → ~25% peak (Jul) → ~15.69% (Nov 2025) per Semrush (10M+ keywords). BrightEdge: AIOs on 48% of industries by Feb 2026 (+58% YoY). Pew: question queries triggered a summary ~60% of the time; 10+-word queries 53%.
- **Source:** Semrush 2025; BrightEdge Feb 2026; Pew Jul 2025.
- **Why it matters:** sizes the informational-query exposure.
- **Confidence:** `hard_evidence` for the studies — caveat: prevalence varies widely by method and dates rapidly.

### EVD-SO-006 — Core Web Vitals (secondary signal; business case > ranking case)
- **Claim:** Confirmed but secondary page-experience signal (since Jun 2021). Thresholds: LCP ≤2.5s, INP ≤200ms (INP replaced FID Mar 2024), CLS <0.1, for ≥75% of visits. Relationship is asymmetric — poor mobile scores suppress more than great scores boost. Business case: a 0.1s speed improvement increased retail conversions **8.4%** and AOV **9.2%** (travel conversions +10.1%).
- **Source:** Google page-experience docs; Deloitte Digital + Fifty-five "Milliseconds Make Millions" (2020, 37 brands, 30M+ sessions; retail on 20.5M sessions/15 brands).
- **Why it matters:** speed pays for itself in conversion regardless of ranking.
- **Confidence:** `hard_evidence` (Deloitte commissioned study) — caveat: one of hundreds of ranking signals; content quality dominates. As of Jul 2025 only ~44% of WordPress mobile sites pass all three CWV.

### EVD-SO-007 — E-E-A-T and helpful content
- **Claim:** 2025 core updates (Mar 27, Dec) rewarded demonstrated expertise, first-hand experience, author credentials, transparency, trust as *proxies* for accuracy. Mueller (Nov 2025): systems "don't care if content is created by AI or humans… [only whether] it's helpful, accurate, and created to serve users."
- **Source:** Google core updates 2025; John Mueller (Nov 2025).
- **Why it matters:** demonstrated experience and trust signals are the durable content bar.
- **Confidence:** `practitioner_consensus` — caveat: E-E-A-T is a framing of rater guidelines, not a measurable score; much "E-E-A-T tactic" advice is consensus, not hard evidence.

### EVD-SO-008 — Schema / structured data — CONTESTED (flag explicitly)
- **Claim:** *For:* Microsoft (Canel, SMX Munich Mar 2025) and Google (Levering, Search Central Live NY Mar/Apr 2025) confirmed schema helps their LLMs understand content; SEranking found ~71% of ChatGPT-cited and ~65% of Google AI-Mode-cited pages have structured data. *Against:* Ahrefs difference-in-differences (1,885 pages adding JSON-LD Aug 2025–Mar 2026 vs 4,000 controls) found no causal lift in AI citations; Search Atlas (Dec 2024) found no correlation.
- **Source:** Microsoft, Google (2025); SEranking; Ahrefs DiD (2026); Search Atlas (Dec 2024).
- **Why it matters:** governs how hard to push schema and what to claim for it.
- **Confidence:** mixed — **honest take:** schema is confirmed valuable for rich results, parsing, entity disambiguation, and plausibly useful on confirmed LLM platforms (Bing Copilot, Google AIO), but **NOT proven to causally drive AI citations.** Implement Organization, Article, FAQPage, HowTo, BreadcrumbList for confirmed value; don't over-claim. Mueller (2025): schema is not a direct ranking factor.

### EVD-SO-009 — Internal linking, freshness, topical authority (mostly consensus/vendor)
- **Claim:** Internal linking distributes authority and aids crawl/discovery (consensus). Freshness appears more heavily weighted on Perplexity (vendor claim: ~3.2x more citations for content updated within 12 months). Depth/topical authority correlates with citation (1,000-AIO analysis: pages >2,500 words cited 1.6x more; pages with ≥1 named-source citation cited 2.1x more).
- **Source:** practitioner consensus; vendor analyses.
- **Confidence:** `practitioner_consensus` / `vendor_claim` — caveat: the freshness multiplier and depth correlations are largely vendor-sourced; treat cautiously.

---

## B. SEA (Paid Search)

### EVD-SO-010 — Quality Score / Ad Rank mechanics (durable)
- **Claim:** Ad Rank ≈ bid × Quality Score + expected impact of extensions/formats. QS (1–10) = expected CTR + ad relevance + landing-page experience. Higher QS lowers CPC and lifts position. QS-6 vs QS-4 ≈ 16–25% CPC difference; landing-page fixes commonly yield 15–30% CPC reductions; a QS-8 advertiser at $3 outranks QS-4 at $5.
- **Source:** Google Ads guidance + practitioner data.
- **Why it matters:** **the clearest SEO↔SEA convergence** — organic-quality content subsidizes paid efficiency.
- **Confidence:** `hard_evidence` (mechanics) / `practitioner_consensus` (the % deltas) — caveat: the visible 1–10 is a *diagnostic, not a KPI*; QS is hidden for Shopping/Display/YouTube/PMax; landing-page experience re-evaluates on Google's crawl schedule (1–4 weeks).

### EVD-SO-011 — Performance Max trade-offs (documented)
- **Claim:** PMax (launched Nov 2021; replaced Smart Shopping by Jul 2023, Local by Sep 2022) runs all Google inventory via Smart Bidding. Documented issues: opacity, brand cannibalization, search-terms report showing only ~top 8% of terms. 2023–25 updates narrowed it — campaign-level negative keywords (up to 10,000), brand exclusions (up to 1,000), search themes, asset-group + channel-level reporting (Nov 6, 2025) — but didn't eliminate it. Adalysis (3,300 campaigns): when PMax and Search compete for the same terms, Search converts better; PMax works best as a complement (~+8–12% incremental volume).
- **Source:** Google docs; Adalysis (3,300 campaigns).
- **Why it matters:** structure PMax as complement with brand exclusions, not a replacement.
- **Confidence:** `practitioner_consensus` — caveat: most PMax "best practice" is vendor/agency consensus; Google's uplift figures (e.g., +12% conversion value from Smart Shopping) are Google's own.

### EVD-SO-012 — AI Max for Search (2025–26, thin independent evidence)
- **Claim:** A keywordless AI layer on Search campaigns (part of Google's "Power Pack" with PMax + Demand Gen). One independent analysis (250+ retail campaigns) found median revenue uplift **13%** but median CPA increase **16%** — efficiency less clear than Google claims. "Broad-match drift" (ads on loosely related, commercially irrelevant queries) is the documented risk.
- **Source:** independent analysis (250+ retail campaigns, 2025–26).
- **Why it matters:** review search-term reports **daily during the first two weeks**.
- **Confidence:** `vendor_claim` / thin — caveat: very new; weak independent evidence.

### EVD-SO-013 — Smart Bidding thresholds (durable)
- **Claim:** Generally outperforms manual bidding for Search; needs ~30–50 conversions/month minimum. Do not enable Target ROAS below ~50 conversions/30 days or it starves volume — stay on Maximize Conversions until the threshold is hit.
- **Source:** Google guidance + practitioner consensus.
- **Confidence:** `practitioner_consensus` (durable operational rule).

### EVD-SO-014 — Organic-paid interaction & incrementality (the most important SEA evidence)
- **Claim:** "1+1=3": with both top organic and paid present, 49% of clicks go organic, 42% paid, only 11% cannibalization — vs 40% of clicks lost to competitors when *not* bidding on brand (Microsoft/Bing retail study). **BUT branded search is frequently the least incremental spend:** Stella dataset of 225 DTC geo-incrementality tests (Aug 2024–Dec 2025) found median **iROAS 0.70x for branded search** — below 1.0x breakeven, lowest of any channel (full-portfolio median 2.31x). Polar Analytics/The Feed: 14% organic cannibalization when branded paid on, only ~2% total traffic lift.
- **Source:** Microsoft/Bing retail study; Stella (225 DTC tests); Polar Analytics/The Feed.
- **Why it matters:** **always incrementality-test branded spend; report iROAS, not blended ROAS.**
- **Confidence:** `hard_evidence` (geo-incrementality method) — caveat: iROAS figures are single-vendor, US DTC-skewed.

---

## C. GEO / AEO / AI Search Optimization

### EVD-SO-015 — Academic foundation: Princeton GEO study (only peer-reviewed causal evidence)
- **Claim:** Top on-content methods — **Cite Sources, Quotation Addition, Statistics Addition — achieved 30–40% relative improvement** on the position-adjusted word-count visibility metric and 15–30% on subjective impression; Perplexity validation showed up to 37% visibility improvement. Citing external sources lifted lower-ranked content most; fluency optimization gave 15–30%; effects vary by domain (statistics help Law & Government and opinion queries most).
- **Source:** Aggarwal et al., "GEO: Generative Engine Optimization," KDD 2024 (arXiv:2311.09735; Princeton, IIT Delhi, Georgia Tech, Allen Institute). GEO-bench: 10,000 queries; Bing-Chat-mimic validated on Perplexity.
- **Why it matters:** the only peer-reviewed *causal* evidence on content modifications — this is the content pattern to encode.
- **Confidence:** `hard_evidence` — caveat: 2023–24 vintage; on-content only — does not capture off-site brand signals (EVD-SO-016).

### EVD-SO-016 — What actually drives AI citation (off-site) — strongest available evidence
- **Claim (Spearman correlations with AI visibility):**
  - **YouTube mentions ~0.737** — strongest single factor (per-platform 0.712–0.740); YouTube mention impressions ~0.717.
  - **Branded web mentions (linked + unlinked): 0.664 (AIO), 0.709 (AI Mode), 0.656 (ChatGPT)** — strongest in Study 1.
  - **Branded anchors: 0.527 / 0.628 / 0.511.** **Branded search volume: 0.392 / 0.466 / 0.352.**
  - **Backlinks 0.218; referring domains 0.295; domain rating 0.18–0.326; site pages 0.17–0.194** — all weak.
  - **Quartile cliff:** top-25%-web-mentions brands averaged **169 AIO mentions** vs **14** one quartile down; bottom two quartiles 0–3. "If your brand sits in the lower 50% of web mentions, you're essentially invisible to AI systems."
  - **Output overlap (Study 2):** assistants mention the *same* brands — AIO & AI Mode 0.821, AI Mode & ChatGPT 0.769, AIO & ChatGPT 0.749. → **one entity foundation serves all engines.**
- **Source:** Ahrefs, 75,000 brands — Linehan & Guan, Study 1 (May 26, 2025) + Study 2 (Dec 12, 2025, rev. Ryan Law). Filtered DR>40, top keyword ≥800 monthly searches.
- **Why it matters:** AI visibility is an **off-site brand** phenomenon; invest in mentions/YouTube/earned media, not on-site tricks.
- **Confidence:** `hard_evidence` (large first-party study) — **caveat (Ahrefs' own, verbatim):** "correlation isn't causation… that doesn't mean improving these metrics will automatically boost your AI visibility" — may be proxies for pre-existing brand strength. Lily Ray and Mark Williams-Cook separately showed AIO visibility can be manipulated.

### EVD-SO-017 — The recycled 0.334 figure — treat with skepticism
- **Claim:** Kevin Indig reports a brand-search-volume ↔ ChatGPT-mention correlation of 0.334; ConvertMate (vendor, 80M+ citations) reports the *identical* 0.334 as its top factor; a Digital Bloom study reportedly does too. Ahrefs' own branded-search figure is **0.392, not 0.334**.
- **Source:** Indig; ConvertMate; Digital Bloom (vs Ahrefs).
- **Why it matters:** exact replication of 0.334 across "independent" studies of very different sizes warrants caution.
- **Confidence:** `vendor_claim` — caveat: may be recycled rather than independently reproduced; ConvertMate is a commercial AEO vendor.

### EVD-SO-018 — Earned media dominates AI citations
- **Claim:** Muck Rack Generative Pulse (Dec 2025, 1M+ AI-cited links): journalistic/earned media ≈25% of all LLM citations; non-paid sources ≈94%. Later Muck Rack analysis (May 2026, 25M links): earned media ~84% of AI citations. U. Toronto researchers: brands "must dominate earned media to build AI-perceived authority."
- **Source:** Muck Rack (Dec 2025, May 2026); U. Toronto.
- **Why it matters:** earned > brand-owned for citations — digital PR is the engine.
- **Confidence:** directional `hard_evidence` — caveat: several figures circulate via PR/GEO vendors with conflicts; the *direction* is robust across sources, the exact % is not.

### EVD-SO-019 — Brand-managed source split (existing library anchor — stay consistent)
- **Claim:** 86% of AI citations come from brand-managed sources (44% first-party websites, 42% listings, 8% reviews/social, 2% forums); 93% of AI users verify recommendations beyond the AI response; profile completeness drives ranking; different models source differently.
- **Source:** Yext 2025 AI-citations research.
- **Why it matters:** control your profiles AND earn third-party coverage — not contradictory with EVD-SO-018: Yext counts *brand-manageable* surfaces (incl. listings you control), Muck Rack counts *editorial/non-brand-owned*. Same playbook.
- **Confidence:** `vendor_claim` (but the existing Performance-group anchor — keep consistent).

### EVD-SO-020 — Platform sourcing differences (vendor data; shifts constantly)
- **Claim:** **ChatGPT:** Bing's index, leans Wikipedia (most-cited ~7.8%), major publications, Reddit. **Perplexity:** continuous crawl, freshness-weighted, Reddit-heavy (~46.7% of top citations), plus YouTube/G2/Yelp; visits ~10 candidate pages, cites 3–4. **Google AIO/AI Mode:** most balanced — YouTube + Wikipedia + Google.com heavy. **Claude:** most cautious, training-data-weighted (cutoff issues), prefers structured authoritative content, converts well for B2B.
- **Source:** Profound, ConvertMate vendor datasets.
- **Confidence:** `vendor_claim` — caveat: per-platform percentages change with every model update; never quote as fixed.

### EVD-SO-021 — llms.txt — does it work? NO, as a citation tactic (mid-2026)
- **Claim:** Proposed by Jeremy Howard (Answer.AI), Sept 2024. Adoption ~10% of domains (SEranking, ~300k domains, Nov 2025); near-zero among top sites (Rankability: 0.3% of top 1,000, Jun 2025). SEranking found **no correlation** with AI citations — an XGBoost model *improved* when llms.txt was removed. Google (Illyes/Mueller): "no plans to support llms.txt." Server-log audits (1,000 AEM domains): no GPTBot/ClaudeBot/PerplexityBot requests for the file. Codersera (May 2026): 97% of ~38,000 domains with a valid llms.txt got zero requests for it.
- **Source:** SEranking (Nov 2025); Rankability (Jun 2025); Google; Codersera (May 2026).
- **Why it matters:** **honest take** — low-cost, low-risk, genuinely useful for **IDE agents (Cursor, Continue, Cline) and docs/MCP tooling**, but **NOT a citation tactic.** Don't let SEO tools flagging "missing llms.txt" pressure adoption on false pretenses.
- **Confidence:** `hard_evidence` (the *negative* result is well-replicated).

### EVD-SO-022 — AI referral traffic: volume vs quality (the central GEO paradox)
- **Claim — volume tiny:** AI referral ≈1.08% of all web traffic (Conductor 2026); ChatGPT ≈87.4% of AI referral (Conductor, 13,770 domains, Nov 2025). Ahrefs (Feb 11, 2026): ChatGPT sends ~190x less traffic than Google despite ~12% of "search-like" volume; est. ChatGPT CTR 1.3% vs Google 29.2%. Growing fast (~357–527% YoY; ChatGPT referral sessions +1,079% across 94 ecommerce brands in 2025, Visibility Labs).
- **Claim — quality exceptional but variable:** Ahrefs (Jun 2025) AI search = 0.5% of traffic but **12.1% of signups (23x conversion)**. Semrush (Jun 2025): AI converts **4.4x** organic. Seer (B2B): ChatGPT 15.9% vs Google organic 1.76%. Adobe (Apr 2026): AI-referred US retail shoppers converted **42% better** in Mar 2026 — vs **38% worse** in Mar 2025, a one-year flip across 1T+ visits. Visibility Labs: ChatGPT 1.81% vs non-branded organic 1.39% (only 1.3x — the low end).
- **Source:** Conductor; Ahrefs (Jun 2025, Feb 2026); Semrush; Seer; Adobe Analytics; Visibility Labs.
- **Why it matters:** AI traffic is small but high-intent — worth instrumenting, not yet worth reallocating budget to wholesale.
- **Confidence:** mixed — caveat: most studies measure their own traffic (sample bias); 40–60% of AI responses lack visible attribution; much AI traffic shows as "direct" (referral header stripped); small denominators make %s volatile; some e-commerce studies show AI *underperforming*. Treat 4–23x premiums as real but range-bound and fast-changing — not a law.

### EVD-SO-023 — AI search share of behavior (2026) — additive, not substitutive
- **Claim:** Google still ~80–90% of search; ChatGPT ~17–20% of digital queries / ~12% of "search-like" volume (Graphite.io Mar 2026; Ahrefs; First Page Sage Q2 2026). **Additive:** total discovery grew 26% (Q1 2023–Q4 2025); Google's absolute search volume hasn't fallen (Pichai, Q4 2025 earnings). Within chatbots, ChatGPT share fell ~87%→~68% in 12 months as Gemini quadrupled.
- **Source:** Graphite.io; Ahrefs; First Page Sage; Alphabet Q4 2025 earnings.
- **Why it matters:** don't abandon Google for AI; serve both.
- **Confidence:** `hard_evidence` (multi-source) — caveat: methodologies disagree wildly; SparkToro/Datos stricter clickstream puts Google at 373x ChatGPT on search-equivalent queries.

### EVD-SO-024 — Gartner prediction (a prediction, NOT a fact)
- **Claim:** "By 2026, traditional search engine volume will drop 25%, with search marketing losing market share to AI chatbots and other virtual agents."
- **Source:** Gartner press release, Feb 19, 2024 (VP Analyst Alan Antin).
- **Confidence:** `hard_evidence` source, but **it is a forecast** — cite as a prediction, not an outcome. (Counter-evidence EVD-SO-023 shows Google volume hasn't fallen.)

---

## D. Cross-Cutting

### EVD-SO-025 — Convergence (durable principle)
- **Claim:** One content + entity foundation serves all three disciplines: strong SEO content → good landing pages (paid Quality Score) → citable answers (GEO). Winning posture is "rank AND get cited," not either/or.
- **Confidence:** `hard_evidence`/durable principle (supported by EVD-SO-010, EVD-SO-016).

### EVD-SO-026 — Entity / knowledge-graph optimization
- **Claim:** Establish the brand as a distinct, verified entity: consistent NAP, Organization schema with `sameAs`, Wikipedia/Wikidata presence, consistent cross-platform descriptions. Entity co-occurrence — your brand name appearing alongside category terms in authoritative sources, even unlinked — is what AI systems record as association.
- **Source:** Princeton GEO (entity signals improved retrieval across tactics) + practitioner consensus.
- **Confidence:** `hard_evidence` (Princeton) + `practitioner_consensus` (the tactics).

### EVD-SO-027 — Digital PR / unlinked brand mentions (highest-leverage cross-cutting activity)
- **Claim:** Drives traditional authority (referring domains remain the strongest organic-ranking predictor at ~0.31, Ahrefs) AND AI citation (brand mentions correlate ~3x more strongly than backlinks: 0.664 vs 0.218). BuzzStream 2025 State of Digital PR (150+ pros, Nov–Dec 2024): campaigns built on **original research earn 4.7x more backlinks** than company-announcement campaigns. Press releases largely do *not* drive AI citations (BuzzStream + Citation Labs, 3,600 prompts, 10 industries).
- **Source:** Ahrefs; BuzzStream 2025; Citation Labs.
- **Why it matters:** original-research digital PR is the single highest-leverage activity across SEO + GEO.
- **Confidence:** `hard_evidence` (Ahrefs correlation anchor) — caveat: much digital-PR-for-AI evidence is PR-vendor-sourced; the Ahrefs data is the credible anchor.

### EVD-SO-028 — The Great Decoupling — real, but 2025 data is contaminated
- **Claim:** Ahrefs: blog impressions/clicks correlation flipped +0.425 (late 2024) → −0.352 (early 2025) as AIO prevalence doubled (+116%) around the Mar 2025 core update. Google's Martin Splitt confirmed (Search Central Live, Warsaw, Jun 17, 2025): AIO presence → more impressions, fewer clicks. **CRITICAL:** GSC impression data was polluted in 2025 by (a) the &num=100 bot exploit — impressions fell 30–70% industry-wide when Google killed the parameter **Sept 12, 2025** — and (b) a confirmed Google logging error inflating impressions since **May 13, 2025**.
- **Source:** Ahrefs; Martin Splitt (Jun 17, 2025); Brodie Clark et al.
- **Why it matters:** **Treat any GSC impression trend spanning 2025 with caution; rebaseline post-Sept 13, 2025. Clicks, GA4 sessions, and conversions remain clean signals.**
- **Confidence:** `hard_evidence` — this is the single most important measurement caveat in the library.

---

## E. Mental Availability & Category Entry Points (the demand-side spine)

Full framework + graph wiring: `epicontext-groups/references/marketing/methodologies/mental-availability-ceps.md`.

### EVD-SO-029 — Mental availability drives growth (the foundational principle)
- **Claim:** Brands grow primarily by increasing **mental availability** (being easy to think of in buying situations) and physical availability — not by persuading a niche or chasing differentiation/loyalty. Growth comes from acquiring more light/non-buyers across more situations.
- **Source:** Byron Sharp, *How Brands Grow* (Ehrenberg-Bass Institute, 2010); Romaniuk & Sharp, *How Brands Grow Part 2* (2016/2022).
- **Why it matters:** reframes search from "rank for keywords" to "be present and chosen across the buyer's situations" — the strategic case for breadth.
- **Confidence:** `hard_evidence` (decades of Ehrenberg-Bass empirical work) — caveat: a body of empirical generalizations, debated at the margins; directionally robust and widely adopted.

### EVD-SO-030 — Category Entry Points are the building blocks of mental availability
- **Claim:** CEPs are the cues/situations buyers use to access the category. A brand linked to **more relevant CEPs, more strongly than competitors**, has higher mental market share. Identify via the **7W framework** (Why, When, Where, While, With/for whom, With what, hoW-feeling); prioritize via the **3 Cs** (Commonality, Competitiveness, Credibility). Measured by mental market share, mental penetration, network size, mental advantage.
- **Source:** Jenni Romaniuk, *Building Distinctive Brand Assets* (2018) and *Better Brand Health* (2023); Ehrenberg-Bass CEP research; Romaniuk, "Increasing mental market share by using category entry points" (2023).
- **Why it matters:** the operational method behind mental availability — the input to keyword + AI-prompt research.
- **Confidence:** `hard_evidence` (Ehrenberg-Bass method) — caveat: incidence/competitiveness estimates require buyer research; an un-sourced CEP list is a guess (stub until researched).

### EVD-SO-031 — A search query / AI prompt is a CEP voiced (the search bridge)
- **Claim:** "If CEPs are the wants, triggers, and circumstances that create category demand in buyers' minds, then search terms are a written declaration of them." Brands establish presence at a CEP by being found for the phrases and prompts that voice it. Practitioner consensus is converging on CEP-first (not keyword-first) search and AI-search strategy.
- **Source:** practitioner synthesis — Semrush ("Why category entry points belong in every AI search strategy," 2025–26); Nepa; quantilope CMO guide; agency deep-dives (2024–26).
- **Why it matters:** makes CEPs the input to keyword clustering and the AI prompt library; ties brand strategy to search execution.
- **Confidence:** `practitioner_consensus` — caveat: the *bridge* is consensus; the underlying CEP science (EVD-SO-029/030) is the hard evidence. Much of the SEO-specific framing is vendor/agency-authored.

### EVD-SO-032 — Distinctive Brand Assets carry the CEP link
- **Claim:** A CEP only builds mental availability once the brand is *linked* to it via consistent Distinctive Brand Assets (colours, logo, characters, taglines, sonic cues). DBAs are tested on **fame × uniqueness** before investment ("distinctive ≠ merely different"). Consistent pairing of asset + situation builds the memory shortcut over time.
- **Source:** Jenni Romaniuk, *Building Distinctive Brand Assets* (2018, Ehrenberg-Bass).
- **Why it matters:** connects the CEP portfolio to the brand's assets in the graph — the visual assets in the `design_system` entity (the `brand_visual_identity` block) plus `tone_of_voice` and `messaging_framework` in the Brand group — content per CEP must carry DBAs to compound.
- **Confidence:** `hard_evidence` (Ehrenberg-Bass DBA research).
