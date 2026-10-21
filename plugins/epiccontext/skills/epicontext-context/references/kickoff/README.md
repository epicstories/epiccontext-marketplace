# Epic Context — Kickoff (the first hour)

*Part of `epicontext-context` (`references/kickoff/README.md`), formerly the `epicontext-kickoff` skill. Paths below are relative to the `epicontext-context` folder: for `get_skill`, put `epicontext-context/` in front.*

> The graph is fresh. Every block is a stub. The user is staring at a wall of
> placeholders. The temptation is to fill everything; the right move
> is to make THREE things real today.

This skill exists for one moment: **the moment after scaffold, before
the project feels alive**. The user has just created (or just joined)
a project. Auto-fill would be overwhelming and would invent things
the user hasn't decided. Stub-everything would feel hopeless. The
kickoff is the bridge: pick 3 blocks worth specialising NOW; everything
else becomes the next sprint's work.

## When to use this skill

- Brand-new project (`get_v3_overview` shows nearly every block at
  `stub` with `default` origin)
- User just said "I scaffolded, what now?", "where do I start?", "I
  just signed up", "I just created the project"
- A returning user who's been away long enough that the graph is
  effectively cold to them again
- The user explicitly asks "kickoff" / "orient me" / "walk me through"
- `get_orientation` names the next step "create the shared context" or
  "fill the organisation's brand, personas, glossary and design system"

If the user asks for the bigger sweep — fill the whole graph, populate
everything from the repo — hand off to `references/fill/README.md` instead.
Kickoff is the 30-minute version; fill is the 2-hour version.

## Core principle — make three things real, not everything half-real

The user is more energised by three rich, validated-ish blocks than
by a whole graph of thin drafts. Three blocks they'd be proud to show someone is
the kickoff's only success criterion. Everything else is the next
work; the next-work list is itself a deliverable.

## The first-hour script

### Step 0 — The organisation first (when its shared context is empty)

Brand, design system, shared personas and the glossary belong to the
**organisation**, not to one project: written once in its shared context,
every project of the organisation reads them as its own (marked `[org]`).
Writing them into a project first means writing them again for the next.

Call `get_org_context` before anything else:

- **No shared context yet** → `ensure_org_project` creates it.
- **Shared context empty** (nothing past `stub`) → fill it there first,
  with `get_briefing("org-setup")` for the slots: vision, positioning,
  tone of voice, visual identity / design system, shared personas,
  glossary. Same sparring-partner rules as below — what the user says,
  marked `assumed` until evidence backs it.
- **A project block that is really the organisation's** (a brand voice,
  a colour system, a persona every project shares) → `move_block_to_org`,
  with a reason, instead of copying it.
- **Shared context written** → skip to Step 1; the project trio builds on it.

Detail, questions and the order to fill in:
`references/kickoff/organisation-first.md`. Keep this step short — the brand
workshop belongs to the brand group of `epicontext-groups`; the kickoff only makes the shared
anchors real enough that the project has something to inherit.

### Step 1 — Open with what the project is FOR (5 minutes)

**Ask the user:**

> *"In one sentence: what is this project, and who's it for? Don't
> polish — say it the way you'd say it to a friend at dinner. We'll
> sharpen the language later; right now I want the rough truth."*

Write back what you heard. Confirm. Use the persona's vocabulary if
the user used any.

This becomes the seed of the `product_overview` block — but don't
write it yet. We're just establishing the frame.

### Step 2 — Pick the persona (10 minutes)

The persona is the spine. Every other group points at it. Get it
right today and the rest of the
graph fills itself faster.

**Start from what the organisation shares.** Read `get_org_context`
first. If it holds a persona that fits, don't invent a new one: extend
it for this project with `override_block` (only the fields that differ —
this project's context, goal, frustration — and a reason saying why).
Write a project persona of its own only when it is a genuinely different
person; then say so in the reason.

> *"Tell me about one specific person who'd use this. Not 'product
> teams' — a named person, or someone you could picture. Their role,
> their day, their friction. If you have a verbatim quote from a
> recent conversation with someone like them, that's gold."*

If the user has interview/conversation material, hand off to
`epicontext-groups/references/users/methodologies/research-synthesis.md`. Otherwise, draft the
persona block live — but mark every claim as `hypothesis` until
research backs it, and write the block at `assumed`.

Quality bar before declaring this Block #1: persona has a name (or a
"name TBD"), a role, a day-in-the-life paragraph, a goal, and a
frustration. Not 12 attributes; the 5 that matter.

### Step 3 — Pick the bet (15 minutes)

What's this product BETTING on? Not the vision (that's longer term),
not the OGSM (that's the operating frame), the **bet**. The thing
that, if true, makes the product work — and if false, the product
fails.

> *"Complete this sentence: 'We bet that [persona] will [action] when
> we ship [mechanism], because [insight]. We bet against [common
> alternative].' If you can't fill the blanks, the bet isn't sharp
> enough yet."*

This becomes the seed of `product_strategy_canvas`. Hand off to
`epicontext-groups/references/strategy/methodologies/strategic-options.md` if the user has multiple candidate
bets to weigh.

Quality bar before declaring this Block #2: a bet with named persona,
named mechanism, named alternative-rejected. Specific enough that
someone could disagree.

### Step 4 — Pick the first feature (15 minutes)

What's the FIRST piece of product that makes the bet real? Not the
full roadmap — the one feature whose existence proves the bet is
plausible.

> *"If you had to ship ONE feature this month that would let you say
> 'see — the bet works', what is it? Specifically. Verb + persona-
> visible value + the smallest scope that still demonstrates the bet."*

If the user proposes 5 features, force ranking: "Which one would you
ship first if you could only ship one this month?"

This becomes the seed of a `feature` block (or sharpens the existing
`primary-feature` stub). Hand off to `epicontext-groups` (product) for the
feature shape.

Quality bar before declaring this Block #3: feature with persona-
visible value sentence, status (planned / in_development), and the
smallest viable scope named.

### Step 5 — Write the three (5 minutes)

Now (and only now) write the three blocks — `update_block` on the
scaffold stubs, `maturity: assumed`, each with a `reason`:

1. The persona from Step 2 — an `override_block` of the organisation's
   persona, or `update_block` on `persona/primary-persona` when it is
   the project's own
2. `product_strategy_canvas/product-strategy` — body from Step 3
3. `feature/primary-feature` — body from Step 4

Each cites the others through its `_ref` fields (the scaffold already
pre-wires most of these; check and fill any gap).

Confirm with the user before writing:

> *"Three blocks, written together. They land straight away, show up
> in the changes feed with my reason beside each, and any of them can
> be undone from there. Go?"*

### Step 6 — Show the next-work list (5 minutes)

Close the kickoff with the next 5 blocks to make real, ranked by
"unlocks the most other blocks." Typical order:

1. `vision` — anchors strategy + brand (skip when the organisation's
   shared context provides it; override only what differs here)
2. `messaging` — anchors marketing + content
3. `ogsm` — anchors performance
4. `tech_stack` — anchors build
5. `journey_map` — anchors product + IA

**Ask the user:**

> *"These are the next 5 most-leveraged blocks. Want to do one more
> today, save the rest for tomorrow, or run `references/fill/README.md` to
> write `assumed` bodies for all of them from the repo + the three
> blocks we just made real?"*

## Quality bar (the kickoff is done when ALL pass)

- ✓ The organisation's shared context holds at least its vision,
  positioning, tone of voice and one persona (or the user chose to
  skip it, and said why).
- ✓ Three blocks (persona / strategy / feature) written at
  `assumed`, each citing the others — the persona extending the
  organisation's where one fits.
- ✓ User can recite the bet in one sentence without reading it.
- ✓ A next-work list exists, ranked, with the user's chosen next
  action named (one more block / fill pass / stop and rest).

If any fails, the project isn't yet ready to leave kickoff — loop
through the relevant step again.

## What this produces in the graph

- **The organisation's anchors** (Step 0), written in its shared
  context when they were missing — never copied into the project.
- **3 block writes** at the end of the script — persona, strategy,
  feature — each cross-linking via its `_ref` fields.
- **`reason` must cite:** at minimum the existing `vision` and
  `product_overview` stubs (even though they're still stubs, the
  references anchor the trio).
- **No new ADRs** in kickoff. The kickoff is about content, not
  decisions. ADRs come later, when the team is actually choosing
  between things.

## Anti-patterns to refuse

- **Trying to make every block real in the first session.** That's
  the fill skill's job, not kickoff's. Insist on three.
- **Drafting blocks the user hasn't named.** If they didn't say it,
  it's not in scope. The kickoff doesn't invent content — it
  facilitates content the user has.
- **Skipping the persona step.** Without it the rest is unanchored.
- **Writing the brand or a shared persona into the project.** It
  belongs to the organisation; the next project would have to write it
  again. Fill it in the shared context, or move it there.
- **Inventing a project persona when the organisation has one.**
  Extend it with `override_block` and a reason.
- **Skipping the verbatim-quote pull.** If the user has interview
  material and we don't use it, we're making the persona up.
- **Treating this as a workshop you finish in one go.** If the user
  runs out of energy or material at step 3, stop. Two written
  blocks + a named gap is a better outcome than three made-up ones.

## How this fits the rest of the skill system

| After kickoff, the user typically wants… | Skill / methodology to hand off to |
|---|---|
| "Fill in the rest of the graph from the repo" | `references/fill/README.md` |
| "I have interview notes; help me extract insights" | `epicontext-groups/references/users/methodologies/research-synthesis.md` |
| "Help me think through positioning" | `epicontext-groups/references/brand/methodologies/positioning-workshop.md` |
| "We're choosing between options" | `epicontext-groups/references/strategy/methodologies/strategic-options.md` |
| "Audit what we have" | `references/alignment/README.md` |
| "What's the project missing?" | `epicontext-analysis` |
| "Ship a feature" | `epicontext-groups` (product) + `epicontext-frontend` + `epicontext-backend` |

Kickoff is the door; the entity skills + methodologies are the
rooms. Don't try to be the whole house.
