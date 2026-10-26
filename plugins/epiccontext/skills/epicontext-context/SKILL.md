---
name: epicontext-context
description: "Use to make and keep the brain right: a fresh project or empty organisation (\"where do I start?\", \"I just signed up\"), \"fill in / populate the context\", a health check or audit before a release, orphans, broken _ref links, stubs, graph-vs-repo drift, the edges a block needs, glossary terms, section guides and project rules. Writes the fixes with a reason."
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Epic Context — Making and keeping the brain right

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-context", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-context/references/<file>")`.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
