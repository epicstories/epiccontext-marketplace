# Architecture

How the system actually fits together — explained as **a sequence of small, captioned diagrams that a non-backend reader can follow.** Architecture is the answer to "what happens when X?" — and crucially, "where does each thing live, who owns it, and how do the pieces talk?" — at a level a designer, founder, or stakeholder could follow without a CS degree.

A real architecture block isn't one big topology dump. It's **multiple small diagrams**, each answering one question, each captioned, each with a one-paragraph narration explaining what the reader just saw and what comes next.

## The visual format — `~~~flow` YAML, NOT mermaid

EpicContext renders architecture diagrams from an **in-house `~~~flow` YAML format**: the book draws it as a server-rendered SVG with role-coloured nodes, and the editor shows it as an interactive diagram. **Mermaid is not enabled.** Writing `~~~mermaid` produces a raw code block, not a rendered diagram.

The flow format gives each node a **role** that picks colour + shape:

| Role | Colour / Shape | Use for |
|---|---|---|
| `person` | sky pill | a human (user, designer, stakeholder, on-call engineer) |
| `system` | violet rect | the system being described, or a major subsystem |
| `db` | sky cylinder | a database, blob store, queue |
| `container` | rose rect | a deployable unit (app, service, function) |
| `component` | lime rect | a module inside a container |
| `external` | stone rect | a third-party service / SaaS dependency |
| `process` | stone rect (default) | a generic step in a flow |
| `decision` | amber diamond | a branch / conditional |
| `start` / `end` | lime / rose pill | flow boundaries |

Use them deliberately. A diagram where everything is `process` is a wall of grey rectangles; a diagram where the user is `person`, the DB is `db`, and the third-party is `external` reads at a glance.

**Minimal flow example:**

````
~~~flow
title: Placing an order
direction: LR
nodes:
  - { id: user, label: "Customer", role: person }
  - { id: app, label: "Web app", sub: "checkout", role: container }
  - { id: pay, label: "Payment provider", role: external }
  - { id: db, label: "Orders DB", role: db }
edges:
  - { from: user, to: app, label: "submits order" }
  - { from: app, to: pay, label: "charges card" }
  - { from: app, to: db, label: "writes order" }
~~~
````

Author with `~~~flow` (tilde fences). Triple-backtick `\`\`\`flow` also works.

## Why most architecture blocks are too thin for non-tech readers

The classic failure: one big topology diagram with five boxes labelled "Frontend", "API", "Database", and four arrows. That tells a backend engineer where things are, but the designer / founder / stakeholder reading it still doesn't understand:
- **What each box is responsible for** (and what it is NOT)
- **Which path data takes** when the user does X (and X is named, not abstract)
- **Where the people are** in the picture (where does the stakeholder fit? the AI agent? the on-call?)
- **What changes when** they push a button vs. when an automated job or AI agent writes vs. when an admin intervenes
- **How the non-request parts work** — background jobs, integrations, the AI or agent layer if there is one

A drafted architecture block has **at least 5 small diagrams** (not one big one), each:
- **Captioned** with the concrete question it answers ("what happens when a user places an order?")
- **Annotated** before AND after with a one-paragraph narration walking the reader through
- **Role-coloured** so the reader sees at a glance who's a person, what's a DB, what's external
- **Zoomed to one concept** — never trying to show everything at once

## The depth bar

| Diagram | Stub looks like | Drafted looks like |
|---|---|---|
| **System context** ("who's involved + what services we depend on") | one box labelled "Web app" | named people (customer, admin, support, on-call) + named third-party services (payment provider, email, hosting, auth) + the system itself — each with the right role colour, each edge labelled with the operation |
| **The data model** ("how the domain concepts map to storage") | absent | the core domain concepts → the tables / collections / documents that hold them → who owns each — at a conceptual level, captioned with the rule ("every order belongs to exactly one account"), not a schema dump |
| **Write path** ("what happens when someone makes a change") | absent | actor → entry point (form, API, job) → validation → authorization → storage → side effects (events, emails, cache invalidation). Every branch named (e.g. validated vs rejected, sync vs queued). |
| **Read path** ("what happens when the UI renders") | absent | client → rendering layer (server, edge, or client) → cache → data store → response |
| **The automation / AI layer** (if the project has one) | absent | agents, background jobs, scheduled tasks, integrations — what triggers them, what they may read and write, and where a human can see or undo what they did |
| **Build variants** (if one codebase produces several builds) | absent | single codebase → flag or config → each build → who gets which |
| **Deployment topology** ("where each thing physically runs") | absent | regions or hosts named, latency budget, the deploy flow from merge to production |
| **Failure modes** | absent | per-dependency: what happens when it's down, what the fallback is |
| **Critical invariants** | absent | the 3–5 things that must always be true (e.g. "no write reaches the database without passing validation") |

## The pedagogical pattern — narration around every diagram

Every diagram has THREE parts, in this order:

1. **`### A specific question as the heading`** — not "Container view" but "How does an AI change reach the database?"
2. **One-paragraph setup** — what the reader is about to see, and which people are in the picture. Mention the role colours so they're not a mystery.
3. **The diagram** (`~~~flow` YAML block).
4. **One-paragraph narration** — what just happened, in plain words. "When a customer submits the form, it goes here first…"

The narration is what makes architecture readable for non-tech folks. Without it, the diagram is decoration.

## The depth checklist (run BEFORE writing the block)

1. **≥5 distinct diagrams** — each answering one named question.
2. **Every diagram has a caption + setup + narration** (the three-part pattern above).
3. **Role colours used deliberately** — `person` for people, `db` for databases, `external` for third-party.
4. **At least one diagram includes a person** (end-user, admin, stakeholder, AI agent, on-call). Architecture without people in the picture is dehumanised.
5. **The automation / AI layer is drawn** if the project has one (agents, jobs, integrations) — not just the request/response side.
6. **At least one diagram shows the data model** at a conceptual level (domain concepts → storage), not a schema dump.
7. **At least one diagram shows a write flow** that names its branches (validated vs rejected, sync vs queued, …).
8. **Build variants are drawn** if one codebase produces several builds.
9. **Deployment topology** named (regions + latency budget + deploy flow).
10. **Failure modes + invariants** stated in prose after the diagrams.
11. **Linked tech_stack + infrastructure + ≥2 ADRs.**

## Push-back prompts (run AFTER drafting, as a critic pass)

- **"Is every diagram captioned with a question?"** "Container view" isn't a question. "How does the same codebase produce two builds?" is.
- **"Could a non-backend reader follow each diagram?"** Show your draft to a designer-mind. If they can't predict what happens when X, the narration is missing.
- **"Are there people in the diagrams?"** No `person` role in any diagram = the system is described as if it runs by itself. Add the user, the admin, the on-call — and the AI agent if one acts on the system.
- **"Did I use role colours, or is everything grey?"** Every-node-is-`process` = a wall of grey boxes. Re-role nodes deliberately.
- **"Is the automation / AI side visible?"** Most architectures forget jobs, integrations and agents. If something writes without a user clicking a button, draw it.
- **"Did I write mermaid by mistake?"** `mermaid` fences DO NOT render in EpicContext — they show as raw code blocks. Use `~~~flow` YAML instead.
- **"Is each diagram zoomed to one concept?"** A diagram that tries to show the request flow AND the job queue AND the deployment is unreadable. Split it.
- **"Did I show the WRITE path, or only read?"** Most blocks only describe reads. The write path (especially with automation in the loop) is usually where the interesting decisions live.
- **"What happens at 3am on Sunday when [X] is down?"** If you can't answer per dependency, the failure-modes section is incomplete.

## Evidence pool — where to mine

All of these are in the project's own repo:

- **The top-level folder structure** (apps, packages, services, source folders) — names the containers and components.
- **The auth and routing boundary** — middleware, route guards, API gateway config.
- **Migrations, schema files, access policies** — define the data model and the trust boundary.
- **The handlers that write** (API routes, controllers, mutations, job workers) — the write path.
- **The data-loading layer** — the read path and its caching.
- **Deploy config** (container files, CI workflows, hosting config) — the deployment topology.
- **Linked ADRs** — every architectural choice should have a corresponding ADR.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Empty `diagram: { nodes: [], edges: [] }` or a placeholder system-context diagram only. |
| **drafted** | ≥5 captioned + narrated `~~~flow` diagrams (system context + data model + write path + read path + at least one more). ≥800 words across narration + sections. Linked tech_stack + infrastructure + ≥2 ADRs. At least one diagram contains a `person` node. |
| **validated** | Drafted + every diagram exercised by a real demo (reader could follow it without you in the room) + all invariants have a drift-detection check or test. |

## Push-back lines to use on yourself (or to surface to the user)

- *"You wrote one big container diagram. A non-tech reader has no entry point. Split it into 5 small ones, each answering a single question."*
- *"None of your diagrams have a `person` node. The system reads as if nobody uses it. Add the user, the admin, the on-call."*
- *"Every node in your diagram is `role: process`. That's a wall of grey. Re-role them by what they are — `person`, `db`, `external`, `container`."*
- *"Your background jobs aren't drawn. Readers ask 'what changes things when nobody is clicking?' — that's a diagram, not a paragraph."*
- *"You wrote `~~~mermaid` — those don't render in EpicContext. Convert to `~~~flow` YAML."*
- *"There's no narration between diagrams. The reader sees boxes then more boxes. Add the one-paragraph 'what just happened' between every diagram."*

## Anti-patterns to refuse

- **The poster diagram.** One pretty diagram with five boxes, no captions, no narration. Refuse — force the 5-diagram, captioned, narrated pattern.
- **The arrow soup.** Lots of unlabelled edges. Force operation names on every edge.
- **The peopleless architecture.** No `person` nodes anywhere. The system has users, an AI, stakeholders — show them.
- **The wall of grey.** Every node `role: process`. Force deliberate role assignment.
- **The mermaid-by-mistake.** `~~~mermaid` blocks. Refuse and convert to `~~~flow`.
- **The missing-write-path.** Only read flows. Force the write path (especially with automation).
- **The automation-blind block.** Architecture that ignores jobs, integrations and agents that write. Force a diagram for them.

## Output schema (markdown body)

Each section is a question — the heading IS the question.

```
### Who's involved — system context

[one-paragraph setup]
~~~flow
title: System context
direction: LR
nodes: …
edges: …
~~~
[one-paragraph narration: what just happened]

### How the domain maps to storage — the data model

[setup]
~~~flow
title: Domain model → storage
direction: LR
…
~~~
[narration]

### What happens when someone makes a change — the write path

[setup]
~~~flow
title: Write path
…
~~~
[narration — explain each branch]

### What happens when the UI renders — the read path

…

### What runs without a user clicking — jobs, integrations, agents (if any)

…

### How one codebase produces each build (if it does)

…

### Where each piece physically runs — deployment topology

[prose: regions, latency, deploy flow]

### What happens when things break — failure modes per dependency

[prose]

### What must always be true — critical invariants

[bullets]
```

## Required connections (graph-level)

A drafted `architecture_diagram` block must:

- Link **tech_stack** (the components used).
- Link **infrastructure** (the deployment surface).
- Link **≥2 decisions (ADRs)** for the major architectural choices.
- Be referenced *by* the **product_overview** capability map (the architecture realises the capabilities).

An architecture with no tech_stack link is floating in the air. An architecture with no ADR links is undocumented. **An architecture with no `person` nodes is dehumanised** — readers can't see themselves in it.
