---
name: epicontext-core
description: "Use on EVERY task in an EpicContext-managed project — always relevant. The 5-step workflow (orient, read, write with a reason, connect, land), how to talk to the user about EpicContext, the hard gates (schema gatekeeper, locks, Stop hook), the coverage mandates, and which skill or reference to load next."
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.served: "get_skill"
---

# EpicContext — Core Rules

This skill is served by Epic Context. Before anything else for this task, load it there, through the Epic Context connector:

get_skill(name: "epicontext-core", project_id: "<the project you work on>")

That is the skill itself: the method as it stands today, with the edits made in Epic Context's settings, then what this organisation and project already know. This file only tells your tool when to use it.

- **The project id** is in the repo's `.epicontext`, in the session start, or in `list_projects`. Without a project, leave it out.
- **A reference the skill names** (`references/<file>.md`) loads the same way: `get_skill(name: "epicontext-core/references/<file>")`.
- **Never work from memory or from a copy on disk** (an older plugin, a `.claude/skills` folder): it lacks both.

If the Epic Context tools are not in this session, tell the person to connect the Epic Context connector (Settings → Connectors) and sign in.
