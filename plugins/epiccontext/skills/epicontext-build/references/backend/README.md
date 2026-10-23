# Epic Context — Backend

Build server-side code grounded in the project's documented tech stack,
architecture, and infrastructure — all of which live in the graph.

## When to use

- Building an API endpoint
- Writing database migrations or queries
- Implementing auth or authorization
- Wiring an integration (third-party API, queue, webhook)
- Implementing a `feature` block's server-side half

## How to read project context

The graph is the source of truth. Pull from MCP — not from any local
`CONTEXT/` folder, which at most is a read-only projection:

| You need                  | MCP tool                                       |
|---------------------------|------------------------------------------------|
| What stack we run         | `get_v3_entity entity=tech_stack`              |
| System shape              | `get_v3_entity entity=architecture`            |
| Where it deploys          | `get_v3_entity entity=infrastructure`          |
| Past architecture choices | `get_v3_entity entity=decision`                |
| Compliance constraints    | `get_v3_entity entity=legal`                   |
| Feature you're building   | `get_block key=<feature-key>`                  |

For deeper methodology pair with `epicontext-build/SKILL.md`
(decisions / ADRs, tech stack, architecture, infrastructure, legal).

## Backend principles

- **Validate at the boundary.** Every API route validates input with zod
  (or whatever the tech stack mandates) before any business logic.
- **Authenticate everywhere unless explicitly public.** Read the auth
  approach from the `tech_stack` block; follow the same pattern app-wide.
- **Authorize per-resource.** Auth = "who you are"; authz = "can you do
  this with that". Both required.
- **No credentials in code.** Reference env vars only; document them in
  the `infrastructure` block.
- **Match the architecture.** If the architecture block says "JSON-RPC
  over Streamable HTTP", don't introduce a SOAP endpoint.
- **Honor ADRs.** A decision block is binding until superseded by another
  decision block. If you're about to violate one, write the superseding
  ADR first (`create_block` type `decision`, with a `reason`) — it lands
  directly and shows in the changes feed.

## Security checklist (per route)

- Input validated against a schema
- Auth required (or explicit public marker + reason in code)
- Authz check on the target resource
- Rate limiting (if user-callable)
- Error responses don't leak internals
- Idempotent or has explicit retry semantics
- Logged at the right level (no PII in logs)

## When the graph is incomplete

Don't invent architecture. If a tech stack detail or decision is missing:
1. Note the gap.
2. Use `update_block` / `create_block` (via MCP) to add it — usually an
   ADR or a `tech_stack` entry — with a `reason` naming what you read.
   It lands directly and can be reverted from the changes feed.
3. Make a conservative choice in code (the boring, reversible one), and
   leave the block at `maturity: drafted` until someone confirms it.

## Output traceability

```markdown
**Trace:**
- Feature: features/folder-sync
- Tech stack: tech_stack (e.g. "Node + Postgres + Fly.io" — whatever the block records)
- Decision: decisions/use-mcp-streamable-http
- Infrastructure: infrastructure/vercel-prod
- Legal: legal/eu-data-residency  (if relevant)
```

## Anti-patterns to refuse

- Introducing a new dependency without an ADR
- Routes without input validation
- Hardcoded credentials
- Bypassing the documented auth layer
- "Quick fix" that violates an existing ADR
- Asking the user to read `CONTEXT/technical/` — pull from MCP instead
