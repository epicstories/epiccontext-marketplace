---
name: epicontext-performance
description: "Use for measurement: analytics, a KPI or metric, a dashboard, NPS, feedback, conversion, retention, or a signal to classify as a problem, trade-off, drift or noise. The Performance expert: its method, then what this organisation and project know (get_skill with project_id). Populates and audits the Performance group against the goals in the strategy."
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
- **Its sub-skills** — one craft or way of thinking each: `data-analysis`, `explore-performance`, `grill-performance` — load the same way, by name: `get_skill(name: "data-analysis")`. The skill lists them all; the briefing names the one a task needs.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools (get_orientation, get_briefing and the rest) are not in this session, Epic Context is not connected here: say so, and tell the person how to connect it. In Claude Code in a terminal: run `claude mcp add --scope user --transport http epiccontext https://www.epiccontext.com/api/mcp` in the shell, then in a session type /mcp, pick epiccontext and choose Authenticate to sign in in the browser. In the Claude desktop app: Settings → Connectors → Add custom connector, with the same address.
