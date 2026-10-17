# Decision Tree: Does this need an ADR?

Not every decision needs an ADR. Wrong answer in either direction creates problems: too many ADRs and nobody reads them; too few and decisions become folklore.

## Start here

**For the decision under consideration, ask:**

```
├─ Will future contributors wonder "why did we do it this way?"
│   → ADR candidate (continue)
│
├─ Is the decision easily reversible (low cost to change)?
│   → Probably not ADR-level — document inline if needed
│
├─ Was the decision contested (real alternatives, real debate)?
│   → ADR likely
│
├─ Does the decision lock in a vendor, framework, or pattern?
│   → ADR
│
├─ Does the decision affect the trust boundary or security model?
│   → ADR
│
└─ Is this just routine work?
    → No ADR needed
```

## Specific signals an ADR is warranted

**Strong signals:**
- Choosing a vendor or platform (database, hosting, auth provider)
- Choosing an architecture pattern (monolith vs. microservices, sync vs. async)
- Choosing a major framework (React vs. Vue, Postgres vs. NoSQL)
- Adopting a standard (REST vs. GraphQL, JWT vs. session cookies)
- Decisions that affect multiple teams or surfaces
- Decisions where reversal would be costly

**Medium signals:**
- Significant library choices (state management, form library, ORM)
- Build/deploy pipeline decisions
- Decisions about external integrations
- Performance trade-offs that affect product behavior

**Weak signals (probably don't need ADRs):**
- Small refactors
- Bug fixes
- Minor library upgrades
- Routine config changes
- Internal team conventions captured elsewhere (style guide, linting rules)

## When the answer is yes — write the ADR

Use `examples/adr-template.md` as the structure. Key sections:
- Context (the situation that produced this need)
- Decision (one paragraph)
- Alternatives (3-5, real ones with rationale-against)
- Consequences (positive, negative, watch)
- Risks accepted
- Status, date, author

## When the answer is no — but it still feels significant

Some decisions don't warrant a full ADR but should be documented somewhere:
- Inline comment in the relevant code
- A note in the architecture entity
- A line in tech_stack rationale
- A team convention doc

The test: will someone reasonably ask "why?" in 6 months. If yes, capture somewhere. If no, ship and move on.

## Backfill ADRs for past decisions?

Sometimes you realize a past decision should have had an ADR. Backfilling is fine, but mark it as such:
- Date the ADR with the decision date (not today's date)
- Note "Backfilled YYYY-MM-DD" in the metadata
- Don't pretend the ADR predated the decision

Backfilling is most valuable for:
- Major foundational choices (database, hosting, framework)
- Decisions that have already been challenged ("why didn't we do X?")
- Decisions about to be reconsidered (need the original context)

## Common failure modes this tree prevents

- **ADR for every minor choice** — inflation; nobody reads them anymore
- **No ADR for major choices** — folklore accumulates; new contributors lost
- **Backfilled ADRs presented as original** — future contributors confused about decision timeline
- **ADRs that skip alternatives** — looks like a justification, not a decision
- **Missing trust-boundary or security ADRs** — these are the most important to document; security decisions need rationale

## Quick guide

| Decision characteristic | ADR? |
|-------------------------|------|
| Vendor or platform choice | Yes |
| Architecture pattern | Yes |
| Major framework | Yes |
| Trust boundary / security | Yes |
| Hard to reverse | Yes |
| Easily reversible | Probably not |
| Routine work | No |
| Minor refactor | No |
| Style/convention | Style guide, not ADR |

## Sources

- Nygard — Documenting Architecture Decisions
- ThoughtWorks — Lightweight ADRs
- EVD-BLD-001 — ADRs prevent decision amnesia
