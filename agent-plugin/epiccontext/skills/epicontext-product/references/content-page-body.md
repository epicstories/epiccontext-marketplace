# content_page body — the page's actual content

A `content_page` block's `body` (markdown) is the canonical store
for everything that appears on the deployed page. Frontend code
reads its copy from it (however the project's own stack does that —
a build-time fetch, a server read through MCP or the API, a copy
step); the widget reads it via the page-context endpoint; people edit
it as plain markdown in the editor. **Three readers, one truth — the
body.**

Every content_page body MUST follow this shape:

```markdown
## Context summary
2–4 sentences: what this page is, who it's for, what context
touches it. End with a Touches line of REAL markdown links to each
connected block's editor route, e.g.:
Touches: [Product Owner](/<org>/<project>/users/product-owner), [Context map](/<org>/<project>/product/context-map).

## Page copy

### Hero
**Headline:** Actual headline that ships on the page
**Sub:** Supporting line
**Primary CTA:** Label → /target

### <Other sections as needed>
**Field label:** Value

## Images
- ![alt text](/path/to/image.png) — caption / placement note
- ![second image](/path/2.png) — placement note
```

## Why the summary lives in the body, not as a UI feature

- The summary is content, not a derivation. The AI agent writes it
  at create time with full knowledge of the page's role.
- It must always be there — opening a page should never trigger a
  "generating summary…" spinner. The summary is authored alongside
  the copy, persistent, editable like any other markdown.
- The widget reads the same string the editor renders. Single source.

## Authoring discipline for AI agents

- When creating a new `content_page`, the body MUST include all
  three sections (`Context summary`, `Page copy`, `Images`).
- When updating a page's `feature_refs` or `persona_refs`, also
  update the `Touches:` line at the end of `## Context summary`.
- Write every entity reference (in the `Touches:` line and inline in
  the prose) as a **real markdown link** `[Label](/<org>/<project>/<section>/<key>)`,
  never as bare `persona/<key>` text. Bare text renders as plain text;
  a markdown link renders as a clickable link in the book, the widget,
  and exports alike.
- The actual copy that ships in code MUST trace to specific lines
  in `## Page copy`. If the code uses a headline, the headline
  lives in the body. The body is the source; the code reads.
- Image references in the body should match the image paths used in
  code (`<img src>` or whatever image component the project's
  framework uses), so an audit of the body lists every asset the page
  actually renders.
