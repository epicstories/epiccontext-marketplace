# Astro

**Sweet spot:** content-first sites — marketing, docs, blogs,
portfolios, landing pages. The bottom of the overkill ladder that still
ships a modern DX.

## Pros
- Zero JavaScript by default; islands opt in per component. Near-perfect
  Core Web Vitals are the norm, not an achievement — LCP typically
  40–70% lower than SSG-optimised Next.js pages.
- Islands take React, Vue, Svelte or Solid components — an escape hatch
  per widget instead of a framework commitment.
- Content collections give typed markdown/MDX with zero ceremony.

## Cons
- Not for app-like surfaces: heavy shared client state across islands
  fights the model.
- Server endpoints exist but a real backend belongs elsewhere.
- Session-style auth flows are wire-it-yourself.

## Overkill when
- Almost never for content — it *is* the anti-overkill choice. The
  inverse failure applies: if interactivity is the product, don't force
  it into islands; step up the ladder.

## Build & checks
```bash
npm run build                      # per-page JS report in output
npx astro check                    # types + a11y hints
npx lhci autorun                   # expect ≥0.95 perf on content pages
```
Red flag: many pages hydrating (`client:load` everywhere) — that's an
app wearing a content site's framework.
