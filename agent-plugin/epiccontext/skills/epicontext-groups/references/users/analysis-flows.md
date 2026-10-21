# Analysis Flows — Users Group

This skill doesn't just populate entities. It analyzes them. Three flows turn context (and raw input) into clarity and action:

1. **Diagnose** — what is the actual problem here?
2. **Summarize** — what does someone need to know in 60 seconds?
3. **Recommend** — what should be done, with what tradeoffs?

Use these flows when:
- A pattern in the graph or raw input needs interpreting (not just recording)
- A client or team needs a clear picture of where things stand
- A decision is pending and you need to sharpen the options
- You're reviewing a project's Users group and asking "what's actually going on?"

These flows are NOT for generating speculative analysis from thin evidence. Each flow has explicit evidence-sufficiency gates. If the gate fails, the honest output is "we don't have enough to say yet" — not a confident-sounding guess.

---

## Flow 1: Diagnose

Find the underlying problem. Not "what does the data say" but "what is this telling us we don't yet understand?"

### Two starting points

**A. Diagnose from the graph** — context is already populated, you're looking for a pattern across entities.

**B. Diagnose from raw input** — interview transcripts, support tickets, NPS responses, meeting notes that haven't been structured yet.

The flows differ; pick the right one.

### A. Diagnosing from the graph

Inputs needed:
- Specific question or area to investigate ("why is rebooking dropping?", "which persona is most at risk?", "what's blocking the booking flow?")
- Access to the relevant graph slice (personas, JTBDs, journeys, insights, competitors)

Process:

1. **State the question precisely.** "Something's wrong with bookings" is not a question. "Why has the rebooking rate for Recovering Rachel dropped 15% over the last quarter?" is.

2. **Pull the relevant entities.** Traverse the graph from the question. If asking about rebooking, that pulls: persona (Rachel) → JTBD (recurring maintenance) → journey (rebooking phase) → insights (recent customer signals) → competitors (alternatives recently considered).

3. **Look for misalignment.** The signal that there's a real problem usually lives at the intersections, not within a single entity. Examples:
   - Persona expectations vs. journey reality (she expects 90-second booking, the journey shows 4 minutes)
   - JTBD hiring criteria vs. competitor strengths (she values provider continuity, two competitors just shipped that)
   - Customer insights vs. journey opportunities (insights flag a pain not represented in any journey opportunity)
   - Recent signals vs. older personas (the persona was drafted 18 months ago, signals suggest behavior has shifted)

4. **Test the obvious explanation against the evidence.** What's the first hypothesis someone would offer? What would have to be true for that to be correct? What evidence would disconfirm it?

5. **Identify the pattern that connects the misalignments.** A real problem usually shows up as 2-3 related signals across entities, not one isolated data point.

### B. Diagnosing from raw input

Inputs needed:
- Raw material — interview transcript, support ticket batch, NPS responses, meeting notes
- Source metadata (where, when, who if known)

Process:

1. **Read the raw material in its original context first.** Don't summarize prematurely.

2. **Classify each signal.** Pain, praise, request, workaround, push, or pull (see `entities/customer-insight.md`).

3. **Cluster signals by underlying topic, not surface feature request.** Customers say "I want feature X" when they mean "I'm struggling with situation Y." Cluster on situation, not feature ask.

4. **Look for triangulation.** Same underlying pattern across multiple sources, multiple channels, multiple dates? That's a real signal. Single source, single date, single channel? That's a stub finding at best.

5. **Test for absence-of-evidence.** What signals would you expect to see if your hypothesis is wrong? Are they there? If you don't look for disconfirming evidence, you're building a confirmation-bias machine.

6. **Identify whose problem this is.** Which persona experiences it? Which JTBD does it interfere with? Which journey phase does it live in? If you can't connect the signal to a specific actor and circumstance, the diagnosis is too vague.

### Evidence-sufficiency gates (both A and B)

Before declaring a diagnosis, check:

- [ ] At least 3 corroborating signals across at least 2 source types
- [ ] Tested against an opposing hypothesis (what would prove me wrong?)
- [ ] Connected to a specific persona AND a specific circumstance/journey phase
- [ ] Recent enough that current behavior is reflected (no 18-month-old data declared current)
- [ ] Not over-fitted to a single vocal customer or a single data spike

If any gate fails, output is "tentative finding — needs more evidence before action," not a confident diagnosis. List specifically what additional evidence would resolve it.

### Output structure for diagnosis

```yaml
diagnosis_id: diag-[slug]
date: 2026-05-04
question: "The specific question being investigated"
finding: "One-sentence statement of the underlying problem"
confidence: tentative | drafted | high
evidence:
  - source: persona-id | research-id | insight-id | raw-data
    signal: "What this source contributes"
opposing_hypothesis_tested: "What would have proven this wrong, and why we ruled it out"
affected_persona: persona-id
affected_jtbd: jtbd-id
affected_journey_phase: journey-id/phase-X
implications:
  - "What this means for the project / business"
gaps_in_evidence:
  - "What we don't know yet that would strengthen or weaken the diagnosis"
```

---

## Flow 2: Summarize

Compress a diagnosis (or a graph slice) into a 60-second readable form. Different audience, different output. Three audiences are supported:

### Audience A: Internal — your own clarity

Goal: a short note you can scan in 30 seconds to remember the state of things.

Format:
```markdown
## [Project] / [Area] — [Date]

**Finding:** [one sentence]

**Evidence:** [3 bullet points max — sources and what they contribute]

**Affects:** [persona, JTBD, journey phase]

**Next:** [the single most useful next action — even if it's "gather more evidence"]
```

Length: Under 100 words. If it's longer, it's not a summary.

### Audience B: Team — your collaborators

Goal: align on the situation so the team can discuss next steps without rereading raw material.

Format:
```markdown
## [Project] — [Area] — [Date]

### What's happening
[2-3 sentences. The pattern, in plain language. No jargon unless the team uses it.]

### Why we think this
[3-5 bullets. Triangulated evidence sources. What we've ruled out.]

### What's at stake
[1-2 sentences. Business impact, customer impact, or strategic implication.]

### What we don't know yet
[1-2 bullets. Honest gaps. Not "we know everything."]

### Suggested next move
[One concrete action, with why.]
```

Length: 200-350 words. Should fit comfortably in a Slack message thread.

### Audience C: Client — they need to act

Goal: enable the client to make a decision. Format optimized for someone who has a budget, a calendar, and competing priorities.

Format:
```markdown
# [Topic] — [Date]

## The problem
[One paragraph. Plain language. Names a specific persona and circumstance, not generalities.]

## What the evidence shows
[3-5 short paragraphs. Each one cites an evidence source by name (e.g., "Q1 2026 customer interviews", "March-April 2026 NPS responses"). Keep claims and quotes distinct.]

## What's at stake
[Business consequences. Numbers if you have them, qualitative if you don't — but always honest about which.]

## Recommended action
[See Flow 3. One recommended action, why, what it would cost, what it would change, what tradeoffs are involved.]

## Alternatives considered
[2-3 sentences naming what else was on the table and why the recommendation won. Shows thinking, not certainty.]

## What we still need to validate
[Honest list of remaining unknowns. Builds trust.]
```

Length: 1-2 pages. Designed to be read in a meeting or attached to an email.

### Common failure modes for all three

- **Compressing without losing nothing** — losing nuance is fine; losing the actual pattern is not. If the summary doesn't include the disconfirming evidence or the gaps, it's lying by omission.
- **Loading every detail** — summary is not "shorter version of the data dump." It's a different artifact.
- **Vague verbs** — "users want better experience" / "we should explore options". Specific actors, specific actions, specific outcomes, or it's not actionable.
- **Hedging into uselessness** — "it might be possible that some users could potentially…" If the evidence is thin, say so directly. Don't wrap weakness in passive voice.

---

## Flow 3: Recommend action

Given a diagnosis, what should be done? The default posture: **recommend one, explain why, name the tradeoffs**. Not "here are 5 options, you pick" (that pushes the work back to the reader). Not "do this" (that's overconfident without context).

### Process

1. **Generate 3-5 candidate actions.** Different in kind, not just in scale. Examples for the rebooking diagnosis:
   - Redesign the booking flow to expose therapist-specific availability
   - Add a "rebook with same therapist" shortcut after a service
   - Build a follow-up email flow that surfaces preferred therapist's availability
   - Train staff to manually offer therapist-specific rebooking at checkout
   - Do nothing yet; gather more data on whether the rebook drop is therapist-related or general

2. **For each candidate, identify:**
   - **Cost:** time, money, complexity, risk
   - **Expected impact:** what specifically improves, by roughly how much, on what timeline
   - **Reversibility:** if this fails, how hard is it to undo?
   - **Evidence basis:** what in the diagnosis points to this being the right move?

3. **Rule out the candidates that lose on evidence.** A "do nothing" recommendation loses if the evidence is already strong; a "redesign everything" recommendation loses if the evidence only points to a specific phase.

4. **Pick one that wins on the right axes.** Usually: best impact-to-cost ratio that is reversible enough to learn from.

5. **State the recommendation, the reasoning, and the tradeoffs honestly.**

### Output structure

```markdown
## Recommended action

**Do:** [One concrete action, in 1-2 sentences. Specific enough that someone could write it as a JIRA ticket or assign it to a person.]

**Why this one:** [The reasoning. Connects the diagnosis to this action specifically. References evidence.]

**Expected impact:** [What changes if this works. Be specific — metric, magnitude, timeline. If unsure, say so: "We'd expect rebook conversion to recover within 4-6 weeks if therapist-continuity is the dominant factor."]

**Cost:** [Time, money, complexity, opportunity cost.]

**Tradeoffs:** [What we lose by choosing this. What it doesn't address.]

**What would change my mind:** [What evidence, post-implementation or pre-, would say this was the wrong call.]

### Alternatives considered

**[Alternative 1]:** [One sentence on what it would do, one sentence on why it didn't win.]

**[Alternative 2]:** [Same.]

**[Alternative 3]:** [Same.]

### Open questions before committing

[Honest list of what could still derail or redirect this recommendation.]
```

### Calibration to evidence strength

The action recommendation must match the evidence:

- **Tentative diagnosis** → "Recommend gathering evidence X before committing to a major change." Don't propose redesigns from thin data.
- **Drafted diagnosis** → Recommend a small, reversible action with measurement built in.
- **High-confidence diagnosis** → Recommend the right move, including major redesigns if the impact justifies them.

Never escalate confidence to drive action. If the diagnosis is tentative, the action is also tentative.

### Common failure modes

- **Recommending what's already underway** — if the team already decided this, the recommendation is restating, not deciding. Either confirm "yes, you're on the right track because…" or recommend something they're not already doing.
- **Recommending the heroic redesign** — most actions should be small enough to ship in a sprint. Major redesigns should require strong evidence and clear acceptance criteria.
- **Hiding the tradeoffs** — every action has costs. Naming them is what separates a recommendation from a sales pitch.
- **Overweighting the most recent signal** — last week's NPS dominates; older patterns get lost. The action should fit the longer pattern, not just the latest data point.

---

## Combining the flows

A common combined sequence:

1. Raw input arrives (interview transcript, batch of NPS, meeting notes)
2. **Ingest** — turn raw input into customer insights and other entities (see `entities/`)
3. **Diagnose** — Flow 1B, find the underlying pattern across new and existing context
4. **Summarize** — Flow 2, format-appropriate for the audience
5. **Recommend** — Flow 3, calibrated to evidence strength
6. **Capture the result back into the graph** — the diagnosis itself becomes a record (linked to the insights, personas, JTBDs it touches)

Each step has its own evidence gate. Skipping gates is the most common cause of confident-sounding bad analysis.

## When to refuse to analyze

Push back instead of producing analysis when:

- Evidence base is a single source (one Reddit thread, one stakeholder hunch, one customer's complaint)
- Time range is too narrow (last week only) for the pattern claimed
- The question is loaded ("prove that we should do X") — diagnose what's actually happening, not what someone wants to be true
- The diagnosis is being asked for to justify a decision already made — that's not analysis, it's narrative construction
- Sources can't be verified or aren't documented

Honest output in these cases: "Not enough evidence to support analysis at this confidence level. Here's specifically what we'd need to investigate before drawing conclusions: [list]."

---

## Red Flags

These are direct interventions in Claude's reasoning. When any of these patterns appears in the analytical work being done, stop and reconsider.

**🚩 "I think the problem is X..." with one source backing it.**
Stop. One signal is a stub finding, not a diagnosis. Re-check evidence-sufficiency gates. If only one source exists, the honest output is "tentative finding from a single source — needs corroboration before action."

**🚩 About to write a confident summary without listing what we don't know.**
Stop. Every summary needs a "what we still need to validate" section. If you're tempted to skip it because it weakens the case, that's exactly when it must be included.

**🚩 The recommendation matches what the team already decided last week.**
Stop. This is restating, not deciding. Either confirm the existing decision with explicit "the evidence supports this because…" or recommend something the team isn't already doing.

**🚩 Building a case from quotes that all support one conclusion.**
Stop. Where's the disconfirming evidence? If you didn't look for it, the diagnosis is confirmation bias dressed up as analysis. Find the quotes that contradict the hypothesis. If none exist, ask why — usually because nobody collected them.

**🚩 The evidence is from "research" or "customers said" without specific source IDs.**
Stop. Vague attribution is the strongest signal of fabricated analysis. Every claim must trace to a research entry, an insight ID, or a specific source. If you can't cite, you can't claim.

**🚩 The recommendation is "redesign X" from thin data.**
Stop. Major redesigns require strong evidence. From tentative diagnosis, the right recommendation is small, reversible, with measurement built in — not heroic.

**🚩 About to skip the maturity flag because the analysis "feels right".**
Stop. Confidence calibration is the discipline. Tentative diagnosis → tentative output. High-confidence diagnosis → confident output with measurement plan. Mismatching them is what produces confidently-wrong analysis.

**🚩 The opposing hypothesis test was skipped because "it's obvious."**
Stop. Most wrong diagnoses feel obvious. The opposing-hypothesis test is what separates real analysis from pattern-matching. Always ask: what would prove me wrong? What evidence would I expect to see?

**🚩 Hedging language doing the work of evidence.**
Stop. "It might be possible that some users could potentially…" is not honest hedging — it's confidence-laundering through vagueness. If the evidence is thin, say so directly: "We have one source pointing to X. Not enough to act on." Don't hide weakness in passive voice.

**🚩 Output is being written for the audience that wants to hear it.**
Stop. Analysis that adapts to what the reader wants to find isn't analysis. It's narrative construction. If the diagnosis is uncomfortable for the audience, that's still the diagnosis.

---

## Cross-group considerations

Users-group signals rarely live in isolation. Before recommending action on a customer signal, traverse to other groups. The truth is in the linked context. See `epicontext-analysis/ANALYSIS.md` for the full method.

**Signals that typically originate here:**
- Customer survey results, NPS, qualitative interview themes
- Switch interview findings (why customers chose us / left us)
- Persona drift (the persona we designed for vs the persona showing up)
- Journey friction discovered in research or session replays
- JTBD shift (the job customers are hiring us for has changed)

**Pull from these groups before judging:**
- **Strategy + OGSM:** does the signal align with or conflict with the bet? "30% want X" matters differently if X serves the strategy vs erodes it.
- **Brand positioning:** does serving the want pull positioning toward generic, or sharpen it?
- **Business model:** does the obvious fix break unit economics?
- **Performance KPIs:** does the qualitative signal show up in the quantitative data, or contradict it?
- **Build / feature feasibility:** if the signal points to a fix, what's the cost?

**Trade-off types specific to this group:**
- Real customer pain vs non-target persona signal
- Loud minority vs target majority
- Customer want vs strategic discipline (premium tier? education? accept and decline?)
- Qualitative signal vs quantitative behavior (people say one thing, do another)

**Default classification questions:**
- Is this the target persona? (If no — secondary or accept-and-decline)
- Does the strategy accommodate this? (If not — is the strategy still right?)
- Are KPIs telling the same story? (If not — which is the better signal?)
- What does the brand promise about this? (Match or gap?)
