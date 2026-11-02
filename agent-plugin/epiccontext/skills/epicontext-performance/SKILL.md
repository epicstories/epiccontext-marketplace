---
name: epicontext-performance
description: "Use for measurement: analytics, a KPI or metric, a dashboard, NPS, feedback, conversion, retention, or a signal to classify as a problem, trade-off, drift or noise. The Performance expert: its method, then what this organisation and project know (get_skill with project_id). Populates and audits the Performance group against the OGSM measures."
metadata:
  epic.requires: "analytics_event,feedback,insight,kpi,metric,north_star"
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Epic Context — Performance Group

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-performance", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-performance/references/<file>")`.
- **Its specialist skills** — one craft each: `data-analysis`, `explore-performance`, `grill-performance` — load the same way, by name: `get_skill(name: "data-analysis")`. The method lists them all; the briefing names the one a task needs.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
