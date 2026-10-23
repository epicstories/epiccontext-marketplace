# Critique template

Copy this structure verbatim for every critique. Respond in the user's
language; the headings may be translated, the structure may not. Tables
stay tables so findings can be compared across rounds and across lenses.

The three lenses are deliberately separate: they force coverage of the
floor, the principles and the standards. They are not three evaluators —
the same model shares its blind spots — so each finding also says what
evidence it rests on, and a finding without evidence is uncertainty, not
a defect.

```
CRITIQUE — <screen or flow> — round <n> — <date>

CONTEXT (from the graph; ASSUMED where the graph had nothing)
Persona & expertise:   <…>
Frequency:             <daily / weekly / once>
Task or content:       <…>, journey step <…>
Device / platform:     <… — e.g. "ASSUMED NL ~50/50, both breakpoints judged">
Experience sentence:   <P1 — from project rules, or PROPOSED>
Slider stand:          <1 Tool · 2 Useful with warmth · 3 Balanced · 4 Brand first · 5 Object> — recorded / PROPOSED
Style direction:       <active style card(s), or "none — proposed below">
Signature language:    <P5 — from project rules, or "not recorded">
Previous round:        <what round n−1 found and what changed since; "first round" otherwise>
What I could not see:  <states, motion, other breakpoint, real data>

MEASUREMENTS (step 3 — deterministic, before any lens)
| Check | Result | Tool / method | Where |
|---|---|---|---|
| Contrast primary button text | 2.65:1 (fail AA) | computed from foundation-colour tokens | all primary buttons |
| Target size, card hearts | … | … | … |
| Reflow at 320 | not captured | — | needs screenshot |

LENS 1 — CRAFT FLOOR (blocking at severity ≥3) — max 8 rows
| # | Finding | Floor item / heuristic | Sev (word) | Freq / Impact / Persist | Evidence | Recommendation |
|---|---------|------------------------|------------|-------------------------|----------|----------------|
| F1 | <what, where> | <e.g. Contrast [SPEC]> | 3 Major | H / M / H | <value, selector or screenshot region> | <concrete fix> |

LENS 2 — PRINCIPLES (directional; a finding only without a recorded reversal) — max 8 rows
| # | Finding | Principle + support | Sev (word) | Reversed on record? | Evidence | Recommendation |
|---|---------|---------------------|------------|---------------------|----------|----------------|
| P-1 | <what, where> | <P7; NN/g layer-cake> | 2 Minor | no | <screenshot region / graph source> | <concrete fix> |

LENS 3 — STANDARDS (advisory; label every line) — max 8 rows
| # | Finding | Standard + label | Sev (word) | Recommendation |
|---|---------|------------------|------------|----------------|
| S1 | <what, where> | <§1 target 44 pt [SPEC]> | 2 Minor | <concrete fix> |

DRIFT — graph vs design (step 7)
| Direction | Item | Where it lives | Resolve by |
|---|---|---|---|
| in graph, not in design | `folder-teaser` spec | design_system | design change |
| in design, not in graph | coral CTA band | — | spec it, or drop it |

WHAT WORKS — keep this
- <strength> → <principle / floor item it satisfies>

UNCERTAINTY
- Needs a usability test, not inspection: <…>
- Needs the live CSS / another breakpoint / a screenshot: <…>
- Assumptions about context (P1) not yet researched: <…>
- Findings seen by one lens only (hypotheses): <…>

VERDICT
| Severity | Count | Of which on the floor |
|---|---|---|
| 4 Catastrophe | <n> | <n> |
| 3 Major | <n> | <n> |
| 2 Minor | <n> | <n> |
| 1 Cosmetic | <n> | <n> |
Release advice:   <"do not release: F1, F3 at Catastrophe" / "release after F2" / "release">
Top 3 actions (severity × frequency):
  1. <…>
  2. <…>
  3. <…>
Redesign proposal for round <n+1>: <two or three sentences, or the directions it should produce>
Stop rule:        <met / not met — which condition is open>
Open question for the owner: <one, if any>
```

## Rules for filling it in

1. **Measure first.** The measurements table is filled before any lens;
   a lens may cite it but not contradict it.
2. **Every finding has a number and evidence** — a floor item, a
   principle (P1–P10) or a standard with its label, plus a value,
   selector, graph source or screenshot region. "Feels off" is not a
   finding; find the number or drop the line. No evidence → uncertainty.
3. **Severity shows its word and its factors.** Frequency (how many
   users, how often), impact (how hard to recover), persistence (once or
   every time). Pick the nearest anchor in `severity-anchors.md`, then
   adjust. A human may re-score; make that possible.
4. **Eight rows per lens.** The rest counts in the verdict table but is
   not listed; say "n more below severity 2" at the foot of the table.
5. **A floor finding of severity ≥3 blocks** whatever the stand says. A
   principle finding never blocks on its own; it lowers the verdict and
   feeds the top-3.
6. **Reversed on record** means the project's design rules, a `decision`
   block or an ADR say so. "The client wanted it" is not on record until
   it is written down with a reason.
7. **Drift is its own table**, both directions, and each row names how it
   gets resolved — in the design or in the graph.
8. **What works is not politeness.** It tells the next round what not to
   touch, and it is where the signature (P5) is usually found.
9. **Top 3, not top 10.** Sort by severity × frequency. Then the redesign
   proposal: a critique that ends without one is a photo, not a round.
10. **One open question**, for a named owner, when a decision is theirs
    (stand, a token change, a release). It goes to `hand_off`.
11. **Then land it**: `write_note` linked to the screen's block with the
    round number, tasks for the top-3 with `create_task`, the plan with
    `share_plan`, and any new project rule, style card or reversed
    principle into the graph with a `reason`.

## Short form

When the user asks for a quick take ("even snel: is dit oké?"), keep the
measurements and the three lenses but collapse each lens to its worst
finding, state the stand in one line, and skip the context block. Still
land the note; the short form is for the chat, not for the graph.
