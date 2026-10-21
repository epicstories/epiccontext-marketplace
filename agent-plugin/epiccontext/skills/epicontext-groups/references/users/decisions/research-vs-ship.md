# Decision Tree: Where does research investment go?

Every Epic Context project scaffolds all entities from sensible defaults at kickoff — personas, journeys, JTBDs, brand, strategy, build choices. Stubs aren't a problem; they're the starting state. The real question is **where to invest research budget first** to specialize the stubs that matter most.

This tree is not "should we do research before doing anything?" — that framing blocks work. The framing here: **scaffolds are already in place. Which stubs deserve research investment first, and how much?**

## Start here

**For the area you're considering — what's the cost if the scaffolded stub turns out to be wrong?**

```
├─ Catastrophic (medical, financial, safety, regulatory)
│   → A. Heavy research investment — specialize before any user-facing release
│
├─ High (major redesign, multi-month investment, public reputation)
│   → B. Significant research investment — specialize before launch
│
├─ Moderate (feature affecting many users but reversible)
│   → C. Light research + ship + measure (most common case)
│
└─ Low (small feature, easy to revert, low visibility)
    → D. Ship the stub; learn from real usage
```

The graph keeps moving in all four cases. Stubs exist; work continues. The decision is how much specialization to fund before exposing the work to real users.

---

## A. Heavy research investment

**Examples:** Medical interfaces, financial transactions, anything regulated, safety-critical systems

**Approach:** Multiple research methods, larger samples, expert review, validated testing. FDA-equivalent rigor where applicable (n=25+ per user group for validation).

**While research runs:** The graph still scaffolds everything. Stubs and proto-personas inform design exploration *internally*. Research replaces stubs with validated entities before anything reaches real users.

**Don't shortcut this:** One regulatory issue or safety incident wipes out years of saved research time.

**Evidence:** EVD-USR-002

---

## B. Significant research investment

**Examples:** Major navigation redesign, brand refresh, pricing change, new product launch with paid acquisition

**Approach:**
- Qualitative interviews (5-12 per user group)
- Usability testing on prototypes (2-3 rounds, 5 users each)
- Small validation survey if quantification helps prioritize
- A/B test on launch if possible

**Time investment:** 3-6 weeks of research before launch — *while the rest of the project keeps moving on scaffolded defaults*.

**Risk if skipped:** Public failure, expensive course-correction, lost trust

---

## C. Light research + ship + measure

**Examples:** New feature in existing product, copy or layout changes, onboarding updates, minor IA changes

**Approach:**
- Quick interview round (3-5 users) to validate problem framing
- One round of usability testing on prototype
- Ship behind a feature flag or to a subset
- Measure aggressively, iterate on real data
- Capture customer insights post-launch

**Time investment:** 1-2 weeks of research before commitment

**This is the most common case for digital product work.** The scaffolded stubs are good enough to start; light validation tightens the riskiest assumptions; real-world signal does the rest.

---

## D. Ship the stub; learn from real usage

**Examples:** Internal tools, experiments, small UI tweaks, tests explicitly framed as learning

**Approach:**
- Skip formal research; trust the scaffolded defaults
- Ship behind feature flag or to a small audience
- Define success metrics upfront
- Set a clear deadline for evaluation
- Either roll out, refine, or revert at the deadline

**Mark the entities involved as stub** — honest about maturity. Real-world data upgrades them to drafted/validated.

**Risk if abused:** Habitually skipping research becomes a culture. Some "small" changes accumulate into major ones.

---

## How this fits the scaffold-first workflow

The Epic Context default: scaffold every canonical entity at project kickoff. Tone is "professional, direct, warm." Personas are proto. Journey maps are templates. Strategy is a stub framing the bet. None of these block the work. They're the starting baseline.

This tree decides which stubs to specialize first by funding research. Not which stubs to *create* (all of them, at kickoff) and not whether work can *proceed* (it always can). Just where to put the research budget.

## When to override the default

**Push toward more research investment:**
- New persona type the team has never worked with
- High visibility (executive review, client showcase)
- Strong stakeholder disagreement that won't resolve without evidence
- The "we're not sure who the user is" question matters and is unanswered

**Push toward shipping the stub:**
- Mature product with rich behavioral data already telling the story
- Existing research already covers the question
- Real users accessible only post-launch (e.g., new market entry)

## Quick selection guide

| Stakes / Reversibility | Research investment |
|------------------------|---------------------|
| Catastrophic | Full validation rigor; specialize before any release |
| High, recoverable | 3-6 weeks of research before launch |
| Moderate | 1-2 weeks of research + ship + measure |
| Low | Ship the scaffolded stub; measure; iterate |
| Unknown | Default to "moderate" until you know better |

## Common failure modes this tree prevents

- Doing months of research for a small feature
- Shipping high-stakes changes "to learn"
- Treating "ship and learn" as universal
- Habitual research as gate-keeping (the skill never blocks work waiting for research; this tree just decides where investment goes)
- Habitual "we don't have time" without naming the stakes
