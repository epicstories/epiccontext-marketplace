# Traceability — every change cites the graph

When you produce code, copy, an ADR, a user story — cite which graph
entities it serves:

```
**Trace:**
- Page: pages/account-billing (content_page) ← the spine anchor
- Feature: features/folder-sync
- JTBD: jobs-to-be-done/keep-context-in-sync-with-code
- Persona: personas/product-team-with-claude-code
- Decision: decisions/use-mcp-streamable-http (if architecturally relevant)
```

A block without a real trace shouldn't exist. A line of code without a
trace to a block shouldn't ship.

## Why traceability is mandatory, not nice-to-have

The graph is the project's memory. Code without a trace becomes folklore
— next session opens, AI reads the graph, doesn't see the feature, treats
it as not shipped. That's not theoretical: it has happened in Epic
Context's own graph (features shipped in code, absent from the graph,
later sessions concluded "not shipped yet").

Traceability is the audit trail that lets:
- A new team member walk from a line of code → the block it serves →
  the persona that needed it
- An AI agent reason about what's in production vs. what's in flight
- A reviewer judge whether a change is in scope for the strategy
- A stakeholder commenting in the widget land on a real graph node

## Receipt to the user

After any task that changed the graph, give the user a short receipt:

> *"📋 EpicContext: read \<feature/X, persona/Y, decision/Z\>. Wrote
> \<N\> blocks — see /\<org\>/\<project\>/changes to review or undo.
> Updated \<M\> links."*

That receipt is the user's view of the trace. Include the `url` from
each write result so they can click through to verify.

## In commit messages

When you commit code that maps to a graph block, name it:

```
Add folder-sync watcher (features/folder-sync)

Trace:
- Feature: folder-sync
- JTBD: keep-context-in-sync-with-code
- Decision: use-mcp-streamable-http

https://claude.ai/code/session_...
```

This makes the commit history walkable from the graph and vice versa.
