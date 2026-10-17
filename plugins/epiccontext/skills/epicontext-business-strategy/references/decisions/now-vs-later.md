# Decision Tree: Now or Later?

Sequencing roadmap items. Wrong sequence wastes effort or blocks bigger work.

## Start here

**For each candidate item, answer:**

```
├─ Does this directly serve a Now-horizon OGSM Goal?
│   → Now candidate
│
├─ Does this unblock other Now items?
│   → Now candidate (even if not directly serving a Goal)
│
├─ Does this serve a Goal but require a precondition?
│   → Next, with explicit dependency
│
├─ Does this serve a future Goal whose precondition isn't yet ready?
│   → Later
│
└─ Does this not trace to OGSM at all?
    → Decline or revisit OGSM
```

## After mapping items

**Check the Now bucket against capacity.**
- More than 5-7 items in Now is overcommitment for a small team
- If overloaded, the question shifts to "which 5-7 of these matter most?"

**Check Now items against impact AND cost.**
- High impact + low cost: definitely Now
- High impact + high cost: usually Now if budget allows
- Low impact + low cost: Now if it unblocks; otherwise Next
- Low impact + high cost: rarely Now

## Key tradeoffs

**Sequence by impact vs. by dependency**

When two items have similar impact but different dependencies, sequence by dependency. Item A unblocks Item B → A first, even if B has slightly higher direct impact.

**Sequence by reversibility**

Reversible decisions can move forward with less evidence. Irreversible decisions need stronger evidence first. Lean reversible-first when uncertain.

**Sequence by learning**

Items that produce learning (test assumptions, validate hypotheses) often deserve to be early, even if the direct impact is modest. The learning informs everything that follows.

## When the answer is "Later"

**Later doesn't mean "won't happen."** It means: directional, not committed, will be reviewed. Later items should still trace to a Goal or Strategy — otherwise they're wishlist items, not roadmap items.

**Later items get reviewed at quarterly review.** Some move to Next. Some move to Declined. Some stay Later. The review is what makes Later honest.

## When the answer is "Decline"

**Items that don't trace to OGSM at all should usually be declined**, not parked in Later. Parking them creates a graveyard. If they're declined explicitly with reasons, future re-introductions can be evaluated against the original decline reason.

**Exception:** If an item doesn't trace to current OGSM but might trace to future OGSM, mark it as "exploration" in Later with a note about which future Goal it might serve. Don't pretend it serves current OGSM.

## Common failure modes this tree prevents

- **Now bucket overflow** — every important item declared Now, nothing actually ships on time
- **Now without OGSM linkage** — work being done that doesn't serve strategic goals
- **Sequencing by interest** — building what's interesting first, not what's most important
- **Later as graveyard** — items move to Later and never get reviewed; backlog rot
- **Decline never used** — every item gets parked, nothing gets formally killed
- **Sequence ignoring dependencies** — high-impact item scheduled before its precondition

## Quick guide

| Item characteristics | Bucket |
|---------------------|--------|
| Serves Now Goal, no blockers, capacity exists | Now |
| Unblocks other Now items | Now |
| Serves Goal but needs precondition | Next with dependency |
| Future Goal, future readiness | Later |
| No OGSM linkage, no future case | Decline |
| No OGSM linkage, possible future case | Later (exploration) |

## Sources

- Cagan, *Empowered* — outcome-focused sequencing
- Klein/Kahneman — premortem before committing to large items
- EVD-STR-009 — Decision quality vs. outcome quality
- EVD-STR-010 — Premortems improve decision quality
- EVD-STR-011 — Outcome-focused roadmaps outperform feature-focused
