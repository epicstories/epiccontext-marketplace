# Fill from the repo — never write an empty node

**A create or update whose body is empty (or just the scaffold
placeholder) is not acceptable when the repository already contains the
answer.** When you work on a project that has real code, the codebase is
your primary evidence. Before you write a block, read what the repo
tells you and write it into the `body`. Empty nodes make the human do
the work the AI was supposed to do — and they make the graph look
populated while saying nothing.

This is the difference between *scaffolding* and *populating*. The
scaffold (`scaffold_v3_project`) intentionally creates stub nodes from
generic defaults — that's a starting skeleton, not a finished graph. The
moment you are pointed at a repo, your job is to **turn those stubs into
real, specialized content derived from the code**, and to create any
missing node already filled in. Don't write `New Feature` with an empty
body; write the actual feature, described from the component that
implements it.

## Where to mine each node from the repo

| Node / entity | Read this in the repo | Write into the body |
|---|---|---|
| `tech_stack` | `package.json`, lockfile, framework config, `tsconfig` | actual frameworks, libraries, versions, runtime |
| `architecture_diagram` | top-level dirs, server/client split, data flow, deploy config | a `~~~flow` of the real components and how they connect |
| `infrastructure` | `vercel.json`, `Dockerfile`, CI workflows, `.env.example` | where it runs, build/deploy pipeline, services |
| `data_model` / `data_schema` | migrations, `schema.sql`, ORM models | the real tables/columns/relations |
| `api_endpoint` / `api_spec` | route handlers (`app/api/**`, `routes/**`, controllers) | real paths, methods, params, responses |
| `ia_tree` | the route/page tree (`app/**/page.*`, `src/routes/**`, `pages/**`, router config) | the actual sitemap as a nested list |
| `content_page` | each page component + its copy | what the page is, its route, the copy it renders |
| `feature` | feature folders, components, the code that implements it | what it does, status (`shipped` if it's in `main`), how it works |
| `product_overview` | `README`, docs, the app's own description | what the product is and who it's for |
| `glossary` | domain terms in code/types/comments | term + real definition as used in the code |
| `decision` (ADR) | `docs/adr/**`, `decisions/**`, notable commits, `CLAUDE.md` | the decision, its context and rationale, consequences |
| `legal` | `LICENSE`, privacy/terms pages, compliance config | the actual obligations referenced in the code |

## Rules

1. **Derive, don't stub.** If the repo answers the question, the body
   must contain the answer. Reserve placeholders only for facts the repo
   genuinely doesn't carry.
2. **Promote maturity to match the evidence.** Content derived from
   shipping code reflects the real product — set `maturity: "drafted"`
   (or `validated` if it's proven in production), not the scaffold's
   `stub`. (`origin` flips from `default` to `specialized` on its own
   with any real edit.)
3. **Top up the stubs you find.** When you read a project and see a node
   still at its scaffold default while the repo has the real content,
   write the update in the same pass — don't leave it for a later
   session. A stub next to code that contradicts it is drift.
4. **Keep it current.** When code changes, the matching node's body
   changes in the same effort.
5. **Don't fabricate.** If the repo is silent and filling the field
   would mean inventing, leave it and note the gap. Deriving from
   evidence ≠ guessing.

The connection mandate (`references/links-are-the-brain.md`) and this
content mandate are the two halves of a real node: **a node must be
both wired AND filled.** A connected empty node and a filled orphan
are each only half a block.

## Be proactive — don't wait to be asked node-by-node

`stub` is the **floor**, not the goal. `drafted` is the target. A graph
full of scaffold placeholders is an unfinished graph, even though every
node is technically "filled." When you open a project, don't wait for the
user to point at each thin node — **survey the whole graph and fill
everything the repo and existing graph can answer, in one sweep**, then
hand the user the batch — every write is in the changes feed, revertible. Ask them only for the few facts
that are genuinely unknowable from evidence (the product bet, a real
interview quote), not for everything.

This proactive sweep has its own skill: **`epicontext-fill`** (the context
pass). Reach for it at the start of working a project, whenever the graph
looks thin, or whenever the user says "fill / populate / complete / bring
it to life." The point of Epic Context is that the user sits back and
watches the graph fill itself — that only happens if you initiate.
