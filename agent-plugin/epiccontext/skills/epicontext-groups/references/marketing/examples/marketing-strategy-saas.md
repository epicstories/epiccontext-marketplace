# Example — B2B SaaS marketing strategy (linked to OGSM + persona + CEPs)

A compact, well-formed `marketing_strategy` for a solo-designer SaaS. Shows the required refs, outcome-stated goals, and a CEP portfolio that fans out to the rest of the group.

```yaml
type: marketing_strategy
key: gtm-2026-h1
name: "H1 2026 go-to-market"
maturity: drafted
last_reviewed: 2026-06-19

# Required refs
ogsm_ref: { blockKey: ogsm-2026, note: "serves Goal 2: activation" }
messaging_ref: { blockKey: messaging-core }
personas_ref: [{ blockKey: solo-product-designer }]
# Recommended
positioning_ref: { blockKey: positioning-core }

summary: >
  Reach solo product designers at the moments they feel project chaos, build
  mental availability across their top buying situations, and convert via
  answer-first search content + founder LinkedIn. No paid until brand search proves out.

goals:                       # outcomes, not activity
  - "300 trial signups/month by end of H1"
  - "40 sales-qualified leads/month"

category_entry_points:       # 7W-identified, 3C-ranked
  - cep: "when onboarding a new client"          # priority 1
    commonality: high
    competitiveness: medium
    credibility: high
  - cep: "when projects start slipping"          # priority 2
    commonality: high
    competitiveness: high
    credibility: medium
  - cep: "when juggling five disconnected tools"  # priority 3
    commonality: medium
    competitiveness: low
    credibility: high

primary_channels: ["founder-linkedin", "organic-search", "ai-earned-media"]
anti_strategy: "No paid social; no broad PMax until branded search proves incremental."
```

**Why it's good:** goals are outcomes; every CEP is a buyer situation (not a feature); the CEP portfolio is the input the search skill turns into keyword clusters + an AI prompt library; channels each reach the persona. The next steps write themselves — a `content_piece` per priority CEP, a `kpi` for mental share-of-voice per CEP.
