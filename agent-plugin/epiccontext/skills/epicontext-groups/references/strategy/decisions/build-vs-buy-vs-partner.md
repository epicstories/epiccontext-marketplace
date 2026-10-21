# Decision Tree: Build, Buy, or Partner?

When a needed capability isn't in-house. Wrong answer wastes time and money or creates strategic dependency.

## Start here

**For the capability under consideration:**

```
├─ Is this capability core to our strategic differentiation?
│   ├─ YES → A. Build (or strategic partnership with deep integration)
│   └─ NO  → continue
│
├─ Is the capability commoditized (many vendors, all similar quality)?
│   ├─ YES → B. Buy (lowest TCO that meets requirements)
│   └─ NO  → continue
│
├─ Is there a single dominant vendor we'd be dependent on?
│   ├─ YES → C. Partner with caution (negotiate exit, accept lock-in or build alternative)
│   └─ NO  → continue
│
└─ Is the capability changing rapidly and we need optionality?
    ├─ YES → D. Buy/partner short-term while watching the space
    └─ NO  → Buy
```

## A. Build

**Best when:**
- Capability is core to differentiation (the moat)
- Wardley Map shows the component is in genesis or custom-built phase
- Buying means handing the moat to a vendor who could undercut you

**Examples for Asana Wellness:**
- Booking platform with provider-continuity capability — this IS the moat
- Customer database with treatment history — proprietary asset

**Watch for:**
- "Strategic" capabilities that aren't actually strategic — easy to over-claim
- Build cost underestimated by 2-3x routinely
- Maintenance burden of internal builds is permanent

## B. Buy

**Best when:**
- Capability is commoditized (multiple vendors, similar quality)
- Wardley Map shows the component is in product or commodity phase
- Building gives no advantage; buying gives focus on what matters

**Examples for Asana Wellness:**
- Payment processing (Stripe, Mollie, etc. — commoditized)
- Email/SMS transactional (Postmark, Twilio — commoditized)
- Cloud hosting (AWS, GCP — commoditized)

**Watch for:**
- Vendor lock-in (data export, contract terms)
- TCO over time (subscription costs add up)
- Vendor going out of business or being acquired

## C. Partner with caution

**Best when:**
- Capability is needed but only one vendor offers it well
- Building is too expensive but dependency is risky
- Need negotiating leverage or exit plan

**Examples:**
- Specialized industry-specific platform with no real alternative
- Marketplace integration where the marketplace owns the customer relationship

**Watch for:**
- Single point of failure
- Pricing power as you grow
- Strategic conflict (partner becomes competitor)

**Mitigation:** Always have an exit plan documented. Build alternative slowly even while partnering.

## D. Buy/partner with optionality

**Best when:**
- Space is moving fast (AI tooling currently a clear example)
- Best-of-breed today might not be best-of-breed in 12 months
- Locking in long-term is risky

**Approach:**
- Short contracts, easy to switch
- Don't deeply integrate at the data model level
- Watch the space; reassess quarterly

## The Wardley Mapping lens

If you can map the component on the evolution axis (Genesis → Custom → Product → Commodity):

- **Genesis / Custom-Built:** Build is often the right answer. Nobody else has it.
- **Product (rental):** Buy or partner. Multiple vendors, real choice.
- **Commodity / Utility:** Buy. Don't build commodity.

Forcing a build for a commodity component is a common strategic mistake — wastes resources that should go to genesis components.

## Common failure modes this tree prevents

- **Build everything by default** — small team builds commodity components that drain capacity
- **Buy strategic capabilities** — hand the moat to a vendor who can later undercut
- **Partner without exit** — strategic dependency with no leverage
- **Treat fast-moving space as stable** — locking in 3-year contracts in spaces that change in 6 months
- **Cost of building underestimated** — typical 2-3x overrun + permanent maintenance burden

## Quick guide

| Component characteristic | Default |
|--------------------------|---------|
| Core to differentiation | Build |
| Commoditized | Buy |
| Single dominant vendor | Partner with caution |
| Fast-moving space | Buy/partner with optionality |
| In genesis/custom phase | Build |
| In product phase | Buy or partner |
| In commodity phase | Buy |

## Sources

- Wardley — Wardley Mapping (component evolution lens)
- Porter — *Competitive Strategy* (vertical integration logic)
- EVD-STR-004 — Strategy without context is broken
- Practitioner literature on TCO, vendor management, lock-in risk
