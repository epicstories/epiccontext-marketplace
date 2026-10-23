---
description: Create an actionable insight from metrics data
argument-hint: [metric-name or observation]
---

# Set Insight

Create a structured, actionable insight from metrics data and write it to the project graph.

## Process

1. `list_blocks section=performance` (MCP) to understand existing metrics
2. If a metric name is given, `get_block` that specific block
3. Formulate the insight using the framework below
4. Write it with `create_block` / `update_block` and a `reason`, and
   connect it to the relevant KPI, persona and feature blocks via their
   `_ref` fields

## Insight Framework: Observation > Implication > Action

### 1. Observation (What the data shows)
- Be specific: use numbers, percentages, timeframes
- Be factual: only state what the data actually shows
- Be precise: "dropped 16% from 78% to 62%" not "went down a lot"

### 2. Implication (Why this matters)
- Connect to business goals or KPIs
- Quantify the impact where possible
- Explain the risk of inaction

### 3. Action (What to do about it)
- Be specific: who should do what
- Be achievable: within team's control
- Be timely: when should this happen
- Be measurable: how do we know if the action worked

### 4. Confidence Level
- **High**: Multiple data sources confirm, large sample size, clear trend
- **Medium**: Single data source, moderate sample, emerging trend
- **Low**: Limited data, small sample, or correlation without causation

## Quality Checklist

Before finalizing an insight, verify:
- [ ] Observation is factual and specific (numbers, not vague)
- [ ] Implication connects to a documented goal or KPI
- [ ] Action is specific and assignable
- [ ] Confidence level is stated honestly
- [ ] Source data is referenced
- [ ] Connected to relevant personas, features, or journeys

## Output Format

```
## Insight: [Short Title]

**Confidence:** high | medium | low
**Source:** [metric/data source]
**Date:** [today]

### Observation
[What the data shows — factual, with specific numbers]

### Implication
[Why this matters — connected to goals]
- Affects KPI: [key of the kpi block]
- Impacts persona: [key of the persona block]

### Recommended Action
[Specific, assignable action]
- Owner: [role/team]
- Timeline: [when]
- Success metric: [how to measure if action worked]

### Supporting Data
- [data point 1]
- [data point 2]
```
