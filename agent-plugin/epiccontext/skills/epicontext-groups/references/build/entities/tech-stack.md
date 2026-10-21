# Tech Stack

The languages, frameworks, libraries, and tools the project is actually built with — **with the rationale behind each choice and the named alternatives that were declined.** Stack choices have long tails: a wrong default decided in week one shapes the next two years. A tech_stack block that just lists technologies is a `package.json` paraphrase. A real one explains *why this combination, why not the alternatives, and what would change our mind.*

## Why most tech_stack blocks are too thin

A common failure mode: "Frontend: Next.js. Backend: Supabase. Database: Postgres." That's not a tech stack — that's a name-drop. It tells a new contributor what's installed but not:
- **Which versions** are pinned and why
- **What alternatives** were considered and why declined
- **Where the boundaries** are (what each piece owns vs. references)
- **Upgrade paths** and what would force a rewrite
- **Operational cost** of each choice (LLM API spend, DB scale ceilings, vendor lock-in)

A drafted tech_stack reads like a senior engineer's "what would I tell my replacement" doc, not a feature checklist.

## The depth bar

The "drafted" column below is one worked example — a TypeScript web app on Next.js + Supabase + Vercel — chosen only because it is concrete. Apply the same depth to whatever the project runs on (Vue, Svelte, Astro, Rails, Django, plain HTML, native iOS/Android, …).

| Section | Stub looks like | Drafted looks like |
|---|---|---|
| Languages & runtime | "TypeScript." | TypeScript 5.x strict, Node 20 LTS (pinned in `package.json#engines`), why TS strict and not lenient, why this runtime and not Bun/Deno. |
| Frontend framework | "Next.js." | Next.js 14 App Router (React Server Components-first), explicit non-goals (no Pages Router, no `getServerSideProps`), rendering strategy (SSR vs. RSC vs. ISR per route family). |
| Backend / API | "Supabase." | Supabase Postgres + Auth + Realtime + Storage; Next.js API routes for app-specific logic; RLS strategy; what lives in DB vs. edge functions vs. Next routes. |
| Database | "Postgres." | Supabase-managed Postgres N.x, named extensions (`pg_graphql`, `vector`, …), RLS philosophy, migration tool, backup cadence. |
| Major dependencies | "shadcn, Tailwind." | shadcn/ui (copy-paste, not npm), Tailwind 4.x, a markdown renderer for user content — **named with reason: copy-paste components keep the component surface owned, not vendored.** |
| AI / LLM layer | "Claude." | Provider SDK, model defaults per job (a large model for heavy extraction, a small one for cheap classification), prompt-caching strategy, $/request budget. |
| Hosting / deploy | "Vercel." | Vercel for app + edge, Supabase for DB+Auth, GitHub Actions for CI; deploy flow (merge to `main` → build → production in ~60s); preview-per-PR. |
| Alternatives declined | absent | At least 3 named alternatives that were evaluated and declined, with one-line *why not* (Firebase: vendor lock-in deeper than Supabase; Pages Router: RSC was the bet; Bun: too new for the Supabase client). |
| Upgrade & sunset policy | absent | Major version cadence, what triggers an upgrade, named EOL dates that matter (Node LTS schedule, Supabase deprecations). |
| Cost shape | absent | Variable vs. structural cost direction. Where the spend scales (LLM calls, DB rows, edge bandwidth). |

## The depth checklist (run BEFORE writing the block)

0. **At least 2 small `~~~flow` diagrams** — stack layers (user → frontend → API → DB → external) AND major-dependency map. Captioned + narrated. Role-coloured. See the "Small visuals" section below.
1. **Versions pinned for every load-bearing piece.** Not "[framework]" — "[framework] 14.x ([mode])".
2. **Reason for each major choice — one sentence each.** No reason = no choice, just a default.
3. **At least 3 named declined alternatives**, each with one-line *why not*.
4. **The boundary story.** What does each piece *own* (state, logic, data)? What does it *reference* (other services)?
5. **The security model.** Where does auth happen? Where do permission checks live?
6. **The deploy flow.** How does code reach users? Branch model, CI gates, rollback path.
7. **The LLM / AI dependency surface.** Which models, which budget, what falls back to what?
8. **Linked ADRs.** Major choices should have an ADR. Link the relevant ones.
9. **Upgrade triggers.** What would force a major migration? (Framework EOL, vendor pricing change, scale wall.)
10. **Cost shape.** Where the bill grows linearly with usage; where it's fixed.

## Push-back prompts (run AFTER drafting, as a critic pass)

- **"Did I name versions or just product names?"** If your stack reads "[framework] + [backend] + [host]" with no versions, it's a logo wall, not a stack.
- **"Have I been honest about lock-in?"** A backend-as-a-service usually hides several vendor-specific surfaces (auth, realtime, storage). Name them; rate the switching cost per surface.
- **"What did I evaluate and decline?"** A stack without declined alternatives reads like the obvious default. Force at least three.
- **"Where's the ADR for the biggest call?"** The single biggest decision in the stack (framework, DB, LLM provider) deserves its own ADR. Link it. If it doesn't exist, that's the next thing to write.
- **"What's the upgrade path for the framework?"** Every major framework version has a known migration cost. State it for each load-bearing piece.
- **"Where does the cost scale?"** LLM calls, DB rows, edge bandwidth — name the line that grows fastest with usage. If you don't know, that's the next experiment.
- **"Am I sure this belongs in `tech_stack` and not `architecture`?"** Stack = *what we built with*. Architecture = *how the pieces fit together and talk*. If your block is about communication topology, move it.

## Evidence pool — where to mine

All in the project's own repo:

- **The dependency manifest and lockfile** (`package.json` + lockfile, `pyproject.toml`, `Gemfile.lock`, `go.mod`, `Podfile.lock`, `build.gradle`, …) — the ground truth for versions. If they disagree with this block, the block is drift.
- **Runtime pinning** (`.nvmrc`, `engines`, `.tool-versions`, `.python-version`, …).
- **Migrations / schema files** — extensions enabled, access policies declared.
- **Framework and bundler config** — runtime config, edge surfaces.
- **Hosting and CI config** (container files, CI workflows, the host's config file) — deploy settings.
- **Linked ADRs** — every major choice should already have one. If not, write one.
- **The repo README + env example file** — what's expected to exist in the runtime environment.
- **CLAUDE.md / agent instructions**, if present — often holds a curated stack table already.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold placeholder (it names one common web stack — Next.js + Supabase + Vercel — which is a placeholder, not a recommendation), no versions, no alternatives. |
| **drafted** | All 10 checklist items answered. Versions pinned. ≥3 named declined alternatives. ≥1 linked ADR for the biggest choice. **≥2 captioned + narrated `~~~flow` diagrams (stack layers + dependency map).** ≥500 words in body. |
| **validated** | Drafted + every major choice has a linked ADR + cost shape sized with real numbers (€/month per axis) + the deploy flow has been exercised at least once end-to-end. |

## Push-back lines to use on yourself (or to surface to the user)

- *"You wrote the framework's name five times and never said which version. The lookup test fails — a new contributor still doesn't know."*
- *"Your backend-as-a-service isn't one decision; it's several (auth, DB, realtime, storage). Which of those would you fight to keep if you had to rip out the rest?"*
- *"You haven't named what you didn't pick. Each serious alternative was an option — say why each was wrong for *this* project."*
- *"You linked zero ADRs. Either the choices are too small to deserve them (unlikely) or the ADRs are missing. Which is it?"*
- *"Your cost section is empty. The bill from this stack has a shape — name it before someone's surprised by it."*

## Anti-patterns to refuse

- **The logo wall.** A list of product names with no versions, no reason, no alternatives. Refuse and force the why.
- **The hidden-vendor stack.** One platform listed as one item when it's really four surfaces. Force decomposition.
- **The aspirational stack.** Listing libraries the team plans to adopt but hasn't. Mark them as *planned*, not *current*, or drop them.
- **The framework worship.** "[Framework] because it's the best." Force a comparison: best at *what*, vs. *which alternative*, for *which constraint*.
- **The orphan stack.** No ADR links, no architecture link, no infrastructure link. The stack should be one node in a graph — connect it.

## Small visuals — the two diagrams every tech_stack benefits from

A non-tech reader cannot grasp a stack from a list. Two small `~~~flow` YAML diagrams (role-coloured nodes — same format as the architecture block, see `architecture.md` for the role palette) carry most of the explanatory weight. The examples below continue the worked Next.js + Supabase example; use the project's own pieces.

### Diagram 1 — Stack layers (where each piece sits)

A vertical or horizontal layer diagram showing: user → frontend → API/server → DB → external services. Role-coloured so the reader sees at a glance who's a person, what's a DB, what's third-party.

````
~~~flow
title: Stack layers
direction: TB
nodes:
  - { id: user, label: "User browser", role: person }
  - { id: fe, label: "Next.js 14 (App Router)", sub: "RSC + Tailwind + shadcn", role: container }
  - { id: api, label: "API surface", sub: "route handlers + public API", role: container }
  - { id: db, label: "Supabase Postgres", sub: "eu-central-1 + RLS", role: db }
  - { id: llm, label: "LLM provider API", sub: "large + small model", role: external }
edges:
  - { from: user, to: fe, label: "HTTPS" }
  - { from: fe, to: api, label: "fetch / RSC" }
  - { from: api, to: db, label: "SQL via supabase-js" }
  - { from: api, to: llm, label: "ingestion / summaries" }
~~~
````

### Diagram 2 — Major dependency map (what shapes each layer)

Show the load-bearing libraries grouped under the layers they shape. Use `external` for third-party packages, `component` for in-house modules.

````
~~~flow
title: Major dependencies
direction: TB
nodes:
  - { id: ui, label: "UI", role: container }
  - { id: shadcn, label: "shadcn/ui", sub: "copy-paste", role: external }
  - { id: tw, label: "Tailwind CSS", role: external }
  - { id: md, label: "Markdown renderer", role: external }
  - { id: data, label: "Data + auth", role: container }
  - { id: sb, label: "@supabase/ssr + supabase-js", role: external }
  - { id: ai, label: "AI", role: container }
  - { id: anth, label: "LLM provider SDK", role: external }
  - { id: mcp, label: "@modelcontextprotocol/sdk", role: external }
edges:
  - { from: shadcn, to: ui, label: "" }
  - { from: tw, to: ui, label: "" }
  - { from: md, to: ui, label: "" }
  - { from: sb, to: data, label: "" }
  - { from: anth, to: ai, label: "" }
  - { from: mcp, to: ai, label: "" }
~~~
````

Each diagram gets a one-paragraph **setup** before and a one-paragraph **narration** after — name what the reader is about to see, then walk them through what just happened (e.g. "Notice the API surface is one box but actually contains three flavours — that's the next diagram").

**Mermaid is NOT enabled in EpicContext.** Use `~~~flow` tilde fences (triple-backtick `\`\`\`flow` also works). See `architecture.md` for the full role palette.

## Output schema (markdown body)

```
### Stack layers
[setup] / ~~~flow / [narration]

### Major dependencies
[setup] / ~~~flow / [narration]

### Languages & runtime
### Frontend framework
### Backend / API surface
### Database & data layer
### AI / LLM layer
### Hosting & deploy
### Alternatives declined
### Upgrade & sunset policy
### Cost shape
```

## Required connections (graph-level)

A drafted `tech_stack` block must:

- Link at least one **decision (ADR)** for the single biggest stack choice.
- Be referenced *by* the **architecture_diagram** block (the diagram should locate stack components on it).
- Link the **infrastructure** block (deploy surface + hosting + secrets boundary).

A tech_stack with no ADR is a list. A tech_stack with no architecture link is unanchored.
