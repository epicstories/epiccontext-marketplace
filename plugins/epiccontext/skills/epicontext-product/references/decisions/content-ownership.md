# Decision Tree: Who owns this content?

Different content surfaces are owned by different roles. Wrong owner produces drift, voice mismatch, or compliance issues.

## Start here

**What kind of content is this?**

```
├─ User-facing UI copy in the product
│   → A. Design / Content design
│
├─ Marketing pages, landing pages, ads, social
│   → B. Marketing
│
├─ Legal text (ToS, Privacy, Cookie, Compliance)
│   → C. Legal (with content design support)
│
├─ Help articles, FAQs, support content
│   → D. Customer support / Documentation
│
├─ Email content (transactional vs marketing)
│   → E. Split: transactional = Design, marketing = Marketing
│
└─ Internal documentation (team-facing)
    → F. Team / engineering / product
```

---

## A. Design / Content design

**Owns:** Buttons, headings, body copy in the app, error messages, empty states, onboarding flows, microcopy throughout.

**Why this owner:** Closest to the user interaction; sees the moment-by-moment experience; understands the journey phase emotional fit.

**Brand voice reference:** Required.

**Output structure:** Content entity, bound to feature + IA node + component + journey phase.

---

## B. Marketing

**Owns:** Homepage hero, landing pages, paid acquisition copy, social posts, ad copy, blog, email newsletters.

**Why this owner:** Owns the customer acquisition funnel; closest to brand positioning and competitive narrative.

**Brand voice reference:** Required, often with marketing-specific overlay (more promotional than in-app voice).

**Watch for:**
- Marketing copy bleeding into product UI (different voice register)
- Product UI copy treated as marketing (over-promising in features)

**Output structure:** Content entity, often longer-form, may not bind to a specific feature.

---

## C. Legal

**Owns:** Terms of Service, Privacy Policy, Cookie Policy, GDPR notices, regulatory disclosures.

**Why this owner:** Legal accuracy is paramount; non-lawyers writing this is a liability.

**But content design must be involved:** Legal text written by lawyers alone is often unreadable. Content design ensures plain language without sacrificing legal accuracy.

**Brand voice reference:** Modified — legal voice has its own constraints. Document the modification.

**Watch for:**
- Legal text accumulating without review (privacy policies that are 6 years out of date)
- Plain-language version drifting from legal-canonical version

**Output structure:** Content entity with a clear `legal_canonical: true` flag and a separate `plain_language_version` field if applicable.

---

## D. Customer support / Documentation

**Owns:** Help articles, FAQs, troubleshooting guides, knowledge base, customer-facing changelog.

**Why this owner:** Closest to customer questions and confusion; sees the support tickets that reveal what users don't understand.

**Brand voice reference:** Required, often with educational overlay (clearer, more patient than marketing copy).

**Watch for:**
- Stale articles documenting old features
- Articles accumulating without an owner; knowledge base becomes a graveyard

**Output structure:** Content entity, often longer-form, linked to features and to support ticket categories (linkage to Performance group's customer insights).

---

## E. Email — split by purpose

**Transactional emails** (booking confirmation, password reset, invoice, receipt):
- Owner: Design / Content design
- Voice: matches in-app voice
- Bound to features and journey phases

**Marketing emails** (newsletters, promotions, win-back):
- Owner: Marketing
- Voice: marketing voice
- Bound to campaigns, not features

**Critical:** Don't mix. A booking confirmation that includes promotional copy violates expectations and reduces trust.

---

## F. Internal documentation

**Owns:** Team-facing content (Product team, engineering, runbooks).

**Why this owner:** It's not user-facing content — it's for the team that builds/runs the product.

**Brand voice reference:** Optional. Internal voice can be more direct and less polished.

**Output structure:** Often lives in the team's documentation system (Notion, Confluence, GitHub wiki) rather than as content entities. Don't try to manage internal docs as content entities — wrong scope.

---

## What if it's unclear?

Ask:
1. Who has the most context on whether this is true/accurate?
2. Whose voice should this be in?
3. Who has the authority to change this?

The answer to any of those is the owner. If they conflict, it's a co-ownership case (e.g., Legal + Content design for ToS).

## Common failure modes this tree prevents

- **No owner** — content gets written by whoever's available; voice drifts, accuracy slides
- **Wrong owner** — marketing voice in product UI, product-team voice in customer help articles
- **Legal text untouched for years** — owner exists but doesn't review
- **Marketing copy in transactional emails** — voice expectations broken
- **Internal docs treated as content entities** — scope creep makes the system hard to manage
