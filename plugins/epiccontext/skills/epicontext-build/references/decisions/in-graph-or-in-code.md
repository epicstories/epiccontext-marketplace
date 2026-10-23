# Decision Tree: In the graph, or in the code?

What belongs in the design system entity vs. living only in code? What belongs in architecture entity vs. only in diagrams? The general rule: graph captures structure and rationale; code holds implementation.

## Start here

**For the candidate item, ask:**

```
├─ Is it a design or architectural decision (the "why")?
│   → In the graph
│
├─ Is it an implementation detail (the "how")?
│   → In the code only
│
├─ Is it both? (e.g., a token used in code + has rationale)
│   → Both: rationale in graph, value in code, with link
│
└─ Is it volatile (changes weekly)?
    → Code only; graph captures patterns, not specifics
```

## In the graph (structure + rationale)

- Foundation choices ("we use shadcn") — design system entity
- Token taxonomy ("we have primary, accent, neutral scales") — design system entity
- Component inventory ("Button is a system primitive; TherapistCard is a domain component") — design system entity
- Major architecture patterns ("monolith, single Next.js app") — architecture entity
- Trust boundaries ("RLS for customer access, role-based for admin") — architecture entity
- Service boundaries — architecture entity
- Provider choices ("Supabase, Vercel, Mollie") — infrastructure entity
- Decisions with rationale — ADR entity

## In code only

- Exact RGB values (the graph names the token; code holds the value)
- Specific component implementations (React, Vue, Svelte, native views, …)
- Database table definitions and migrations
- API route handlers
- CSS class definitions
- Vercel deployment config files
- Environment variables (the graph notes that secrets exist; values stay in env)
- Specific Mollie API integration code

## In both, with cross-reference

- Design tokens (graph: name + rationale; code: value)
- Components (graph: inventory + status; code: implementation)
- Architecture diagram (graph: structure description; diagram tool: visual)

The cross-reference matters: the graph entity should point to the code location, and code should be discoverable from the graph.

## Volatile content stays in code

- Specific bug-fix commits don't need graph entries
- Routine refactors don't need graph entries
- Day-to-day code changes don't need graph entries
- Style preferences (linting rules) live in linting config, not graph

The graph captures patterns and decisions; daily code work is below the graph's resolution.

## What about everything in between?

Some patterns aren't quite "decisions" but are worth capturing:

**Coding conventions** — usually a style guide doc, not a graph entity. Reference from the graph if needed.

**API contracts** — typically lives in OpenAPI specs or generated docs. The graph might reference, not duplicate.

**Database schema** — lives in migrations. The graph might describe major tables and relationships at the architecture level.

**Test strategy** — captured in a docs/testing.md or similar. Graph might note "we use Vitest + Playwright" in tech stack.

The principle: **the graph is for cross-team / cross-time coordination**. Things that only need to be known by one team or at one time don't belong in the graph.

## Common failure modes this tree prevents

- **Graph as documentation graveyard** — every detail copied into the graph; nobody can find anything
- **Graph as aspirational doc** — describes intended state; code shows different reality; confusion
- **Code without rationale** — works correctly; nobody knows why; reverted on whim
- **Documentation duplicates code** — values copied into docs; drift inevitable
- **Decisions captured nowhere** — folklore accumulates

## Quick guide

| Item | Where |
|------|-------|
| "We chose Supabase" + rationale | Graph (ADR + infrastructure) |
| Supabase connection string | Code (env var) |
| "Primary color is brand teal" + rationale | Graph (design system) |
| Hex value `#2A8B9C` | Code (token file) |
| "Architecture is monolith" + rationale | Graph (architecture) |
| API route handler implementation | Code |
| "Customer access via RLS" + rationale | Graph (architecture) |
| Specific RLS policy SQL | Code (migration) |
| Daily commits | Git, not graph |

## Sources

- General software architecture principles
- C4 Model — abstraction levels guide what belongs at each layer
- Practitioner experience with documentation drift
