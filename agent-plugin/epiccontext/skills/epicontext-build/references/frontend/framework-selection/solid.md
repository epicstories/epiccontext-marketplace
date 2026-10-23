# Solid + SolidStart

**Sweet spot:** update-rate-critical UIs — live dashboards, editors,
anything where re-render latency is the felt product — with a team
willing to trade ecosystem for ceiling.

## Pros
- Fine-grained reactivity without virtual DOM; consistently at the top
  of JS framework benchmarks; ~89% satisfaction.
- JSX familiarity: React developers read Solid quickly (writing it
  correctly takes longer — no re-running components).
- Small runtime comparable to Svelte's.

## Cons
- ~10% usage: smallest ecosystem and hiring pool of the serious
  options; SolidStart is younger than its peers.
- AI assistants regularly write React idioms into Solid code —
  destructuring props breaks reactivity silently. Review burden is real.

## Overkill when
- The UI updates at human pace (forms, CRUD, content) — Svelte or React
  deliver the same felt result with a larger safety net.

## Build & checks
```bash
npm run build
npx vite-bundle-visualizer
npx lhci autorun
```
