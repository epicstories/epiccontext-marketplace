# Epic Context — Search Optimization (SEO · SEA · GEO/AEO)

*Part of `epicontext-groups` (`references/marketing/search-optimization/README.md`), formerly the `epicontext-search-optimization` skill. Paths below are relative to the `epicontext-groups` folder: for `get_skill`, put `epicontext-groups/` in front.*

A single integrated **audit → research → prioritize → plan → measure** loop for the three converging search disciplines. It does not invent a new data layer: it **reads from and writes recommendations into the existing Marketing group** (channels, campaigns, content pieces) and **Performance group** (analytics, KPIs, AEO feedback). This skill carries the methodology, the evidence base, the KPIs, and a hard set of anti-patterns it refuses.

> **The one durable principle, if you remember nothing else:** build **one** entity + content + earned-media foundation; measure **clicks and conversions (not impressions)** and **AI mention/citation share**; **incrementality-test all automation.** One foundation serves all three disciplines — the winning posture is "rank AND get cited," not either/or.

## The three disciplines (one foundation)

Search has fractured into three disciplines on one entity-and-content foundation:

| Discipline | What it wins | What's changing (dated) |
|---|---|---|
| **SEO** (organic) | Rankings + clicks for transactional/navigational; citations for informational | AI Overviews hollow out top-of-funnel clicks — position-1 CTR drops ~58% when an AIO appears (Ahrefs, Dec 2025) |
| **SEA** (paid search) | Incremental conversions at controllable CPA | Absorbed into AI black boxes (Performance Max, AI Max) — opacity + branded-spend cannibalization are the risks |
| **GEO/AEO** (AI answers) | Being cited *inside* AI answers; high-quality referral traffic | New layer. Driven by **off-site brand signals**, not on-site tricks |

**Convergence is the whole point:** strong SEO content produces good landing pages (lifts paid Quality Score → lower CPC) and citable answers (GEO). Off-site brand building (digital PR, YouTube, earned media) is the shared multiplier across all three.

## Category Entry Points — the demand-side spine

Search is downstream of a brand-strategy idea: **Mental Availability** and **Category Entry Points (CEPs)** from the Ehrenberg-Bass Institute (Sharp, Romaniuk). A CEP is the situation a buyer's mind is in when they enter the category — and **a search query or AI prompt is a CEP voiced out loud.** So the demand side of this skill is CEP-driven:

- **Keyword research = CEP research made concrete.** Start from the prioritized CEP portfolio (7W list, 3C-ranked), not a volume dump.
- **The AI prompt library = the CEP portfolio phrased for an assistant.** The 50–200 GEO/AEO prompts you track should be the priority CEPs as a buyer would ask ChatGPT/Perplexity/AIO.
- **Being cited across the CEP-shaped prompt set is machine-mediated mental availability** — which is exactly why off-site brand signals drive AI citation (see "What actually drives AI citations").

Read `references/marketing/search-optimization/ceps-and-search.md` for the CEP→SEO/SEA/GEO operationalization, and `epicontext-groups/references/marketing/methodologies/mental-availability-ceps.md` for the full framework + graph wiring (where the CEP portfolio lives, how it fans out to messaging, content, keywords, prompts, and KPIs).

## When to use this skill

**Audit / baseline:** organic, paid, or AI visibility for a project; "are we visible in ChatGPT/AIO?"; "why did our traffic drop while rankings held?"
**Research:** keyword + intent clustering, entity-gap mapping, AI-prompt-library building, competitor citation analysis.
**Plan:** an integrated 90-day search plan; content calendar for citations; Google Ads / PMax / AI Max structure; measurement instrumentation.
**Measure:** discipline-specific KPIs, leading-vs-lagging separation, divergence detection (decoupling, data pollution, broad-match drift).

## Core principle — evidence tiers gate confidence

Most pre-2024 SEO advice is now partially obsolete, and the GEO vendor space is full of unproven claims. Every recommendation this skill makes is weighted by evidence strength. **Tie ICE/RICE confidence to the tier:**

1. **`hard_evidence`** — peer-reviewed (Princeton/KDD GEO study), rigorous behavioral datasets (Pew), large first-party platform studies (Ahrefs 75k-brand), primary platform/analyst statements (Google, Gartner), commissioned conversion studies (Deloitte). **Weight highest.**
2. **`practitioner_consensus`** — widely-held professional practice (internal linking, E-E-A-T tactics, topic clusters). Useful, not proven.
3. **`vendor_claim`** — GEO/AEO-tool blogs, agency case studies, recycled correlation figures. **Treat skeptically; never the sole basis for a recommendation.**

Full library: `references/marketing/search-optimization/evidence.md`. **Read it before citing any statistic** — each entry carries its source, date, and caveat. Fast-moving facts are date-stamped; durable principles are flagged.

## The integrated loop (5 phases)

Full detail in `references/marketing/search-optimization/methodology.md`. At a glance:

- **Phase 0 — Frame by business type.** B2B SaaS / Local-services / E-commerce / Dev-tools diverge sharply on where to invest. Don't run a generic plan.
- **Phase 1 — Audit / baseline.** Pull from GSC (clicks as primary KPI — *not* impressions), DataForSEO, Google Ads, Bing Webmaster, and an AI-visibility tool. See `references/marketing/search-optimization/tooling.md`.
- **Phase 2 — Research.** Intent clustering (informational = AIO/GEO-vulnerable; transactional/navigational = still click-rich), entity-gap mapping, a 50–200 prompt AI library, competitor citation pull.
- **Phase 3 — Prioritize.** Allocate by intent mix; sequence foundations → entity/content → off-site signals → paid. Score with ICE/RICE where **confidence = evidence tier**.
- **Phase 4 — 90-day plan.** Measurement instrumentation, citable content calendar, entity/technical backlog, digital-PR/earned-media plan, paid plan with incrementality tests, explicit leading/lagging targets.
- **Phase 5 — Execute + measure.** Instrument leading + lagging per discipline; run the divergence-detection rules monthly (AI visibility changes with every model update).

## KPIs at a glance (full set in `references/marketing/search-optimization/kpis.md`)

| Discipline | Leading | Lagging | **Refuse as vanity** |
|---|---|---|---|
| **SEO** | rankings, indexation, CWV pass rate, referring domains | organic **clicks**, conversions, assisted revenue | **impressions** (2025+ polluted), keyword counts, DA in isolation |
| **SEA** | Quality Score *inputs*, impression share, CTR | CPA, **iROAS**, conversion volume | raw clicks, **blended ROAS** (brand-inflated) |
| **GEO/AEO** | mention rate, citation share, earned mentions, YouTube presence | AI-referral conversions, branded-search lift | raw "AI visibility score" with no action — *tracked ≠ improved* |

## What actually drives AI citations (the GEO headline)

The strongest evidence (Ahrefs, 75,000 brands, 2025) says AI visibility is an **off-site brand** phenomenon, not an on-site trick:

- **YouTube mentions (~0.737)** and **branded web mentions, linked + unlinked (0.66–0.71)** correlate strongly with AI visibility.
- **Backlinks (0.218)** and **page count (0.17–0.194)** barely correlate.
- **Quartile cliff:** top-quartile-web-mentions brands averaged **169 AIO mentions** vs **14** one quartile down. "If your brand sits in the lower 50% of web mentions, you're essentially invisible to AI systems."
- The three assistants largely cite the **same** brands (pairwise correlations 0.75–0.82) → **one strong entity foundation serves all engines.**
- **Caveat (Ahrefs' own):** correlation ≠ causation; these may be proxies for pre-existing brand strength. The Princeton/KDD study is the only peer-reviewed *causal* evidence, and it covers on-content tactics only (**cite sources, add quotations, add statistics → 30–40% relative visibility lift**).

→ Highest-leverage cross-cutting activity is **digital PR / earned media / YouTube** (the AI-citation engine), which *also* drives organic authority. See `references/marketing/search-optimization/evidence.md` §C–D.

## How this fits the graph (Marketing + Performance)

This skill orchestrates; it does not own a new entity type.

- **Reads:** `brand_positioning`, `messaging_framework`, `tone_of_voice` (the words), `persona` (who's asking), `product_overview` / `feature` (what to make citable), `ogsm` (the goals to ladder up to).
- **Writes recommendations as blocks into:**
  - **Marketing group** — `channel` (organic search, paid search, AI/earned), `campaign` (a 90-day search push), `content_piece` (citable answer-first pages, data studies for digital PR). Use `references/marketing/README.md`.
  - **Performance group** — `analytics` (GA4 AI-referral channel), `kpi` (clicks/iROAS/citation-share with targets + experiments), `feedback` channel `aeo` (the AI-visibility prompt library). Use `references/performance/README.md`; see its `epicontext-groups/references/performance/examples/aeo-tracking-setup.md`.

Every recommendation traces to an OGSM Goal and a persona, or it's noise. Write it with `create_block` / `update_block` and a `reason` that names the goal, persona and evidence — never a silent change (see `epicontext-core`).

## Anti-patterns this skill refuses (guardrails, not advice)

Full list with reasons in `references/marketing/search-optimization/anti-patterns.md`. The headline refusals:

- **Treating impressions as success** — 2025 GSC data pollution (&num=100 exploit killed Sept 12 2025; logging error since May 13 2025) + the Great Decoupling. Use clicks/GA4 sessions/conversions.
- **"Schema guarantees AI citations"** — contested; no causal evidence (Ahrefs DiD study found noise). Implement schema for its *confirmed* rich-result/parsing value; don't over-claim citation impact.
- **`llms.txt` as a citation tactic** — no evidence it drives citations (SEranking: removing it *improved* the model). Ship it only for IDE-agent/docs tooling value, never sold as AEO.
- **Handing PMax full control without brand exclusions** — cannibalizes free branded traffic.
- **Not incrementality-testing branded paid** — median iROAS ~0.70x (below breakeven). Report iROAS, not blended ROAS.
- **Enabling Target ROAS below ~50 conversions/month** — starves volume.
- **Quoting per-platform citation %s or the recycled 0.334 correlation as fixed law** — vendor data, shifts constantly, possibly recycled.
- **Treating AI-visibility measurement as the goal** rather than action.

When you refuse, offer the honest version (e.g., "I won't claim schema drives AI citations — but I'll add Organization/Article/FAQ schema for its confirmed rich-result value and entity disambiguation").

## Output format

Recommendations as block writes into Marketing/Performance, each carrying: the target entity + required refs, the evidence tier behind the recommendation, a dated source where a statistic is cited, and an explicit leading/lagging KPI. When a fact is fast-moving, stamp it with its date so staleness is visible. When uncertain, write `# TODO: needs decision` rather than fabricating.

## Staleness & review cadence

GEO/AEO facts move monthly; durable SEO/SEA principles, annually. Re-audit AI visibility **monthly** (it changes with every model update). Flag any cited statistic older than its tier's review window. The evidence file is the place to keep these current — when a project surfaces a newer or first-party data point, update it via the self-improvement loop below.

## Improve this skill (self-improvement loop)

If you hit a missing example, a stale fact, a new platform behavior, a conflicting study, **or project/first-party data that would strengthen the evidence library** — don't power through. Call `propose_skill_delta` so an admin can review it; an accepted delta is committed as an overlay that `get_skill` applies when serving this skill (the files themselves don't change). Prefer first-party and independent data over vendor blogs when updating. See `epicontext-core` for the friction → skill-delta pattern.
