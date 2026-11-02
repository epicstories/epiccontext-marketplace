---
name: epicontext-design
description: "Use to design, judge, iterate on or choose between UI/UX designs in an EpicContext project: a screen, flow or component; a critique of a screenshot, Figma frame or prototype ('beoordeel dit scherm', 'welke variant'); directions or a redesign; the /design canvas; the design system and brandbook. The Design expert, with Robert's standard; get_skill with project_id adds the project's design rules."
metadata:
  epic.requires: "brand_asset,brand_moodboard,brand_visual_identity,component_spec,design_application,figma_embed,persona,storybook_link,tone_of_voice"
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Epic Context — Design

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-design", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-design/references/<file>")`.
- **Its sub-skills** — one craft or way of thinking each: `explore-design`, `grill-design`, `ios-hig`, `material-3` — load the same way, by name: `get_skill(name: "explore-design")`. The skill lists them all; the briefing names the one a task needs.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
