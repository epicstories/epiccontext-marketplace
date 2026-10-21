---
description: Analyze metrics data and extract insights
argument-hint: [metric-name or "all"]
---

# Analyze Metrics

## Process

Work on the project graph through the Epic Context MCP tools, not on
local files (a `CONTEXT/` folder, if present, is a read-only projection).

1. Read this skill's entity references (`kpi`, `analytics`, `feedback`)
   for what a complete block looks like
2. If a specific metric is given, `get_block key=$ARGUMENTS`
3. If "all", `list_blocks section=performance` and analyze each

## For Each Metric, Evaluate

### Data Quality
- Is the metric clearly defined? (Specific)
- Can it be measured with available tools? (Measurable)
- Can the team influence it? (Actionable)
- Is it connected to a business goal? (Relevant)
- Does it have a timeframe? (Time-bound)

### Completeness
- Has a baseline value
- Has a target value
- Has a measurement method/tool
- Is linked to features or personas
- Has a tracking frequency defined

### Connections
- Check if it connects to personas (`list_blocks type=persona`)
- Check if it connects to features (`list_blocks type=feature`)
- Check if related KPIs exist
- Check if analytics events are defined to track it

## Output Format

```
## Metrics Analysis: [name or "Full Dashboard"]

### Summary
- Total metrics: X
- With targets: X/Y
- With baselines: X/Y
- Connected to features: X/Y

### Per Metric

#### [Metric Name]
- **Type**: metric | kpi | north_star | analytics_event
- **SMART Score**: X/5
- **Missing**: [list of missing elements]
- **Insight**: [observation about the metric's usefulness]
- **Recommendation**: [specific action to improve]

### Overall Recommendations
1. [Priority action]
2. [Next action]
```
