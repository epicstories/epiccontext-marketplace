# CEPs as the Spine of Search (SEO · SEA · GEO/AEO)

How Category Entry Points and Mental Availability (the Ehrenberg-Bass framework) drive the search effort. The full framework + graph wiring is in `epicontext-marketing/references/methodologies/mental-availability-ceps.md` — **read it first**. This file is the search-discipline operationalization.

---

## The bridge: a search query is a CEP, voiced

A Category Entry Point is the situation a buyer's mind is in when they enter the category — *"my projects keep slipping,"* *"best CRM for a small agency,"* *"how do I stop double-booking clients."* When that buyer types a query or asks an AI assistant, they are **declaring a CEP out loud.** So:

- **Keyword research IS CEP research, made concrete.** Don't start from a keyword tool's volume dump; start from the prioritized CEP portfolio (the 7W list, 3C-ranked) and find how each CEP is *voiced* in search.
- **The AI prompt library IS the CEP portfolio, phrased for an assistant.** The 50–200 prompts you track for GEO/AEO should be the priority CEPs as a buyer would ask ChatGPT/Perplexity/AIO — not a random prompt set.
- **Mental availability and AI citation are the same goal in two arenas.** Mental availability = "thought of in the buying situation." AI citation = "surfaced when the assistant is asked about that situation." Being cited across the CEP-shaped prompt set is *machine-mediated mental availability.*

This is why the off-site brand signals matter so much for GEO (EVD-SO-016): AI assistants surface the brands with the strongest, broadest category associations — exactly what mental availability measures.

---

## CEP → search, per discipline

| Discipline | CEP becomes… | What you build |
|---|---|---|
| **SEO** | a keyword cluster + an answer-first page | One page (or hub) per priority CEP, written from the *situation*, statistic-rich and well-cited (Princeton pattern, EVD-SO-015). Informational CEPs are AIO/GEO-vulnerable; defend with citable content. |
| **SEA** | an ad group / theme + a landing page | Group paid around the transactional CEPs; the CEP's landing page doubles as the SEO answer page (shared content lifts Quality Score, EVD-SO-010). |
| **GEO/AEO** | prompts in the AI library + earned-media targets | Track the CEP as buyer-phrased prompts across engines; earn third-party coverage (digital PR, YouTube) that links the brand to that situation — the actual AI-citation driver (EVD-SO-016, EVD-SO-027). |

**Intent-cluster the CEP list** (Phase 2 of `methodology.md`): informational CEPs lean GEO + citable content; transactional/navigational CEPs lean paid + strong organic. The CEP portfolio is the input to that clustering — not a separate keyword dump.

---

## Measuring CEP coverage in search (mental SoV)

When buyer-survey mental-availability data isn't available, use the **behavioural proxy**: share of voice across the CEP-shaped query/prompt set.

| Metric | How to read it |
|---|---|
| **CEP coverage** | % of priority CEPs where you rank/are-cited at all |
| **Mental share of voice (per CEP)** | your presence vs competitors across that CEP's searches + AI answers |
| **AI mention rate per CEP** | % of the CEP's prompts where an assistant surfaces you (the GEO KPI, see `kpis.md`) |
| **Mental advantage (per CEP)** | how much more present you are than the strongest competitor at that CEP |

Re-audit monthly (AI visibility shifts with every model update). Track per-CEP, not just in aggregate — the strategy is *breadth* (be present across many situations), so a single high-traffic win can mask thin coverage everywhere else.

---

## How this lands in the graph

1. Read the CEP portfolio from `marketing_strategy` (`category_entry_points`). If it's missing, that's the gap to fix first — write it via `epicontext-marketing/SKILL.md` (7W + 3C), sourced from `research`/`insight`.
2. For each priority CEP, write: a `content_piece` (the answer page), a `channel` wiring (organic/paid/AI), and prompt-library entries on the `feedback` block (channel `aeo`).
3. Write `kpi` blocks for mental SoV / AI mention rate per CEP cluster, traced to an OGSM measure.
4. Keep it fresh: CEP↔brand links decay; re-review the portfolio and its search coverage each planning cycle.

---

## Anti-patterns (search-specific, on top of `anti-patterns.md`)

- **Skipping the buyer gate.** CEPs are buy-side only (see `epicontext-marketing/references/methodologies/mental-availability-ceps.md` → "is this a buying situation at all?"). Sell-side / intake / disposal queries (a *seller* searching "how to list X", a *supplier* onboarding) are a different actor — don't fold them into the buyer CEP/prompt set.
- **Ignoring need-state vs discovery-state.** A need-state CEP wants direct, fast, comparison-ready content found via active search; a discovery-state CEP wants narrative content found via incidental exposure. Matching the wrong mode to a CEP's search behaviour wastes the page.
- **Keyword-first instead of CEP-first.** Chasing volume without the situation produces pages that rank for words but don't match how buyers think — and don't get cited.
- **One mega-page for all CEPs.** Mental availability is breadth; collapse the portfolio into a single page and you under-serve most situations.
- **Treating the AI prompt set as arbitrary.** If the tracked prompts aren't the priority CEPs, the AI-visibility score measures the wrong thing — *tracked ≠ improved*, and tracked-the-wrong-thing is worse.
- **Optimizing aggregate share of voice only.** Hides per-CEP gaps; report per-CEP.
