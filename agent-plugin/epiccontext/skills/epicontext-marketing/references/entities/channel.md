# Entity — Channel

A distribution channel that reaches a persona. "We do social media" is not a channel; "Founder LinkedIn for solo product designers" is. A channel earns its place by reaching a real persona at a predictable cost.

## Required connections

| Ref | To | Why |
|---|---|---|
| `personas_ref` | `persona[]` | The channel must reach a real persona; otherwise it's cost without reach. |

## Key fields (in the body)

- `type` — organic_search / paid_search / ai_earned_media / social / email / community / etc. (specific surface, not "social media").
- `owner` — who runs it.
- `cadence` — how often it's worked.
- `cost_model` — CAC / spend model.
- `notes` — what actually works here (from real activity).

> **Search channels** (`organic_search`, `paid_search`, `ai_earned_media`) are operated via `references/search-optimization/README.md`, and their content/keywords/prompts come from the CEP portfolio. A channel reaches a persona *at a Category Entry Point* — name the CEP(s) it serves in `notes`.

## Maturity bar

| Stub | Drafted | Validated |
|---|---|---|
| Name + type + persona | Owner, cadence, cost model, notes on what works | Repeatedly delivers to the persona at predictable CAC |

## Anti-patterns

- "Social media" as a channel — break into specific surfaces (LinkedIn vs TikTok vs X).
- No `personas_ref` — a channel reaching nobody in particular is cost without reach.
- Channel whose persona's `where_they_hang_out` doesn't include it — reach mismatch.

## Worked example (compact)

```yaml
type: channel
key: founder-linkedin
maturity: drafted
personas_ref: [{ blockKey: solo-product-designer }]
channel_type: social
owner: founder
cadence: "3 posts/week"
cost_model: "time only; ~3h/week"
notes: "Best for the 'onboarding a new client' and 'projects slipping' CEPs; carousels outperform text."
```
