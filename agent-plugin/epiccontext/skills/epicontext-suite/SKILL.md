---
name: epicontext-suite
description: >
  Use when work touches the Epic Suite or leaves something behind: a plan
  (share_plan), a hand-off, notes, a notification; which tool is for what
  (Kanban, Notes, Social, User, Prototype, CRM, Research, Analytics…); the
  organisation's shared context vs a workspace; a meeting or transcript;
  research; a feature turned into stories, tasks and cards.
metadata:
  epic.requires: ""
  epic.version: "1.0.0"
  epic.contenthash: "d6c599a6725f3dfb"
---

# Epic Context — Working in the Epic Suite

Epic Context is the brain of a suite of tools — Kanban, Notes,
Notifications, Analytics, Social, User, Prototype, CRM and more — and the
one connection an agent needs to reach all of them. You don't learn every
tool: you learn where each kind of thing goes, and one verb for each.

Every path below is inside this skill's folder. For `get_skill`, put
`epicontext-suite/` in front and drop `.md`.

## When to use this skill → which reference

| You are about to… | Read |
|---|---|
| Plan a build, hand something to a person, keep notes, tell someone something | `references/places-and-verbs.md` — the five verbs in full, plans, notes, notifications, opening what you touch |
| Decide which tool something belongs in, or what a tool does for you | `references/tools.md` — every tool, what it is for, how you reach it |
| Work for the organisation rather than one product, or decide where a block lives | `references/org-and-workspace.md` |
| Handle a meeting, research, a design in Figma, a post, a user test, the running app | `references/recipes.md` |
| Turn a feature into stories and tasks, as cards on the board | `references/feature-to-work.md` |

## The five places, five verbs

| What you have | Where it goes | Verb |
|---|---|---|
| What is **true**: a decision, a feature, a persona, a rule | **Context** — the graph | `create_block` / `update_block`, with a reason |
| The **plan** of your work | **Kanban** — one card, a sub-card per step | `share_plan` — as soon as you have one, and again as steps start and finish (no `share_plan` in your tools: `call_tool_action` with `kanban.share_plan`) |
| What is **left for a person**: an action, decision, approval, setting, question, investigation | **Kanban** and **Notifications** — a card for a named member | `hand_off` (one card: `create_task`) — never a list in the chat |
| **Notes** along the way: a session log, meeting notes, research notes, a draft | **Notes** | `write_note` (same key = same note; `append` adds under it) |
| What someone must **know but not do** | **Notifications** | `notify` |

Numbers are read, not written: they live in the graph (analytics and KPI
blocks). A number you need and don't find is named as something to
measure — never invented. `get_orientation` lists the tools the
organisation has on, one line each on what it is for; `list_tool_actions`
adds the actions of installed tools.

## Look first

Before you research, plan, advise, design or decide anything for the
organisation, read what the brain already holds:

1. `get_orientation` — with a project, its state and next step; **without
   a `project_id`**, the organisations you are in, each one's shared
   context (its decisions, plans, the suite, brand) and its workspaces.
2. `get_briefing(task_type, target)` or `search_blocks` for the subject;
   `list_handoffs` for open plans and cards from earlier sessions — continue
   a plan under its own key.
3. Build on what is there: the decisions (ADRs) and plans that govern the
   subject come before your own ideas.

**Research agents, subagents, web research and external tools can't reach
Epic Context.** Give them `get_context_pack(task_type, target, task)` in
their brief: one paste-ready summary — the decisions that bind, what is
known, what is missing, every source as `key@version` with its link. Paste
it as it is, and land what they bring back yourself.

## The organisation and its workspaces

Each organisation has one **shared context** (its org project): its
decisions and ADRs, its plans, the suite itself, the brand, the design
system, shared personas, the glossary. Every **workspace** (a project — one
product or tool) inherits those blocks and reads them as its own, marked
`[org]`.

- A question about the organisation, its tools, or an idea for a new
  product or tool starts in the **shared context**; a question about one
  product starts in **its workspace**.
- Differ from an org block in one workspace with `override_block` and a
  reason — never copy it. A block that is really the organisation's moves
  there with `move_block_to_org`.
- Detail (pinning, drift, promotion): `references/org-and-workspace.md`.

## Each tool in one line

| Tool | Use it for |
|---|---|
| Context | What is true. Read before you work (`get_briefing`), write back with a reason. |
| Design | The design system as a working thing; its rules and specs are the Design group in Context (`get_briefing`, `ui-component`). |
| Kanban | The planning: your plan (`share_plan`) and what is left for people (`hand_off`). |
| Notes | What you wrote along the way (`write_note`); what turns out true goes to Context too. |
| Capture | Meetings into the brain: decisions, cards and the transcript, each with its quote. Never record yourself; read what a meeting left. |
| Notifications | What someone must know but not do (`notify`). Tools never e-mail the team. |
| Dashboard | Each person's day; it shows what you plan and hand off — nothing to call. |
| Analytics | Numbers from site, search and campaigns — read them in the graph before you judge a change. |
| Research | Research runs on organisations and markets — ask with `hand_off` (kind `investigation`); conclusions land in Context. |
| Processes | Automations that run on their own — propose one with `hand_off`; don't build one yourself. |
| Prototype | The running app of a workspace and who may open it — point reviews and Epic User runs at it. |
| User | Synthetic user tests on the prototype; findings come back as `customer_insight` (assumed). |
| Social | The one publishing channel; its source is `content_piece` and tone of voice in Context — never post yourself. |
| Content | Pictures and reels from the organisation's own templates, in the brand from Context. Never render yourself: Social asks once a post is chosen. |
| CRM | Contacts, companies, deals — customer facts belong there, not in Context; a follow-up is a `hand_off` card. |
| Mail, Calendar, AI-Chat | People's mailboxes, agendas and conversations — not for an agent's output; a date goes on a card (`due`). |

An organisation may switch tools off; `get_orientation` shows which are on.
Without the suite, plans, notes and hand-offs are kept in Epic Context and
`list_handoffs` shows them.

## Recipes — the short version

| The work | The moves (full: `references/recipes.md`) |
|---|---|
| A meeting, a transcript | `write_note` (the raw notes) → `ingest_text` (decisions and insights, one revertible batch; a decision as `assumed`, with the literal quote) → `hand_off` (every action to its owner). Recorded with Capture: it did this already — read what it left |
| Research | Look first → brief the agents with what the brain holds → land findings as blocks with their sources (`assumed`) → notes to `write_note` |
| A build | `share_plan` (key: the branch) → keep it current → at the end final statuses, `hand_off` what is left, the session log to `write_note` |
| A design explained in Figma | `get_context_card` per persona / journey / feature, placed as is and linked — `epicontext-design/references/context-cards.md`; on a board, `epicontext-boards` |
| A social post | Write or update the `content_piece` (campaign, channel, tone of voice) in Context; Epic Social publishes after a person approves |
| A picture or a reel | Keep the brand and design system right in Context; Content makes it from the organisation's own template once Social chooses a post. A new template: `hand_off` |
| A user test | Ask for an Epic User run with `hand_off`; read the `customer_insight` blocks it writes back before you judge the flow |
| The running app, who may open it | The Prototype tool: per workspace its address, the Epic Context sign-in gate and a shared password, on the tool's own page |
| A feature → stories, tasks | Cards on the board: `references/feature-to-work.md` |

## The hard rules — keep these in view

1. **Truth goes to Context and nowhere else.** A note, a card or a chat
   message is not where a decision lives; write the block too, and link it.
2. **Every build has a plan on the board**, shared as soon as it exists and
   sent whole each time (a step you leave out is cancelled).
3. **What is left for a person goes to that person** — `hand_off` to a
   named member. People are found by name or e-mail, never guessed: a name
   that fits nobody or two members is refused with the candidates; ask the
   user.
4. **Never post, mail or invite on someone's behalf.** Social publishes
   after approval; tools send their own notifications; agents don't e-mail.
5. **The numbers are never invented.**
6. **Open what you touch, beside the chat** — the `url` a write or
   `share_plan` returns; without a browser, give the url.
7. **Never notify someone about their own action**, and never as status
   noise — the changes feed already shows what changed.

## Pairs with

`epicontext-core` (always — the workflow and the gates), `epicontext-context`
(making the brain right), the eight experts (what a block should say),
`epicontext-design` and `epicontext-boards` (context cards in Figma, Miro,
FigJam).
