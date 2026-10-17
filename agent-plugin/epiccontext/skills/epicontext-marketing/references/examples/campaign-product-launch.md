# Example — Product-launch campaign (channels, content, KPIs, target CEP)

A compact `campaign` that traces up to a strategy and down to content + KPIs, built around one priority Category Entry Point.

```yaml
type: campaign
key: onboarding-mode-launch
name: "Onboarding Mode launch"
maturity: drafted
last_reviewed: 2026-06-19

strategy_ref: { blockKey: gtm-2026-h1 }
channels_ref: [{ blockKey: founder-linkedin }, { blockKey: organic-search }, { blockKey: ai-earned-media }]
kpis_ref: [{ blockKey: trial-signups }, { blockKey: ai-mention-rate-onboarding }]

goal: "200 trial signups attributed to the onboarding CEP in 6 weeks"
hypothesis: >
  Designers feel category pain most acutely when onboarding a new client.
  Showing up at that CEP — in search, in AI answers, and on founder LinkedIn —
  converts better than generic 'project management' messaging.
target_ceps: ["when onboarding a new client"]
status: in_flight
window: { start_date: 2026-03-01, end_date: 2026-04-11 }

content_pieces:
  - { blockKey: blog-onboarding-without-the-chaos, format: blog }       # SEO/GEO answer page
  - { blockKey: li-carousel-first-week, format: social }                # founder LinkedIn
  - { blockKey: lp-onboarding-mode, format: landing }                   # paid + organic landing
```

**Why it's good:** the goal is an outcome; the hypothesis names the CEP and why it converts; KPIs include a mental-availability proxy (AI mention rate for the onboarding CEP); the landing page doubles as the search answer page for that CEP's keyword cluster. When the window closes, wrap with actual KPI movement and link lessons learned.
