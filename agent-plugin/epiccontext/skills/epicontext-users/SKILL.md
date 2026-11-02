---
name: epicontext-users
description: "Use for users and research: persona, JTBD, journey map, interviews, customer insight, competitor, voice of customer, discovery; transcripts, tickets or NPS answers to make sense of. The Users & research expert: its method, then what this organisation and project know (get_skill with project_id). Diagnoses patterns and recommends action from the evidence."
metadata:
  epic.requires: "competitor,customer_insight,journey_map,jtbd,persona,research_data,user_research"
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Epic Context — Users Group

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-users", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-users/references/<file>")`.
- **Its specialist skills** — one craft each, such as `explore-users`, `grill-users` — load the same way, by name: `get_skill(name: "explore-users")`. The method lists them all; the briefing names the one a task needs.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
