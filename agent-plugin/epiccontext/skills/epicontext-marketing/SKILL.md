---
name: epicontext-marketing
description: "Use for marketing: go-to-market, a campaign, channel, content piece, blog post, ad, landing page, growth or acquisition; SEO, SEA, GEO/AEO and AI search visibility. The Marketing expert: its method, then what this organisation and project know (get_skill with project_id). Populates and audits the Marketing group against brand, strategy and personas."
metadata:
  epic.requires: "campaign,channel,content_piece,marketing_strategy"
  epic.version: "1.0.0"
  epic.contenthash: "4225b4182b2df24e"
---

# Epic Context — Marketing Group

> **The Marketing expert** (ADR-072). This file is the method, the same at every client. `get_skill("epicontext-marketing", project_id)` adds what this organisation and project already know, below it. Read both before you write. What you learn that should outlive the session goes back with `save_rule` or `log_learning` and `expert: "marketing"`. A signal to classify goes through the five-step analysis (`epicontext-core/references/analysis/README.md`).

Populate, maintain, and analyze the Marketing group: marketing strategy, campaigns, channels, content pieces. Marketing answers *how we grow* — how the product reaches the personas it's for, in the voice the brand has set, against the goals the strategy committed to.

This skill does two kinds of work:
- **Populate** entities from marketing plans, campaign briefs, channel audits, content calendars
- **Analyze** existing marketing to find drift, audit alignment with brand + strategy + personas, and recommend action

## When to use this skill

**Populating:**
- Scaffolding a new project's Marketing layer at kickoff
- Adding or updating marketing strategy, a campaign, a channel, or a content piece
- Ingesting a marketing plan, campaign brief, channel review, or content calendar
- Capturing campaign wrap-ups (what was claimed, what actually moved)

**Analyzing:**
- Auditing whether marketing aligns with brand voice + positioning + messaging
- Checking whether campaign KPIs ladder up to OGSM Goals
- Diagnosing channel performance ("which channels actually reach the primary persona?")
- Reconciling drift between marketing claims and product reality

**Reviewing:**
- Checking whether marketing context is at the right maturity level
- Resolving channel decisions ("paid social vs. SEO this quarter?", "kill or invest in this channel?")

## Core principle

**Scaffold first, never block.** Every project starts with all marketing entities scaffolded from sensible defaults — a marketing-strategy stub anchored to OGSM and messaging, a primary channel, a primary campaign, a primary content piece. The skill's job is to populate and link; specialization is the work of running campaigns. **Stub is the floor, not the finish line:** the moment you have evidence — the existing graph, a real campaign brief, the team's actual channel cadence — fill the node to `drafted` in the same pass instead of leaving its scaffold placeholder, and run the proactive context pass (`epicontext-context` (fill)) rather than waiting to be asked node-by-node.

Marketing is the most-easily-orphaned group. A campaign launched without a `strategy_ref` is "we made a thing"; a content piece without a `campaign_ref` is "we wrote a thing." Both are noise. Marketing earns its place in the graph by tracing every artefact back to the strategy, the brand, and the persona it serves.

**Three modes of work this skill supports:**
1. **Scaffold** — stub all entities at project kickoff from sensible defaults.
2. **Specialize** — upgrade stubs to drafted/validated as campaigns ship and channels prove themselves.
3. **Analyze** — use the populated, linked graph to find tensions across groups (brand voice drift in marketing copy, channels that miss the persona, campaigns disconnected from OGSM), classify problems vs accepted trade-offs, and recommend action with explicit reasoning. For cross-group analysis, see the five-step analysis (`epicontext-core/references/analysis/README.md`).

## Mental availability & Category Entry Points (the demand-side spine)

Marketing's deepest job is **mental availability** — being easy to think of in buying situations — built from **Category Entry Points (CEPs)**, the cues/situations a buyer's mind uses to enter the category (Ehrenberg-Bass; Sharp, *How Brands Grow*; Romaniuk). This is the framework that makes the whole group coherent: a CEP portfolio defined once fans out to messaging (a message per CEP), content pieces (creative per CEP), channels, the search keyword + AI-prompt libraries, and the KPIs that measure share-of-voice per CEP.

- Identify CEPs with the **7W framework**; prioritize with the **3 Cs** (Commonality, Competitiveness, Credibility).
- Hold the prioritized **CEP portfolio on `marketing_strategy`** (`category_entry_points`), sourced from `research`/`insight`, anchored to a `persona`.
- A **search query / AI prompt is a CEP voiced** — so the CEP portfolio is the input to `references/search-optimization/README.md` (SEO/SEA/GEO), not a separate keyword dump.

**Read `references/methodologies/mental-availability-ceps.md`** for the full method, the graph-wiring diagram, measurement, and anti-patterns. It's the shared reference between this skill and `references/search-optimization/README.md`. It works two ways: a **build** mode (identify → prioritize → wire CEPs) and a **review** mode — a fixed question-set to *toets* a concrete piece of work (copy, design, flow, campaign) against CEPs and mental availability, reviewer-not-generator. Both start with the **buyer gate** (CEPs are buy-side only; sell-side/intake/disposal situations are a different model).

## The four entities

| Entity | Purpose | Reference file |
|--------|---------|----------------|
| Marketing Strategy | The go-to-market frame for a period | `references/entities/marketing-strategy.md` |
| Campaign | A discrete initiative (Q3 launch, spring sale, designer week) | `references/entities/campaign.md` |
| Channel | A distribution channel that reaches a persona | `references/entities/channel.md` |
| Content Piece | A concrete artefact (blog, video, ad, landing, social, email) | `references/entities/content-piece.md` |

**Read the relevant reference file before producing any entity.** (Each entity reference is a short markdown file describing the required fields, the connection mandate, and 1–2 worked examples.)

## How the entities connect

```
                  ┌── brand_positioning ──┐
                  │                       ▼
  ogsm ──► marketing_strategy ──► campaign ──► content_piece
                  │                  │           ▲
                  ▼                  ▼           │
              persona[] ◄────── channel[] ───────┘
                                  │
              messaging_framework ─┴─► content_piece
                                          │
              tone_of_voice ───────────► content_piece
```

Read this as: **OGSM sets the goals**, marketing_strategy commits to a period of effort against them, brand_positioning + messaging_framework + tone_of_voice supply the words and the voice, channels reach personas, campaigns run on channels and produce content pieces. KPIs measure the impact.

## Required connections (the mandate)

The full list of required and recommended edges across every entity
lives in `epicontext-context` (connections); `check_project_health` reports the
ones a project is missing. Some projects also keep a
`canonical-linking-spine` architecture_diagram block that draws them —
if `get_block(key: "canonical-linking-spine")` finds one, it's a handy
picture. The marketing slice, for quick reference:

| From | Required ref | To |
|---|---|---|
| `marketing_strategy` | `ogsm_ref` | `ogsm` |
| `marketing_strategy` | `messaging_ref` | `messaging_framework` |
| `marketing_strategy` | `personas_ref` | `persona[]` |
| `campaign` | `strategy_ref` | `marketing_strategy` |
| `campaign` | `channels_ref` | `channel[]` |
| `channel` | `personas_ref` | `persona[]` |
| `content_piece` | `campaign_ref` | `campaign` |
| `content_piece` | `channels_ref` | `channel[]` |

Soft (recommended) refs include `tone_of_voice_ref` on content pieces, `kpis_ref` on campaigns, `features_ref` on content pieces, and `positioning_ref` on the marketing strategy. The scaffold pre-wires these between its stub blocks; when you create a new block, set each ref yourself (usually to the project's primary anchor of that type).

If this table ever disagrees with `epicontext-context` (connections) or with what `check_project_health` reports, those win — follow them, and file a `propose_skill_delta` to fix this table rather than acting on stale info.

## Order to populate for a new project

1. **Marketing Strategy** — anchor to OGSM, messaging_framework, and the primary persona. Without these three refs the block is unmoored.
2. **Channels** (1–4) — each backed by a persona it reaches. "We do social media" is not a channel; "Founder LinkedIn for solo product designers" is.
3. **Campaign** (the current one) — goal as an outcome (signups, qualified leads, revenue), not activity. Hypothesis even if it's small.
4. **Content Pieces** — drafted under a campaign, distributed on channels, voiced by the brand.

For an existing project:
- Marketing often exists informally. Capture what's actually true (audit recent posts, ads, landing pages) before writing aspirational plans. Mark channels with `notes:` describing what works.

## Maturity expectations

| Entity | Stub | Drafted | Validated |
|--------|------|---------|-----------|
| Marketing Strategy | Summary + anchors to OGSM/messaging/persona | Goals as outcomes, 2–4 primary channels named, anti-strategy written | Multiple campaigns wrapped against it; goals hit or honestly missed |
| Campaign | Name + goal + status | Hypothesis + channels + KPIs + content pieces wired | Wrapped with actual KPI movement + lessons learned linked |
| Channel | Name + type + persona | Owner, cadence, cost model, notes on what works | Repeatedly delivers to the persona at predictable CAC |
| Content Piece | Title + format + hook | Key message borrowed from messaging_framework, voice respects tone_of_voice, channels wired | Published + measured against campaign KPIs |

## Analyzing context — finding the problem and what to do about it

**Diagnose** — common diagnoses:
- **Marketing orphaned from strategy**: campaigns with no `strategy_ref`; content pieces with no `campaign_ref`. Marketing happens; nobody can answer "why."
- **Channels that miss the persona**: a channel has a `personas_ref` but the persona's `where_they_hang_out` doesn't include that channel. Cost without reach.
- **Voice drift in marketing copy**: content pieces don't trace to `tone_of_voice_ref`; copy reads off-brand vs. in-product copy.
- **Positioning invented in marketing**: hooks and value props in content pieces don't match `brand_positioning` + `messaging_framework`. Marketing tells one story; product tells another.
- **KPIs that don't ladder up**: campaign KPIs aren't part of any OGSM Goal. Movement that doesn't matter.

**Summarize** — three formats:
- Internal one-liner (under 100 words): "What is marketing actually doing this quarter?"
- Team brief (200-350 words): strategy summary + active campaigns + channels + this week's content
- Client deck (1-2 pages): brand-voice respecting summary with results, lessons, next bets

**Recommend action** — name ONE action, explain why, name tradeoffs honestly. Marketing changes have a lag (1–4 weeks to see whether a channel works); don't kill a channel on one bad week.

## When you need to make a marketing decision

`references/decisions/`:
- `decisions/channel-prioritisation.md` — pick 2–4 channels; the rest are dormant or anti-strategy
- `decisions/campaign-vs-evergreen.md` — when a piece deserves a campaign frame vs. evergreen content
- `decisions/kill-or-double.md` — when to kill a channel vs. invest more

## When you need a worked example

`references/examples/`:
- `examples/marketing-strategy-saas.md` — a B2B SaaS marketing strategy linked to OGSM + persona
- `examples/campaign-product-launch.md` — a product-launch campaign with channels, content, KPIs
- `examples/content-piece-blog-post.md` — a blog post with hook, key message, voice respect, distribution

## The discipline contract

Every entity in this group at maturity ≥ `drafted` must pass the six
norms in `epicontext-core/references/discipline.md` — MECE,
answer-first, evidence-aware, assumption-conscious, executive-
readable, specific-enough. Especially relevant for Marketing: a
marketing_strategy whose goals aren't stated as outcomes (signups,
revenue, qualified leads) is failing specific-enough; a campaign
with overlapping channel categories is failing MECE; a content_piece
whose hook isn't borrowed from messaging_framework + cited is failing
evidence-aware.

## Anti-patterns to refuse

**Populating anti-patterns:**
- Marketing strategy with no `ogsm_ref` — don't write it unmoored — create a stub OGSM Goal first and link it
- Campaign goal stated as activity ("post 3x/week", "publish 5 blogs") instead of outcome (signups, revenue, qualified leads)
- "Social media" listed as a channel — break it into the specific surfaces (LinkedIn vs. TikTok vs. X)
- Content piece with no `campaign_ref` — orphaned marketing rarely performs; either link a campaign or mark as evergreen with a `notes:` explaining why
- Inventing positioning or hooks in marketing copy that aren't in `messaging_framework` — borrow, don't invent
- Cheeky voice when `tone_of_voice` says formal (or vice versa)
- Campaign stuck on `status: in_flight` months after `end_date` — wrap honestly with results

**Analysis anti-patterns:**
- Recommending a channel kill on one bad week of data
- "Marketing isn't working" without naming which OGSM Goal it's failing to move
- Blaming voice drift without sampling actual published content

When refusing, offer the honest version. Example: "I can capture this as a stub campaign; making it drafted requires a `strategy_ref` and at least one channel — should I scaffold a marketing_strategy first?"

## Output format

YAML / markdown structures defined in entity references. Always include:
- `maturity` field
- The required refs (see "Required connections" above)
- `last_reviewed` date

When uncertain, write `# TODO: needs decision` rather than fabricating.

## When this skill ends

Skill ends when the requested marketing entity has been produced and linked. If the work touches Brand (voice/messaging), Strategy (OGSM), Users (persona), or Performance (KPIs), surface the need but don't expand scope — write the change in the matching group instead.

## Improve this skill (self-improvement loop)

If you hit confusion, a missing example, missing evidence, a new pattern not yet covered, the schema gatekeeper rejects something you wrote, **or you encounter project data or a cited source that would strengthen the evidence library** — don't just power through. Call `propose_skill_delta` so an admin can review it. An accepted delta doesn't edit this skill's files: it is committed as an overlay that `get_skill` applies when it serves the skill.

See `epicontext-core` for the full friction → skill-delta pattern and how to format the proposal.
