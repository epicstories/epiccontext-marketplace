# Legal Document

A **legal / compliance document** the project depends on — contracts, DPAs, T&C, privacy policy, licences. Each block carries the document's purpose, scope, dates (signed / expires / review), counterparty, and which product surfaces it affects.

A real legal block is **traceable** — a reader can find the document, see the renewal date, and know which feature / data flow it covers.

## Why most legal blocks are too thin

Classic failure: a title + "we have a DPA." No counterparty, no dates, no scope, no link to the surface it covers. A real legal block names the **counterparty**, the **scope**, **dates**, and the **surfaces affected** so a renewal review has a clear blast radius.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Title + type | "Privacy Policy" | Title + document type (T&C / DPA / contract / policy / licence) + jurisdiction. |
| Counterparty | absent | Named party (or "all users" for site-wide policies). |
| Scope | absent | What's in / what's out — which surfaces, features, data flows. |
| Dates | absent | Signed / effective from / expires / next review. |
| Storage | absent | Where the executed document lives (1Password / Dropbox / signed PDF). |
| Surfaces affected | absent | Linked content_pages / features / infrastructure blocks. |
| Renewal trigger | absent | What event forces a review (annual / vendor change / law change). |

## Depth checklist (BEFORE writing)

1. **Title + type + jurisdiction.**
2. **Counterparty named.**
3. **Scope explicit.**
4. **Dates** (signed / effective / expires / review).
5. **Storage location.**
6. **Surfaces affected linked.**
7. **Renewal trigger.**

## Push-back prompts (AFTER drafting)

- **"Where is the executed document?"** Without storage location, the block is hearsay.
- **"What surfaces does this cover?"** Without links, renewal has no blast radius.
- **"When does it expire?"** Dateless legal = drift waiting to happen.
- **"What triggers a review?"** Law changes, vendor changes, scale crossings.

## Evidence pool

- **Linked content_pages** — privacy / T&C live here.
- **Linked infrastructure** — data residency, processors.
- **Linked features** — what the document covers.
- **Storage system** (1Password / Notion / signed PDFs).

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder title). |
| **drafted** | Title + type + counterparty + scope + dates + storage + linked surfaces + renewal trigger. |
| **validated** | Drafted + executed document accessible + next review date in calendar + ≥1 surface explicitly references this block. |

## Anti-patterns to refuse

- **The dateless legal.** Refuse.
- **The storage-less legal.** Document inaccessible = not legal.
- **The orphan legal.** No surfaces linked.
- **The "we have" legal.** Without specifics, just an assertion.

## Output schema (markdown body)

```
### Title + type + jurisdiction
### Counterparty
### Scope (in / out)
### Dates (signed / effective / expires / next review)
### Storage location
### Surfaces affected
### Renewal trigger
```

## Required connections (graph-level)

A drafted `legal_document` block must:

- Link **≥1 content_page** (where the document is publicly accessible if it's a policy).
- Optionally link **infrastructure** (DPAs cover data flow) + **features** the document covers.

A legal block with no linked surface is hearsay.
