# Analytics Event

A **named user-behaviour signal** the product captures — what's tracked, what it means, what KPI / feature it serves, and what the dashboard looks like. Analytics events are the instrument behind every measure-driven decision.

A real analytics_event block names the **event**, the **trigger condition**, the **properties captured**, the **KPI it feeds**, and the **owner who watches it**.

## Why most analytics_event blocks are too thin

Classic failure: an event name + "tracks user action." No trigger condition, no properties, no KPI link, no owner. A real event spec lets a developer instrument it and a data team validate it.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Event name | "page_view" | Canonical name + naming convention (snake_case / namespacing). |
| Trigger condition | absent | When exactly fires — DOM action, server-side event, time-based. |
| Properties | absent | What's captured: user props, event props, with types. |
| Privacy / PII | absent | What's NOT captured (PII, sensitive fields). GDPR compliance. |
| KPI it feeds | absent | Linked KPI or measure. |
| Feature served | absent | Linked feature that this event measures. |
| Owner | absent | Who watches the dashboard. |

## Depth checklist (BEFORE writing)

1. **Event name** canonical.
2. **Trigger condition** unambiguous.
3. **Properties** typed.
4. **Privacy stated** (PII excluded).
5. **Linked KPI + feature.**
6. **Owner named.**

## Push-back prompts (AFTER drafting)

- **"Can two devs instrument this identically?"** If no, the trigger is ambiguous.
- **"What's the PII boundary?"** GDPR-shaped specifically.
- **"What KPI does this feed?"** Free-floating events become noise.
- **"Who watches?"** Unwatched events become drift.

## Evidence pool

- **Linked feature + KPI.**
- **Existing analytics implementation** in the project's repo (its analytics module, tag-manager config, or tracking calls).
- **GDPR / privacy policy** for PII rules.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder event name). |
| **drafted** | Event + trigger + properties + privacy + linked KPI/feature + owner. ≥250 words. |
| **validated** | Drafted + instrumented in production + dashboard exists + ≥30 days of data. |

## Anti-patterns to refuse

- **The ambiguous trigger.** Force unambiguous.
- **The PII-blind event.** Refuse.
- **The free-floating event.** Force a linked KPI/feature.

## Output schema (markdown body)

```
### Event name + naming convention
### Trigger condition
### Properties (typed)
### Privacy + PII boundary
### KPI it feeds
### Feature served
### Owner
```

## Required connections (graph-level)

A drafted `analytics_event` block must:

- Link **≥1 feature** it measures.
- Link **≥1 kpi** it feeds.
- Optionally be referenced *by* **customer_insight** blocks.

An analytics event with no KPI is noise.
