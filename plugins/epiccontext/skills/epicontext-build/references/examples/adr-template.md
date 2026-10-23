# Example: ADR Template (Canonical)

A full Architecture Decision Record demonstrating every section. Adapt this for any significant decision.

```yaml
id: adr-007-supabase-platform
type: adr
maturity: drafted
status: accepted
date: 2026-01-15
author: "Robert Lijbers"
supersedes: null
superseded_by: null

title: "ADR-007: Adopt Supabase as managed Postgres + auth + storage"

context: |
  We need persistent data storage, authentication, and file storage for the booking platform. The team is effectively one developer plus a part-time collaborator. We need to minimize operational overhead so we can spend time on the booking flow and customer experience rather than infrastructure.
  
  Constraints:
  - Small team, limited ops capacity
  - EU customer data (GDPR applies)
  - Need both customer auth and admin auth
  - Need file storage for therapist photos
  - Budget conscious; want predictable costs at our scale
  - Want to minimize vendor count where possible
  
  This decision is being made at project kickoff. Reversing later is possible but costly.

decision: |
  We will use Supabase (Pro plan) as our combined provider for Postgres, Auth, and Storage. The frontend talks to Supabase directly via the JS client where appropriate (with Row-Level Security policies enforcing access control), and via Next.js API routes where server-side logic or cross-cutting concerns are needed.
  
  Specifically:
  - Postgres for all relational data (bookings, customers, treatments, therapists, packages)
  - Supabase Auth for customer and admin authentication
  - Supabase Storage for therapist photos and customer profile images
  - Row-Level Security (RLS) policies to enforce access at the database level
  - Drizzle ORM for type-safe database access from the server

alternatives_considered:
  - alternative: "Self-hosted Postgres + custom auth + S3 for storage"
    rationale_against: |
      Operational overhead too high for team size. Auth implementation is risky to roll yourself — every common auth mistake (timing attacks, session handling, password reset flow) is a security exposure. S3 + signed URLs is workable but adds complexity. We'd spend weeks on infrastructure that Supabase provides on day one.
    
  - alternative: "Managed Postgres (Neon) + Auth0 + S3"
    rationale_against: |
      Three vendors to integrate, three billing relationships, three points of failure. Cost similar to Supabase Pro. Integration overhead is real — Auth0's user IDs need to be linked to Postgres rows in our code, where Supabase does this natively via RLS.
    
  - alternative: "Firebase / Firestore"
    rationale_against: |
      NoSQL doesn't fit our relational data model — bookings, treatments, therapists, customers all have rich relationships. Vendor lock-in to Google ecosystem is heavier than Supabase (which is open-source under the hood). Pricing model is harder to predict at scale.
    
  - alternative: "PlanetScale + Clerk + S3"
    rationale_against: |
      MySQL not Postgres. We want JSONB support for flexible structured data. Clerk is a good auth product but adds another vendor. PlanetScale's serverless Postgres alternative is newer and we'd be early adopters.
    
  - alternative: "Wait and decide later (use SQLite for prototyping)"
    rationale_against: |
      Need to make this choice early. Migrating from SQLite to a real DB later is friction we don't need. The decision will be made now or we'll keep deferring.

consequences:
  positive:
    - "Single vendor for three foundational services — simpler integration, simpler billing, simpler mental model"
    - "Tight integration: auth → RLS → row-level access in queries, all in one stack"
    - "Generous free tier for development and previews"
    - "Pricing is clear and predictable at our expected scale"
    - "Supabase is open-source under the hood (Postgres, GoTrue auth) — theoretical migration path exists"
    - "Strong developer experience — the JS client is well-designed; documentation is good"
  
  negative:
    - "Vendor lock-in despite open-source: migrating to self-hosted or another provider is non-trivial work"
    - "Pricing tied to a single vendor; surprise pricing changes are possible"
    - "Auth and DB share fate during a major Supabase outage (mitigated by Supabase's good uptime track record)"
    - "We rely on RLS for security — if we write bad policies, security holes are direct"
    - "Some product decisions (e.g., real-time subscriptions, edge functions) push us deeper into the Supabase ecosystem"
  
  neutral_but_to_watch:
    - "Supabase is growing fast; major product changes possible in 1-2 year timeframe"
    - "Realtime subscriptions are nice-to-have; if we use them heavily we lock in further"
    - "Supabase pricing has historically been stable; watching for changes"

risks_accepted:
  - risk: "Vendor lock-in"
    mitigation: "Standard Postgres makes the DB layer portable. Auth and Storage are harder to migrate but workable. Track migration cost annually."
  - risk: "Shared-fate outage (auth + DB go down together)"
    mitigation: "Supabase has good uptime track record; we accept this risk for the cost saved. Status page monitoring; if we see degradation, evaluate."
  - risk: "Pricing increases"
    mitigation: "Annual contract review. If pricing becomes prohibitive, we have ~3 months runway to migrate Postgres."

implementation_notes:
  - "RLS policies must be reviewed for every new table"
  - "Service role key is server-only; never exposed to client"
  - "Backups: Supabase managed; 7-day PITR on Pro plan"

linked_strategy: strategy-services-led-quality
linked_architecture: architecture-id
linked_tech_stack: tech-stack-id

review_at: "2027-Q1 — re-evaluate against Supabase pricing, product direction, and our scale"
```

## What this example demonstrates

**Context is rich, not just one sentence.** The decision makes sense only with the context. Future contributors need to understand the constraints we operated under.

**Alternatives are real, not strawmen.** Each alternative has a name, what it would mean, and a specific reason for not choosing it. "Self-hosted everything" is a real alternative; the rationale-against has to address the actual tradeoffs.

**Consequences are honest in three categories.** Positive (what we gain). Negative (what we give up). Neutral-but-to-watch (things that could go either way). Hiding the negatives is the most common ADR failure.

**Risks accepted are named with mitigations.** Every decision has risks. Naming them is what separates an ADR from a sales pitch.

**Review date is specific.** ADRs without review dates rot. "2027-Q1" is testable.

**Linked to strategy.** This decision serves the services-led posture (fast build, low ops). Decisions disconnected from strategy are flags.

## How to adapt

For any significant decision:
1. Title: ADR-N + slug
2. Context: what situation, what constraints, why now
3. Decision: one paragraph — the chosen path
4. Alternatives: 3-5, each with its own rationale-against
5. Consequences: positive + negative + watch
6. Risks accepted with mitigations
7. Status, date, author
8. Review date

## Sources

- Nygard — Documenting Architecture Decisions (2011)
- ThoughtWorks — Lightweight Architecture Decision Records
- MADR (Markdown ADR) template
- EVD-BLD-001
