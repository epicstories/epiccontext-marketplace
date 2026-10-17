# Decision Tree: Which persona type?

NN/g identifies three persona types: proto, qualitative, and statistical. They serve different purposes and have very different evidence requirements. Picking the wrong one wastes effort.

## Start here

**What evidence do you currently have?**

```
├─ No research, no data, just stakeholder hunches
│   → A. Proto persona (workshop)
│
├─ 5-30 user interviews completed or planned
│   → B. Qualitative persona
│
├─ Quantitative segmentation data (analytics, large surveys)
│   → C. Statistical persona
│
└─ Mix of qualitative + quantitative
    → D. Layered approach
```

---

## A. Proto persona

**Best when:** Project is just starting, stakeholders disagree about who the user is, time/budget for research not yet available

**Process:** 2-4 hour workshop, each participant creates 2-5 proto personas, cluster into 3-6 final ones, tag explicitly as "proto"

**Maturity:** Stub by default — that's the right starting maturity for a working hypothesis, not a problem. Stays at stub until research arrives to upgrade it.

**Risks:** Reinforces existing biases, can be mistaken for researched personas if not labeled clearly, tend to over-include demographic detail

**When to upgrade:** As soon as user research becomes possible. Compare proto personas against research findings to learn what assumptions were wrong.

**Evidence:** EVD-USR-006

---

## B. Qualitative persona

**Best when:** Access to actual users and time for interviews, depth matters more than statistical confidence — standard for most digital product work

**Process:** 5-30 in-depth interviews (saturation 8-10), cluster by attitudes/goals/behaviors NOT demographics, compose 3-6 personas mapped to design contexts

**Maturity:** Drafted by default once interviews are in; validated through usage and refinement

**Risks:** Recruitment bias, researcher confirmation bias, persona inflation beyond what's actionable

**Evidence:** EVD-USR-002, EVD-USR-007

---

## C. Statistical persona

**Best when:** Large user base with rich behavioral data, you need to understand relative size of segments, mature products with engaged users

**Process:** Cluster analysis on behavioral or attitudinal data (n>500), validate clusters with qualitative interviews, map to actionable persona descriptions

**Maturity:** Drafted; validated with ongoing tracking

**Risks:** Statistical clusters may not be psychologically meaningful, behavioral data only captures what users do not why, often becomes a tracking metric rather than a design tool

**Evidence:** EVD-USR-002

---

## D. Layered approach

**Best when:** Both qualitative and quantitative research available, project has time for sustained research investment, maximum confidence and longevity needed

**Process:** Start qualitative, run survey or behavioral analysis to size and validate types, refine personas with both layers, update annually or with significant business changes

**Maturity:** Validated, given the depth of research backing it

**Risks:** Most expensive and time-consuming approach, easy to over-engineer, maintenance burden

**When to do this:** Personas used by many teams over multiple years. Not for one-off projects.

---

## Quick selection guide

| Situation | Persona type |
|-----------|--------------|
| Project kickoff, no research yet | Proto |
| Standard digital product, research budget exists | Qualitative |
| Mature product with rich analytics | Statistical |
| High-stakes long-term product investment | Layered |
| One-off engagement, fast turnaround | Proto, upgrade if time allows |
| Client unwilling to fund research | Proto, with explicit caveats |

## Common failure modes this tree prevents

- Calling a proto persona "validated" because it has a name and photo
- Trying to do statistical personas on small datasets
- Relying on personas from years-old research without refresh
- Building 12 personas when 4 would do
- Skipping qualitative validation of statistical clusters
