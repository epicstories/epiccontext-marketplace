# Research

A **specific study** that produced evidence about the persona, the market, or the product — with method, sample, findings, and the validated insights that descend from it. Not "we did some research"; one named, dated, methodologically explicit study.

A real research block is what lets `validated` maturity stand. Personas, JTBDs, journeys, and business cases that cite no research are at best `drafted`.

## Why most research blocks are too thin

The classic failure: a title + "we interviewed 5 users" + a single bullet finding. That tells the reader nothing about the method (open-ended vs. structured?), sample (recruited how? for what?), or what insights *that specific study* produced vs. assumptions the team brought.

A drafted research block names the **method** (interviews / usability / survey / desk research), the **sample with recruitment criteria**, the **findings** (what was learned), and the **insights** (what the findings imply for product/strategy).

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Title + date + lead | "Initial Research" | "Sept 2026 — Onboarding interviews — Lead: founder" |
| Method | absent | Named (semi-structured interviews / unmoderated usability / survey N=…). Why this method. |
| Sample + recruitment | absent | N + criteria + how recruited + bias acknowledgement. |
| Findings | "Users liked it." | 3–7 named findings, ordered by signal strength, each with the evidence (quote / behaviour). |
| Insights | absent | What the findings imply for product/strategy. Distinguish findings (data) from insights (interpretation). |
| Limitations | absent | What this study can NOT tell us. Sample bias, method limits. |
| Linked entities affected | absent | Which persona / JTBD / feature / business_case this study validates or refutes. |

## Depth checklist (BEFORE writing)

1. **Date + lead + method** stated.
2. **Sample N + recruitment criteria** + bias acknowledged.
3. **3+ findings** with evidence per finding.
4. **Insights distinguished from findings** (data vs interpretation).
5. **Limitations** named.
6. **Linked entities** updated (persona quote added, JTBD validated, etc.).
7. **Quotes verbatim where possible.**
8. **Maturity honesty:** "We talked to some users" without method/sample = `stub`.

## Small visual — evidence flow

A small flow diagram showing how this research feeds the graph.

````
~~~flow
title: Evidence flow — what this study touches
direction: LR
nodes:
  - { id: study, label: "[Study title]", sub: "N=… · method", role: process }
  - { id: finding, label: "Findings (data)", role: component }
  - { id: insight, label: "Insights (interpretation)", role: component }
  - { id: persona, label: "Persona [name]", role: person }
  - { id: jtbd, label: "JTBD [name]", role: external }
  - { id: feature, label: "Feature [name]", role: container }
edges:
  - { from: study, to: finding }
  - { from: finding, to: insight, label: "interpreted as" }
  - { from: insight, to: persona, label: "validates quote / frustration" }
  - { from: insight, to: jtbd, label: "validates trigger / cost" }
  - { from: insight, to: feature, label: "shaped" }
~~~
````

Setup + narration: name which entities were updated based on this study, and which weren't (limitations).

## Push-back prompts (AFTER drafting)

- **"What is the sample bias?"** Every recruitment method has one. Name it.
- **"Is this a finding or an insight?"** "5 of 5 users couldn't find X" is a finding. "Users assume X is in the wrong place" is an insight. Tag each.
- **"What can this study NOT tell us?"** Force limitations.
- **"Did I update the affected blocks?"** A research block that doesn't update its persona / JTBD / business_case is shelfware.
- **"Are the quotes verbatim?"** Paraphrased = lower confidence. Be honest.

## Evidence pool

- **The raw research artifacts** — transcripts, recordings, survey CSVs (referenced, not embedded).
- **Linked persona + JTBD + feature blocks** to update.
- **Prior research blocks** — do findings agree or contradict?
- **External benchmarks** — industry studies on similar samples.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder title). |
| **drafted** | Title + date + method + sample + recruitment + ≥3 findings + insights + limitations. ≥400 words. Small-visual evidence flow showing entities touched. |
| **validated** | Drafted + raw artifacts archived + ≥1 affected entity (persona / JTBD / feature) updated by a write whose `reason` cites this study + lead approved write-up. |

## Anti-patterns to refuse

- **The "we talked to users" block.** No method, no sample, no findings. Refuse.
- **The finding-as-insight conflation.** Force tagging.
- **The shelfware research.** Findings not propagated to affected blocks. Force the updates.
- **The bias-free claim.** Every method has bias. Acknowledge.
- **The retroactive research.** Citing a study that doesn't exist. Tag `stub` + flag.

## Output schema (markdown body)

```
### Study metadata (date / method / lead)
### Sample + recruitment + bias
### Findings (data)
### Insights (interpretation)
### Limitations
### Affected entities
### Evidence flow
[setup] / ~~~flow / [narration]
```

## Required connections (graph-level)

A drafted `research` block must:

- Link **the persona** the study is about (or marked "market study, not persona-specific").
- Be referenced *by* at least one **persona**, **JTBD**, **feature**, **business_case**, or **customer_insight** block (downstream — what does the study validate?).
- Optionally link **prior research blocks** if findings agree/contradict.

Research that updates nothing in the graph is shelfware.
