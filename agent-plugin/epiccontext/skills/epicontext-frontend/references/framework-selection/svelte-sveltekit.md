# Svelte + SvelteKit

**Sweet spot:** interactive apps where bundle size and runtime speed
matter and the team is small enough to choose its own tools; the
default recommendation when no constraint forces React.

## Pros
- Compiler, not runtime: ~15–20 kB baseline, 20–30% smaller app bundles
  than Next.js equivalents; consistently top-tier runtime performance.
- Highest retention of any framework (~91% "would use again", State of
  JS 2025) — people who try it stay.
- Svelte 5 runes give fine-grained reactivity with less code than hooks.
- SvelteKit covers SSR/SSG/endpoints with far less configuration
  surface than Next.

## Cons
- Ecosystem is a fraction of React's — component libraries, auth kits
  and niche SDKs often need hand-rolling.
- Smaller hiring pool; contractors are rarer.
- AI assistants are less fluent than in React (improving, still a gap
  worth stating).

## Overkill when
- Pure content → Astro.
- Rarely overkill otherwise — its floor is low; the real question is
  usually whether the *ecosystem gap* costs more than the bundle win.

## Build & checks
```bash
npm run build                      # adapter output
npx vite-bundle-visualizer         # rollup-plugin-visualizer under the hood
npx lhci autorun
npx size-limit
```
