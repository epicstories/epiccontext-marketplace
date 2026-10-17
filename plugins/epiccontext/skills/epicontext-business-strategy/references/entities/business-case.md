# Business Case

The investment thesis for a specific bet — usually a roadmap item, capability investment, or strategic choice. A business case forces the question: **"Why this, why now, what does it cost, what does it return, and what would change our mind?"**

A well-written business case lets a stakeholder say yes or no with confidence — not because it's polished, but because the reasoning is exposed end-to-end.

## Why most business case blocks are too thin

A common failure mode: the executive summary is one line, the problem statement is one line, every other field is empty, and `confidence_level = medium` is the only signal — meaning *nothing*. That's not a business case. That's a label.

A business case is a **thinking artifact**, not a form. It should read like a senior analyst spent two hours on it. If yours reads like a checklist someone tabbed through in two minutes, downgrade it to `stub` and keep working.

## The depth bar

A drafted business case has **≥7 of the 11 schema sections substantively filled**, with **named evidence** behind every load-bearing claim. "Substantively" means:

| Section | Stub looks like | Drafted looks like |
|---|---|---|
| Executive Summary | "We should invest in X." | 2–3 paragraphs: what we're investing in, why now (the trigger), what we expect back (tied to OGSM goals), confidence level + why. |
| Problem Statement | "Users find it hard." | Who feels the pain (linked persona), current cost (quantified or named), what's been tried, cost of doing nothing. |
| Market Opportunity | "Big market." | Named segment, sized (even rough), why-now signal, where competitors leave a gap. Cited. |
| Value Proposition | "Better UX." | The mechanism — specific enough to disagree with. Why customers switch from the alternative they use today. |
| Competitive Advantage | "We're better." | Named comparables (link competitor blocks), what they do well, where our wedge is, how durable it is. |
| Revenue Model | "Subscription." | Pricing model + unit economics + path to ≥X% margin. If unsure, name the experiments to find out. |
| Investment Required | "A few weeks." | Engineer-weeks, design-weeks, money, opportunity cost (what we won't do). Best/expected/worst case. |
| Risks & Mitigations | "Technical risk." | 3–5 named risks, each with likelihood, blast radius, and a mitigation (or "we accept this risk because…"). |
| Recommendations | "Approve." | Decision + decision-maker + decision-date. What happens at each gate. |
| Confidence | "medium" | A reason for the level — the assumption-to-evidence ratio. |

## The depth checklist (run BEFORE writing the block)

Answer each. If you can't, that's the work to do — don't paper over it.

1. **The bet in one sentence.** "We're investing [resources] in [thing] because [trigger], expecting [outcome] within [horizon]." If you can't write this, no case yet.
2. **The trigger.** What changed externally or internally that put this on the table now and not six months ago?
3. **The cost — honest version.** Engineer-weeks, design-weeks, opportunity cost (what we're NOT doing). Best/expected/worst case.
4. **The expected outcome — tied to OGSM Goals.** Which Goal does this move? By how much? When measurable?
5. **The alternatives — at least three, including "do nothing".** For each: what would happen, why we're not picking it.
6. **The assumptions.** What has to be true for this case to hold? List 3–7. These become the things to test.
7. **The falsification condition.** "If [evidence] shows up, we'll reverse this decision." Without this, it's not a bet, it's a hope.
8. **The audience.** Which persona feels the upside? Link them. If no persona is named, the value prop is abstract.
9. **The competitive frame.** Who would do this differently and why? Link competitor blocks.
10. **The downstream blocks.** Which features, decisions, KPIs does this case justify? Link them — a business case with no downstream connections is decoration.
11. **The reviewer.** Who decides? Who gets to overrule? When is the next review?

## Push-back prompts (run AFTER drafting, as a critic pass on your own draft)

After you've written the block, run this self-interrogation. Don't skip it — this is where stub becomes drafted.

- **"Did you size it?"** If every section is qualitative, the case is decorative. Find at least one number — even a rough range with explicit confidence.
- **"What evidence am I sitting on that I didn't use?"** Walk the connected graph: linked persona's pain quotes, the OGSM Goal's measure, the competitor blocks' weaknesses, the latest research blocks. Pull at least three pieces of evidence into the body.
- **"What's the strongest argument against this case?"** Write it down inside the case, then respond to it. A case that doesn't address its own counter-argument hasn't been pressure-tested.
- **"Am I sure this belongs in `business_case` and not `decision` (ADR)?"** A business case is the *thesis before* a decision. A decision is the *commitment after*. If it's already committed, the body should reference the ADR — and the case becomes the rationale-trail.
- **"What would a skeptical CFO ask?"** Three questions. Answer them in the body, not in your head.
- **"How does this die?"** Name three failure modes. If you can't, you don't yet understand the risk.
- **"Word-count check."** A drafted business case is rarely under 600 words. If yours is, you compressed where you should have reasoned. Expand the section that's thinnest — usually `risks_mitigations` or `competitive_advantage`.

## Evidence pool — where to mine

Before claiming drafted, walk these and pull what's relevant:

- **Linked graph nodes:** the persona (their pain quotes), OGSM Goals (the metric this should move), competitor blocks (named comparables), customer_insight blocks (validated signals), research blocks (study findings).
- **The repo:** ADRs (`.claude/skills/epicontext-build/references/decisions/`), existing feature blocks (what's already built that this depends on or replaces).
- **This skill's references:** `references/decisions/` may carry prior cases. Read them before writing yours — pattern-match what worked.
- **Comparable products:** the strategic-group-map or competitor blocks name them. If your case has no comparables, search the public web for one — but cite it.
- **The team's prior cases:** if there are other `business_case` blocks in this project, your case should be coherent with them. If it contradicts, name the contradiction.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default, untouched. Recognisable by placeholder phrases. |
| **drafted** | All 11 depth-checklist questions answered. At least one push-back round done. ≥600 words in body. No "Replace with..." text left. At least 3 linked downstream blocks (persona, OGSM Goal, competitor, feature, ADR). |
| **validated** | Drafted + ≥3 citations to research/decisions/production evidence in the body. Reviewed and signed-off by a named decision-maker. A `decision` block (ADR) exists that references this case. |

If a block claims `validated` without a linked ADR, downgrade it to `drafted` (`update_block` with `maturity: drafted` and a `reason`).

## Push-back lines to use on yourself (or to surface to the user)

When working on a business case, drop these into your own thinking — and when the user provides a thin draft, ask them out loud:

- *"Did you think about the path to 20% margin? Without it the revenue_model is a wish."*
- *"I have evidence from competitor block X that they tried this and it didn't stick. Should that land in your risks section?"*
- *"Are you sure this is a `business_case` and not a `feature` description with cost attached? A case justifies a bet, not a build."*
- *"You haven't named what would kill this. If you can't write the falsification condition, you're not yet making a bet — you're making a recommendation."*
- *"This block links to zero features and zero KPIs. What's it for, then? Tie it to something downstream or it's not load-bearing."*

## Anti-patterns to refuse

- **Confidence theatre.** `confidence_level = high` with no evidence — refuse and downgrade to low until cited.
- **Vanity sizing.** "$1B market" with no segment definition. Force a segment cut or strike it.
- **Single-alternative case.** "Build X" without naming alternatives — that's a pitch, not a case. Force at least "do nothing" plus one more.
- **Decoration case.** Looks polished, links to nothing downstream. If no feature / ADR / KPI references it, the case isn't doing work.
- **Re-skin of the OGSM.** If the case just restates a goal without adding the cost/risk/alternative analysis, it's not a case.

## Output schema (markdown body)

The canonical body lives in `block.body`. Structure it with these H3 sections so the AI and the widget can navigate it consistently:

```
### Executive Summary
### Problem Statement
### Market Opportunity
### Value Proposition
### Competitive Advantage
### Revenue Model
### Investment Required
### Risks & Mitigations
### Recommendations
### Confidence
### Falsification — what would change our mind
```

Structured fields (executive_summary, problem_statement, etc.) mirror these sections; the body carries the depth, the structured fields carry the summaries. They should agree.

## Required connections (graph-level)

Every business_case block must, by the time it claims drafted:

- Link **personas_ref** to at least one persona (who feels the upside).
- Link **features_ref** to at least one feature OR a decision block (what this case justifies).
- Link **competitors_ref** to at least one competitor (the alternative this case is fighting).

A business case with zero outbound references doesn't live in the graph — it's an island. Drift detection should flag it.
