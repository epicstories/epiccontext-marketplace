# Entity — Campaign

A discrete initiative with a goal and a window (Q3 launch, spring sale, designer week). Runs on channels, produces content pieces, and moves a KPI. A campaign that doesn't trace to a strategy is "we made a thing."

## Required connections

| Ref | To | Why |
|---|---|---|
| `strategy_ref` | `marketing_strategy` | The campaign serves a period's strategy and its CEP portfolio. |
| `channels_ref` | `channel[]` | Where the campaign runs. |

Recommended: `kpis_ref` → `kpi[]` (what it's meant to move).

## Key fields (in the body)

- `goal` — an **outcome** (signups, qualified leads, revenue), not activity.
- `hypothesis` — what you believe will happen and why (even if small).
- `target_ceps` — which Category Entry Point(s) this campaign builds mental availability for (from the strategy's portfolio). One primary CEP per execution.
- `status` — planned / in_flight / wrapped.
- `window` — start_date / end_date.

## Maturity bar

| Stub | Drafted | Validated |
|---|---|---|
| Name + goal + status | Hypothesis + channels + KPIs + content pieces wired + target CEP(s) | Wrapped with actual KPI movement + lessons learned linked |

## Anti-patterns

- Goal stated as activity ("post 3x/week") instead of outcome.
- No `strategy_ref` — orphaned campaign; link a strategy or refuse.
- Stuck on `status: in_flight` months after `end_date` — wrap honestly with results.
- No `target_ceps` — the campaign isn't building any specific mental-availability link.

## Worked example (compact)

```yaml
type: campaign
key: designer-onboarding-push-q1
maturity: drafted
strategy_ref: { blockKey: gtm-2026-h1 }
channels_ref: [{ blockKey: founder-linkedin }, { blockKey: organic-search }]
kpis_ref: [{ blockKey: trial-signups }]
goal: "120 trial signups from the onboarding CEP in 8 weeks"
hypothesis: "Designers feel the pain most when onboarding a new client; content at that moment converts."
target_ceps: ["when a freelance designer onboards a new client"]
status: in_flight
window: { start_date: 2026-02-01, end_date: 2026-03-28 }
```
