# Methodology — The Integrated Audit → Research → Prioritize → Plan → Measure Loop

One loop, three disciplines, one foundation. Run it top to bottom for a new engagement; re-enter at the relevant phase for ongoing work. Every output is a block write into the **Marketing** or **Performance** group, carrying a `reason` (never a silent graph change).

---

## Phase 0 — Frame by business type (divergence map)

The plan diverges sharply by business type. Pick the frame first; never run a generic plan.

| Type | Where to invest | Notes |
|---|---|---|
| **B2B SaaS** | GEO + thought-leadership digital PR + YouTube; LinkedIn for professional AI queries | Long research cycles; AI-referral traffic converts highest-value (EVD-SO-022) |
| **Local / services** | Google Business Profile, local pack, listings completeness, reviews | Yext data most relevant (EVD-SO-019); local-pack CTR ~23.6% for first listing |
| **E-commerce** | Merchant Center/product feeds, PMax (with brand exclusions), product schema | AI referral sometimes *underperforms* paid/direct — **incrementality-test before reallocating** (EVD-SO-022) |
| **Pure digital / dev tools** | Developer docs, llms.txt (genuinely useful for IDE agents here), community (Reddit, GitHub, Stack Overflow) | llms.txt earns its place here — NOT as a citation tactic (EVD-SO-021) |

Read the project's `persona`, `product_overview`, and `ogsm` blocks to confirm the frame before proceeding.

---

## Phase 1 — Audit / Baseline

What to pull, from where, what to look at. Tooling detail in `tooling.md`.

- **GSC (mcp-gsc, free):** clicks/impressions/CTR/position by query and page; segment by SERP feature. **Set CLICKS as the primary KPI** — *not* impressions (2025 data pollution + decoupling, EVD-SO-028). Flag crocodile-mouth decoupling (impressions up, clicks flat/down).
- **DataForSEO (paid API):** AIO triggering across your keyword set, SERP features, competitor rankings, volumes — best for programmatic audits.
- **Google Ads MCP (free):** Quality Score components, search-terms report, impression share, PMax channel/asset reports, conversion data.
- **Bing Webmaster MCP (free):** Bing index health — **matters because it feeds ChatGPT** (EVD-SO-020).
- **AI-visibility tool:** baseline mention rate / share of voice across ChatGPT, Gemini/AIO, Perplexity, Claude; **identify the exact URLs each engine cites** for your category (the actionable output).
- **Technical:** Core Web Vitals (field data), schema coverage, crawlability, entity consistency (NAP, `sameAs`, knowledge panel).

**Baseline rebaselining rule:** any GSC trend spanning 2025 is suspect — rebaseline post-Sept 13, 2025 (EVD-SO-028).

---

## Phase 2 — Research

**Start from CEPs, not a keyword dump.** The research phase is anchored on the Category Entry Point portfolio (Mental Availability framework — see `ceps-and-search.md` and `epicontext-marketing/references/methodologies/mental-availability-ceps.md`). If the project has a CEP portfolio on its `marketing_strategy`, use it as the input; if not, that's the first gap to fix (build a 7W → 3C portfolio via `epicontext-marketing`). Every cluster and prompt below is a CEP made concrete.

- **Keyword + intent:** map each priority CEP to how it's *voiced* in search, then cluster by intent — **informational = AIO/GEO-vulnerable** (defend with citable content + GEO); **transactional/navigational = still click-rich and paid-friendly** (protect with paid + strong organic).
- **Entity research:** map your entity graph and the gaps vs competitors (EVD-SO-026).
- **AI-prompt-library research:** build the **50–200 buyer questions/prompts** that matter — these ARE the priority CEPs phrased as a buyer would ask an assistant, by journey stage and persona; test across engines (persona-based visibility can differ sharply from brand-name visibility). This becomes the `feedback` block of channel `aeo` in the Performance group (see `epicontext-performance/references/examples/aeo-tracking-setup.md`).
- **Competitor research:** who is cited in AI answers, who ranks organically, who is bidding; **pull the specific URLs AI engines cite** so you can reverse-engineer the earned-media pattern.

---

## Phase 3 — Strategy / Prioritization

- **Allocate by intent mix and goals:** protect transactional/navigational with paid + strong organic; defend informational with citable content + GEO; invest off-site (digital PR, YouTube, earned media) as the **shared multiplier across all three** (EVD-SO-027).
- **Sequence:** fix technical/measurement foundations → build entity + content foundation → earn off-site signals → layer paid for incremental capture.
- **Prioritize with ICE/RICE or PIE**, scored on impact × confidence × effort, where **confidence is tied to evidence strength**: `hard_evidence` > `practitioner_consensus` > `vendor_claim`. A tactic resting only on a vendor blog cannot score high-confidence.

---

## Phase 4 — The 90-Day Integrated Plan

A good plan contains all six:

1. **Measurement instrumentation** — GA4 custom AI-referral channel (sources: chatgpt, openai, perplexity, claude, gemini); GSC click baseline; AI-visibility tracking; post-purchase "how did you hear about us" survey (much AI influence mis-attributes to branded organic).
2. **Content calendar** — answer-first, statistic-rich, well-cited pages (Princeton-validated: cite sources, add quotations, add statistics, optimize fluency — EVD-SO-015).
3. **Entity / technical-fix backlog** — schema for *confirmed* value (EVD-SO-008), CWV (EVD-SO-006), NAP/`sameAs` consistency (EVD-SO-026).
4. **Digital PR / earned-media plan** — original data studies, expert commentary, YouTube presence: **the AI-citation engine** (EVD-SO-016, EVD-SO-027).
5. **Paid plan** — incrementality tests on branded spend (EVD-SO-014), PMax/Search structure with brand exclusions (EVD-SO-011), conversion-value bidding above the threshold (EVD-SO-013).
6. **Explicit leading/lagging KPI targets per discipline** (see `kpis.md`).

Each item lands as a block write: content → `content_piece`; PR/YouTube → `channel` + `campaign`; instrumentation → `analytics`; targets → `kpi`. All trace to an OGSM Goal + persona.

---

## Phase 5 — Execution + Measurement (detect divergence)

Instrument **leading** (rankings, AI mention rate, Quality Score, content velocity, referring domains/mentions earned) and **lagging** (clicks, AI-referral conversions, CPA/ROAS, revenue, share of voice). Then run the divergence-detection rules:

| Signal | Likely cause | Action |
|---|---|---|
| Rankings hold but clicks fall | Decoupling / AIO (EVD-SO-002, EVD-SO-028) | Pivot to citation + conversion-rate focus |
| Impressions spike implausibly | 2025 data pollution (EVD-SO-028) | Suspect, rebaseline — don't celebrate |
| Paid CPA rises with broad-match expansion | AI Max / PMax drift (EVD-SO-012) | Review search terms **daily** during learning |
| Branded paid "ROAS" looks great | Blended-ROAS illusion (EVD-SO-014) | Run a geo-incrementality holdout; report iROAS |

**Re-audit AI visibility monthly** — it changes with every model update.

**Frameworks practitioners use:** intent-based content clustering; topic-cluster/pillar model; ICE/RICE/PIE prioritization; geo-holdout incrementality testing for paid; the GEO "cite/quote/statistic/fluency" content pattern from Princeton.
