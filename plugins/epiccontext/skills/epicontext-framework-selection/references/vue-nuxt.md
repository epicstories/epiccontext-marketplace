# Vue + Nuxt

**Sweet spot:** teams already in Vue; products wanting a batteries-included
meta-framework with a gentler mental model than React's RSC.

## Pros
- Single-file components keep template/logic/style together — low
  ceremony, fast onboarding.
- Nuxt's module ecosystem (content, image, auth) covers common needs
  without wiring.
- Nitro server engine deploys anywhere (node, edge, static) from one
  codebase.
- Satisfaction consistently above React's; stable, mature.

## Cons
- Smaller hiring pool and ecosystem than React; niche integrations
  often React-first.
- AI assistants are noticeably weaker in Vue than React — more
  hallucinated APIs, more review needed.
- Options/Composition API split still fragments examples and docs.

## Overkill when
- Static content → Astro (which can host Vue islands).
- The team doesn't know Vue and has no reason to learn it — team fit is
  the main argument *for* Vue; absent that, it's React's ecosystem or
  Svelte's simplicity.

## Build & checks
```bash
npm run build                      # nitro output summary
npx nuxi analyze                   # built-in bundle analyzer
npx lhci autorun
npx size-limit
```
