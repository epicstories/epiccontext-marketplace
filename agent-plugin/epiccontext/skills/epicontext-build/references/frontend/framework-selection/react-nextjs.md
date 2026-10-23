# React + Next.js

**Sweet spot:** full-stack interactive applications where ecosystem
depth, hiring pool and AI-assistant familiarity outweigh runtime cost;
teams already fluent in React.

## Pros
- Largest ecosystem and hiring pool of any option; ~85% usage (State of
  JS 2025). Every integration has a React package first.
- Server Components + Partial Pre-Rendering give strong
  time-to-interactive when used well.
- AI coding assistants are at their most reliable in React/Next —
  training data density is a real, unglamorous advantage for
  AI-assisted teams (which every EpicContext project is).
- Vercel deployment path is friction-free.

## Cons
- Lowest satisfaction of the major frameworks (~72%) — complexity
  fatigue is real: RSC boundaries, caching semantics, `"use client"`
  discipline all bite (EpicContext's own Next.js app has the scars).
- Heaviest baseline bundle of the mainstream options; equivalent apps
  run 20–30% larger than SvelteKit.
- The App Router's caching model changes across majors; upgrades are
  work.

## Overkill when
- The site is content with a sprinkle of interactivity → Astro.
- There's no server-side logic at all → Vite + React SPA, or lighter.
- One form on a marketing page justifies neither RSC nor a meta-framework.

## Build & checks
```bash
npm run build                      # watch route table: ○ static / ƒ dynamic
ANALYZE=true npm run build         # @next/bundle-analyzer
npx lhci autorun                   # budgets: perf ≥ 0.9
npx size-limit                     # cap .next/static client JS (e.g. 200 kB gzip)
```
Red flags in the route table: everything `ƒ (Dynamic)` on a content
site; no `loading.tsx` anywhere; client bundles growing past budget.

## Building UI with EpicContext on this stack

> One stack among several. These are the React / Next.js specifics of
> the stack-neutral rules in `epicontext-build/references/frontend/README.md`; use them only when
> the project's `tech_stack` block says React / Next.js.

- **Tokens.** Typically CSS custom properties in `app/globals.css`
  (with `.dark` counterparts) surfaced through `tailwind.config.{ts,js}`
  if the project uses Tailwind — or a theme object (MUI,
  styled-components). Use the names; add a missing token there, never a
  raw value in a component.
- **Page copy from the `content_page` body.** In a Server Component,
  fetch the block at request time from
  `https://www.epiccontext.com/api/v1/projects/<id>/blocks/<key>` (API
  key in an env var, never in code), cache it with the framework's fetch
  cache / `revalidate`, and split the body on its `**Label:**` lines.
  Keep the fetch in the route; components take the strings as props.
- **Images.** `next/image` `src` values should match the paths in the
  body's `## Images` section.
- **Component previews.** The EpicContext preview template
  (https://www.epiccontext.com/templates/epiccontext-preview/README.md) ships a
  React registry plus an App Router page: copy them to
  `src/design-system/registry.tsx` and `src/app/__ec/preview/page.tsx`.
  An existing Storybook works too — point each spec's `preview_url` at
  the story's public absolute iframe URL.
- **Gate.** The EpicContext gate installs as root `middleware.js` (or
  `proxy.js` on Next 16) — see `epicontext-design/references/epiccontext-gate.md`.
