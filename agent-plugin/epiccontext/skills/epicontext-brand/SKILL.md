---
name: epicontext-brand
description: "Use for brand work: vision, positioning, tone of voice, messaging, value proposition, brand promise; a brand workshop, voice guide or messaging framework; copy that must sound like the brand. The Brand expert: its method, then what this organisation and project know (get_skill with project_id). Populates, audits and analyzes the Brand group and checks the promise against the product."
metadata:
  epic.requires: "brand_positioning,messaging_framework,tone_of_voice,vision"
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Epic Context — Brand Group

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-brand", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-brand/references/<file>")`.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
