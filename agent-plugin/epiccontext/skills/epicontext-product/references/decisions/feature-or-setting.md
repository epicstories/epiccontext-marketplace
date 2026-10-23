# Decision Tree: Is this a feature, a setting, or a property?

A common product decision: should this thing be a feature, a configurable setting, or just a property of an existing entity? Wrong answer creates clutter or hidden capability.

## Start here

**What does this thing do?**

```
├─ Provides a distinct capability tied to a JTBD
│   → A. Feature
│
├─ Configures behavior of an existing feature
│   → B. Setting
│
├─ Describes an attribute of something the product manages
│   → C. Property
│
└─ Is rarely used and could be removed without losing a JTBD
    → D. Probably shouldn't exist
```

---

## A. Feature

**It's a feature when:**
- Linked to a specific JTBD (Users group)
- Has its own distinct interaction or workflow
- Removing it would leave a job unserved
- Has measurable success metrics tied to JTBD outcomes

**Examples:** "Book a treatment", "Rebook with same therapist", "Pay with iDEAL", "Cancel a booking"

**Output:** Create a feature entity. Link to JTBD. Define does/doesn't-do. See `entities/feature.md`.

---

## B. Setting

**It's a setting when:**
- It modifies behavior of an existing feature for a specific user or context
- Different users want different defaults
- The feature works without it (it just works the same way for everyone)

**Examples:** "Email notifications: on/off", "Default booking duration: 60min/90min", "Preferred therapist auto-selected: yes/no", "Reminder lead time: 24h/2h/none"

**Output:** Add to an existing feature's configuration; don't create a new feature entity. Note the setting in the feature's documentation.

**Trap:** Settings shouldn't accumulate to the point that the product becomes infinitely configurable. Each setting is cognitive load. If you have >7 settings on one feature, the feature probably has identity issues.

---

## C. Property

**It's a property when:**
- It's an attribute of a glossary term, not a behavior
- It's data, not interaction
- It describes the thing, not what users do with it

**Examples:** A therapist has a "name", "specialty", "languages spoken". A booking has a "duration", "price", "status". A package has a "session count", "validity period".

**Output:** Add to the relevant glossary term's plain_definition or as a structured field. Don't create a feature entity.

**Common mistake:** Wrapping every property in a feature. "Therapist names" is not a feature. "Browse therapists by name" is a feature; the name itself is a property of the Therapist glossary term.

---

## D. Probably shouldn't exist

**It probably shouldn't exist when:**
- It can't be linked to a JTBD
- Removing it would not leave any user underserved
- It exists because someone asked for it once but no evidence shows it's needed
- It's been shipped but is barely used in analytics

**Output:** Recommend deprecation. Move it to the sunset-candidates list for review. Don't formalize as a feature.

**Trap:** Sunk cost makes sunsetting hard. If something has been built but doesn't trace to a JTBD, the choice is: find the JTBD it actually serves, or sunset it. Don't justify retroactively.

---

## When the answer is unclear

Sometimes the right answer is "it could be a feature OR a setting" — that's a real decision, not an indication you're missing something.

**Lean toward feature when:**
- Multiple users have asked for it
- It changes the value the product provides
- It needs its own UI surface

**Lean toward setting when:**
- Only some users care
- It modifies behavior without changing capability
- It can be added to an existing feature's config

**Lean toward property when:**
- It's information about a thing, not an action
- The "verb" you'd use about it is "see" or "know", not "do"

## Quick selection guide

| Question | Answer |
|----------|--------|
| Does it serve a JTBD? | If yes, candidate for feature |
| Does removing it leave a job unserved? | If yes, definitely a feature |
| Is it on/off configurable per user? | Probably a setting |
| Is it data about something? | Property |
| Can no one explain why it exists? | Should it exist? |

## Common failure modes this tree prevents

- **Feature inflation** — every minor capability gets wrapped as a separate feature, scope balloons
- **Setting bloat** — too many settings make the product configurable but unusable
- **Property as feature** — wrapping data in feature scaffolding ("Therapist names" feature)
- **Sunk cost protection** — keeping things in the feature list because they were built, not because they serve users
