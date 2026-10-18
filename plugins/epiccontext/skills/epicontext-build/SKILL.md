---
name: epicontext-build
description: "Use for the Build group of an Epic Context graph: design system, design tokens, tech stack, architecture, infrastructure, deployment, ADRs / decision records, legal, compliance, privacy, GDPR. Use when populating these from the repo or from decisions, ingesting stack, architecture or compliance material, or auditing documented build context against what is actually deployed."
metadata:
  epic.requires: "api_endpoint,api_spec,architecture_diagram,budget,constraint,data_model,data_schema,decision,dev_setup,integration,legal_document,running_costs,tech_stack,testing_strategy"
  epic.version: "1.0.0"
  epic.contenthash: "1ac3990ceddf138a"
---

# Epic Context — Build Group

Populate, maintain, and analyze the Build group: design system, tech stack, architecture, infrastructure, ADRs, and legal/compliance. Build answers *how the project actually works* — the technical and structural reality underneath what users experience.

This skill does two kinds of work:
- **Populate** entities from technical decisions, design system docs, infrastructure config
- **Analyze** existing context to find drift, summarize for an audience, recommend action

## When to use this skill

**Populating:**
- Scaffolding a new project's Build layer at kickoff
- Adding or updating design system, tech stack, architecture, infrastructure, ADRs, legal
- Capturing a decision before it becomes folklore ("why did we pick X?")

**Analyzing:**
- Auditing whether documented architecture matches deployed reality (drift)
- Reconciling design system documentation with code
- Summarizing build context for handoff or audit
- Evaluating proposed changes against existing decisions (should this become a new ADR?)

**Reviewing:**
- Pre-handoff: is everything captured?
- Post-incident: do we have an ADR for the decision that led here?
- Annual: does legal/compliance reflect current law?

## Core principle

**Scaffold first, never block.** Every project starts with all build entities scaffolded as stubs with placeholder defaults — a component-hierarchy and token-flow skeleton for Design System, one common web stack named as a placeholder in Tech Stack, a simple monolith for Architecture, project-type templates for Legal. Those placeholders are not a recommendation: replace them with what the project actually uses, whatever the stack. The skill's job is to populate; specialization is the work of building. **Stub is the floor, not the finish line:** the moment you have evidence — the repo, real research, the existing graph — fill the node to `drafted` in the same pass instead of leaving its scaffold placeholder, and run the proactive context pass (`epicontext-fill`) rather than waiting to be asked node-by-node. (For Build especially: most of this is sitting in the repo right now — `package.json`, the route tree, migrations, deploy config — so mine it, don't ask for it.)

Once scaffolded, build context drifts faster than any other group. Code changes, infrastructure shifts, decisions get made in Slack. The graph's job is to capture *what's actually true now*, not what was true at project start. ADRs are the antidote to "why did we do it this way" amnesia. Legal entries need review dates because law changes.

**Design System note**: tokens come from the project's own token source (a theme file, CSS variables, a tokens JSON, a native theme — whatever its stack uses), as recorded in its `design_system` and `tech_stack` blocks. Every UI surface has a `component_spec` block with a live `preview_url` — an absolute public URL that renders the real component (ADR-045). An existing Storybook is a valid preview source under the same rules (public, absolute story-iframe URLs), but it is not required. The scaffolded `design_system` block (block type `storybook_link`) is a pointer — the URL of the project's live component catalogue — plus a markdown body capturing the *why* (philosophy, coverage, accessibility commitments, when to bend the rules) that the code doesn't carry. The block editor shows that URL as an iframe next to the markdown. See `references/entities/design-system.md` for the full contract — it includes the "Why this rule isn't aesthetic preference" section with productivity numbers, defect-density research, and stakeholder framing (the evidence is general design-system rationale, not tied to any specific block-type implementation). The underlying evidence entries are EVD-BLD-014–018 in `references/evidence.md`.


**Three modes of work this skill supports:**
1. **Scaffold** — stub all entities at project kickoff from sensible defaults.
2. **Specialize** — upgrade stubs to drafted/validated as decisions, research, and production use accumulate.
3. **Analyze** — use the populated, linked graph to find tensions across groups, classify problems vs accepted trade-offs, and recommend action with explicit reasoning. For cross-group analysis, see `../ANALYSIS.md`. For build-specific flows, see `references/analysis-flows.md`.

## The seven entities

| Entity | Purpose | Reference file |
|--------|---------|----------------|
| Design System | Tokens, components, design source of truth | `references/entities/design-system.md` |
| Tech Stack | Languages, frameworks, libraries — and the project's commitments to how they're used (performance budget, accessibility level, API contracts, auth layers, error shape, anti-patterns) | `references/entities/tech-stack.md` |
| Architecture | How services and components fit together | `references/entities/architecture.md` |
| Infrastructure | Where it runs, how it's operated | `references/entities/infrastructure.md` |
| ADR | Architecture/product decisions with rationale | `references/entities/adr.md` |
| Legal | Compliance, privacy, regulatory | `references/entities/legal.md` |
| Finance | What the product costs to run, and the budgets it's measured against | Own skill: `epicontext-finance` |

**Read the relevant reference file before producing any entity.**

> **On project commitments:** what code is built with (frameworks, DB, libraries) AND how it's built (performance budget, accessibility commitment, API contracts, auth model, anti-patterns) both live in `tech-stack.md`. The narrative version of "how" lives there as the `project_commitments` block; the rationale for major commitment decisions lives in ADRs. Public skills (Vercel, Anthropic, Supabase, W3C) are the authoritative source for the underlying practice — `tech-stack.md` references them rather than restating them.

## How the entities connect

```
design_system ──► component (Product group)
        │              │
        │              ▼
        │          ia_node (Product group)
        │
        ▼
   tech_stack ──► architecture ──► infrastructure
       │                │              │
       │                ▼              │
       └──────────► adr ◄──────────────┘
                    │
                    └──► (any decision touching tech)

legal ──► (cross-cuts everywhere — privacy in product, compliance in infrastructure, etc.)

tech_stack ──┐
             ├──► finance (running cost of the thing that was built)
infrastructure ┘
```

Read this as: **design system is upstream of component**. Components in Product group reference design tokens here. **Tech stack** captures both the choices (frameworks, DB, libraries) and the project's commitments for *how* they're used (performance budget, accessibility commitment, API contracts, auth model, anti-patterns). Architecture builds on stack choices; architecture lives in infrastructure; major decisions get ADRs. Legal cross-cuts everything.

## Order to populate for a new project

1. **Tech stack** — what's chosen at project start
2. **Infrastructure** — how it's deployed
3. **Architecture** — how the pieces fit
4. **Design system** — start from the foundation the project already uses (its component library or CSS approach, or the scaffold placeholder) and specialize
5. **Frontend craft** — once the stack and design system exist, capture the patterns and commitments (performance budget, accessibility level, anti-patterns)
6. **Backend craft** — once architecture exists, capture API approach, data layer, auth model, error semantics
7. **ADRs** — captured as decisions are made (don't pre-populate)
8. **Legal** — start of project for applicable regulations; update as scope changes
9. **Finance** — line items from the stack and deploy config at kickoff; figures once the first invoice arrives (see `epicontext-finance`)

For an existing project:
- Reverse-engineer current state for tech stack, architecture, infrastructure
- Frontend/backend craft entities are usually drift-prone — they're often where folklore accumulates ("we don't use the shared button for X because…"); capture the anti-patterns explicitly
- ADRs are usually missing; capture going forward, optionally backfill major past decisions
- Legal often partially exists; audit completeness

## Maturity expectations

| Entity | Stub | Drafted | Validated |
|--------|------|---------|-----------|
| Design System | Scaffold placeholder or the foundation's defaults | Specialized for brand, documented | Used consistently; changes propagate cleanly |
| Tech Stack | Listed languages/frameworks | Versions, rationale, dependencies mapped | Stable, current, with upgrade paths planned |
| Architecture | High-level diagram | Detailed with service boundaries, data flow | Reflects production; deployed and stable |
| Infrastructure | Provider listed | Full stack with monitoring, environments | Runs reliably; observability in place |
| Frontend Craft | Approach named | Component architecture + state strategy + performance budget with numbers + accessibility level + anti-patterns | Performance budget met; accessibility audit passed; patterns followed across codebase |
| Backend Craft | Approach named | API contract + data layer + auth (multi-layer) + error semantics + validation + operational hygiene + anti-patterns | Patterns consistent; errors uniform; auth audited; load-tested |
| ADR | Decision recorded | Full ADR template with context, alternatives, consequences | Decision held up over time; no surprise reversals |
| Legal | Required regulations identified | Specific obligations documented per regulation | Reviewed by counsel; current with law |
| Finance | Structure in place, figures blank | Every line named with provider + real figure, charted, linked to the system producing it | Reconciled against invoices, with a named owner |

## Analyzing context — finding the problem

Use the three flows in `references/analysis-flows.md`.

**Diagnose** — common Build diagnoses:
- Documentation-reality drift (docs say X, code does Y)
- Design system not used (custom components everywhere instead of system components)
- Performance budget exceeded (`tech-stack` (project_commitments) says <2.5s LCP; production is 4.0s)
- Accessibility regression (`tech-stack` (project_commitments) commits to WCAG AA; audit finds violations)
- API contract drift (`tech-stack` (project_commitments) says one shape; clients see another — Hyrum's Law in action)
- Auth model has a single layer (`tech-stack` (project_commitments) requires defense in depth; one of three layers is missing)
- Decisions made without ADRs (folklore accumulating)
- Infrastructure scaling assumptions that no longer hold
- Legal entries past review date
- Cost rising with no line item to attribute it to (see `epicontext-finance`)

**Summarize** — three formats. For Build, the team format often goes to engineering specifically.

**Recommend action** — recommend ONE action, name tradeoffs. Build recommendations have ripple effects (changing the stack touches everything); calibrate for that.

## When you need to make a build decision

`references/decisions/`:
- `decisions/needs-an-adr.md` — when a decision is significant enough to formalize
- `decisions/upgrade-vs-stay.md` — version upgrades, framework changes
- `decisions/in-graph-or-in-code.md` — what belongs in design system entity vs. just in code

## When you need a worked example

`references/examples/`:
- `examples/adr-template.md` — canonical ADR with all sections
- `examples/design-system-with-tokens.md` — design system entity with specialization shown

## When you need to defend a claim with evidence

`references/evidence.md` — fewer entries than other groups (Build is more practitioner than research) but real sources where they exist. The design-system-as-SSOT rule is backed by EVD-BLD-014 (Smashing Magazine ROI meta-analysis), EVD-BLD-015 (IBM Carbon), EVD-BLD-016 (Salesforce Lightning), EVD-BLD-017 (component reuse defect density), and EVD-BLD-018 (cost of NOT having a system) — pull from these when the rule is questioned or when making the case to stakeholders.

## The discipline contract

Every entity in this group at maturity ≥ `drafted` must pass the six
norms in `epicontext-core/references/discipline.md` — MECE,
answer-first, evidence-aware, assumption-conscious, executive-
readable, specific-enough. Especially relevant for Build: an ADR
that doesn't open with the Decision in sentence one (after the new
decision-memo scaffold) is failing answer-first; a tech-stack choice
without cited justification is failing evidence-aware; an
architecture diagram without a reversal condition for the
load-bearing choice is failing specific-enough.

## Anti-patterns to refuse

**Populating anti-patterns:**
- Tech stack as a list without versions or rationale
- Architecture diagram with no data flow
- ADR without alternatives considered
- Legal entries copy-pasted from templates without project-specific tailoring

**Analysis anti-patterns:**
- Documentation review without checking code
- "We need a rewrite" without diagnosing whether current architecture is the real problem
- Legal recommendations without legal counsel review

When refusing, offer the honest version. Example: "I can list the stack, but versions and rationale are needed for it to be drafted — without rationale, future contributors won't know why we chose this and may swap it for the wrong reason."

## Output format

YAML structures defined in entity references. Always include:
- `maturity` field
- `last_reviewed` (Build entities go stale fast)
- Linkage to other Build entities and to Product group where applicable

## When this skill ends

Skill ends when entity is produced. If touching Product (component-design system relationship), Performance (infra-monitoring), or Strategy (build-vs-buy decisions), surface the need without expanding scope.

## Improve this skill (self-improvement loop)

If you hit confusion, a missing example, missing evidence, a new
pattern that's not yet covered, the schema gatekeeper rejects
something you wrote, **or you encounter project data or a cited
source that would strengthen the evidence library** — don't just
power through. Call `propose_skill_delta` so the admin can review
and (if useful) accept it. Accepting alone changes nothing — once the
admin also commits it, `get_skill` serves it as an overlay on this file.

See `epicontext-core` for the full friction → delta pattern and how
to format the proposal.
