# htmx + server-rendered HTML

**Sweet spot:** server-owned apps (any backend language) whose
interactivity is submit/swap-shaped — admin panels, CRUD, dashboards
that refresh rather than collaborate. The "most admired" tool in State
of JS 2025 among those who use it, precisely because it removes the
frontend build entirely.

## Pros
- ~14 kB, no build step, no node toolchain — the backend renders HTML
  and htmx swaps fragments.
- The state lives where it already was (the server); an entire class of
  client-state bugs never exists.
- Pairs with any backend: Django, Rails, Laravel, Go, Spring.

## Cons
- Optimistic UI, offline, drag-and-drop-heavy or collaborative surfaces
  fight the model hard.
- No component ecosystem — you bring server partials and CSS.
- Team must think in hypermedia; React habits mislead.

## Overkill when
- Never overkill — it's the floor for *apps*. The failure mode is the
  opposite: outgrowing it (rich client interactions multiplying) and
  bolting on script islands until you've built a worse framework.
  When >30% of interactions need client-side state, step up the ladder.

## Build & checks
```bash
# No JS build. The checks are the server's + the wire:
npx lhci autorun          # still measures the pages users get
# Watch fragment sizes and request waterfalls in the network tab —
# htmx apps regress by chattiness, not bundle size.
```
