---
name: epicontext-context
description: "Use to make and keep the brain right: a fresh project or empty organisation (\"where do I start?\"), \"fill in the context\", a health check or audit, what the brain's editors found, orphans, broken _ref links, stubs, graph-vs-repo drift, the edges a block needs, glossary terms, section guides and project rules. Brain care: the editors first, then the fixes, each written with a reason."
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# Brain care — Is the brain right?

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-context", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-context/references/<file>")`.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools (get_orientation, get_briefing and the rest) are not in this session, Epic Context is not connected here: say so, and tell the person how to connect it. In Claude Code in a terminal: run `claude mcp add --scope user --transport http epiccontext https://www.epiccontext.com/api/mcp` in the shell, then in a session type /mcp, pick epiccontext and choose Authenticate to sign in in the browser. In the Claude desktop app: Settings → Connectors → Add custom connector, with the same address.
