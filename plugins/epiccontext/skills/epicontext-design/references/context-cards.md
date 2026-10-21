# Context beside a design: Epic Context's own cards

When a design in Figma is explained with its context — *who it is for and
where it sits*: the persona, the journey step, the feature, the KPI, the
decision behind it — that context is **Epic Context's own card**, placed
from the graph, with a link to the block. Never redraw a persona or a
journey by hand: a hand-drawn copy is a second source that drifts, carries
no brand, and leads nowhere.

## The rule

1. **Get the card**: `get_context_card(key, highlight?, style?)` for each
   block the design answers to (a persona, a journey, a feature, a
   decision, …). It returns `svg`, `data`, `url` and `place`.
2. **Place it as is** in Figma, with `use_figma`:
   ```js
   const card = figma.createNodeFromSvg(svg);
   card.name = `Epic Context · ${title}`;
   // beside the design frame, on the same page
   ```
3. **Link it**: the card's title and its source line link to the block's
   page. For each of those text nodes:
   ```js
   await figma.loadFontAsync(node.fontName);
   node.setRangeHyperlink(0, node.characters.length, { type: "URL", value: url });
   ```
4. **Mark the moment**: for a journey, pass `highlight` with the phase or
   step the design is about; the card marks it ("▲ This design").
5. **Fit the design, keep the card**: colours and fonts may follow the
   design's style — pass `style` (`ink`, `muted`, `ground`, `border`,
   `accent`, `soft` as hex, `font` as a family name) and place the new
   card. Do not repaint shapes or rewrite text by hand: the structure, the
   wording and the source line are Epic Context's.

## A "for whom and where" frame

The usual layout beside a design:

| Part | What |
|---|---|
| Title | `For whom and where — <design>`, in the design's type |
| One line | The design's job, in the session's language, from the feature or journey step |
| Cards | The persona card and the journey card (with `highlight`), side by side; a feature or decision card below when the design answers to one |
| Nothing else | No hand-made summary of the persona or the journey next to the cards |

## When there is no block

No persona or journey in the graph is a gap, not a reason to invent one:
say so on the frame ("No persona in Epic Context yet"), and offer to write
the block first — then place its card.

## Boards

On a Miro or FigJam board the same card is built from `data` in the
board's own shapes — see the `epicontext-boards` skill.
