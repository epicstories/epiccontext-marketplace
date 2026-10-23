---
description: Read and interpret a chart or dashboard screenshot
argument-hint: [description of what you're looking at]
---

# Read Chart / Dashboard

Help the user interpret chart data and extract meaningful insights.

## Process

1. `list_blocks section=performance` (MCP) to understand existing metrics and targets
2. Ask the user to describe or share the chart data
3. Apply the analysis framework below

## Chart Reading Framework

### Step 1: Identify What You're Looking At
- **Chart type**: Line (trends), bar (comparison), pie (composition), funnel (conversion)
- **Metric(s)**: What is being measured?
- **Time range**: What period does this cover?
- **Segments**: Is the data broken down by any dimension?

### Step 2: Read the Numbers
- **Current value**: What's the latest number?
- **Baseline/previous**: What was it before?
- **Change**: What's the delta (absolute and percentage)?
- **Direction**: Up, down, or flat?

### Step 3: Identify Patterns
- **Trend**: Consistent direction over time?
- **Seasonality**: Recurring cycles?
- **Anomalies**: Sudden spikes or drops?
- **Inflection points**: Where did the trend change?

### Step 4: Compare Against Context
- **vs. Target**: Are we above or below goal?
- **vs. Baseline**: How much have we improved/declined?
- **vs. Benchmark**: How does this compare to industry standards?
- **vs. Other segments**: Which segments outperform?

### Step 5: Formulate Insights

For each notable finding, write an insight:

```
**Observation:** [What the data shows — factual, specific]
**Implication:** [Why this matters — impact on goals]
**Action:** [What to do about it — specific, assignable]
**Confidence:** [high | medium | low]
```

## Output Format

```
## Chart Analysis: [Chart Title/Description]

### What I See
- Chart type: [type]
- Metric: [name]
- Period: [timeframe]
- Current value: [value]

### Key Patterns
1. [Pattern description]
2. [Pattern description]

### Insights
1. **[Insight title]**
   - Observation: [what the data shows]
   - Implication: [why it matters]
   - Action: [what to do]
   - Confidence: [level]

### Connected Metrics
- Related to: [keys of the performance blocks it touches]
- Affects: [links to features or personas]

### Recommendations
1. [Priority recommendation]
2. [Next recommendation]
```
