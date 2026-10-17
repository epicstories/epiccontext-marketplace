# Decision Tree: Which research method?

The most common mistake in research is method-question mismatch. This tree narrows from the kind of question you're asking to the method that actually answers it.

## First cut: qualitative or quantitative?

Before picking a specific method, decide which axis the question lives on. Get this wrong and the right method on the wrong axis still wastes effort.

**Qualitative wins for:** discovery (you don't yet know the questions), causation ("why" not "what"), emotion and meaning, edge cases and outliers, and small total user bases where surveying ~5,000 niche professionals to N=200 is overkill.

**Quantitative wins for:** sizing ("how many"), causal claims with strong inference (A/B tests), tracking change over time, prioritization across many candidates (Kano, MaxDiff, conjoint), and stakeholder buy-in for known issues ("12% hit this in their first session" lands harder than "several users said it was confusing").

**Mixed wins most often.** Qual surfaces unknowns; quant sizes them. Common patterns:
- *Qual → quant:* Interview 8 users to find emergent themes, survey 200 to size which themes are common.
- *Quant → qual:* Analytics shows a 40% drop-off at step 3; interview 5 dropoffs to find out why.
- *In parallel:* Interview during the same week analytics is collected; correlate themes with behavior.

**Failure modes this prevents:**
- Surveying for discovery (you'll get answers to questions you knew to ask, missing what you didn't)
- N=5 quant claims ("60% of our users prefer this" with 5 users is 3 of 5, not a statistic)
- Mistaking qual themes for prevalence ("users said X" — how many of how many?)
- Quant without context (a 20% drop-off — bad? good? compared to what?)

**Sample size guidance (rough):**
- Qualitative: 5-8 users surfaces ~80% of usability issues (Nielsen); 8-12 interviews to reach saturation in a single segment; 30+ for ethnographic depth
- Quantitative: 30 minimum for any statistical claim; 100+ for survey segmentation; 1,000+ for tight confidence intervals on small effects; A/B testing depends on baseline rate and minimum detectable effect

**Evidence:** EVD-USR-029 (Erika Hall — match method to question), EVD-USR-030 (Indi Young — qualitative depth)

---

## Once you know qual or quant: pick the specific method

**What is the kind of question you're trying to answer?**

```
├─ "Why do people do X?" — reasons, motivations, emotional drivers
│   → A. Understanding why
│
├─ "Can users do X?" — task-based, observable behavior
│   → B. Testing capability
│
├─ "How many / what percentage of people do X?" — quantification
│   → C. Measuring scale
│
├─ "How do people experience X over time?" — longitudinal context
│   → D. Long-form context
│
├─ "How do people organize / categorize X?" — IA-specific
│   → E. Information architecture
│
└─ "Why did people switch from / to X?" — JTBD-specific
    → F. Switching behavior
```

---

## A. Understanding why → In-depth interviews

**Method:** Semi-structured 60-minute interviews
**Sample size:** 5-12 per user group (saturation 8-10)
**When to use:** Discovery, persona development, understanding pain points

**Don't use this for:** Quantifying patterns, testing usability, exploring tasks people can't articulate

**Output:** Personas, JTBDs, qualitative insights, journey thoughts/emotions

**Evidence:** EVD-USR-002

---

## B. Testing capability → Task-based usability testing

**Method:** Moderated or unmoderated task completion with think-aloud
**Sample size:** 5 per user group per round; iterate across 3-5 rounds
**When to use:** Validating design solutions, finding friction in existing flows

**Don't use this for:** Understanding why people don't start a task, statistical claims, discovering what tasks matter

**Output:** Friction points, opportunities, validated or invalidated design hypotheses

**Evidence:** EVD-USR-001 (5 users find ~85% of common problems), EVD-USR-003

---

## C. Measuring scale → Survey or behavioral analytics

**Method:** Structured survey OR analytics segmentation
**Sample size:** 20+ for basic significance; much larger for sub-segments
**When to use:** Quantifying patterns surfaced in qualitative work; validating prevalence

**Don't use this for:** Discovery, understanding why, the first research move on a new project

**Evidence:** EVD-USR-002, EVD-USR-011

---

## D. Long-form context → Diary study or field study

**Method:** Diary study (over days/weeks) OR contextual inquiry (in-environment observation)
**Sample size:** 10-15 for diary; 3-5 for contextual inquiry
**When to use:** Understanding behavior over time, observing what people don't articulate

**Don't use this for:** Quick answers, single-moment decisions, quantification

**Evidence:** EVD-USR-027

---

## E. Information architecture → Card sort or tree test

**Method:** Card sort (open or closed) for IA design; Tree test for IA validation
**Sample size:** 15+ per user group
**When to use:** Designing or validating navigation, taxonomy, content structure

**Don't use this for:** Anything that's not IA / categorization

**Evidence:** EVD-USR-002

---

## F. Switching behavior → Switch interview

**Method:** 60-90 minute interview focused on a recent switch decision
**Sample size:** 5-10 across recent switchers
**When to use:** Defining JTBDs, understanding competitive forces, validating positioning

**Don't use this for:** People who haven't switched recently, ongoing usage patterns, quantifying switch rates

**Evidence:** EVD-USR-018

---

## When you need more than one

Most projects need a combination. Common pairings:

- **Discovery phase**: interviews (A) + field study (D) → defines personas, JTBDs, journey
- **Design validation**: usability testing (B) + survey (C) → validates qualitatively then quantifies
- **IA project**: card sort (E) + tree test (E) → designs then validates
- **Competitive strategy**: switch interviews (F) + competitive UX benchmark → positions and identifies gaps

## Common failure modes this tree prevents

- Running a survey to answer a "why" question → use interviews
- Recruiting for usability testing without first understanding the persona → run interviews first
- Doing a card sort to answer a content question → IA methods only answer IA questions
- Interviewing existing happy customers about why they chose you → use switch interviews instead
- Observation-only studies without follow-up interviews → behavior without context can be misread
