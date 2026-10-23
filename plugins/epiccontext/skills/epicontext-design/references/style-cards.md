# Style cards — step 0

> Interim version (2026-10-23), written from step 0 of `SKILL.md` and the
> `brand_asset` schema while Robert's own `style-cards.md` is on its way.
> His file replaces this one; until then, this is the format.

A style card says where the product is moving to visually, so a
generation starts from the project's direction instead of the AI default.
It is inspiration, not a template: it carries **elements**, never a
composition, and nothing that identifies its source (P6).

## Where it lives

One `brand_asset` per card, with `asset_kind: style_card`, in the Design
group's Brand-assets chapter. The reference images are its `files`
(uploaded with `upload_asset`, each with the `background` it is shown
on); `source_url` points at the board they came from when there is one.
The active card or cards are named in the project's design rules
(`references/design-rules.md`, "Style direction").

## The body, in this order

```markdown
## Direction
Three words. (e.g. "calm, exact, warm")

## References
~~~gallery
items:
  - src: /assets/ref-1.webp
    caption: What it is, and where it comes from (internal; never shown to users)
~~~

## What we take
- The element, and the problem it solved there (P6: the same problem here?)

## What we refuse
- The element we leave out, and why (a principle number where one applies)

## In our tokens
- Each taken element as tokens: colour role, radius, type step, motion duration.
  An element with no token yet is a finding (P4, P9), never a raw value.

## Where it may appear — and where not
- Flows or moments where the element is used; where it stays out
  (dense task screens, checkout, error states).

## The two tests
- Swap the logo for a competitor's: does it still read as us? If yes, it is decoration (P5).
- Is every element a token or a component, or is it still a picture? A picture is not yet a direction.
~~~dodont
do:
  - The element applied through the tokens
dont:
  - The reference's composition copied
~~~
```

## How it is used

- **Before generating** (step 0): read the active cards. None → propose
  one from the brand layer (positioning, tone of voice, visual identity)
  and have the user confirm it before any direction is drawn.
- **In a direction**: each direction names the card elements it uses
  (`references/modes.md`, Generate).
- **In a critique**: a screen that ignores the recorded direction is a
  drift row (`references/drift.md`); a borrowed picture without its
  problem is red flag 17 (`references/red-flags.md`).
- **Landing**: a new or changed card → `upload_asset` for the images,
  then the `brand_asset`, with a `reason` naming what was read.
