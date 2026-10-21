# Decision Tree: One term or many?

Glossary disambiguation. Same word for different concepts? Different words for one concept? This tree disambiguates.

## Start here

**What's the situation?**

```
├─ Same word appearing in multiple contexts that mean different things
│   → A. Disambiguate (split into multiple terms)
│
├─ Different words appearing in different surfaces for the same concept
│   → B. Consolidate (pick canonical, deprecate synonyms)
│
├─ One word, one meaning, but team disagrees on which word
│   → C. Pick canonical with rationale
│
└─ One word, one meaning, broadly accepted
    → D. Document and move on
```

---

## A. Disambiguate

**Examples:**
- "Session" meaning a 60-minute treatment AND a logged-in browser session
- "Account" meaning a customer profile AND a financial billing arrangement
- "Service" meaning a treatment offering AND a third-party integration

**Process:**
1. Identify each distinct meaning. Be specific.
2. For each meaning, decide: is the existing word the right canonical, or does one meaning need a new word?
3. Often the more specific meaning gets a new word ("user session" instead of bare "session")
4. Less specific or more frequent meaning often keeps the bare term
5. Document why each choice was made

**Output:** Multiple glossary terms with explicit synonyms_to_avoid pointing at each other.

**Trap:** Naming each meaning the same word with different prefixes ("Treatment Session" vs. "User Session") works but bloats. Prefer single words where possible.

---

## B. Consolidate

**Examples:**
- "Therapist", "Practitioner", "Specialist", "Professional" all referring to the same role
- "Booking", "Appointment", "Reservation", "Schedule" all referring to the same thing

**Process:**
1. List every variant in current use
2. Decide canonical based on:
   - Brand voice fit (clinical vs. casual vs. luxury)
   - JTBD framing (Users group)
   - Industry convention
   - Localization parallel (does it translate cleanly?)
3. Mark non-canonical as `synonyms_to_avoid` with deprecation date
4. Run a content audit to update existing surfaces (this is the work)

**Output:** One canonical glossary entry, deprecation list, content cleanup tasks.

**Trap:** Consolidating without doing the cleanup. The glossary says "use X" but content still has Y, Z, W. Now there's drift documented in the glossary itself. Either commit to the cleanup or don't consolidate.

---

## C. Pick canonical with rationale

**Examples:**
- Team disagrees: "Booking" vs. "Reservation" — both mean the same thing, both work
- Brand voice could go either way

**Process:**
1. List the candidates with arguments for each
2. Decide based on:
   - Most users in research already use this word
   - Brand voice fits better
   - Less ambiguous (one of the candidates has secondary meanings)
   - Localizes more cleanly
3. Document the rationale in the glossary entry's notes
4. Move forward; don't re-litigate

**Output:** One glossary entry with explicit notes on why this term beat the alternatives.

**Trap:** Endless deliberation on tiny terminology choices. Pick, document, move on. You can always revisit if real evidence emerges.

---

## D. Document and move on

**Process:**
1. Write the entry with clear definition
2. Mark status active
3. Don't agonize

**Trap:** Treating every term as a complex disambiguation. Most aren't. Save the deliberation for cases that actually need it.

---

## How to detect which situation you're in

**Quick audit:**
1. Pull all content strings.
2. Tag every domain noun.
3. Cluster: same word → same meaning? Different words → different meanings?
4. Where clustering reveals same-word-different-meaning, you're in A.
5. Where clustering reveals different-words-same-meaning, you're in B.
6. Where the team has been arguing in meetings, you're in C.
7. Where there's no friction, you're in D.

## Common failure modes this tree prevents

- **False disambiguation** — splitting a term into two when one would do
- **Inconsistent consolidation** — picking canonical but never cleaning up content
- **Endless terminology debates** — treating C-category decisions as if they're life or death
- **Skipping rationale capture** — pick a term, don't document why; future contributor reverses the choice without context
