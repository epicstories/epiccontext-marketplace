# A case in Figma — looking at the whole

Some design questions are not about one screen. A flow runs across five
screens; a direction changes the product in many places; a critique has to
be talked through with the people who decide. In a chat the whole falls
apart into lists. On one Figma page it can be seen at once: the screens
side by side, who they are for and where in the journey, what we found and
what the graph says. That is a **case**.

A case is offered, never assumed. It costs the person time and lands in
their Figma, so ask first and wait for a yes.

## When to offer it

- **The question is the whole.** A flow or a journey across screens,
  consistency across a product or across tools, a direction or redesign
  that changes more than one place.
- **People have to look at it together.** A review, a choice between
  directions, a stakeholder who decides, feedback to talk through (P10).
- **The findings do not fit a chat.** More than one lens table,
  screenshots that need to sit side by side, drift rows that point at
  several screens.
- **A round needs a human decision.** The iteration cap is reached, or a
  stand, an experience sentence or a style direction has to be set (P2).

Do not offer it for one screen and a quick question, or when the person
asked for code.

## How to ask

One sentence, in the person's language. Say what they get, then wait:

> **NL:** "Zal ik dit als case uitwerken in Figma, met alle context
> erbij? Dan zet ik de schermen naast elkaar, met de persona, de stap in
> de journey, wat we vonden en de keuzes die openstaan."
>
> **EN:** "Shall I work this out as a case in Figma, with all the context
> beside it? The screens side by side, with the persona, the journey
> step, what we found and the choices still open."

On a yes, ask where it goes: a new file, or a page in an existing file
(which one). A yes is for this case; ask again for the next.

## What a case holds

One page per case, read from left to right:

| Part | What | From |
|---|---|---|
| **The question** | The case name, the one question it answers (P1), the stand (P2), the round | The design rules; the critique |
| **For whom and where** | The persona card and the journey card with the moment highlighted; a feature or decision card where the case answers to one | `get_context_card`, see `references/context-cards.md` |
| **The whole** | The screens in the order of the flow, as they are, at 390 and 1440, with the path between them | Step 3's captures; `get_screenshot` for Figma frames |
| **What we found** | Findings pinned on the screen they concern: number, severity word, principle or floor item, evidence. The top-3 first | The critique, `references/critique-template.md` |
| **What the graph says** | Each drift row beside its screen | Step 7, `references/drift.md` |
| **The options** | For a choice: the directions side by side, each with its bet as *A even over B* and what it gives up | Generate or Choose, `references/modes.md` |
| **What needs a person** | A stand to set, a test to run, a decision to take, each with a name | The verdict |

## The rules

- **Context is Epic Context's card,** placed and linked, never redrawn by
  hand (`references/context-cards.md`).
- **Screens are real:** screenshots or frames of the real build or
  design, never redrawn. A redrawn screen is a second source
  (`references/figma-sync.md`).
- **Annotations use the project's tokens.** Severity uses the design
  system's status colours, never a colour picked for the page.
- **One question per case.** A second question is a second page.
- **The case shows the graph; it does not replace it.** The verdict, the
  findings and the decisions land in the graph as every round does
  (`references/landing.md`). Every card and note on the page links to its
  block.

## Making it

With the Figma connector: `use_figma` builds the page (frames, the
screenshots as images, the pinned findings, the cards from
`createNodeFromSvg`). A new file is `create_new_file` where the session has
it. Open the page beside the chat and give the link. Sharing the file is
the person's own act: never change its permissions.

Without a Figma connection, say so in one line. Then offer the same case
on a FigJam or Miro board (`epicontext-boards`), or as the critique with
its screenshots in a note.

## After the discussion

Read the comments on the page and classify them before acting on them
(`references/saying-no-and-feedback.md`). Then:

- what changes the design is the next round;
- what changes a project rule goes to the design-rules document, with a
  reason;
- what someone must decide goes to them with `hand_off`.

The round's note (`write_note`, on the screen's `content_page` or
`component_spec`) carries the link to the case, so the next session finds
it.
