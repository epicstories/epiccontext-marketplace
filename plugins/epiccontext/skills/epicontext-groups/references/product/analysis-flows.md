# Analysis Flows — Product Group

Three flows for analyzing product context: diagnose, summarize, recommend. Same shape as Users group, adapted for product-specific patterns.

## Flow 1: Diagnose

### Two starting points

**A. Diagnose from the graph** — context is populated, looking for a pattern across product entities.

**B. Diagnose from raw input** — product spec, content audit, navigation review, terminology workshop hasn't been structured yet.

### A. Diagnosing from the graph

Common diagnoses in Product:

**Glossary drift** — Multiple terms for one concept, or one term for multiple concepts, accumulating across content.
- Pull all glossary terms; check for synonyms in usage notes
- Pull all content; check for raw words that should be glossary references
- Cross-reference: terms in glossary that aren't referenced anywhere are dead; words appearing 5+ times in content that aren't in glossary are missing terms

**Feature-JTBD mismatch** — Features that don't trace to a job, or jobs without a serving feature.
- Pull all features; check `linked_jtbds`. Features with empty links are flagged.
- Pull all JTBDs (Users group); check incoming feature links. JTBDs with no features are unserved jobs.
- Both directions matter — orphan features waste effort, unserved jobs lose users.

**IA-mental-model gap** — Navigation organized by team structure, not by user understanding.
- Walk each persona through their primary journey using the IA. Where do they get lost? Where do they have to backtrack?
- Check IA labels against glossary — labels that aren't glossary terms are usually team jargon.
- Check incoming paths — sections users never reach are either dead or hidden.

**Voice drift in content** — Different surfaces sound like different products.
- Pull content strings; check `brand_tone_referenced`. Strings without tone reference are unanchored.
- Sample strings by section; do they feel like the same voice? Or do registration emails feel corporate while in-app copy is casual?

### B. Diagnosing from raw input

Inputs:
- Existing site/product to audit
- A spec or PRD that needs structuring into the graph
- Stakeholder feedback batch
- Content from a workshop

Process:
1. Extract candidate entities (terms → glossary, capabilities → features, sections → IA, strings → content).
2. Cluster: same concept under different names → glossary drift candidates. Different concepts under same name → ambiguity candidates.
3. Check upstream linkage: do extracted features trace to known JTBDs? If not, that's a flag.
4. Check downstream coverage: do extracted JTBDs (from Users group) have features serving them?
5. Identify the pattern that connects misalignments.

### Evidence-sufficiency gates

Before declaring a diagnosis:
- [ ] At least 3 corroborating signals across at least 2 entity types or surfaces
- [ ] Tested against the obvious alternative hypothesis
- [ ] Connected to specific affected entities (not "the product")
- [ ] Not over-fitted to the loudest stakeholder voice or the most recent change

If gates fail, the honest output is "tentative finding — needs more evidence."

### Output structure

```yaml
diagnosis_id: diag-[slug]
date: 2026-05-04
question: "The specific question investigated"
finding: "One-sentence statement of the underlying problem"
confidence: tentative | drafted | high
evidence:
  - source: glossary-drift-audit | feature-jtbd-trace | ia-walkthrough | content-sample
    signal: "What this contributes"
opposing_hypothesis_tested: "What would have proven this wrong, and why we ruled it out"
affected_entities:
  features: [feature-id]
  ia_nodes: [ia-id]
  glossary_terms: [glossary-id]
  content: [content-id]
implications:
  - "What this means for users / business / team"
gaps_in_evidence:
  - "What we don't know yet"
```

## Flow 2: Summarize

Same three audience formats as Users group:

- **Internal (just me)** — under 100 words, scannable in 30 seconds
- **Team (Frenz, Nico, collaborators)** — 200-350 words, fits a Slack thread
- **Client** — 1-2 pages, designed for decision-making

For Product specifically, client summaries should include:
- A diagram or visual where IA is involved (text-only IA descriptions are hard to follow)
- Specific examples of drift or misalignment, named and quoted
- The cost of NOT addressing it, in user terms ("users currently can't find X" not "the IA has issues")

## Flow 3: Recommend action

Default: recommend ONE action, explain why, name the tradeoffs honestly.

For Product, common action categories:

**Glossary actions** — Adopt a canonical term and deprecate synonyms; add a missing term; merge ambiguous terms with disambiguation; bind translations at glossary level.

**Feature actions** — Trace orphan features to their job (or sunset them); propose feature for an unserved job; reprioritize based on JTBD evidence; sunset feature whose JTBD is now obsolete.

**IA actions** — Restructure section by user mental model; flatten deeply-nested primary tasks; rename labels to match glossary; remove dead-end pages.

**Content actions** — Bind unbound strings to glossary; rewrite to match brand voice; translate via glossary layer; A/B test a microcopy change at a decision moment.

Calibrate to evidence:
- **Tentative diagnosis** → small reversible action with measurement built in (rename one term and watch; A/B one button label).
- **High-confidence diagnosis** → larger structural change, but still with measurement and rollback plan.

## Red Flags

These are direct interventions in Claude's reasoning. When any pattern below appears, stop and reconsider.

**🚩 Recommending "redesign IA" from a few user complaints.**
Stop. IA redesigns are expensive and disruptive. Tentative evidence → small navigation tweaks first. Major IA changes require tree testing or strong behavioral data.

**🚩 About to declare glossary drift from 2-3 instances.**
Stop. Some inconsistency is unavoidable. Drift is a *pattern* across many surfaces — single instances are minor cleanup, not a diagnosis.

**🚩 Feature recommendation without naming the JTBD.**
Stop. If you can't trace the proposed feature to a specific job, you're proposing scope creep. Find the JTBD or recommend differently.

**🚩 Content recommendation that doesn't reference the brand voice.**
Stop. Content changes that ignore brand voice produce the drift you're trying to fix. Always cross-check.

**🚩 IA recommendation that doesn't reference any persona's journey.**
Stop. IA exists to serve user paths. If the recommendation doesn't show how a persona's journey improves, the recommendation isn't grounded.

**🚩 "The team has been saying we should redesign X for months."**
Stop. Stakeholder consensus is not evidence. The diagnosis must show the actual problem in the entities, not in meeting minutes.

**🚩 Glossary cleanup recommendation without checking impact on existing content.**
Stop. Renaming a term means every content string referencing it needs updating. Estimate scope before recommending.

**🚩 About to skip the maturity flag because the analysis "feels right".**
Stop. Tentative diagnosis → tentative output. Confidence calibration is the discipline.

**🚩 Hedging language doing the work of evidence.**
Stop. "It might be possible that some content could potentially benefit from…" is confidence-laundering. Be direct.

## When to refuse to analyze

- Single-source signal presented as a pattern
- IA "audit" without testing against any actual journey
- Feature prioritization without JTBD linkage available
- Content review that ignores glossary state
- Analysis being requested to justify a redesign already decided

Honest output: "Not enough evidence to support analysis at this confidence level. Here's specifically what we'd need: [list]."

---

## Cross-group considerations

Product-group signals (feature usage, IA findability, content/copy issues, glossary inconsistency) almost always have causes outside the Product group. Don't fix what you find without traversing first. See `epicontext-analysis/ANALYSIS.md` for the full method.

**Signals that typically originate here:**
- Feature usage low or dropping; users skip a step; abandoned flows
- IA findability problems (tree test fails, support tickets about "where is X?")
- Content drift (copy doesn't match brand voice; terms inconsistent across surfaces)
- Glossary inconsistency (same concept named three different ways)
- "We need a new feature" requests from stakeholders or customers

**Pull from these groups before judging:**
- **Users (persona, JTBD, journey):** is this feature for the right persona? Is the journey phase the actual pain point?
- **Strategy + OGSM:** is this feature on a strategic objective, or is it legacy?
- **Brand voice:** is the copy supposed to read this way, or has it drifted?
- **Build (design system, components):** is the implementation the problem, not the design?
- **Performance:** does the metric actually move? Or is the "problem" perceived without data?

**Trade-off types specific to this group:**
- Fix vs deprecate (is the feature serving anyone?)
- Improve copy vs improve flow vs improve concept (different fixes for different root causes)
- Add IA node vs reorganize (additive is cheaper; reorganize is sometimes necessary)
- One term vs synonyms (consistency vs domain accuracy — see `decisions/one-term-or-many.md`)

**Default classification questions:**
- Is this feature on a current OGSM? (If not — deprecate or document as maintenance)
- Does the linked persona actually need this? (If not — wrong feature for wrong audience)
- Has the brand voice changed, or did the copy drift? (Different responses to each)
- Is the IA wrong, or is the content wrong? (Tree test answers this; don't guess)
