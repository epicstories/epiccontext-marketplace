# Decision Tree: Upgrade or Stay?

Version upgrades, framework migrations, dependency updates. Wrong answer wastes time or creates technical debt.

## Start here

**What kind of upgrade?**

```
├─ Patch version (security, bug fixes)
│   → Upgrade promptly
│
├─ Minor version (new features, backwards compatible)
│   → Upgrade when convenient (next sprint, batch with other work)
│
├─ Major version (breaking changes)
│   → Decision required (continue tree)
│
└─ Framework or vendor migration
    → ADR required (this is a major decision)
```

## For major version upgrades

**Evaluate:**

```
├─ Does the new version offer something we need?
│   ├─ YES → Upgrade likely justified (continue evaluation)
│   └─ NO  → Stay (current version still maintained)
│
├─ Is the current version going EOL within 12 months?
│   ├─ YES → Upgrade required (just timing matters)
│   └─ NO  → Continue
│
├─ How costly is the migration (breaking changes scope)?
│   ├─ Small (few hours) → Upgrade
│   ├─ Medium (a sprint)  → Upgrade if benefits justify
│   └─ Large (multi-sprint) → ADR required; schedule deliberately
│
└─ Is the new version stable?
    ├─ YES → Proceed based on cost/benefit above
    └─ NO  → Wait. Early adopter cost rarely worth it.
```

## When to upgrade promptly

- Patch versions (almost always — security risk to delay)
- Security-related minor versions
- New version fixes a problem we have
- Old version going EOL within 6 months
- New version unlocks a feature we genuinely need

## When to delay or skip

- New version is bleeding-edge (less than 6 months old, ecosystem not caught up)
- No specific need for new features
- Current version still actively maintained
- Migration cost is high and benefits are speculative
- We're in a freeze period (pre-launch, pre-handoff to client)

## When to migrate to a different framework or vendor

This is rarely the right call. Migration cost is systematically underestimated (per EVD-BLD-005). Strong signals:

- Current vendor is shutting down or being acquired (forced migration)
- Pricing has changed materially against our economics
- Strategic mismatch (vendor's direction doesn't fit ours)
- Critical missing capability with no workaround

Weak signals (don't migrate just for these):
- New vendor has a feature we want
- Marketing/hype around the new option
- "Modern" or "cleaner" code
- Engineer preference

If migrating, write an ADR. The decision deserves the rigor.

## Practical sequencing

For a project with multiple upgradeable dependencies:

1. **Patch and minor versions:** Batch into a regular cadence (weekly, biweekly). Don't agonize.
2. **Major versions:** Plan deliberately. One major upgrade at a time. Schedule between feature work, not on top of it.
3. **Framework migrations:** Quarterly review at minimum. Not lightly.

## Common failure modes this tree prevents

- **Always-upgrading** — chasing new versions; team spends time on upgrades instead of features
- **Never-upgrading** — versions silently drift to EOL; security risks accumulate; eventually a forced massive upgrade
- **Migration on hype** — switching frameworks because the new one trended; cost not justified by benefit
- **Migration without ADR** — major decision with no record of why
- **Upgrade-stack-day** — trying to upgrade everything at once; bisecting failures becomes painful

## Quick guide

| Situation | Action |
|-----------|--------|
| Patch / security | Upgrade promptly |
| Minor version, new features | Upgrade when convenient |
| Major version, current still maintained | Evaluate cost/benefit; ADR if expensive |
| Major version, current going EOL | Upgrade required; schedule |
| Framework migration | Rarely; ADR required |
| Vendor migration | Rarely; ADR required |

## Sources

- ThoughtWorks Technology Radar — periodic guidance on stack maturity
- EVD-BLD-005 — Vendor lock-in cost is usually underestimated
- Migration cost research (Kirschner et al., academic and practitioner)
