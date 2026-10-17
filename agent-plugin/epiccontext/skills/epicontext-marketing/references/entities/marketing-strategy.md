# Entity — Marketing Strategy

The go-to-market frame for a period. Anchors the whole Marketing group: it holds the goals (from OGSM), the voice (from messaging), the people (personas), and the **Category Entry Point portfolio** that everything else fans out from.

## Required connections

| Ref | To | Why |
|---|---|---|
| `ogsm_ref` | `ogsm` | The strategy serves the period's Goals. Without it the strategy is unmoored. |
| `messaging_ref` | `messaging_framework` | Supplies the words; a message per CEP. |
| `personas_ref` | `persona[]` | Who the situations belong to. |

Recommended: `positioning_ref` → `brand_positioning`.

## Key fields (in the body)

- `summary` — the go-to-market frame in 2–4 sentences.
- `goals` — stated as **outcomes** (signups, qualified leads, revenue), not activity.
- `category_entry_points` — the prioritized **CEP portfolio** (7W-identified, 3C-ranked). Each CEP: buyer-phrased situation, incidence (commonality), clutter (competitiveness), credibility note, priority. This is the source list messaging, content, channels, keywords, and AI prompts all reference. See `../methodologies/mental-availability-ceps.md`.
- `primary_channels` — 2–4 named channels (the rest are dormant / anti-strategy).
- `anti_strategy` — what this period deliberately does NOT do.

## Maturity bar

| Stub | Drafted | Validated |
|---|---|---|
| Summary + anchors to OGSM/messaging/persona | Goals as outcomes, 2–4 primary channels, anti-strategy written, an initial CEP portfolio (even if stub-sourced) | Multiple campaigns wrapped against it; CEP portfolio research-sourced; goals hit or honestly missed |

## Anti-patterns

- No `ogsm_ref` — don't leave it unmoored; create a stub OGSM Goal first and link it.
- Goals as activity ("publish 5 blogs") instead of outcomes.
- A CEP list invented at the desk rather than sourced from `research`/`insight` — mark stub until buyer research backs it.

## Worked example (compact)

```yaml
type: marketing_strategy
key: gtm-2026-h1
maturity: drafted
ogsm_ref: { blockKey: ogsm-2026 }
messaging_ref: { blockKey: messaging-core }
personas_ref: [{ blockKey: solo-product-designer }]
positioning_ref: { blockKey: positioning-core }
goals: "300 trial signups/mo by end H1; 40 qualified leads/mo"
category_entry_points:
  - cep: "when a freelance designer onboards a new client"  # Where/While
    commonality: high
    competitiveness: medium
    credibility: high
    priority: 1
  - cep: "when projects start slipping and the overview is lost"  # Why/hoW-feeling
    commonality: high
    competitiveness: high
    credibility: medium
    priority: 2
primary_channels: ["founder-linkedin", "organic-search", "ai-earned-media"]
anti_strategy: "No paid social this period; no broad PMax until brand search proves out."
```
