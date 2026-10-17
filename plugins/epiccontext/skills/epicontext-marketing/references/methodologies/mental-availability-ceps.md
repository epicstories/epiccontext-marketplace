# Methodology — Mental Availability & Category Entry Points (CEPs)

The marketing-science backbone for *getting chosen*, from the Ehrenberg-Bass Institute (Byron Sharp, *How Brands Grow*; Jenni Romaniuk, *Building Distinctive Brand Assets* and *Better Brand Health*). This file is the shared reference for **how CEPs become actionable in the Epic Context graph** — it's pointed to by both `epicontext-marketing` and `epicontext-search-optimization`.

---

## The core idea

**Mental availability** = the propensity of a brand to be thought of, or noticed, in a buying situation. It is the single biggest driver of market share growth (Ehrenberg-Bass). You grow not by persuading a niche to love you, but by being *easy to think of* for **more buying situations, for more buyers**.

**Category Entry Points (CEPs)** are the building blocks of mental availability: the cues, situations, motivations, and occasions a buyer's mind uses to access the category — the moment someone thinks *"I might need this kind of thing."* A brand linked to **more relevant CEPs, more strongly than competitors** wins more of the category.

> Romaniuk's framing: mental availability is a *network* of brand↔CEP links in memory. Marketing's job is to build and refresh those links, broadly (more CEPs) and freshly (so they don't decay).

**Why this is the spine of the whole search effort:** *search terms and AI prompts are the written declaration of CEPs.* When a buyer types a query or asks an assistant, they are voicing a category entry point. SEO/SEA/GEO is the discipline of being present and chosen at the CEP — so CEPs are the bridge between brand strategy (marketing) and search execution (search-optimization).

---

## Gate: is this a buying situation at all?

**Run this before anything else.** CEPs and mental availability describe how **buyers enter the category to *acquire*.** Apply the framework ONLY to purchase/acquire situations. **Sell-side, intake/consignment, and disposal/liquidation situations are NOT CEPs** — they are a different actor with a different job (a seller listing an item, a lender liquidating collateral, a supplier onboarding). If the "situation" isn't a buyer deciding to acquire in the category, stop: it does not belong in the CEP portfolio, and it should not be minted as a persona-CEP.

> This gate is generic on purpose: two-sided marketplaces, auctions, B2B procurement-vs-supply, recruitment (candidate vs employer) all have a buy-side and a sell-side. The framework covers the buy-side. The sell-side deserves its own model — keep it separate (a distinct persona set and, if needed, its own strategy), don't fold it into the CEP portfolio.

---

## Identifying CEPs — the 7W framework

Run a workshop with category experts and/or interviews with category buyers, and enumerate CEPs across seven dimensions (Romaniuk's 7 Ws):

| W | Question | Example (project-management tool) |
|---|---|---|
| **Why** | What's the motivation / goal / problem? | "my projects keep slipping" |
| **When** | What time / trigger / frequency? | "at the start of a new quarter" |
| **Where** | What physical or digital location? | "while onboarding a new client" |
| **While** | What other activity is co-occurring? | "while juggling five tools" |
| **With/for whom** | Who else is involved? | "for a distributed team" |
| **With what** | What's it used alongside? | "alongside our CRM and Slack" |
| **hoW feeling** | What emotional state? | "overwhelmed, losing the overview" |

Aim for breadth: a healthy category map is **20–50 raw CEPs** before prioritization. Phrase each as a buyer would think it, not as a feature.

### Two CEP modes — need-state vs discovery-state

A generic and high-value split on the *When/Why/hoW* dimensions. Most CEPs lean one way, and **work that mixes signals of both usually means the CEP isn't sharply chosen.**

| | **Need-state** (functional, time-pressure) | **Discovery-state** (opportunistic, no time-pressure) |
|---|---|---|
| Trigger | a problem arises; something is needed now | curiosity, inspiration, no acute need |
| Emotion | relief, efficiency — *the outcome* matters | the search/process itself is the reward |
| Time | now, fast, no room to defer | leisure, no deadline |
| Tone that fits | direct, functional, little story | narrative, surprising, curiosity-piquing |
| How found | active search (SEA, direct query, comparison) | incidental exposure (social feed, PR, word of mouth) |

The same category can sit in **either** mode depending on the buyer's situation, not the product — e.g. a daily-use item is need-state; a collectible version of the same item is discovery-state. Classify by the buyer's situation, never by the product category.

### 7W sharpness test (pass/fail)

The 7 Ws *identify* CEPs; use them again as a **gate** on each candidate (this is a test, not a generation template). A CEP is sharp enough only if you can fill a concrete, buyer-phrased value for its core Ws:

- [ ] **Why / hoW-feeling** — a real motivation or emotional state?
- [ ] **When / Where / While** — a concrete trigger, place, or co-occurring activity?
- [ ] **With/for whom / With what** — who or what else is in the situation?

**Rule:** if you cannot give a concrete, buyer-phrased value for the situation's core Ws, it is **not a CEP yet** — it's a category label, a market statistic, or a feature. Reject or sharpen. *(This blocks "market-figure-as-CEP" — a number like "38% of the market" or "the diesel-SUV segment" is data, not a situation.)*

---

## Prioritizing CEPs — the 3 Cs

Reduce the raw list to a strategic shortlist with a process of elimination:

- **Commonality** — how often does this CEP occur across category buyers? (size of the prize). Prioritize high-incidence situations.
- **Competitiveness** — how cluttered is this CEP? Who already owns it? Avoid head-on fights at CEPs a competitor has cemented; look for under-served situations.
- **Credibility** — can the brand plausibly show up here, given its product range and history? Drop CEPs you can't deliver against.

Output: a ranked **CEP portfolio** (typically 5–12 priority CEPs), each with an incidence estimate, a competitive-clutter read, and a credibility note.

---

## Building the links — Distinctive Brand Assets (DBAs)

A CEP is only useful once the brand is *linked* to it in memory. The mechanism:

- Pick one priority CEP per execution (short-term: one message per execution; portfolio: many executions across many CEPs).
- Pair the CEP with **Distinctive Brand Assets** — colours, logo, characters, taglines, sonic cues — consistently, in every asset that features that situation. Over time the repeated pairing builds the memory shortcut.
- DBAs live in the graph as the `design_system` entity's visual blocks (`brand_visual_identity`, `brand_moodboard`) plus `tone_of_voice` and `messaging_framework`. Romaniuk's DBA grid (fame × uniqueness) is the test for which assets are worth investing behind.

---

## Measuring mental availability

Buyer surveys ask "which situations do you associate with which brands?" — measuring the strength of each brand↔CEP link. Key metrics (track over time):

| Metric | Definition |
|---|---|
| **Mental market share** | Your share of all brand-CEP associations in the category |
| **Mental penetration** | % of category buyers who link your brand to **at least one** relevant CEP |
| **Network size** | Average number of CEPs that bring your brand to mind (per buyer) |
| **Mental advantage** | How much more strongly you're linked to a *specific* CEP vs competitors |

A search-era proxy when survey data is absent: **share of voice across the CEP-shaped query/prompt set** (see search-optimization) — what share of the relevant searches and AI answers surface your brand. It's a behavioural stand-in for mental market share.

---

## Making CEPs actionable in the Epic Context graph (the "our setup" part)

CEPs are not a free-floating slide; in this setup they are **structured context that drives every downstream surface**. There is no dedicated `cep` block type — CEPs are captured and wired across existing entities:

```
                         ┌──────────── persona (who + their situations) ───────────┐
                         ▼                                                          │
  research / insight ──► CEP portfolio  ──► messaging_framework (a message per CEP) │
  (7W workshop)          (held on the                  │                            │
                          marketing_strategy)          ▼                            │
                                            content_piece (creative per CEP) ◄───────┘
                                                       │
                 ┌─────────────────────────────────────┼───────────────────────────────┐
                 ▼ SEO/SEA                              ▼ GEO/AEO                         ▼ Performance
        channel: organic/paid search          channel: AI/earned media           kpi + feedback(aeo)
        keyword clusters = CEPs voiced         AI prompt library = CEPs voiced     mental SoV per CEP
```

Concrete wiring:

1. **Capture the CEP portfolio on `marketing_strategy`.** Add a `category_entry_points` block in the strategy's body — each CEP with its 7W phrasing, incidence (commonality), clutter (competitiveness), credibility note, and priority. This is the source list everything else references. Source it from `research` / `insight` (the 7W workshop or buyer interviews) — write those blocks too.
2. **Tie each priority CEP to a `persona`.** CEPs are situations *buyers* are in; the persona's `situations` / `jtbd` are the human anchor. A CEP with no persona is a guess.
3. **Give each priority CEP a message in `messaging_framework`.** One message per CEP (not one message for all) — that's how you build broad mental availability instead of a single narrow claim.
4. **Brief `content_piece` blocks per CEP.** Each priority CEP becomes a creative brief; the content carries the Distinctive Brand Assets so the CEP↔brand link compounds. Wire `campaign_ref` + `channels_ref`.
5. **Operationalize CEPs as search via `search-optimization`:**
   - **SEO/SEA:** each CEP → a keyword cluster (the CEP "voiced"). Intent-cluster the CEP list; informational CEPs are AIO/GEO-vulnerable, transactional CEPs are click-rich + paid-friendly.
   - **GEO/AEO:** each CEP → entries in the **AI prompt library** (the `feedback` block, channel `aeo`). The 50–200 prompts ARE the priority CEPs phrased as a buyer would ask an assistant. See `epicontext-performance/references/examples/aeo-tracking-setup.md`.
6. **Measure CEP performance as `kpi` + `feedback`:** mental share-of-voice per CEP (what % of the CEP's searches/AI answers surface you vs competitors), AI mention rate per CEP-shaped prompt, branded-search lift. Trace each to an OGSM measure.

The payoff: a CEP defined once propagates to messaging, content, keywords, AI prompts, and KPIs — the graph turns a marketing-science concept into a maintained, queryable, measurable system. That's "what AI can do to make CEPs actionable": read the CEP portfolio, fan it out across these entities as block writes (each with a `reason`), and keep the brand↔CEP links fresh.

---

## Review mode — test work against CEPs (reviewer, not generator)

The framework has two uses. Above is the **build** use (identify, prioritize, wire CEPs). This is the **review** use: a fixed question-set to judge whether a concrete piece of work — copy, a design, a UX flow, a campaign brief, a landing page, a positioning line — actually builds mental availability. **In review mode the framework tests the work; it does not generate it in place of the team.** Run the questions in order; output the assessment as its own short note (no fixed template — fit the form to the moment), naming concrete changes, not just pass/fail.

1. **Buyer gate** — is this even a buying situation (vs sell-side / intake / disposal)? If not, the CEP lens doesn't apply — say so and stop.
2. **CEP assignment** — which CEP(s) does this serve? Is it **need-state, discovery-state, or (problematic) a mix of both**? Mixed signals (urgency language on a discovery item, a meandering story on a need-state query) → flag: the CEP isn't sharp.
3. **7W sharpness** — does the CEP behind this pass the pass/fail test above, or is it a category label / market figure / feature wearing a CEP costume?
4. **Breadth (commonality)** — does this reach broadly, or does niche language / an assumed-knowledge bar / a one-segment tone quietly exclude part of the audience? (Growth is breadth — EVD-SO-029.)
5. **Credibility at risk moments** — on a money/trust/authenticity moment, does this *remove* uncertainty or accidentally add it? (Each category has recurring trust-blockers — its "known frictions". See "Project-specific layers" below; new work must not contradict the project's accepted resolutions.)
6. **Competitiveness / structural backing** — if it makes a supply/scarcity/price claim, is that **structurally true and provable** in the actual experience, or a one-off marketing claim the rest of the product won't back up?
7. **Distinctive Brand Assets** — does it reuse consistent, recognizable brand assets (visual, voice, fixed UI patterns) so the CEP↔brand link compounds, or is it a one-off that builds no memory?
8. **Advice** — concrete and reasoned in CEP / mental-availability terms: what to change and why. Not "good/bad" — a specific, actionable edit.

> Items 4–6 are the same three lenses you used to *prioritize* CEPs (commonality, credibility, competitiveness — the 3 Cs), now turned around to *judge a piece of work*. Same vocabulary, two jobs.

### Project-specific layers (live in the project graph, not here)

This methodology is generic. A project specializes it by holding its own instances in its graph — keep them there, not hard-coded in the skill:

- **CEP portfolio** → `marketing_strategy.category_entry_points` (the project's actual 7W→3C list).
- **Known frictions** → the recurring credibility blockers in *this* category, captured as `decision` blocks (the accepted resolution) and tracked via `feedback`. Review question 5 checks new work against these.
- **Funnel / journey mapping** → which 3-C lens dominates at each stage of *this* product's journey lives on the `journey_map`, not in this file. Use it to check that a piece of work fits the stage it appears in.
- **Need vs discovery split** → which mode each priority CEP is in, noted on the CEP portfolio.

That keeps the skill reusable across every project while each project's specifics stay in its own graph.

---

## Anti-patterns to refuse

- **CEPs ≠ audience segments.** Segments slice *people*; CEPs slice *buying situations* (one person hits many CEPs). Don't collapse them. (Ehrenberg-Bass is explicit demographic segmentation is weak strategy.)
- **CEPs ≠ features.** "Has Gantt charts" is a feature; "while planning a big launch" is a CEP. Brief from the situation, not the spec.
- **CEPs ≠ sell-side / intake / disposal situations.** The framework is buy-side only (see the gate). Minting a seller/supplier/consignor as a "persona-CEP" is the classic error — give the sell-side its own model.
- **Mixing need-state and discovery-state in one execution.** Urgency language on a discovery item, or a meandering story on a need-state query, undermines itself — a sign the CEP wasn't sharply chosen.
- **Using the framework as a generator.** In review mode it *tests* work against CEPs; it doesn't invent the work in place of the team. Generating from the checklist skips the very test questions that catch the errors above.
- **Over-investing in one CEP.** Mental availability is *breadth* — being linked to many situations. Don't pour everything into the single biggest CEP and starve the network.
- **Inventing CEPs at the desk.** CEPs come from buyers (7W interviews) or category experts, not from the marketer's intuition. An un-sourced CEP portfolio is a `vendor_claim`-tier guess — mark it stub until research backs it.
- **Letting links decay.** Mental availability erodes without refreshment. A CEP wired once and never refreshed loses strength; treat the portfolio as living context, re-reviewed each planning cycle.
- **Distinctive ≠ different.** DBAs must be *recognized as yours* (fame × uniqueness), not merely "creative." Test before investing.

---

## Evidence

The confidence-tiered, dated evidence entries for this framework live in
`epicontext-search-optimization/references/evidence.md` §E (EVD-SO-029…032) — the
search-optimization skill is where mental availability and search converge, so the
evidence is kept in one place. Core sources: Sharp, *How Brands Grow* (2010);
Romaniuk & Sharp, *How Brands Grow Part 2* (2016/2022); Romaniuk, *Building
Distinctive Brand Assets* (2018) and *Better Brand Health* (2023); Ehrenberg-Bass
Institute CEP research; Romaniuk, "Increasing mental market share by using category
entry points" (2023).
