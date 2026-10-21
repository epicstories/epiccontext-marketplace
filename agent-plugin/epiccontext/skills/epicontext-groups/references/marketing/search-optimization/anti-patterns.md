# Anti-Patterns & Honest Caveats (Guardrails)

These are **guardrails the skill actively refuses**, not just advice. When a request or a recommendation hits one, refuse it and offer the honest version. Each is anchored to the evidence library.

---

## SEO myths to refuse

- **Treating impressions as success.** 2025 data pollution + decoupling (EVD-SO-028). → Use clicks / GA4 sessions / conversions.
- **Chasing a single CTR curve.** It bends by SERP feature now (EVD-SO-001). → Model by SERP composition, not one table.
- **"Schema guarantees AI citations."** No causal evidence; Ahrefs DiD found noise (EVD-SO-008). → Implement schema for confirmed rich-result/parsing/entity value; don't claim citation impact.
- **Keyword-density / content-volume arms race.** Page count correlates ~0.17–0.194 with AI visibility (EVD-SO-016). → Depth where it serves the answer, not word-count padding.
- **Treating Domain Authority as a ranking factor.** It's a third-party metric. → Use referring domains + clicks.
- **Assuming ranking #1 = AIO citation.** Only ~38% of AIO citations came from top-10 results by early 2026 (Ahrefs), down from ~76% mid-2025. → Earn citations off-site; don't assume rank carries them.

## SEA over-automation traps

- **Handing PMax full control without brand exclusions** — cannibalizes free branded traffic (EVD-SO-011). → Set brand exclusions; structure PMax as complement.
- **Not incrementality-testing branded search** — median iROAS 0.70x (EVD-SO-014). → Run a geo-holdout before trusting branded spend.
- **Enabling Target ROAS below the conversion threshold** — starves volume (EVD-SO-013). → Stay on Maximize Conversions until ~50 conv/30 days.
- **Trusting blended ROAS** inflated by brand (EVD-SO-014). → Report iROAS + new-customer CPA.
- **Ignoring AI Max broad-match drift** (EVD-SO-012). → Review search terms daily during the first two weeks.
- **Optimizing to Quality Score as a goal** rather than its inputs (EVD-SO-010). → Improve expected CTR, ad relevance, landing-page experience.

## GEO/AEO hype / snake-oil to refuse

- **llms.txt as a citation tactic** — no evidence (EVD-SO-021). → Ship only for IDE-agent/docs value; never sold as AEO.
- **Schema as a citation guarantee** — contested (EVD-SO-008).
- **Vendor "we boosted citations 300%" case studies** — mostly self-published, unverified.
- **Per-platform citation percentages quoted as fixed** — they shift constantly (EVD-SO-020).
- **The recycled 0.334 correlation** appearing identically across "independent" studies (EVD-SO-017).
- **Treating AI-visibility measurement as the goal** rather than action — *tracked ≠ improved.*

---

## Where evidence is thin / fast-moving (flag in any recommendation)

- AI-referral conversion premiums (sample-biased, volatile, e-commerce-contradictory — EVD-SO-022).
- AI Max (very new, thin independent evidence — EVD-SO-012).
- All per-platform sourcing splits (vendor data — EVD-SO-020).
- Freshness multipliers (vendor-sourced — EVD-SO-009).
- Schema's causal role in AI citation (contested — EVD-SO-008).
- Anything dated pre-2024 in SEO.

**Weighting rule (repeat):** weight independent + first-party platform data (Google, OpenAI, Pew, Princeton, Ahrefs first-party, Gartner, Deloitte) **above** GEO-vendor blogs.

---

## How to refuse well

Name the guardrail, cite the evidence ID, and offer the honest alternative. Examples:

- *"I won't add `llms.txt` as an AEO tactic — EVD-SO-021 shows it doesn't drive citations. I'll ship it for the dev-docs/IDE-agent value instead, and put the AEO effort into earned media + YouTube (EVD-SO-016)."*
- *"I won't report blended ROAS on this branded campaign — it hides the 0.70x median iROAS (EVD-SO-014). Let's run a geo-holdout and report incremental ROAS."*
- *"I won't claim schema will get us cited (EVD-SO-008). I'll add Organization/Article/FAQ schema for the confirmed rich-result and entity-disambiguation value."*
