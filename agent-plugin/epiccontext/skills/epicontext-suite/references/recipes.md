# Recipes — work that crosses tools

Each recipe is a few moves. They all start the same way — look first
(`get_orientation`, then `get_briefing` or `search_blocks` for the subject) —
and end the same way: what is true is in Context, what is left for a person
is a card for that person, and you give the `url` of what you wrote.

## A meeting or a transcript

1. **Keep the raw material**: `write_note` with the notes or the
   transcript (a stable `key`, e.g. `meeting-2026-10-21-pricing`; `blocks`
   for what it is about).
2. **Land what is true**: `ingest_text` with the text (`source:
   "transcript"`). Decisions and insights become blocks in one revertible
   batch. A decision taken in a meeting lands as a `decision` at maturity
   `assumed`, with the literal quote that decided it — never a paraphrase
   presented as settled.
3. **Hand off the actions**: `hand_off` with every action, approval and open
   question as a card for the person who owns it (by name; never guessed).
4. Say what landed: the note, the blocks (the batch, to undo in one action),
   the cards.

## Research

1. **Look first**: what the brain holds on the subject — research,
   competitors, customer insights, the decisions that frame the question
   (`get_evidence_for` on the target).
2. **Brief the agents**: research agents, subagents and web research can't
   reach Epic Context. Put the block keys, the decisions, the constraints
   and what is already known in their brief, and ask them for sources.
3. **Land the findings** as blocks (`research`, `competitor`,
   `customer_insight`, …) with their sources named, at `assumed`; link them
   to what they support or contradict (`link_blocks`).
4. Your working notes go to `write_note`. A deeper run on an organisation
   or a market is the Research tool's: `hand_off` with kind `investigation`.

## A build (any change of code or content)

1. `list_handoffs` — an open plan for this work? Continue it under its key.
2. `share_plan` as soon as there is a plan: title, goal, steps; the branch
   as `key`. Open the card's `url` beside the chat.
3. Send the **whole** plan again whenever a step starts (`doing`) or
   finishes (`done`). A step someone else does names them (`for`).
4. At the end, even when not done: the final statuses with `share_plan`,
   `hand_off` what is left for people, and the session log with
   `write_note` (`append`), naming what was done, the branch, the PR and
   what is still open.

## A design explained in Figma

1. For each block the design answers to — the persona, the journey (with
   `highlight` on the phase or step), the feature, a decision —
   `get_context_card`.
2. Place the returned `svg` as is, beside the design frame (`use_figma`),
   and link its title and source line to the block's `url`. Never redraw a
   persona or a journey by hand.
3. No persona or journey in the graph is a gap: say so on the frame and
   offer to write the block first.

Detail: `epicontext-design/references/context-cards.md`. On a Miro or
FigJam board, build the card from `data` in the board's own shapes:
`epicontext-boards`.

## A social post

Epic Social is the one publishing channel; it publishes per brand, after a
person approves. Its source is Context.

1. Write or update the `content_piece` in Context — linked to its campaign
   and channels, written in the tone of voice (read it; never keep a copy).
2. If it needs a person's approval or a decision about timing, `hand_off`
   (kind `approval`) to the brand's person.
3. Never post yourself. What was published comes back as a `content_piece`,
   what was learned as a `customer_insight`.

## A user test

1. The flow to test runs on the workspace's prototype (the Prototype tool
   holds its address and who may open it, per workspace).
2. Ask for an Epic User run with `hand_off`, naming the flow, the persona
   and the question.
3. Findings come back as `customer_insight` blocks (assumed). Read them
   (`get_evidence_for` on the feature or page) before you judge or change
   the flow.

## The running app and who may open it

The Prototype tool holds a workspace's running app and its access (App URL
& access). Point reviews and Epic User runs at it. Changing who may open it
is a person's setting: `hand_off` (kind `setting`).

## A feature → stories → cards

Break the feature into stories and tasks that trace to the JTBD, the persona
and the page, and put them on the board — as the steps of your plan
(`share_plan`) or, for work that is someone else's, as cards (`hand_off`).
Stories and tasks are cards, not graph entities. The full method:
`references/feature-to-work.md`.

## A customer follow-up

Customer facts (contacts, companies, deals) belong in the CRM, not in
Context. The follow-up is a card: `hand_off` to the person who owns the
relationship.

## A step that keeps coming back

When the same manual step returns session after session, propose an
automation for the Processes tool with `hand_off` — describe the trigger,
the steps and the schedule. Don't build it yourself.

## A number you need

Read it in the graph (analytics and KPI blocks; the Analytics tool feeds
them). Not there? Write the structure, leave the value blank, and name what
should be measured and where it comes from. Never invent it.

## Something someone must know

A report is ready, a process is stuck, a decision changed their work:
`notify` that person, with a link. Something they must *do* is a card
(`hand_off`), not a notification.
