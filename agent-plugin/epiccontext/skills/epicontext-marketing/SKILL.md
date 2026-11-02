---
name: epicontext-marketing
description: "Use for marketing: go-to-market, a campaign, channel, content piece, blog post, ad, landing page, growth or acquisition; social and LinkedIn, posts and ads; SEO, SEA, GEO/AEO and AI search. The Marketing expert: its method and specialist skills, then what this organisation and project know (get_skill with project_id). Populates and audits the Marketing group against brand, strategy and personas."
metadata:
  epic.requires: "campaign,channel,content_piece,marketing_strategy"
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Epic Context — Marketing Group

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-marketing", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-marketing/references/<file>")`.
- **Its sub-skills** — one craft or way of thinking each: `copywriting`, `explore-marketing`, `grill-marketing`, `linkedin-ads`, `linkedin-posts`, `sea`, `search-optimization`, `seo`, `social-strategy` — load the same way, by name: `get_skill(name: "copywriting")`. The skill lists them all; the briefing names the one a task needs.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
