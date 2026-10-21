# Feedback

A **specific piece of user/stakeholder feedback** — what was said, where it came from, the sentiment, the classification, and the action (or decline) it triggered. Feedback blocks are the inbox of the feedback loop; customer_insight blocks are what survives classification.

A real feedback block is **routed** — it doesn't sit unread. Either it became a customer_insight, or it was explicitly de-prioritised with reason.

## Why most feedback blocks are too thin

Classic failure: a quote + "user said X." No source attribution, no sentiment, no route. A real feedback block names the **source** (channel + dated), the **persona** (or "non-target"), the **sentiment**, the **classification path**, and what **happened next**.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Source | absent | Channel (widget / email / NPS / interview) + date + author (if known). |
| Quote | one line | Verbatim quote. |
| Persona | absent | Linked persona (or "non-target" / "unclassified"). |
| Sentiment | "neutral" | Positive / negative / mixed + intensity. |
| Classification | absent | Bug / feature request / praise / churn risk / wrong-persona / noise. |
| Routed to | absent | customer_insight / ADR / dropped — with reason. |
| Linked to | absent | Feature / page / journey step the feedback is about. |

## Depth checklist (BEFORE writing)

1. **Source + date.**
2. **Verbatim quote.**
3. **Linked persona** (or "non-target").
4. **Sentiment + intensity.**
5. **Classification.**
6. **Route taken** (became insight / dropped).
7. **Linked target** (feature / page / journey).

## Push-back prompts (AFTER drafting)

- **"Which persona?"** Non-target feedback misclassified as "problem" wastes cycles.
- **"What's the route?"** Unrouted feedback dies in the inbox.
- **"Is the quote verbatim?"** Paraphrasing loses signal.
- **"What changed because of it?"** Force the link to action.

## Evidence pool

- **Linked persona + feature / page / journey.**
- **Widget comment threads** (the most direct surface).
- **Linked customer_insight** if the feedback graduated.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (placeholder feedback). |
| **drafted** | Source + quote + linked persona + sentiment + classification + route + linked target. |
| **validated** | Drafted + route closed (became insight / declined with reason) + ≥1 follow-up (response / fix / decline-message). |

## Anti-patterns to refuse

- **The unsourced feedback.** Refuse.
- **The personaless feedback.** Force a classification (incl. "non-target").
- **The routeless feedback.** Inbox graveyard.
- **The paraphrased quote.** Loses signal.

## Output schema (markdown body)

```
### Source (channel + date + author)
### Quote (verbatim)
### Linked persona
### Sentiment + intensity
### Classification
### Route taken (insight / dropped + reason)
### Linked target (feature / page / journey)
```

## Required connections (graph-level)

A drafted `feedback` block must:

- Link **persona** (or "non-target").
- Link **at least one target** (feature / content_page / journey).
- Be referenced *by* **customer_insight** if it graduated (or be explicitly marked "dropped").

Feedback with no route is an inbox graveyard.
