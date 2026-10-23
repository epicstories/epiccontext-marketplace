# Persona

A **researched representation of one type of user** — name, role, context, goals, frustrations, decision criteria, and quotes from real conversations. Not an invention, not a marketing avatar. A persona is the answer to *"who specifically are we building this for, and what's true about them?"*

A real persona block lets a designer make a copy decision, a PM cut a feature, and an AI client write a relevant journey — all without re-checking with research.

## Why most persona blocks are too thin

The classic failure: a name + a stock photo + three demographic bullets + "wants the app to be easy to use." That's not a persona; that's a slide template. It tells the reader nothing about how this person decides, what makes them switch products, where they get information, or what they'd say in a room.

A drafted persona has **named quotes from research**, **explicit decision criteria**, and **a context paragraph** that a designer could use to scope a screen for.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Name + role | "Primary user" | Named role + seniority + organisation type (e.g. "Sara, solo product designer running her own studio in NL"). |
| Context | absent | The day-to-day reality: tools used, time pressure, who they answer to, where they work from. |
| Goals | "Wants it to just work." | 3–5 named outcomes they're trying to reach, ordered by importance. Linked to JTBDs. |
| Frustrations | "Slow software." | 3–5 specific pain points with the *trigger* (when does the pain hit?) and the *cost* (what does it stop them doing?). |
| Decision criteria | absent | What they evaluate when choosing a tool: top 3 axes, with relative weights. |
| Information sources | absent | Where they learn / discover (newsletters, communities, peers). Useful for marketing + research. |
| Quotes | absent | 2–4 verbatim lines from real conversations or research. Marks the persona as *researched*, not invented. |
| Non-goals | absent | What this persona explicitly does NOT care about (filters wrong features out). |

## Depth checklist (BEFORE writing)

1. **Name + role** specific enough to picture.
2. **3+ goals** linked to JTBDs (or marked as "needs JTBD ingestion").
3. **3+ frustrations** with trigger + cost named.
4. **Decision criteria** — 3 named axes with relative weights.
5. **Information sources** — where they learn / discover.
6. **2+ direct quotes** from research (or marked as "to verify" with a placeholder).
7. **Non-goals** — at least 2.
8. **Linked JTBDs, journeys, features** (where applicable).
9. **Maturity honesty:** if quotes are invented placeholders, the persona is `stub` regardless of how polished the rest looks.

## Small visual — context map for this persona

A non-tech reader can't see who a persona connects to without a picture. One small `~~~flow` diagram showing the persona at the centre + linked entities makes the network visible.

````
~~~flow
title: Where this persona appears in the graph
direction: TB
nodes:
  - { id: p, label: "[Persona name]", role: person }
  - { id: j1, label: "JTBD: [job]", role: component }
  - { id: j2, label: "Journey: [name]", role: component }
  - { id: f1, label: "Feature: [name]", role: container }
  - { id: bc, label: "Business case: [name]", role: external }
edges:
  - { from: p, to: j1, label: "hires" }
  - { from: p, to: j2, label: "walks through" }
  - { from: j2, to: f1, label: "renders" }
  - { from: bc, to: p, label: "targets" }
~~~
````

Setup + narration: name the connections honestly (some may be "not yet linked").

## Push-back prompts (AFTER drafting)

- **"Are the quotes real?"** If you invented them, mark the persona `stub`. Inventing quotes is the single worst failure mode here.
- **"Do the frustrations have triggers and costs?"** "Frustrated by slow tools" is decoration. "Refuses to use design tools that take >5 min to load a file because she bills hourly" is a finding.
- **"What does this persona NOT care about?"** Without non-goals, every feature looks justified. Force 2.
- **"Could I tell two of my real users apart from this description?"** If the block could describe 80% of your users, it's not specific enough — it's an average, not a persona.
- **"Is the JTBD link real or aspirational?"** Persona without linked JTBD is unmoored from why someone hires the product.

## Evidence pool

- **Linked research blocks** — the studies / interviews this persona is derived from.
- **Linked JTBDs** — what jobs they hire for.
- **Linked journeys** — paths they walk through.
- **Linked customer_insight blocks** — validated signals from this persona.
- **Linked competitor blocks** — what they currently use instead.
- **The repo** — onboarding flows, user-facing copy that already assumes things about this persona.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (role: "Primary user" + invented goals). |
| **drafted** | All 9 checklist items present. ≥2 real quotes cited (or explicit "to verify"). At least 1 linked JTBD + 1 linked research block. Context paragraph + non-goals filled. ≥400 words in body. Small-visual context map present. |
| **validated** | Drafted + persona referenced *by* at least one journey_map + one feature, and at least one customer_insight / research block independently confirms a frustration or goal. |

## Anti-patterns to refuse

- **The fictional avatar.** No research cited; quotes invented. Refuse — force a research link or downgrade to `stub`.
- **The demographic-only persona.** Age, location, hobbies, no decision criteria. Refuse.
- **The everything-persona.** Goals and frustrations broad enough to cover any user. Force specificity.
- **The orphan persona.** No links to JTBDs / journeys / features. Personas exist to anchor downstream blocks — link them.
- **The pity-the-user persona.** Frustrations as marketing pain ("frustrated by complicated tools"). Force the trigger + cost.

## Output schema (markdown body)

```
### Who they are (name, role, context)
### Goals
### Frustrations
### Decision criteria
### Information sources
### Quotes
### Non-goals
### Context map
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `persona` block must:

- Link **at least one JTBD** (what jobs do they hire for?).
- Link **at least one research block** (or mark goals + quotes as "to verify").
- Be referenced *by* at least one **journey_map** and one **feature** (downstream — what does serving this persona produce?).

A persona without downstream references is an avatar.
