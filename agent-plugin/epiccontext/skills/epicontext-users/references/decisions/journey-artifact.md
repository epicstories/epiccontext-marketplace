# Decision Tree: Which journey artifact?

"Journey map" is often used as a generic term, but several distinct artifacts solve different problems. Picking the wrong one produces a deliverable that fails its actual purpose.

## Start here

**What problem are you trying to solve?**

```
├─ "Where does the customer experience break down today?"
│   → A. Current-state journey map
│
├─ "What should the experience look like after we redesign it?"
│   → B. Future-state journey map
│
├─ "How does the customer's life look beyond just our product?"
│   → C. Day-in-the-life map
│
├─ "What operational systems need to support the experience?"
│   → D. Service blueprint
│
└─ "How do different people travel through this together?"
    → E. Multi-actor journey or stakeholder map
```

---

## A. Current-state journey map

**Purpose:** Diagnose existing experience; find friction; align team on reality

**Best when:** Existing product/service with known issues, stakeholders are imagining experience as better than it is, need to ground a redesign in evidence

**Skip this if:** You're designing something new with no existing experience to map

**Evidence:** EVD-USR-008, EVD-USR-009

---

## B. Future-state journey map

**Purpose:** Show how the experience should be after intervention; create alignment on the target

**Best when:** Current-state map exists and you need to show the change, major redesign or new product launch, stakeholders need a vision artifact

**Risk:** Future-state maps drift from reality once shipped. Update or archive.

---

## C. Day-in-the-life map

**Purpose:** Understand the customer's broader context; find where the product fits into their life

**Best when:** Discovery phase before product or feature decisions, understanding a new market or persona, designing for emotional or contextual fit

**Skip this if:** You already understand the context well or the question is narrowly transactional

**Evidence:** EVD-USR-027

---

## D. Service blueprint

**Purpose:** Map the operational systems behind the customer experience — frontstage AND backstage

**Best when:** Service design (anything with humans delivering value), operations is part of the experience, multiple departments need to coordinate around customer moments

**Critical for:** Hybrid online-offline service businesses (booking + treatment + payment + follow-up)

**Skip this if:** Pure-software product with no human delivery component

---

## E. Multi-actor journey

**Purpose:** Show parallel journeys when multiple personas travel through the same system

**Best when:** B2B contexts (buyer, user, admin, support), two-sided marketplaces, healthcare contexts (patient + provider + family + insurance)

**Risk:** Becomes overwhelming if too many actors. Cap at 3-4.

---

## When you need more than one

- **Discovery → design**: Day-in-the-life (C) + current-state journey (A) + future-state journey (B)
- **Service design**: Current-state journey (A) + service blueprint (D)
- **B2B redesign**: Current-state journey (A) per actor, then a multi-actor journey (E) showing handoffs

## Quick selection guide

| Need | Artifact |
|------|----------|
| Diagnose existing problems | Current-state map |
| Sell a redesign vision | Future-state map |
| Understand context before designing | Day-in-the-life |
| Design service operations | Service blueprint |
| Coordinate multiple actor types | Multi-actor journey |
| Hand off to development | Current OR future-state |

## Common failure modes this tree prevents

- Mapping a future-state vision when you don't yet understand the current state
- Drawing a service blueprint when you needed a journey map
- Single-actor journey for a B2B context — missing the buyer/user/admin distinction
- Day-in-the-life when you needed task-focused diagnosis
- One artifact serving all purposes
