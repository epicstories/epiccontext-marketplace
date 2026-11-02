---
name: epicontext-strategy
description: "Use for strategy work: a diagnosis or crux, product strategy, business model, OGSM, roadmap, prioritisation, a business case or ROI, a strategic bet, choosing where to play, war-gaming or stalled growth; critiquing or steering a strategy. The Strategy expert, with Robert's standard: its method, then what this organisation and project know (get_skill with project_id)."
metadata:
  epic.requires: "business_case,business_model_canvas,obeya_board,ogsm,porters_five_forces,product_strategy_canvas,roadmap,strategic_group_map,swot_analysis"
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Epic Context — Strategy

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-strategy", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-strategy/references/<file>")`.
- **Its sub-skills** — one craft or way of thinking each: `business-case`, `business-model-canvas`, `consulting-problem-solving`, `explore-strategy`, `grill-strategy`, `kill-criteria`, `lean-canvas`, `ogsm`, `opportunity-solution-tree`, `playing-to-win`, `strategy-kernel`, `strategy-statement` — load the same way, by name: `get_skill(name: "business-case")`. The skill lists them all; the briefing names the one a task needs.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
