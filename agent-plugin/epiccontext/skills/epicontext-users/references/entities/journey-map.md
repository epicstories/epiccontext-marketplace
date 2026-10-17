# Journey Map

The **path a persona walks through to accomplish a job** — phase by phase, step by step, with feelings, actions, and the screens they touch. A journey map is the answer to *"how does this persona move from trigger to outcome, and where does the experience succeed or fail?"*

A real journey map binds **each step to a content_page** (where applicable), so when the prototype renders, the widget can show stakeholders which journey state any given screen represents.

## Why most journey map blocks are too thin

The classic failure: 3 phases × 3 steps, generic actions ("user opens app"), no feelings, no pages bound. That's a process diagram, not a journey. A real journey makes the *emotional arc* visible (where does delight peak? where does frustration spike?) and grounds every screen-bound step in the IA/content layer.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Persona + job | unlinked | Linked primary persona + the specific JTBD this journey serves. |
| Phases | 3 generic phases | Phases named after the persona's mental model (e.g. "Realising I need this" / "Comparing options" / "First win"). |
| Steps per phase | 1–2 vague steps | 2–5 specific steps with action verbs from the persona's vocabulary. |
| Feelings | absent | 😀 🙂 😐 🙁 😣 per step. Reveals the emotional arc. |
| Insights per step | absent | What we learned about the persona at this step. |
| Page bindings | absent | Each on-screen step has `route` set to a `content_page` slug. Enables widget Stakeholder mode + drift detection. |
| Pain points + opportunities | absent | At least 2 named pain points + 2 opportunities to address them. |
| Quotes | absent | 1–2 quotes per phase, anchoring the steps in research. |

## Depth checklist (BEFORE writing)

1. **Linked persona + JTBD.** Without them the journey is generic.
2. **Phases named in persona language** (not internal jargon).
3. **Each step has an action + feeling + insight.**
4. **Each on-screen step has `route` set** to a `content_page` slug. Drift detection flags missing bindings.
5. **2+ named pain points** with opportunity for each.
6. **1+ quote per phase** (or marked "to verify").
7. **Linked features** that touch this journey.
8. **Maturity honesty:** stock feelings and invented quotes = `stub`.

## How the table renders — lanes are rows

The book and the board draw the journey as a **grid**: steps run across
as columns, and each table column after `Happiness` becomes its own
**row** — Does, Feels, Insight, and any lane you add.

That is why the table columns matter more than they look. A reader
scans a journey *across*: "what does the user feel at every step?" is
one continuous row, and comparing step 2 against step 5 is free. Two
consequences for how you write it:

- **Keep one idea per cell.** A cell holding "Opens the page, feels
  lost, wishes there were a template" becomes one card in one lane and
  breaks the comparison. Split it across Does / Feels / Insight.
- **An empty cell is fine.** Write `—` and the lane simply has nothing
  at that step. Padding every cell so the table looks full produces rows
  of filler that make the real signal harder to see.

Add a lane by adding a column. `| Step | Happiness | Actions |
Experience | Insights | Touchpoint |` gives a Touchpoint row, coloured
from the chart tokens and kept through every edit. Use it when the
journey genuinely has another dimension — channel, owning team, system
touched — not to pad the grid.

## Metrics on the flow — chart the steps you actually measure

A journey with real numbers on it stops being a workshop artefact and
starts being a diagnosis. If the graph holds measures for this flow,
put them on the block:

- Read `analytics`, `kpi`, `metric` and `north_star` for anything scoped
  to these steps; read `customer_insight` and `feedback` for numbers
  buried in prose (completion rates, ticket volumes, NPS by stage).
- Chart drop-off across the steps with a `~~~chart` `column`, using the
  **same step names** as the table's `Step` column so the two read as
  one picture.
- Or `~~~embed` the KPI block itself under the phase it belongs to — an
  embed stays live, so the journey updates when the measure does. Prefer
  the embed when the measure already has its own block; prefer the chart
  when you're showing a shape across steps that no single block holds.

~~~chart
title: Reaching each step
kind: column
unit: "%"
categories: [Sign-up, Create project, Scaffold, First export]
series:
  - { name: Reach this step, values: [100, 74, 61, 38] }
~~~

Then say where it came from: *"From `analytics/onboarding-funnel`,
last 30 days."*

**Never invent the numbers.** A journey is exactly the kind of block
where a plausible funnel would be believed and acted on. If nothing is
instrumented, write the sentence instead — "no instrumentation between
Scaffold and First export; that gap is the number to capture" — and
name the `analytics` block that should capture it. That is a finding. A fabricated chart is
damage.

## Small visual — the journey-to-IA binding

The widget's "This page" panel relies on `route` being set on journey steps. A small flow diagram makes this binding visible.

````
~~~flow
title: Journey step → page binding
direction: TB
nodes:
  - { id: phase, label: "Phase: [name]", role: process }
  - { id: step, label: "Step: [name]", sub: "route: /[slug]", role: component }
  - { id: page, label: "content_page", sub: "/[slug]", role: container }
  - { id: stake, label: "Stakeholder via widget", role: person }
edges:
  - { from: phase, to: step }
  - { from: step, to: page, label: "renders" }
  - { from: stake, to: page, label: "comments via widget" }
  - { from: page, to: step, label: "widget shows: 'this is journey step X'", style: dashed }
~~~
````

Setup + narration: explain that page bindings are what make Stakeholder mode work; missing bindings = drift flag.

## Push-back prompts (AFTER drafting)

- **"Does every on-screen step have a `route`?"** Run `detect_drift` after — `journey_step_no_page` flags missing ones.
- **"Are the feelings real or decorative?"** If every step is 🙂, the journey has no arc. Find the dip and the peak.
- **"Are phases named in persona language?"** "Acquisition / Activation / Retention" is internal; "I heard about it / I tried it / I came back" is the persona's voice.
- **"What's the worst step?"** Every journey has one. Name it; flag the opportunity.
- **"Could a developer build the prototype from this?"** If steps are abstract ("user takes action"), no. Force specificity.

## Evidence pool

- **Linked persona + JTBD.**
- **Linked research blocks** — interview quotes, usability studies.
- **Linked content_page blocks** — what screens already exist.
- **The IA tree** — what's the actual route structure.
- **Customer_insight blocks** — pain points already validated.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (empty or 3 generic phases). |
| **drafted** | Linked persona + JTBD. ≥3 phases × 2–4 steps. Feelings on every step. Insights per step. Page bindings on all on-screen steps (no `journey_step_no_page` drift flags). ≥2 pain points + opportunities. ≥1 quote per phase. |
| **validated** | Drafted + ≥1 usability study or customer_insight block validates the pain points + at least one opportunity has been shipped as a feature change. |

## Anti-patterns to refuse

- **The pageless journey.** On-screen steps without `route` bindings. Refuse — the widget breaks without them.
- **The flat-affect journey.** Every step 🙂. Force the arc.
- **The internal-jargon journey.** Phases named in funnel language. Force persona voice.
- **The featureless journey.** No linked features. Journeys exist to be implemented; link them.
- **The aspirational journey.** Steps invented by stakeholders. Mark `stub` until validated.

## Output schema (markdown body)

Use the **timeline shape** convention — H2 per phase, then a markdown table with columns `Step | Happiness | Actions | Experience | Insights` (use 😀 🙂 😐 🙁 😣 for happiness).

```
## Phase 1 — [persona-voice name]
| Step | Happiness | Actions | Experience | Insights |
|---|---|---|---|---|

## Phase 2 — …

### Page bindings (flow diagram)
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `journey_map` block must:

- Link **the primary persona** + **the JTBD** this journey serves.
- Have **`route` set on every on-screen step** (binds to content_page).
- Link **≥2 features** that the journey touches.
- Optionally link **customer_insight blocks** validating pain points.

A journey without page bindings produces drift flags on every render.
