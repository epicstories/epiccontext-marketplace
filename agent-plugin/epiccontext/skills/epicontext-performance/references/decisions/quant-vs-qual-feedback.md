# Decision Tree: Quantitative vs. Qualitative Feedback?

When to instrument (quant) vs. when to ask (qual). Most projects over-rely on one or the other. Healthy feedback systems use both, deliberately.

## Start here

**For a question you want answered, ask:**

```
├─ Is the question "WHAT is happening?"
│   └─ Quantitative dominant (analytics, NPS, conversion rates)
│
├─ Is the question "WHY is it happening?"
│   └─ Qualitative dominant (interviews, open-ended survey, support tickets)
│
├─ Is the question "WHO is affected?"
│   └─ Quantitative for sizing, qualitative for understanding
│
└─ Is the question "WHAT SHOULD WE DO?"
    └─ Both — quant frames the problem; qual reveals the lever
```

## When quantitative wins

| Question | Best method |
|----------|-------------|
| How many users completed the booking flow? | Analytics events |
| What percentage of customers rebook within 30 days? | Cohort analysis |
| Which feature has highest engagement? | Usage telemetry |
| Is the metric trending up or down? | Time-series analytics |
| Which segment converts best? | Funnel analysis with segments |
| Has the change we shipped affected the number? | A/B test or before/after analytics |

**Quant strengths:** Statistical power, scale, objectivity, trend detection, segment comparison.

**Quant weaknesses:** Tells you WHAT, rarely WHY. Misses signals not instrumented. Can mislead when correlation is mistaken for causation.

## When qualitative wins

| Question | Best method |
|----------|-------------|
| Why don't customers complete the booking flow? | User interviews, session replay, support tickets |
| What does this customer segment actually need? | JTBD interviews |
| Why did this user churn? | Switch interview |
| What language do customers use to describe the problem? | Open-ended NPS comments, interviews |
| What's the unmet need we don't know about? | Generative interviews |
| How does the experience feel? | In-depth conversations, ethnography |

**Qual strengths:** Reveals causes, surfaces unknown unknowns, captures emotion and language, builds empathy.

**Qual weaknesses:** Small samples, harder to generalize, time-intensive, subject to interviewer bias, can't detect trends without aggregation.

## When you need both

Almost always, when stakes are real. The pattern:

**Quant frames the problem.** "Booking conversion dropped 8% last month."

**Qual reveals the cause.** Five interviews with users who dropped: "I couldn't find the same therapist as last time."

**Quant validates the fix.** "After shipping therapist-specific booking, conversion went up 6%."

**Qual confirms the experience.** "Now I can find them in two clicks. Easy."

Each step alone would be incomplete. Quant alone says "something's wrong" without specifying. Qual alone says "I think this might be the issue" without scale. Together, they close the loop.

## How to choose for a specific question

**Question:** "Why is rebook rate stuck at 47% despite the new flow?"

**Quant first (what):** 
- Look at funnel: where exactly do users drop?
- Segment: are some personas converting at higher rates than others?
- Compare: does the new flow actually outperform the old, or has the gap closed?

**Qual second (why):**
- Interview 5 users who dropped at the identified step
- Interview 3 users who converted (what worked)
- Read support tickets in the rebook-related category from the last 30 days

**Synthesis:**
- Quant tells you "drop is at step 3, persona X is most affected"
- Qual tells you "step 3 confuses persona X because [specific reason]"
- Together: a specific intervention you can ship and measure

## The NPS trap

NPS is tempting because it produces a single number that looks quantitative.

**Reality:** The number itself is weakly informative. The OPEN-ENDED COMMENT FIELD is where the value lives. NPS without the qualitative comments is half the data.

**Practical implication:** Always require an open-ended follow-up ("What's the main reason for your score?"). Synthesize comments by theme. The number gives you direction; the comments give you understanding.

See EVD-PER-004 for NPS limitations.

## Common failure modes this tree prevents

**Over-instrumented, under-listened.** Teams with rich analytics dashboards but no interviews. They know what's happening but not why. Optimization stalls.

**Anecdote-driven without scale.** Teams making decisions from 3 interviews without checking whether the pattern holds in the data. Risk: building for the loudest voices, not the median customer.

**NPS as the only feedback signal.** A single number tracked in isolation. Misses the rich qualitative data in comments.

**Skipping qual because "we already have analytics."** Analytics tells you what users did, not what they wanted. The feature with high usage isn't necessarily the feature that delivered value.

**Skipping quant because "we know our users."** Founder/PM intuition is valuable but biased. Without quant, you can't tell if a pattern is real or one loud customer.

## Sample size guidance

**For qual:**
- 5 interviews per persona is the practitioner heuristic for saturation on a specific question
- Beyond ~12 interviews on the same question, marginal value drops
- For generative work (no specific hypothesis), more interviews up to 20-30

**For quant:**
- For directional analytics: a few hundred users per segment is usually enough
- For statistical significance on conversion changes: 1000+ per arm in an A/B test typically required
- For NPS: 100+ responses for stability; 50+ for directional reading

## Quick guide

| Situation | Lean toward |
|-----------|-------------|
| Need to know if a change is working | Quant (with qual to interpret) |
| Need to understand why something is happening | Qual (with quant to size) |
| New problem, unclear what's going on | Qual first, then quant to validate |
| Recurring problem, suspected cause | Quant first, then qual to confirm |
| High-stakes decision | Both |
| Can only afford one | Whichever directly answers your top question |

## Sources

- Erika Hall — *Just Enough Research* — qualitative methods primer
- Indi Young — *Practical Empathy* — qualitative research depth
- Croll & Yoskovitz — *Lean Analytics* — quantitative methods
- EVD-PER-004 — NPS limitations
- EVD-PER-005 — Action loops in voice-of-customer programs
- EVD-USR-002 — JTBD interview methodology (cross-reference Users group)
