# Influences — where the principles come from, and what was left out

Read this when the user asks where a principle comes from, or wants to
extend the philosophy. It records what Robert takes from each influence,
what he explicitly does not, and what people often attribute to these
designers that isn't in their work. Nothing here is a rule; the rules
are in `principles.md` and `craft-floor.md`.

Contents: Rams · Newson · Apple · NN/g and Norman · Spool and the
even-over form · Shape Up and Linear · What is Robert's own

---

## Dieter Rams (Braun, Vitsœ)

**Taken.** Colour as signal, structure neutral: Braun's palette was
blacks, pale greys and off-whites, and Rams applied colour "if it told
the user something" (ET 66: green/red for on/off, one yellow `=`). A
visible hierarchy of controls: the most-used key gets the most contrast,
and hierarchy runs through texture as well as colour. "Omit the
unimportant in order to emphasize the important" — leaving out as a means
to emphasis, not an end (P3, P7). Honesty: a product "does not attempt to
manipulate the consumer with promises that cannot be kept" (P6, floor).
Nothing arbitrary: every element defends its place (P8, P9). Visual
pollution counts as pollution (principle 9 of his ten). The 606 shelving
as an extensible system (P4).

**Not taken.** "Honest materials" literally — software has no material;
it becomes honest *behaviour*. "Long-lasting" as freezing the UI — it
becomes a stable mental model and a product that doesn't get heavier per
release. The solitary-genius myth: the SK 4 was Wagenfeld, Gugelot,
Lindinger, Aicher and Rams; the ET 66 is Dietrich Lubs under Rams.

**Not actually in Rams.** The 8-pt scale, a radius rule, a grid size —
those are Robert's own system (P4, P9). "One accent colour" — Braun used
several signal colours; the rule is colour = meaning. And Rams' own ten
are, by Spool's test, mostly truisms: only *unobtrusive*, *long-lasting*
and *as little as possible* have a reasonable opposite — and that opposite
is Newson.

**Critique that applies.** Norman and Tognazzini (2015) on Apple:
minimalism that removes discoverability, feedback and recovery is not
good design; NN/g (2013, 2017) measured the cost of weak signifiers. This
is why P3 says *leave out, don't hide* and why the floor is not
negotiable.

## Marc Newson

**Taken.** The designer as "a troubleshooter — a problem solver" (P1).
One continuous form language: the soft rectangle "somewhere between a
square and a circle… I've never really been one for really hard-edge
things" — the signature as a *language*, not a moment (P5). A personal
"dictionary" of cues reused across domains (Nike sneakers ↔ Louis Vuitton
trunks, "because they're both touching the ground") — Robert's version is
the token set (P4, P9). Obsession with how a thing is made and how it
feels to touch — in UI: motion with weight, interruptible, tactile (P5;
Apple WWDC18 fluid interfaces as the nearest digital counterpart).
"Nobody likes designing landfill" — Robert's translation: we don't
pollute the design (P8). Restraint as his own word for his work: "There
was an order. There's a reason."

**Not taken.** The luxury premise ("anything good is kind of costly"):
in UI an expensive signature costs performance, accessibility and
maintenance for every user. Freehand curves: in UI a curve is a token or
it breaks the system. The Ferrari Luce interior still has the wheel and
dashboard where they belong — conventions stay (P2, P6).

**Critique that applies.** Glenn Adamson (frieze, 2019): Newson as a
"human hood ornament" — the signature recognisable *regardless of the
problem* is branding, not design. Hence the test in P5: if you swap the
logo for a competitor's and the loud moment still fits, it is
decoration.

**Not actually in Newson.** "One signature moment per screen" — his
signature runs through the whole object; the loud-moment constraint is
Robert's. Squircles and fluid motion are Apple/Ive; their link to Newson
is synthesis, not documented influence.

## Apple (HIG, Ive, iOS)

**Taken.** The radius rule (uniform, or continuous curvature at large
radii), optical correction as a recorded exception (P9), motion with
damping — taps don't bounce, flicks may overshoot (P5), platform
conventions as the floor (P6).

**Not taken.** Liquid Glass (iOS 26) as judged by NN/g: "motion for
motion's sake is not usability" — the example of a signature language
applied without the floor. Rams' own verdict that Apple took his form and
left his ethics.

## Nielsen Norman Group and Don Norman

**Taken.** The ten heuristics as the floor (not as principles — they are
truisms by Spool's test, which is exactly why they are non-negotiable).
Severity 0–4 with frequency × impact × persistence. The "one evaluator
finds ~35%" finding, which is why the critique runs three passes and
flags what needs a test. Affordance vs signifier (Norman 2013): you can
keep an affordance and remove its signifier, and then the function is
gone in practice — the heart of P3. Measured findings as standards with
labels: hidden navigation 27% vs 48% (2016), weak signifiers +22% (2017),
57% of attention above the fold (2018), aesthetic-usability effect
(Kurosu & Kashimura 1995) — which also means pretty interfaces hide
usability problems (P10). "You are not the user" (P1's source rule). For
complex applications: "reduce clutter without reducing capability", and
a learnable system is not always efficient (P2/P7 B2B exception).

**Not taken as rules.** Anything marked ⚠ in `standards.md` — the 2008
reading percentages, the 1993 thresholds as hard limits, single-site
studies.

## Jared Spool, Matt Ström, Ben Brignell — the even-over form

The test every principle in this skill had to pass: a good principle
helps you say no to an otherwise-good design, and its opposite is a
reasonable choice for someone else. Principles that fail it ("be
consistent", "give feedback") went into the floor. The *A even over B*
form (used by Linear, Atlassian and others) makes the trade-off explicit
and is why each card in `principles.md` opens with one. Brignell:
concise, memorable, decisive — "creating a bias, guiding judgement rather
than describing what's good."

## Shape Up (Singer) and Linear (Saarinen)

**Taken.** Constraints as creative input — appetite, rough/solved/bounded
— which is why the project's design rules are set *once* and then every
design "is een eitje" (step 2). Linear's "Quality Wednesdays train the
team to see what is off" — judgment as a practice of seeing, which is
what the critique mode exercises.

## What is Robert's own

- The definition: function **with feeling**, and "works" instead of
  "easy" — a deliberate departure from Zhuo's *valuable, easy to use,
  well-crafted* and from NN/g's usability-only definition. It admits
  deliberate friction and even deliberate loudness when the goal asks for
  it (the UK dealer site), bounded by the sludge rule.
- The slider (P2) as the recorded tiebreaker, and the rule that it moves
  expression and never conventions.
- Signature as language with a frequency-scaled loud moment (P5).
- Hierarchy as scanned story, with "what stays uniform" as the dense-screen
  move and frequency as the tiebreaker (P7).
- "We don't pollute the design" with the three non-arguments and the
  principle-number rule (P8).
- Evaluation as interpretation of feedback, with the stubborn/humble split
  (P8 + P10).
- The requirement that the signature exists as tokens and components, or
  it isn't one.

## Open items for the philosophy

Questions Robert has not answered yet, which would sharpen the cards:
three designs he killed and why; one case where user goal and business
strategy conflicted and what he chose; which products are his benchmark
and which acclaimed product he finds overrated; the three sentences he
repeats most to other designers. Answers go into the cards' do/don't
examples via `propose_skill_delta`.
