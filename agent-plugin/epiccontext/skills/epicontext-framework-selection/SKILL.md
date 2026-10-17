---
name: epicontext-framework-selection
description: Use when choosing or reviewing a frontend framework for an EpicContext-managed project — a new prototype, "what should we build this in?", "is this framework overkill?", or any mention of React, Next.js, Vue, Nuxt, Svelte, SvelteKit, Solid, Astro, Angular or htmx. Carries per-framework pros/cons, the overkill ladder, build-health checks, and per-stack UI how-tos.
metadata:
  epic.requires: "tech_stack,decision"
  epic.version: "1.0.0"
  epic.contenthash: "2c392f406b7bb01b"
---

# Frontend framework selection

The job: recommend the *lightest* framework that meets the project's
actual requirements, say what it costs, and record the decision in the
graph. Frontenders are right that frameworks are often overkill — the
most common failure is defaulting to the heaviest option because it is
the most familiar, then paying for it in build times, bundle size and
complexity for the life of the project.

## The method

1. **Read the graph first.** `product_strategy`, `overview`, `persona`,
   `journey_map`, `tech_stack` — the requirements live there, not in the
   framework docs. What actually matters: how much *interactivity* the
   product needs, whether content is mostly static, whether there's a
   real backend, team familiarity, and hiring reality.
2. **Climb the overkill ladder from the bottom.** Start at the simplest
   option that could work and only step up when a requirement forces it:

   | Step | Reach for | Forced up when… |
   |---|---|---|
   | Static content | Plain HTML/CSS or **Astro** | You need islands of interactivity |
   | Content + islands | **Astro** (+ any island framework) | Interactivity is the product, not the garnish |
   | Server-rendered app, modest interactivity | **htmx** on any backend, or **SvelteKit** | Heavy client state, offline, real-time collaboration |
   | Full interactive app | **SvelteKit** / **Nuxt** / **Next.js** — pick by team | Extreme update-rate UIs (dashboards, editors) |
   | Update-rate-critical | **SolidStart** | Large-org governance needs |
   | Enterprise, large teams, long-lived | **Angular** or **Next.js** | — |

3. **Name the trade-off explicitly.** Every recommendation states what
   is being given up (ecosystem size, hiring pool, AI-assistant
   familiarity, performance headroom) — a choice with no stated cost is
   marketing.
4. **Record it.** The choice becomes a `decision` (ADR) block with the
   rejected alternatives and reversal conditions, and updates
   `tech_stack`. A framework choice that isn't in the graph will be
   silently re-made by the next AI session.

## Grounding (checked August 2026)

From the State of JS 2025 survey (13k responses): React ~85% usage but
its lowest-ever satisfaction (~72%); Svelte ~91% retention ("would use
again"), Solid ~89% satisfaction at ~10% usage; htmx the "most admired"
among its users. Practical benchmark spread: Svelte/Solid runtime
bundles ~15–20 kB; SvelteKit bundles typically 20–30% smaller than
Next.js for equivalent apps; Astro static pages commonly ship near-zero
JS with LCP 40–70% lower than SSG-optimised Next.js. The honest
headline from every serious comparison: **for ~90% of projects any
modern framework works — choose by team fit; performance only decides
when it is the differentiator.**

Re-verify these numbers yearly (State of JS, framework release notes)
— this file states its check date so staleness is visible.

## Per-framework references

One file per framework, each with: sweet spot, pros, cons, overkill
signals, and the build-health checks to run. Some also carry a labelled
"Building UI with EpicContext on this stack" section — the stack-specific
how-to behind the stack-neutral rules in `epicontext-frontend`.

- `references/react-nextjs.md`
- `references/vue-nuxt.md`
- `references/svelte-sveltekit.md`
- `references/astro.md`
- `references/solid.md`
- `references/angular.md`
- `references/htmx-server-rendered.md`

## Build-health checks (framework-agnostic core)

Whatever the framework, these run in CI and locally; each reference
file adds the framework-specific analyzer.

```bash
# Lighthouse CI: collect → assert against budgets → fail the build.
npx lhci autorun            # lighthouserc.js: minScore 0.9 on performance

# Bundle budget as a hard limit, not a dashboard.
npx size-limit              # e.g. "200 kB gzip" on client JS entrypoints
```

Budgets are the enforcement layer — a performance culture without a
failing build is a suggestion. Set them at adoption time, when the
numbers are good, so regression is visible the week it happens.

## Anti-patterns to refuse

- **"We might need it later."** Choose for the product in the graph,
  not a hypothetical scale-up. Migration costs are real but so is
  carrying a meta-framework for a brochure site for three years.
- **Framework-hopping for satisfaction scores.** High retention among
  self-selected users is not a reason to migrate a working product.
- **Choosing against the team.** A technically superior framework the
  team doesn't know loses months; say so in the trade-offs.
- **Recommending without a check.** Every recommendation names the
  budget numbers the choice must hold (LCP, bundle size) — the check is
  part of the advice.

## Backend note

The same method applies to backend selection but the space is far
larger; a backend equivalent of this skill is deliberately deferred.
Until it exists, record backend choices as ADRs with the same
trade-off discipline and lean on `epicontext-backend` for the
implementation guidance.
