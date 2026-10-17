# Generating Figma designs from the component library

**Checked August 2026.** The blunt constraint first: Figma's REST API
cannot create or edit design files — writing into Figma happens through
the in-editor Plugin API, or through third-party bridges built on it.
"Export our components to Figma" is therefore an integration choice,
not an API call.

## The principle before the tooling

In EpicContext, **code is the canonical design system** and everything
else is a projection of it (the book chapter, the audit, tokens — and
Figma, if we add it). A generated Figma file must be treated like the
book: regenerated from code on demand, never hand-edited into a second
source of truth. A Figma file that designers edit while the code moves
is the exact drift this product exists to kill.

## Viable paths, ranked

1. **story.to.design** (divRIOTS) — generates Figma components from
   Storybook stories, with variants mapped from story permutations.
   If the project already has a Storybook, this is the lowest-effort
   pilot: point it at the Storybook build, get a component library with
   variant sets. Not a reason to add a Storybook to a project without
   one — use (2) against the preview route instead.
2. **code.to.design `/html-component` API** (same vendor) — generate a
   Figma component programmatically from HTML, with native variant
   properties and slots. Fits our preview registry: each preview's
   rendered HTML becomes a component. More control than (1), more
   plumbing.
3. **Own Figma plugin** on the Plugin API (`figma.createComponent`,
   component sets from a variants matrix; the Figma Console MCP wraps
   this for agent use). Full control, real build cost — only worth it
   if (1)/(2) can't express something we need.
4. **Tokens only** — push colour/type/space/radius into Figma Variables
   (write API is Enterprise-tier) or via Tokens Studio. Cheapest, and
   often what stakeholders actually need from "it's in Figma".

## Recommendation

With an existing Storybook, pilot (1); with a preview route, pilot (2).
Fall back to (4) if the variant mapping disappoints. Whatever lands, record it as an ADR with
the regeneration rule stated: *the Figma file is output, not input.*
Both divRIOTS tools are commercial — pricing is part of the pilot.
