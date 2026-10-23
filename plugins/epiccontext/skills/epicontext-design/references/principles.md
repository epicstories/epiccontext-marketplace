# The ten principles — full cards

Each card: the principle as a choice (*A even over B*, so that B is also
something good), why Robert holds it, the test question, a do and a
don't, when to reverse it, and the default severity when it is violated
without a recorded reason. The short table in SKILL.md is the working
list; this file is the reasoning behind it.

Contents: P1 Context · P2 Slider · P3 Leave out · P4 Unity · P5 Signature
· P6 Borrow · P7 Hierarchy · P8 Don't pollute · P9 Scale · P10 Evaluate ·
How the principles interact

---

## P1 — Context sets the problem

**The problem from the context, even over the designer's first idea.**

*Why.* The designer is a problem solver, not a stylist (Newson: "a
troubleshooter, a problem solver"). Whoever knows the context — the user,
the business strategy, the intended feeling — sees which problem or
opportunity is on the table, and that decides the experience. Ease can be
the solution, but ease can also be the problem: a product that is too easy
can teach nothing, make the user feel nothing, and give no reason to come
back. Rams' "usefulness" already includes psychological and aesthetic
criteria; Newson adds pleasure and lightness as function.

*Test.* Which problem does this screen solve, or which opportunity does it
take, in one sentence? And how does this component contribute to it?

*Do.* A B2B workflow tool whose dense list view exists because the
persona runs it fifty times a day and the journey step says "clear the
queue before 10:00". The density is the solution.

*Don't.* A "clean" landing page for that same tool, designed because
landing pages look like that, with the queue hidden behind a dashboard
nobody asked for.

*Reverse when.* Never. This is the foundation; the other principles hang
from it. What *does* vary is the source of the context: it must come from
observed users and recorded strategy in the graph, not from the
designer's assumption. An un-researched assumption is written down as an
assumption.

*Severity if violated.* 3 when the component serves no stated problem on
a primary task; 2 elsewhere.

---

## P2 — The slider is explicit

**A recorded stance even over case-by-case balancing.**

*Why.* Every product sits somewhere between *tool* (Rams: neutral,
restrained, room for the user's own expression) and *object* (Newson: a
recognisable form language, material, desire). B2C and brand-led products
lean to object: it's fine if not everything is easy, as long as the user
says "this is cool". B2B, service and daily-use products lean to tool: the
goal matters more than the feeling. The stand has to be written down once
per project, because it is the tiebreaker for every conflict between the
other principles (signature vs simplicity, story vs density). The slider
moves *expression* — colour, shape, type, motion, tone — and never the
*interaction conventions*: forms, navigation, back, buttons stay where
users expect them. Newson's Ferrari interior still has the wheel and the
dashboard where they belong.

The five stands, so the choice is nameable and repeatable:

| Stand | Name | Meaning | Typical |
|---|---|---|---|
| 1 | Tool | efficiency, neutral; no expression beyond the logo | expert tools, daily B2B (Edge) |
| 2 | Useful with warmth | a tool, but with a recognisable tone and colour | a local index, a service (Yellowbello) |
| 3 | Balanced | expression and goal weigh the same | a consumer app, a folder or guide page |
| 4 | Brand first | the experience may cost some ease: "not everything easy, but this is cool" | lifestyle, entertainment, launch pages |
| 5 | Object | the product is the brand | campaign, one-off experience |

A stand may differ per flow inside one product: a stand-4 product's
checkout is stand 2; a stand-1 tool's first run may be stand 3. Record
the exception.

*Test.* Which stand is this project — and this flow — on, why, and is
that in the graph?

*Do.* Project rules say "stand 4, because the product is the brand's
only touchpoint" — so the signature may be present on the hero and the
completion state, and the checkout form is still a conventional one-column
form on stand 2.

*Don't.* A B2B dashboard where every card has a different hover animation
because "the client wants it to feel premium", with the stand never
discussed.

*Reverse when.* When a single flow inside the product has a different
job: a brand-led product's payment flow moves to stand 2; a tool's
first-run onboarding may move to stand 3. Record the per-flow exception.

*Severity if violated.* Not scored directly; a missing stand turns every
other principle finding into an open question instead of a finding, and
is reported as such.

---

## P3 — Leave out, don't hide

**Fewer elements even over covering every need — but visible even over tidy.**

*Why.* Simplicity is not a style; it is knowing the context. Throwing
every need onto one screen is easy; leaving things out until the user
*just* doesn't miss them is the work (Rams: "omit the unimportant in order
to emphasize the important"). But leaving out is not hiding. Three
constraints Robert holds, backed by NN/g: (1) hiding costs — on desktop,
hidden navigation was used in 27% of cases against 48% visible (NN/g
2016), and weak signifiers made findability tasks 22% slower (NN/g 2017);
(2) a user never misses what they never saw, so "just not missed" must be
measured by frequency of use, not by feel; (3) one experience across
breakpoints: showing something on desktop and removing it on mobile — or
the reverse — breaks the mental model. Conventions stay: users know where
a menu usually is.

*Test.* What can go without anyone missing it? For what remains hidden:
can a new user still discover it, and does it exist on every breakpoint?

*Do.* A settings screen with eight controls, where six low-frequency
options moved to a clearly labelled "Advanced" section that is visible on
every device.

*Don't.* A desktop table whose column picker lives behind an unlabelled
icon in a hover-only toolbar, and does not exist at all on mobile.

*Reverse when.* Expert tools where density *is* the experience and the
users are trained (P2 at tool); then the question becomes which elements
stay deliberately uniform (P7), not which disappear.

*Severity if violated.* 3 for a hidden or breakpoint-missing primary
action or navigation; 2 for secondary elements; 1 for decoration that
could go.

---

## P4 — Unity through system

**As few components as possible even over the perfect one-off.**

*Why.* Everything is a component, and the question is how few of them can
carry the whole experience. Unity is felt before it is understood: the
same spacing scale everywhere (8 / 16 / 24 / 32 / 64 stacks beautifully),
one radius rule (nested smaller, or uniform the way Apple does it),
colour that means something. Rams' Braun and the 606 shelving were a
shared *system* of rules; Newson keeps a personal "dictionary" of cues he
reuses across projects. A new component earns its place only when the
same pattern recurs three times and composition can't solve it. Colour
carries meaning, but never alone: every meaning is double-coded with
shape, text or icon (WCAG 1.4.1).

*Test.* How many distinct components does this screen use? Which value —
spacing, radius, colour, type size — is not on the scale?

*Do.* A new "approval queue" built from the existing List, Badge and
Button, with the queue's urgency expressed through the existing status
colours plus an icon.

*Don't.* A new "ApprovalCard" with its own 14-px padding and 10-px
radius because the designer liked the proportions on this screen.

*Reverse when.* A product's own domain organism (NS Nessie's lesson: the
route planner, the trading ticket) genuinely recurs and has no composable
equivalent — then it becomes a design-system citizen with the same
documentation as Button.

*Severity if violated.* 2 for off-scale values and unnecessary new
components; 3 when colour is the only carrier of a meaning on a primary
task.

---

## P5 — Signature is a language, not a moment

**One quiet form language everywhere even over scattered highlights.**

*Why.* The brand only goes so far; the experience is a feeling, and that
feeling is also design. Newson's signature is not one gesture, it runs
through the whole object: the soft rectangle "somewhere between a square
and a circle", the obsession with how a thing is made and how it feels to
touch. In UI that is the radius language, the curve, the motion
character — consistent, quiet, present on every screen. On top of that
language, per flow, at most one place may become loud: an animation that
explains what text cannot, a completion that gives pleasure. Two
constraints: the loud moment gets quieter the more often it is seen (NN/g:
frequent animations must be shorter and subtler; a daily action at 100×
per day can't wait for a 600-ms flourish), and it must be *attached* to
what the product does (Adamson's warning about Newson as "hood ornament":
if you swap the logo for a competitor's and the moment still fits, it is
decoration). The signature must exist as tokens and components, with a
reduced-motion twin, or nobody can repeat it.

*Test.* Would you recognise this product without its logo? For the loud
moment: what does it explain or what pleasure does it give, in one
sentence — and how often will this user see it?

*Do.* The same continuous-curve radius on every container, a 180-ms
spring on every state change, and one loud moment: the first successful
sync animates the data flowing in, once.

*Don't.* A different "delight" micro-animation on every button, each over
400 ms, on a tool used all day.

*Reverse when.* Pure task flows (payment, error recovery) have no loud
moment, only the language. Campaign pages and one-off brand experiences
may be loud throughout, because there the spectacle is the product.

*Severity if violated.* 3 when a signature slows or obscures a daily
action, or has no reduced-motion variant; 2 when the loud moment is
unjustified decoration; 2 when the language is inconsistent across
screens.

---

## P6 — Borrow the principle, not the picture — and the ethics

**Proven references even over originality for its own sake.**

*Why.* Good design is often borrowed from examples we know work: colour
combinations, a style, a pattern. Apple borrowed Braun; Braun leaned on
Ulm. The rule is to borrow the *problem solved* and the principle behind
it, not the picture — and to borrow the ethics with it. Rams was clear
that Apple took his form and left his restraint behind. Platform
conventions are the one exception: those are copied literally, because
users spend most of their time in other products (Jakob's Law). No
deceptive patterns, and no sludge — friction that works against the
user's own goal (cancelling harder than signing up, confirmshaming,
fake urgency) counts as a dark pattern even when it is "just friction".

*Test.* Which problem did the reference solve, and is it the same problem
here? Would the user feel deceived if they knew exactly what this element
does?

*Do.* Taking Linear's command palette for a daily tool because the
problem — expert users who want speed without hiding the mouse route —
matches.

*Don't.* Taking Linear's dark gradient hero for a B2B compliance tool
because it looks premium.

*Reverse when.* Never for the ethics. For references: when the product
*is* a new interaction model and the convention does not exist yet —
then test it with users before shipping it.

*Severity if violated.* 4 for a deceptive pattern or sludge on a
primary flow; 3 for breaking a platform convention on a core interaction;
1 for a borrowed style that doesn't fit.

---

## P7 — Hierarchy is the story — scanned in seconds

**One thing first even over everything equally visible.**

*Why.* A screen tells a story in an order: one thing is seen first, one
second, the rest stays quiet. Size, colour and whitespace are the three
tools, and whitespace is the cheapest: an element given room around it
gains force without anything being added. This is what gives simplicity
(P3) its purpose — only a calm screen lets one or two elements stand out.
Hierarchy is read by *scanning*, not reading: users form a judgment in
seconds (NN/g: the F-pattern is what happens to badly structured content;
layer-cake scanning along headings is what works), and Robert is such a
user himself. In task screens the first thing is the most frequent task,
not the brand's message; in dense B2B screens the decision shifts to what
stays deliberately *uniform*, so that the one or two things that matter
can still stand out. Frequency of use wins the tie, not business
importance.

*Test.* Name the first three things seen, in order, in under five
seconds. Does that order match what the user must understand or do here?
Can you retell the screen in two sentences without seeing it?

*Do.* An order-overview where the one overdue order is the only thing in
colour, the primary action sits alone with whitespace, and the other
forty rows share one quiet tone.

*Don't.* A dashboard where every KPI tile has its own colour and size,
so nothing is first.

*Reverse when.* Linear flows (a wizard, a checkout) where the structure
already carries the order; there everything may be equally calm. And
content pages without a task yet, where the story may lead.

*Severity if violated.* 3 when the primary action is not among the first
things seen; 2 for a wrong order in secondary content; 1 for competing
emphasis among decorative elements.

---

## P8 — We don't pollute the design

**Protecting the experience even over accommodating every request.**

*Why.* Requests come from every side: the developer wants what worked
last time, a stakeholder wants what is pretty, someone else wants nothing
replaced because it is work. Newson: "nobody likes designing landfill";
Robert's translation: every addition that does not serve the intended
experience is landfill in the design. The designer guards the experience,
and that takes saying no and being a little stubborn — but stubborn about
the *experience*, never about *evidence*. Spool's test gives the tool: a
good principle helps you say no, and the opposite must be a reasonable
choice. So every no names the principle it rests on and the severity of
ignoring it; a no without a number is taste, and then the conversation is
open.

*Test.* Which experience (P1) or which story (P7) gets better from this?
If the answer is "it worked before", "it looks nice" or "it's less work",
there is no reason yet.

*Do.* "No to the carousel: P7 severity 2, three competing messages
mean nothing is first; on comparable sites ~1% of visitors click
(Runyon 2013, ⚠ single site). What should be first?"

*Don't.* "I don't like carousels."

*Reverse when.* The request comes with evidence — a test, data, a
recorded project rule. Then the evidence wins, and the relevant
principle's reverse clause is how to say yes without breaking the system.

*Severity if violated.* Not scored on the design; scored on the
*process*: an addition that cannot be traced to a principle or a project
rule is reported as unjustified, with the severity of the principle it
damages.

---

## P9 — An explainable scale over a pretty value

**A value from a series even over a value that merely looks right.**

*Why.* Logic makes beauty: 8 → 16 → 24 → 32 → 64, a type scale with one
ratio, a colour ramp with fixed steps, durations within 100–500 ms
anchored to the 0.1-s response threshold. The beauty is in the coherence,
not in the individual value, and that coherence is what makes the
signature (P5) and the unity (P4) repeatable by the next person and the
next session. Newson's freehand curve is a production process; in UI a
curve has to be a token or it breaks P4. The one legitimate exception is
optical correction — a circular icon next to text, an arrow inside a
button — where the mathematically right value looks wrong and the eye
wins. That exception is *recorded*, or "by eye" creeps in everywhere.

*Test.* For each value: which series does it come from? A value that only
"looks good" is a finding.

*Do.* Spacing tokens space-1…space-6 on the 8-pt scale; an icon nudged
1 px up with a comment `optical: icon baseline`.

*Don't.* `padding: 13px 18px` because it "sat better".

*Reverse when.* Optical correction, recorded with its reason. And brand
assets (a logo's clear space, a wordmark's letter spacing) that follow
their own geometry.

*Severity if violated.* 2 for off-scale values; 1 when the deviation is
plausibly optical but unrecorded.

---

## P10 — Keep evaluating: feedback is a signal, not an instruction

**Interpreting feedback even over acting on it — and evidence even over conviction.**

*Why.* The first design is rarely the best; we learn along the way and
find things we didn't have in view. So we keep evaluating and stay open to
new feedback. That seems to clash with P8 (guard the experience) and it
doesn't: openness means evaluating the feedback *well*. Why does this user
say this? What were they trying to do? Often they have a different
intention, are in the wrong place, or point at something we hadn't
considered. Feedback is rarely to be copied 1:1; it carries elements it
doesn't name, and context decides. Two further reasons from the research:
the aesthetic-usability effect means pretty interfaces hide usability
problems in tests, and one evaluator — the designer included — finds about
a third of the problems. When evidence exists, it beats conviction.

*Test.* What is this feedback a symptom of? Who gave it, where in the
journey, and what does it not say? What would we have to measure to know
whether the design should change?

*Do.* A stakeholder says "the button should be red". The agent asks what
they expected to happen, finds the button is below the fold on their
laptop, and classifies it as a hierarchy finding (P7, severity 3) — not a
colour change.

*Don't.* Making the button red.

*Reverse when.* For brand expression where no task performance is at
stake, or for reversible decisions where shipping and measuring is cheaper
than another round — then the designer's call stands until the data
arrives.

*Severity if violated.* Not scored on the design; a feedback item applied
without classification is reported as drift risk.

---

## How the principles interact

- **P1 is the root.** Every other principle asks "for this context".
- **P2 breaks ties.** When P5 (signature) pulls against P3 and P7
  (simplicity, hierarchy), the recorded stand decides. Stand 4–5 → the
  signature may cost some calm; stand 1–2 → calm wins; stand 3 → name
  the trade-off and let the experience sentence (P1) decide.
- **Style cards feed P5 and P6.** A direction without a card borrows
  from the AI default; a card without the swap test copies the source.
- **P3 and P7 are one move.** Leaving out is what makes hierarchy
  possible; hierarchy is what tells you what to leave out.
- **P4 and P9 are the mechanics of P5.** A signature that isn't tokens
  and a scale isn't a signature, it's a mood.
- **P6 bounds P5.** The signature may be loud; it may never deceive or
  break a convention users rely on.
- **P8 and P10 are the two halves of the designer's stance.** Stubborn
  about the experience (P8), humble before evidence (P10). The principle
  number is what lets both be true at once.
