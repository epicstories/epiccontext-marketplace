---
name: epicontext-design
description: >
  Use to design, judge, iterate on or choose between UI/UX designs in an
  EpicContext project: a screen, flow or component; a critique of a
  screenshot, Figma frame or prototype ("beoordeel dit scherm", "welke
  variant"); directions or a redesign; the /design canvas; the design
  system and brandbook. Robert's standard: function with feeling,
  measured before judged, landed in the graph.
metadata:
  epic.requires: "component_spec,brand_visual_identity,tone_of_voice,persona"
  epic.version: "1.0.0"
  epic.contenthash: "8f9a85eb39a27ab8"
---

# Epic Context — Design

Any model can produce a plausible screen. What it cannot do on its own is
say whether that screen is *right for this product*: right for the person
using it, the business behind it, and the feeling it should leave. That
judgment is Robert's, and this skill writes it down so every design round
— inspiring, generating, critiquing, choosing — applies the same standard,
measures before it judges, and lands its verdict in the graph instead of
in a chat that ends.

One skill for all design work: the judgment is this file, the mechanics
(the `/design` canvas, the brandbook, anatomy, Figma) are in
`references/canvas-and-brandbook.md`. Seed → design → **test** → land,
before `epicontext-frontend` builds anything. It reads context from the
graph, never from assumption; it measures before it judges; and it says
*no* with a principle number, never with taste. One round is a photo.
The work is the loop.

## What good design is

> **Good design connects function with feeling.** It solves a problem that
> comes from the context, it works in use, and it contributes to the goal
> and the story we want to tell. The three cannot be separated: what works
> but tells nothing is a tool, what tells but doesn't work is decoration,
> and what solves no problem shouldn't exist.

"Works" is deliberate; it is not "easy". A goal can ask for friction,
learning, or even loudness — a dealer site that is intentionally shouty
and gets attention because of it. "Works" means usable *and* useful for
the user's own goal (NN/g: learnability, efficiency, memorability, errors,
satisfaction, plus utility). Friction placed *for* the user is a design
decision; friction placed *against* the user is sludge, and P6 forbids it.

## Four layers, in order of authority

| Layer | What it holds | Reversible? |
|---|---|---|
| **Project rules** | This project's recorded experience sentence, slider stand, style direction, signature language, platform mix — in the graph | Only by changing the graph, with a reason |
| **Craft floor** | Usability and accessibility minimums — `references/craft-floor.md` | No. A floor finding of severity ≥3 blocks, whatever the slider says |
| **Principles** | Ten choices that create a bias — `references/principles.md` | Yes, when the card's "reverse when" clause applies and the reason is recorded |
| **Standards** | Measured numbers and platform conventions that switch on with context — `references/standards.md` | Advisory. Never blocks; produces a finding with its evidence label |

When layers conflict: project rules > floor > principles > standards. A
conflict between a project rule and this skill is named in the output,
never silently resolved either way.

## The loop — one round

```
0. INSPIRE   read the project's style cards; none → propose one before drawing anything
1. ORIENT    read the project's context from the graph (never ask what the graph knows)
2. SET       confirm experience sentence, slider stand, style direction; propose if missing
3. MEASURE   deterministic checks first — targets, contrast, labels, reflow, motion, CWV — on screenshots at 390/768/1440
4. FLOOR     lens 1 — craft-floor checklist, severity per finding, evidence per finding
5. JUDGE     lens 2 — the ten principles, severity + "deliberately reversed?"
6. APPLY     lens 3 — context-triggered standards, with evidence labels
7. DRIFT     graph vs design — what the graph prescribes and the design lacks, and the reverse
8. VERDICT   release advice, top-3 actions sorted by severity × frequency, what to keep
9. LAND      verdict, decisions, open questions → graph and suite
10. AGAIN    next round on the change, until the stop rule (below) is met
```

Three lenses, not three evaluators. Running the floor, the principles and
the standards as separate passes forces *coverage*; it does not create
the independent errors that make Nielsen's "three to five evaluators"
work, because the same model shares its blind spots across passes. Real
independence comes from different input — code or DOM, a screenshot, the
Figma JSON — ideally as separate subagents whose findings are merged with
a count of how many lenses found each one. A finding seen by one lens
only is a hypothesis.

## Step 0 — Inspire: the style cards

Where the product is moving to visually is part of the context, and
without it every generation starts at the AI default. A **style card** is
a `brand_asset` with `asset_kind: style_card` (*stijlkaart*) in the
Brand-assets chapter: a direction in three words, reference images
(internal, with source), the elements we take and the ones we refuse,
their translation to our tokens, where they may appear and where not, and
the two tests (swap the logo — does it still read as us? is it a token,
or still a picture?). Format and a worked example in
`references/style-cards.md`.

Read the project's style cards before generating. If there are none,
propose one from the brand layer and have the user confirm it before any
direction is drawn. A style card is inspiration, not a template: it
carries elements, never a composition, and nothing that identifies its
source (P6).

## Step 1 — Orient: the context intake

Answer from the graph before judging or designing: the direction, who it
is for and how often, task screen or content page, device and platform
mix, experience and voice, what exists, how critical the flow is, locale
and law. Each answer switches on standards and tunes the principles;
which source answers which: `references/intake.md`.

`get_briefing` (task type `ui-page` or `ui-component`) and
`get_context_pack` fetch most of it in one or two calls. A Figma frame is
read before judging: `get_screenshot`, `get_design_context`,
`get_variable_defs`. The design system as it looks, every component live,
is the suite's Design tool: open it beside the chat. What the graph
cannot answer is an **assumption** in the output. The NL device mix is
roughly 50/50; design both breakpoints until the analytics say otherwise.

## Step 2 — Set: the project's design rules

Every project records once, in a `document` in its Design group's
Guidelines chapter: the experience sentence (P1), the slider stand of
five with its reason (P2), the style direction, the signature language
(P5), the dense-screen hierarchy rule (P7), the deliberate friction (P6),
the optical corrections (P9) and the platform mix. The five stands and
how to propose missing rules: `references/design-rules.md`. Then every
later design is *een eitje*: the hard choices were made once.

## Step 3 — Measure before judging

About half of what goes wrong in generated UI is measurable, and a model
that "sees" it instead of measuring it produces 25–80% false positives in
the published studies. So before any lens runs:

- Capture the screen at **390, 768 and 1440** CSS px, plus the focus
  state of the primary action and the reduced-motion variant where motion
  exists (Playwright, or the Figma screenshot per frame).
- Run the deterministic checks: target size, contrast of every text and
  UI pair against the tokens in the graph, placeholder-as-label,
  icon-only controls, reflow at 320, animation durations, CLS/INP/LCP
  where a URL exists. `npx impeccable detect --json`, axe-core and
  `npx @google/design.md lint` cover most of this; a page behind a
  sign-in is measured in the browser itself. Use what the session has.
- Every floor finding carries **evidence**: a selector, a measured value,
  or a screenshot region. A finding without evidence is not a defect; it
  goes under *uncertainty* as "needs a usability test" or "needs the live
  CSS".

The lenses then judge what cannot be measured: the problem fit, the
hierarchy, the story, the signature, the drift.

## The ten principles, short form

Full cards (why, do/don't, reverse condition): `references/principles.md`,
read on the first judgment in a session.

| # | Principle | Test question |
|---|---|---|
| P1 | **Context sets the problem.** The designer is a problem solver, not a stylist. | Which problem or opportunity does this solve, in one sentence, and how does this component serve it? |
| P2 | **The slider is explicit.** One of five stands, set per project and per flow, recorded. It moves *expression*, never *interaction conventions*. It breaks ties between the other principles. | Which stand is this, and is it recorded? |
| P3 | **Leave out, don't hide.** Remove by frequency until just not missed; never remove an affordance; one experience across mobile and desktop; primary navigation and core actions stay visible. | What can go without anyone missing it — and can a new user still discover what remains? |
| P4 | **Unity through system.** Fewest components; one spacing scale; one radius rule; colour carries meaning and never carries it alone. | How many components does this screen use, and which value is off the scale? |
| P5 | **Signature is a language, not a moment.** One continuous form language everywhere, quiet. Louder only at rare moments (first use, completion); quieter the more often it is seen. It must strengthen use, explain or give pleasure — and exist as tokens and components, with a reduced-motion twin. | Would you recognise this product without its logo? For the loud moment: what does it explain or give, and how often is it seen? |
| P6 | **Borrow the principle, not the picture — and the ethics.** Learn from what works via style cards; copy platform conventions literally; no deceptive patterns, no sludge. | Which problem did the reference solve, and is it the same problem here? |
| P7 | **Hierarchy is the story — scanned in seconds.** One thing first, one second, the rest quiet; size, colour and whitespace are the tools. In task screens the order follows the most frequent task; in dense B2B screens the choice is what stays uniform. | Name the first three things seen, in order. Does that order match what the user must understand or do? |
| P8 | **We don't pollute the design.** "It worked before", "it's pretty", "it's less work" are not reasons. Say no with a principle number and a severity; be stubborn about the experience, never about evidence. | Which experience (P1) or story (P7) gets better? |
| P9 | **An explainable scale over a pretty value.** Every size, colour step and duration comes from a series you can explain; optical correction is the recorded exception. | Which series does this value come from? |
| P10 | **Keep evaluating — feedback is a signal, not an instruction.** The first design is rarely the best. Ask why this user says this, what they tried to do, whether they are the intended user on the right spot, or whether we missed something. Never copy feedback 1:1; when evidence exists it beats conviction. | What is this feedback a symptom of, and what would we have to measure to know? |

## Severity

Nielsen's scale, always with its word and the three factors, so a human can re-score:

| Score | Word | Meaning | Anchor example |
|---|---|---|---|
| 4 | Catastrophe | fix before release | a primary action with no feedback; a destructive action with no confirmation or undo; a deceptive pattern |
| 3 | Major | high priority | white text on a brand colour at 2.65:1 on every primary button; primary navigation hidden on mobile; the search field not among the first three things seen on a search page |
| 2 | Minor | low priority | counts in the navigation that duplicate stat tiles; a floating assistant covering the last card of a carousel; a full-width CTA band carrying a secondary action |
| 1 | Cosmetic | when there is time | a feature-icon block with no action; letter avatars mixed with real logos |
| 0 | Not a problem | noted only when the user raised it | — |

Factors: **frequency** (how often users meet it), **impact** (how hard to
recover), **persistence** (one-time or every time). Severity ≥3 on the
floor blocks release regardless of the slider. A principle finding is only
a finding when no recorded reason for reversing it exists. More anchors
in `references/severity-anchors.md`; add one from every real critique,
because models cluster everything at 2–3 without them.

## Step 7 — Graph-vs-design drift

The graph is the contract; the design is one rendering of it. Compare
both ways in a short table and land each row as a design change or a
graph update, never left as a difference: `references/drift.md`.

## Modes

One loop, entered at different points; a critique ends with a redesign
proposal, a generation with a self-critique. In full: `references/modes.md`.

- **Generate** ("design the X screen", "ontwerp") — steps 0–2 first; two
  or three directions that embody **different bets**, each stated as
  *A even over B*; only tokens and components from the graph; a
  self-critique (steps 3–7) before presenting, fixing severity ≥3 and the
  part that looks like the AI default.
- **Critique** ("is this good?", "beoordeel dit") — steps 1–9, output
  exactly `references/critique-template.md`, **at most eight findings per
  lens**, every finding with its floor item, principle number or labelled
  standard, plus its evidence. Never "feels off".
- **Choose** ("which variant?", `/design` artboards) — measure and floor
  every option first; an option failing severity ≥3 drops out before
  taste enters; recommend one and state when you would reverse it.
- **Case** — when the question is the whole (a flow, a direction, a critique
  to talk through with people), ask first: *"Zal ik dit als case uitwerken
  in Figma, met alle context erbij?"* On a yes: `references/figma-case.md`.

## Iteration — the obsession as a method

The first design is rarely the best (P10), and a critique that is never
followed by a second round changes nothing. Rounds continue until the
**stop rule** is met:

- no finding of severity ≥3 on any lens, and
- the top-3 is empty or cosmetic only, and
- the slider stand, experience sentence and style direction are
  confirmed in the graph, and
- the drift table is empty.

Two guards, because published studies show model feedback gets *less*
accurate as a design gets better (accurate feedback fell from 52% to 39%
over iterations in one CHI study): a **hard cap of five rounds** per
screen without a human decision in between, and the rule that every
round must bring **new evidence** — a changed measurement, a new
screenshot diff — or it ends. Each round lands a snapshot in the graph
(scores per lens, the findings, what was deliberately left as is and
under which principle), so round three knows what round one found and
nobody re-raises a recorded exception.

## Saying no, and feedback (P8, P10)

Answer with the principle and the severity: "P3, major: hiding the filter on desktop
halves its use (NN/g 2016)" lands; "I don't think it's right" doesn't. Evidence wins,
through the principle's reverse clause. Feedback is **classified** first (`epicontext-analysis`),
never applied 1:1, and lands as a `feedback` entity: `references/saying-no-and-feedback.md`.

## Landing the round — step 9

A critique that lives only in the chat gets redone next quarter. Verdict
and findings → `write_note` on the screen's `content_page` or
`component_spec`; actionable findings → `create_task`; the plan →
`share_plan`; a style card → `upload_asset` + `brand_asset`; a reversed
principle, friction point, optical correction or stand → the design-rules
document with a `reason`; a missing token → a `decision`; what is left for
a person → `hand_off`; a recurring pattern → `propose_skill_delta`. In
full: `references/landing.md`. Every write reads first (`get_briefing`)
and carries a reason that names what it read (`epicontext-core`).

## What this skill refuses to do

- Judge without reading the graph. "Looks good" against unknown context is a guess with confidence.
- Report a floor finding without evidence. No selector, value or screenshot region → uncertainty, not defect.
- Call three lenses three evaluators, or present one lens's severity as final. Show the factors; flag what needs a test.
- Add a "wow" anywhere. The signature is a language (P5); a loud moment needs a sentence of justification and a frequency check.
- Treat the floor as negotiable because the brand is bold. The slider moves expression, not usability.
- Rewrite a design in its own taste. Every change traces to a numbered principle, a floor item or a labelled standard.
- Apply a statistic as a threshold when it carries ⚠ in `references/standards.md` (old, single-site, second-hand). Those are directional.
- Keep iterating past the cap or without new evidence. That is polishing noise.

## References — when to read which

| File | Read when |
|---|---|
| `references/principles.md` | First judgment in a session: the full cards with why, examples, reverse conditions |
| `references/style-cards.md` | Step 0, and whenever a direction or redesign is asked for |
| `references/intake.md` · `design-rules.md` · `drift.md` · `landing.md` | Steps 1, 2, 7 and 9 in full |
| `references/craft-floor.md` | Every critique and every self-critique (lens 1) |
| `references/standards.md` | After intake; read only the blocks the context switches on |
| `references/critique-template.md` | Every critique output; copy it verbatim |
| `references/severity-anchors.md` | Before scoring, until the anchors are second nature |
| `references/red-flags.md` | Critiquing generated UI, or triaging many findings; says which flags are measurable |
| `references/modes.md` · `saying-no-and-feedback.md` | Generate, critique, choose in full; saying no and classifying feedback |
| `references/influences.md` | When the user asks where a principle comes from, or wants to extend the philosophy |
| `references/canvas-and-brandbook.md` | The `/design` canvas, the brandbook's five chapters, component anatomy, landing a direction |
| `references/project-setup.md` · `design-system-standards.md` · `epiccontext-gate.md` | A new project's design system: where components live, the base inventory, the prototype's sign-in gate |
| `references/figma-case.md` · `context-cards.md` · `figma-export.md` · `figma-sync.md` | Figma: the whole as a case to discuss; a design with its context; into or out of Figma |

## Known gaps (v0.3)

An eval set with seeded defects and a no-skill baseline; a DESIGN.md export for `lint` and
`diff`; lenses as subagents with duplicate clustering; few-shot visual anchors. On the board.

## Pairs with

`epicontext-frontend` (building it), `epicontext-analysis` (feedback), `epicontext-suite`
(board, notes, hand-offs), `epicontext-groups` (design system, brand, users, performance),
`epicontext-boards` (the case on FigJam or Miro), `epicontext-core` (read, then write).

Respond in the language the user writes in; principle numbers, stands and
severity words stay the same in both.
