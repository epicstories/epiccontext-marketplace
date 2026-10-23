# Infrastructure

The **operational reality**: where the system runs, how secrets flow, how it's deployed, what observability exists, what it costs, and what the on-call runbook says. Architecture is the *logical* topology; infrastructure is the *physical and operational* topology beneath it.

A real infrastructure block lets a new on-call engineer answer four questions in under a minute: *where does it run, how do I deploy, where do I look when it breaks, and what does it cost?* If yours can't, it's a stub.

## Why most infrastructure blocks are too thin

The pattern: "Vercel + Supabase. Push to main and it deploys." That's the happy path, not the infrastructure. Missing:
- **Regions** — where in the world, what's the latency budget, where's the disaster-recovery story
- **Secrets management** — where they live, who can read them, rotation cadence
- **CI/CD gates** — what runs before a deploy lands, what blocks it
- **Observability** — logs, metrics, traces, alerts, who gets paged
- **Cost** — current bill, where it scales, where the next cliff is
- **Backup + DR** — what's backed up, how often, how to restore, when last tested
- **The runbook** — top 5 incidents and what to do

A drafted infrastructure block is the **runbook + the spend chart + the deploy contract**, not the stack list.

## The depth bar

The "drafted" column and the diagrams below use one worked example — a web app on Vercel + Supabase — only because it is concrete. Apply the same depth to whatever the project runs on (a VPS with Docker, Kubernetes, a PaaS, app stores for native apps, …).

| Section | Stub looks like | Drafted looks like |
|---|---|---|
| Hosting | "Vercel." | Vercel Pro tier, deployed from `main`, edge functions in `iad1` + `fra1`, build pipeline `next build` with bundle analyzer on PR, preview-per-PR via Vercel GitHub app. |
| Database | "Supabase." | Supabase Pro tier, Postgres N.x in eu-central-1, daily backups (PITR), connection pooling via PgBouncer, named extensions enabled. |
| Auth | "Supabase Auth." | OAuth providers enabled (Google, GitHub), email confirmation flow, session lifetime, RLS strategy summary. |
| Secrets | absent | Where each secret lives (Vercel env, Supabase secrets, GitHub Actions, local `.env`), who has read access, rotation cadence. |
| CI/CD | "Vercel auto-deploy." | Triggers (push to a feature branch, merge to `main`), pipeline gates (typecheck, lint, tests), what blocks a deploy, what rolls back. |
| Observability | absent | Logs (Vercel logs + Supabase logs), metrics (Vercel analytics), traces (if any), error tracking (Sentry / none), alert routing. |
| Cost | absent | Current MRR spend by line (Vercel €X, Supabase €Y, LLM €Z), what scales linearly with usage, where the next cliff is. |
| Backup + DR | absent | What's backed up, retention, restore SLA, when DR was last tested (or "never — open risk"). |
| Runbook | absent | Top 5 likely incidents and the first response for each. Links to detailed playbooks if longer. |
| Compliance posture | absent | What regulatory regimes apply (GDPR, etc.), where audit logs live, data-residency commitments. |

## The depth checklist (run BEFORE writing the block)

1. **Hosting tier + region** named for every runtime.
2. **Database tier + region + backup cadence** named.
3. **Auth surface** described — providers, session, RLS.
4. **Secret inventory** — name + storage location + access list + rotation cadence per secret.
5. **CI/CD pipeline gates** — what runs on PR, what runs on merge, what blocks deploy.
6. **Observability surface** — logs, metrics, traces, errors, who-gets-paged.
7. **Current cost** by line, with growth driver per line.
8. **Backup + DR** including last-tested-date.
9. **Runbook** for top 5 incident types.
10. **Compliance posture** — applicable regimes + audit log location.

## Push-back prompts (run AFTER drafting)

- **"Where in the world?"** "Vercel" without a region is wrong by half. Name the region; name the latency budget to the dominant user base.
- **"Where do secrets actually live?"** If you can't name the storage location + the access list, that's a security finding masquerading as a documentation gap.
- **"When was DR last tested?"** Untested DR is unworking DR. If "never", state it as an open risk.
- **"What blocks a deploy?"** A pipeline with no gates ships any commit. State the gates or admit there aren't any.
- **"Where do you look when it breaks?"** If you can't name the dashboard + log source + alert routing, the on-call is doing forensics every time.
- **"What's the bill?"** A round number with the dominant line item is enough. No number = no cost discipline.
- **"Am I sure this is `infrastructure` and not `architecture`?"** Architecture is logical (what talks to what); infrastructure is operational (where, how much, who gets paged).

## Evidence pool — where to mine

- **The host's config files** (`vercel.json`, `fly.toml`, `docker-compose.yaml`, Helm charts, …) + the host's dashboard.
- **The database / backend config** + its dashboard.
- **CI pipeline definitions** (`.github/workflows/`, `.gitlab-ci.yml`, …).
- **The env example file** + the actual env vars in production — the secret inventory.
- **Every provider's billing page** (hosting, database, LLM, SaaS) — for cost numbers.
- **Linked ADRs** — choice of hosting, choice of DB tier, choice of region.
- **Linked tech_stack** — the components have to run *somewhere*; that's this block.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | `dev_setup` block with generic scaffold prerequisites and no operational detail. |
| **drafted** | All 10 checklist items present. Regions named. Secrets inventory complete. Runbook for ≥3 incidents. Cost numbers present. **≥3 captioned + narrated `~~~flow` diagrams (deployment topology + CI/CD pipeline + secrets flow).** ≥600 words in body. Linked to tech_stack + architecture + ≥1 ADR. |
| **validated** | Drafted + DR last-tested within 6 months + runbook validated against ≥1 actual incident + alerting + cost reviewed in last quarter. |

## Push-back lines to use on yourself (or to surface to the user)

- *"You said 'Vercel' but not where. A region matters — your users in NL are 200ms further from `iad1` than from `fra1`."*
- *"Your secret inventory is missing. That's not a paperwork gap; it's a security finding. Who can read the Supabase service-role key right now?"*
- *"You haven't named what blocks a deploy. If nothing blocks it, a typecheck failure ships to production. State the gates."*
- *"What's the bill? Even '€200/month, mostly Supabase' is more useful than nothing."*
- *"Your runbook is empty. The first 3am incident will cost you the time you didn't spend writing it. Write the top 3."*
- *"You linked zero ADRs. Hosting choice, DB tier, region — all deserve ADRs. Which exist?"*

## Anti-patterns to refuse

- **The happy-path-only.** "Push to main, it deploys." Doesn't say what happens when it doesn't. Force the runbook.
- **The regionless infrastructure.** "Vercel + Supabase" with no region named. Refuse.
- **The secret-free infrastructure.** No secret inventory. That's a security gap, not a doc gap.
- **The unverified DR.** "We have backups." When tested? If never, state it as an open risk.
- **The cost-blind infrastructure.** No spend numbers. The bill is a fact; document it.

## Small visuals — three diagrams every infrastructure block benefits from

A non-tech reader cannot grasp ops from a paragraph. Three small `~~~flow` YAML diagrams (role-coloured nodes — see `architecture.md` for the role palette) carry the explanatory weight.

### Diagram 1 — Deployment topology (where each piece physically runs)

Show regions, deployment targets, the path from user to the system.

````
~~~flow
title: Deployment topology
direction: LR
nodes:
  - { id: user, label: "User (EU)", role: person }
  - { id: cdn, label: "Vercel edge", sub: "iad1 + fra1", role: external }
  - { id: app, label: "Next.js app", sub: "Vercel Pro", role: container }
  - { id: db, label: "Supabase Postgres", sub: "eu-central-1", role: db }
  - { id: llm, label: "Anthropic API", role: external }
edges:
  - { from: user, to: cdn, label: "HTTPS" }
  - { from: cdn, to: app, label: "edge → server" }
  - { from: app, to: db, label: "supabase-js" }
  - { from: app, to: llm, label: "ingestion only" }
~~~
````

### Diagram 2 — CI/CD pipeline (how code reaches production)

Show triggers → gates → deploy → rollback path.

````
~~~flow
title: CI/CD pipeline
direction: LR
nodes:
  - { id: dev, label: "Developer", role: person }
  - { id: push, label: "git push (PR)", role: start }
  - { id: gh, label: "GitHub Actions", sub: "typecheck + lint", role: process }
  - { id: gate, label: "All green?", role: decision }
  - { id: main, label: "merge to main", role: process }
  - { id: vercel, label: "Vercel build", sub: "next build", role: process }
  - { id: live, label: "Production", role: end }
edges:
  - { from: dev, to: push }
  - { from: push, to: gh }
  - { from: gh, to: gate }
  - { from: gate, to: main, label: "yes" }
  - { from: gate, to: dev, label: "no → fix", style: dashed }
  - { from: main, to: vercel, label: "auto-pickup ~60s" }
  - { from: vercel, to: live }
~~~
````

### Diagram 3 — Secrets flow (where each secret lives and who can read it)

Show secret stores + who reads what. Critical for audit posture.

````
~~~flow
title: Secrets flow
direction: TB
nodes:
  - { id: founder, label: "Founder", role: person }
  - { id: vault, label: "1Password vault", role: db }
  - { id: vercel, label: "Vercel env", sub: "prod + preview", role: container }
  - { id: gh, label: "GitHub secrets", role: container }
  - { id: app, label: "Next.js runtime", role: external }
  - { id: actions, label: "GitHub Actions", role: external }
edges:
  - { from: founder, to: vault, label: "writes / rotates" }
  - { from: vault, to: vercel, label: "manual paste" }
  - { from: vault, to: gh, label: "manual paste" }
  - { from: vercel, to: app, label: "process.env" }
  - { from: gh, to: actions, label: "secrets.GH_TOKEN" }
~~~
````

Each diagram gets a one-paragraph **setup** before and a one-paragraph **narration** after. The setup names the pieces; the narration walks the reader through what just happened and flags any honest gaps (e.g. "Notice secrets flow manually from 1Password — there's no automated rotation; rotation is calendar-driven").

**Mermaid is NOT enabled in EpicContext.** Use `~~~flow` tilde fences. See `architecture.md` for the full role palette.

## Output schema (markdown body)

```
### Hosting & deploy targets

### Database

### Auth

### Secrets management

### CI/CD pipeline

### Observability

### Cost — current + scale drivers

### Backup + DR

### Runbook — top 5 incidents

### Compliance posture
```

## Required connections (graph-level)

A drafted `dev_setup` (infrastructure) block must:

- Link **tech_stack** (what's deployed has to match what's built with).
- Link **architecture_diagram** (the architectural topology lands on this infrastructure).
- Link **≥1 ADR** for the hosting / DB tier / region choice.
- Optionally link a **legal_document** for data-residency commitments.

Infrastructure with no tech_stack link is operating in a vacuum. Infrastructure with no ADRs makes operational choices invisible.
