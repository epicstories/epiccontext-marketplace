# ADR (Architecture Decision Record)

A record of a **significant decision** — with context, named alternatives, the chosen option, the rationale, the consequences, and the falsification condition that would force a rewrite. ADRs are the antidote to *"why did we do it this way?"* amnesia, and the single most important entity in the Build group long-term: they're what lets future contributors understand the present and reverse course honestly when the world changes.

A real ADR is a **mini-essay you'd be embarrassed to publish without**. A weak ADR is a sentence saying "we picked X." If your block is closer to the second, downgrade it.

## Why most ADR blocks are too thin

The common failure: a one-paragraph block that says what was decided but never says what was *considered and declined*, what assumptions held, or what would reverse the decision. Without alternatives + falsification, it's not a decision record — it's a fait accompli.

The other failure: ADRs for things that don't deserve one (every dependency upgrade, every prop rename). ADRs are for **significant decisions** — ones that shape future work, lock in a constraint, or close off alternatives. Use `decisions/needs-an-adr.md` to gauge significance before opening a new ADR block.

## The depth bar

| Section | Stub looks like | Drafted looks like |
|---|---|---|
| Status | "draft" | proposed / accepted / superseded / deprecated — with the date and the person who decided. |
| Context | "We needed to decide on X." | The situation that produced this need: what changed, what constraint applies, what's been tried, what's the cost of doing nothing, who feels the pain. 3–6 paragraphs. |
| Decision | "We will use X." | The chosen approach stated specifically enough to disagree with — including the scope (what's in, what's out) and the mechanism (how it works in 2–3 sentences). |
| Alternatives considered | absent or "we considered A and B" | At least 3 named alternatives (including "do nothing"). For each: what it would look like, why it was declined, what would make us reconsider it. |
| Rationale | "Because it's better." | The trade-off named honestly: what we're giving up to get what we want. The named principles or constraints the choice satisfies. |
| Consequences | absent | What changes downstream (positive + negative + neutral). What gets easier, what gets harder, what new risks appear. |
| Falsification — what would reverse this | absent | "If [observable evidence] shows up, we will reconsider." Without this, the decision is unreviewable. |
| Links | absent | The blocks affected (tech_stack, architecture, features), prior superseded ADRs, external sources cited. |

## The depth checklist (run BEFORE writing the block)

1. **Is this significant enough to deserve an ADR?** (Run `decisions/needs-an-adr.md`.) If not, it doesn't belong here.
2. **The decision in one sentence.** Specific enough to disagree with.
3. **The context — 3–6 paragraphs.** What produced the need? What's been tried?
4. **At least 3 named alternatives**, including "do nothing", with one-line *why declined* each.
5. **The rationale — the trade-off named honestly.** What are we giving up to get what we want?
6. **The consequences** — at least 3 named (positive + negative + neutral).
7. **The falsification condition.** "If X shows up, we reconsider."
8. **The status** — proposed / accepted / superseded / deprecated, with date.
9. **The owner** — who decided, who can overrule.
10. **The links** — affected blocks, related ADRs, external sources.

## Push-back prompts (run AFTER drafting)

- **"Did I name what I *didn't* pick?"** ADRs that name only the chosen option are pitches, not decisions. Force ≥3 alternatives.
- **"What's the trade-off?"** Every decision trades one thing for another. If your rationale reads "X is just better", you haven't done the trade-off.
- **"What would reverse this?"** Without a falsification condition, the ADR is permanent — and permanent decisions decay into folklore. Add it.
- **"Who decided?"** ADRs need a named owner. Anonymous decisions can't be debated.
- **"Did I link the affected blocks?"** An ADR that doesn't link to tech_stack, architecture, or a feature isn't doing graph work.
- **"Is this an ADR or a `business_case`?"** Business case = thesis *before* commitment. ADR = the commitment + rationale *after*. If you're still arguing for it, it's a case. If you've decided, it's an ADR.
- **"Have I been here before?"** Check prior ADRs. If your new decision supersedes one, say so explicitly and link to it.

## Evidence pool — where to mine

- **The codebase change that prompted the decision** — link the PR or commit if available.
- **Prior ADRs** in `references/decisions/` and in the graph — pattern-match shape and check for supersession.
- **`tech_stack` + `architecture` + `infrastructure`** — these are the blocks the ADR affects; pull current state to ground the *consequences* section.
- **External sources** — RFCs, vendor docs, public ADRs from other projects. Cite them in the body.
- **The team's prior debate** — Slack threads, PR reviews. Summarise the back-and-forth in *context*.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default ("First decision recorded...") untouched. |
| **drafted** | All 10 checklist items present. ≥3 named alternatives. Falsification condition specific. ≥400 words in body. Status set (proposed / accepted). |
| **validated** | Drafted + status = accepted with date + owner named + at least one downstream block (tech_stack, architecture, feature) explicitly references this ADR. |

## Push-back lines to use on yourself (or to surface to the user)

- *"You wrote 'we will use Supabase' but not 'we considered Firebase, Hasura, raw Postgres'. Add the alternatives or it's not a decision — it's an announcement."*
- *"Your consequences section is one bullet. Every decision has trade-offs. Name three downstream effects, including at least one negative."*
- *"You haven't written the falsification condition. What evidence would force you to revisit? Without it, this ADR can't expire — and ADRs that can't expire become folklore."*
- *"This ADR doesn't link to any block. An ADR with no downstream connections isn't doing graph work — it's a journal entry."*
- *"Are you sure this is significant? Run `decisions/needs-an-adr.md`. If it's a routine implementation choice, an inline code comment is better."*

## Anti-patterns to refuse

- **The fait accompli.** "We chose X." with no alternatives, no context, no trade-off. Refuse — force the structure.
- **The kitchen-sink ADR.** Trying to record three decisions in one block. Split.
- **The dependency-upgrade ADR.** Bumping a minor version doesn't deserve an ADR. Use a commit message.
- **The "we'll figure it out later" ADR.** Status = accepted but rationale = "TBD". Refuse — either decide or keep it as proposed.
- **The orphan ADR.** No links to affected blocks. Decisions exist to constrain things — name what's constrained.

## Output schema (markdown body)

```
### Status
[proposed / accepted / superseded / deprecated] — [date] — [owner]

### Context

### Decision

### Alternatives considered
- **[Alternative A]** — what it would look like; why declined; what would change our mind.
- **[Alternative B]** — …
- **[Do nothing]** — …

### Rationale

### Consequences
- **Positive:** …
- **Negative:** …
- **Neutral:** …

### Falsification — what would reverse this decision

### Links
- Affected blocks: …
- Supersedes: …
- External sources: …
```

## Required connections (graph-level)

A drafted `decision` (ADR) block must:

- Link **at least one downstream block** that the decision constrains (tech_stack, architecture, feature, infrastructure).
- If it supersedes a prior ADR: link the superseded one.
- Be referenced *by* the blocks it shapes (a tech_stack mentioning Supabase should link to the "Choose Supabase" ADR).

An ADR with no downstream constraints isn't a decision; it's a memory.
