---
name: epicontext-product
description: "Use for product work: a feature or product spec, the product overview, glossary and term definitions, information architecture, navigation, sitemap, content and microcopy, spec-vs-build drift. The Product expert: its method, then what this organisation and project know (get_skill with project_id). Populates, audits and analyzes the Product group."
metadata:
  epic.requires: "content_page,feature,feature_market_analysis,glossary,ia_tree,product_overview,taxonomy"
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Epic Context — Product Group

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-product", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-product/references/<file>")`.
- **Its specialist skills** — one craft each: `explore-product`, `grill-product` — load the same way, by name: `get_skill(name: "explore-product")`. The method lists them all; the briefing names the one a task needs.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
