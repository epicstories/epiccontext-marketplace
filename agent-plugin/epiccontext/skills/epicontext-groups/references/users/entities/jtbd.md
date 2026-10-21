# Job to Be Done (JTBD)

The **job a persona hires the product to do** — phrased as *situation → motivation → outcome*. A JTBD is the answer to *"when [situation], the user wants to [motivation], so they can [outcome]"*. Functional jobs, emotional jobs, and social jobs all qualify; a real JTBD names which.

A real JTBD block lets a feature get cut ("this feature doesn't serve any job in the graph") or kept ("this feature is the *only* thing serving this job").

## Why most JTBD blocks are too thin

The classic failure: a one-line job statement with no situation, no outcome metric, no current alternatives. "User wants to manage projects" is not a job — it's a category. A real JTBD names the *moment of dissatisfaction* that triggers the hire.

A drafted JTBD has the **situation grounded in time + context**, the **outcome measurable**, the **alternatives named** (what the persona currently hires for this job), and **at least one quote** from research showing the pain.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Job statement | "User wants to manage projects." | "When I start a new client project and need to brief AI clients, I want every AI to share the same context, so I can ship deliverables without re-briefing." |
| Situation | absent | The triggering moment — what just happened that put this on the table. |
| Motivation | "Save time." | The deeper *why* — emotional / functional / social. |
| Outcome | "Done faster." | Measurable: what does success look like? By when? How would the persona know? |
| Current alternatives | absent | What the persona hires today for this job (incl. "nothing" / "Notion + manual glue"). |
| Pain (cost of doing nothing) | "Frustrating." | What it costs the persona — quantified or named (hours/week, missed billings, stress, dropped quality). |
| Job type | absent | Functional / emotional / social. Most jobs are layered — name the primary. |
| Quotes from research | absent | 1–2 verbatim lines showing the moment of dissatisfaction. |

## Depth checklist (BEFORE writing)

1. **One-sentence job statement** in `when [situation], wants to [motivation], so they can [outcome]` form.
2. **Situation grounded in time + context** — not "always," but "when [X happens]."
3. **Outcome measurable** — how does the persona know it's done?
4. **Current alternatives named** — at least 2, including "nothing" if applicable.
5. **Cost of doing nothing** — named or quantified.
6. **Job type** — functional / emotional / social.
7. **1+ research quote** showing the trigger or the pain.
8. **Linked persona** + linked features serving this job.

## Small visual — the job context flow

A JTBD is a sequence. A small flow diagram makes the situation → motivation → outcome arc visible.

````
~~~flow
title: Job context
direction: LR
nodes:
  - { id: trigger, label: "When [situation]", role: start }
  - { id: persona, label: "Persona", role: person }
  - { id: pain, label: "Pain: [cost]", role: process }
  - { id: alt, label: "Current alternative", role: external }
  - { id: outcome, label: "Wants [outcome]", role: end }
edges:
  - { from: trigger, to: persona }
  - { from: persona, to: pain }
  - { from: pain, to: alt, label: "hires today" }
  - { from: alt, to: outcome, label: "but partially fails" }
~~~
````

Setup + narration: name the gap between current alternative and outcome — that's the wedge.

## Push-back prompts (AFTER drafting)

- **"Is the situation a moment or a state?"** "When I'm working" is a state. "When I'm onboarding a new project" is a moment. Push to the moment.
- **"Is the outcome measurable?"** "Done faster" isn't measurable. "Shipped within 5 working days" is.
- **"What does the persona currently hire?"** Without naming alternatives, the JTBD is unmoored from reality.
- **"What's the emotional or social layer?"** Most jobs are layered. If yours is purely functional, double-check.
- **"Could this job be hired across multiple personas?"** If yes, it might be too generic — refine, or accept it as a shared job.

## Evidence pool

- **Linked persona** (who hires this job?).
- **Linked research blocks** — the studies showing the trigger.
- **Linked competitor blocks** — what they currently hire.
- **Linked features** serving this job.
- **The repo** — onboarding flows + empty states often reveal the assumed jobs.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (template phrase). |
| **drafted** | Statement complete + situation + measurable outcome + ≥2 alternatives + cost + job type + ≥1 quote. Linked persona + ≥1 feature. ≥300 words in body. |
| **validated** | Drafted + ≥1 research block validates the trigger + ≥1 feature in production demonstrably serves this job. |

## Anti-patterns to refuse

- **The category statement.** "User wants to manage projects." Force a moment.
- **The unmeasurable outcome.** "Better experience." Force a metric.
- **The free-floating JTBD.** No linked persona. Refuse.
- **The everything-job.** Job phrased so broadly it could justify any feature. Force specificity.
- **The aspirational JTBD.** Invented by stakeholders, not surfaced by research. Mark `stub` until validated.

## Output schema (markdown body)

```
### Job statement
### Situation
### Motivation + job type
### Outcome (measurable)
### Current alternatives
### Cost of doing nothing
### Quotes from research
### Job context (flow diagram)
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `jtbd` block must:

- Link **the persona** that hires this job.
- Link **at least 1 feature** that serves this job.
- Optionally link **competitor blocks** showing what's hired today.
- Be referenced *by* at least one **journey_map** step or a **feature**.

A JTBD with no linked persona is decoration.
