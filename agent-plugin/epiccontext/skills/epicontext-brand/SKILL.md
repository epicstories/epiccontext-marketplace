---
name: epicontext-brand
description: "Use when the user mentions vision, positioning, tone of voice, brand, messaging, value proposition or brand promise, or shares a brand workshop, positioning exercise, voice guideline or messaging framework. Populates and audits the Brand group of an Epic Context graph (who the brand is, where it stands, how it speaks) and reconciles the brand promise with product behaviour."
metadata:
  epic.requires: "brand_positioning,messaging_framework,tone_of_voice,vision"
  epic.version: "1.0.0"
  epic.contenthash: "14c1ddaf81ae9b73"
---

# Epic Context — Brand Group

Populate, maintain, and analyze the Brand group: vision, positioning, tone of voice, messaging. Brand answers *how the project shows up in the world* — the consistent identity across every surface and every interaction.

This skill does two kinds of work:
- **Populate** entities from brand workshops, positioning exercises, voice guidelines
- **Analyze** existing brand to find drift, summarize for an audience, recommend action

## When to use this skill

**Populating:**
- Scaffolding a new project's Brand layer at kickoff
- Adding or updating vision, positioning, tone, messaging
- Ingesting brand workshops or voice exercises
- Capturing brand decisions that emerge during the project

**Analyzing:**
- Auditing voice consistency across surfaces (does in-app sound like marketing sounds like email?)
- Reconciling brand drift (the brand promise vs. what the product actually does)
- Summarizing brand for stakeholders or a new collaborator
- Evaluating proposed positioning shifts

**Reviewing:**
- Checking whether brand context is at the right maturity level
- Resolving voice decisions ("should this be more formal?", "how do we sound in a complaint response?")

## Core principle

**Scaffold first, never block.** Every project starts with all brand entities scaffolded from sensible defaults — vision as a working hypothesis, tone as "professional, direct, warm," positioning as a category-of-one stub. The skill's job is to populate and link; specialization is the work of building. **Stub is the floor, not the finish line:** the moment you have evidence — the repo, real research, the existing graph — fill the node to `drafted` in the same pass instead of leaving its scaffold placeholder, and run the proactive context pass (`epicontext-fill`) rather than waiting to be asked node-by-node.

Once scaffolded, brand drifts faster than almost any other group. Different writers, different surfaces, different moods produce divergence within months. The Brand group's job is to anchor — making voice and positioning testable and auditable, not just aspirational. A tone of voice document nobody references is not brand; it's wallpaper.


**Three modes of work this skill supports:**
1. **Scaffold** — stub all entities at project kickoff from sensible defaults.
2. **Specialize** — upgrade stubs to drafted/validated as decisions, research, and production use accumulate.
3. **Analyze** — use the populated, linked graph to find tensions across groups, classify problems vs accepted trade-offs, and recommend action with explicit reasoning. For cross-group analysis, see `epicontext-analysis` (its `ANALYSIS.md`). For brand-specific flows, see `references/analysis-flows.md`.

## The four entities

| Entity | Purpose | Reference file |
|--------|---------|----------------|
| Vision | Why this project exists, what change it's making | `references/entities/vision.md` |
| Positioning | Where the brand stands relative to alternatives | `references/entities/positioning.md` |
| Tone of Voice | How the brand sounds — narrative principles + operational rules (tone spectrums, vocabulary, channel overrides) for AI generators and content reviewers | `references/entities/tone-of-voice.md` |
| Messaging | What the brand says — value prop, key messages | `references/entities/messaging.md` |

**Read the relevant reference file before producing any entity.**

## How the entities connect

```
vision ──► positioning ──► messaging
              │              │
              └──► tone_of_voice ──► content (Product group)
```

Read this as: **vision is the foundation**. Positioning is how the brand stands relative to competitors. Tone of voice and messaging are how positioning is expressed. Tone of voice contains both narrative principles (humans read these for orientation) and operational rules (AI generators and content reviewers parse these to produce on-voice copy). Tone flows into every content string in the Product group; without that link, voice drifts.

## Order to populate for a new project

1. **Vision** — even one line; everything else needs an anchor.
2. **Positioning** — relative to competitors (links to Users group competitor entries).
3. **Tone of Voice** — start with narrative principles + concrete examples + anti-examples; specialize the operational layer (tone spectrums, vocabulary, channel overrides) as content production scales.
4. **Messaging** — value prop and key messages tied to positioning.

For an existing project:
- Brand often exists informally. Capture what's actually true (audit existing content for voice patterns) before writing aspirational guidelines.

## Maturity expectations

| Entity | Stub | Drafted | Validated |
|--------|------|---------|-----------|
| Vision | One-line aspiration | Tied to strategy, makes specific change | Used to make decisions; rejects mismatched opportunities |
| Positioning | Listed competitors and rough differentiation | Specific positioning statement, tested against market | Resonates in customer language and sales conversations |
| Tone of Voice | Adjectives only; default scaffold from project type | Principles + 5+ examples + anti-examples + tone spectrum + vocabulary lists + channel overrides | Voice consistent across audited surfaces; AI generators produce on-voice output |
| Messaging | Value prop written | Full message hierarchy with key messages per audience | Tested in market; messages land |

## Analyzing context — finding the problem and what to do about it

Use the three flows in `references/analysis-flows.md`.

**Diagnose** — common diagnoses:
- Voice drift across surfaces (in-app vs. marketing vs. email sound different)
- Positioning that doesn't match what customers say (research surfaces a different value than positioning claims)
- Vision that contradicts strategy (Strategy group says one thing; vision says another)
- Messaging that doesn't differentiate (sounds like every competitor)

**Summarize** — three formats: internal (under 100 words), team (200-350 words), client (1-2 pages). Brand summaries for clients should always include voice examples — abstract principles without examples don't communicate voice.

**Recommend action** — recommend ONE action, explain why, name tradeoffs honestly. Brand changes have long tails (every existing surface needs updating); calibrate accordingly.

## When you need to make a brand decision

`references/decisions/`:
- `decisions/voice-register.md` — formal vs. casual, warm vs. direct, expert vs. peer
- `decisions/voice-flexibility.md` — when to flex voice (channel, audience, life moment) vs. hold consistent
- `decisions/messaging-hierarchy.md` — what's the primary message, what's secondary, what's tertiary

## When you need a worked example

`references/examples/`:
- `examples/positioning-services-led.md` — positioning for a services-led brand
- `examples/tone-of-voice-with-examples.md` — full tone document with do/don't pairs
- `examples/messaging-hierarchy.md` — primary and supporting messages per audience

## When you need to defend a claim with evidence

`references/evidence.md` — Dunford, Moore, Ehrenberg-Bass, content design literature.

## Hostile-question preparation (messaging discipline)

Every `messaging_framework` block at maturity ≥ `drafted` must end with
a **Skeptic's questions** section — 3–5 pointed objections an executive,
customer, or competitor would raise, paired with a one-line answer
grounded in cited evidence (research / customer_insight / feedback /
competitor blocks). Without this, the messaging hasn't survived a
real-world test; it's still aspirational copy.

Examples of valid skeptic questions: *"How is this different from
[named competitor]?"*, *"What does this cost when it goes wrong?"*,
*"Who's already using it, and what did they pay?"*, *"Why now and not
in 12 months?"*. Generic objections ("is this scalable?") don't count.

This borrows the McKinsey narrative-builder pattern: messaging that
hasn't been tested against pushback is unfinished. See the discipline
contract (`epicontext-core/references/discipline.md`) for the
answer-first norm this enforces.

## The discipline contract

Every entity in this group at maturity ≥ `drafted` must pass the six
norms in `epicontext-core/references/discipline.md` — MECE,
answer-first, evidence-aware, assumption-conscious, executive-
readable, specific-enough. Load it before promoting any brand block.

## Anti-patterns to refuse

**Populating anti-patterns:**
- Vision that's a slogan without specifying the change being made
- Positioning that lists "we're better at X, Y, Z" without naming the audience and competitive frame
- Tone of voice that's adjectives only ("warm, professional, friendly") with no examples
- Messaging that sounds like every competitor in the category
- Brand assertions disconnected from product reality (claiming "fast" when the product is slow)

**Analysis anti-patterns:**
- "Voice audit" without sampling actual content from multiple surfaces
- Positioning recommendations from internal opinion alone (no customer or competitive evidence)
- Brand drift declared from one stakeholder's complaint

When refusing, offer the honest version. Example: "I can capture this as a stub vision; making it drafted requires specifying what specific change the project makes in the world."

## Output format

YAML structures defined in entity references. Always include:
- `maturity` field
- Linkage to Strategy group, Users group, Product group as appropriate
- `last_reviewed` date

When uncertain, write `# TODO: needs decision` rather than fabricating.

## When this skill ends

Skill ends when the requested entity has been produced. If the work touches Strategy (vision-strategy alignment), Users (audience), or Product (voice in content), surface the need but don't expand scope.

## Improve this skill (self-improvement loop)

If you hit confusion, a missing example, missing evidence, a new
pattern that's not yet covered, the schema gatekeeper rejects
something you wrote, **or you encounter project data or a cited
source that would strengthen the evidence library** — don't just
power through. Call `propose_skill_delta` so an admin can review it.
An accepted delta doesn't edit this skill's files: it is committed
as an overlay that `get_skill` applies when it serves the skill.

See `epicontext-core` for the full friction → skill-delta pattern
and how to format the proposal.
