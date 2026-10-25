# The tools of the suite — what each is for

The tools of the suite's menu, in its order. "What it is for" is the
line every agent is told about the tool (`get_orientation` and
`list_tool_actions` give the same lines, only for the tools the organisation
has on). Context is always on; an organisation can switch every other tool
off.

You reach every tool through this one connection. The suite's own verbs —
`share_plan`, `write_note`, `hand_off`, `create_task`, `notify`,
`list_handoffs` — are tools of the Epic Context server; an installed tool's
actions run through `call_tool_action` (from `list_tool_actions`), with a
reason, under the same guardrails as a graph write.

| Tool | What it is for | How you reach it | What comes back |
|---|---|---|---|
| **Dashboard** | Each person's day: their cards, what waits on them, what is ready. | Nothing to call — it shows what you plan and hand off. | — |
| **Context** | What is true: brand, users, product, design, decisions. Truth goes here and nowhere else. | `get_briefing`, `get_book`, `search_blocks`; `create_block` / `update_block` with a reason | The book page (`url`) of every write; the changes feed |
| **Design** | The design system as a working thing: tokens, live components, brand assets, packages and versions. | Its knowledge — rules, component specs, decisions — is the Design group in Context: `get_briefing` (`ui-component`), and write specs there with a reason. | — |
| **Prototype** | The running app of a workspace and who may open it: per workspace its address, the Epic Context sign-in gate and a shared password, on the tool's own page. | Point reviews and Epic User runs at it. | — |
| **Notifications** | What someone must know but not do. Cards and questions you hand off arrive here too. | `notify` | The tools' own notifications (each kind can be muted) |
| **Kanban** | The planning: the plan of every build, and what is left for a person. | `share_plan` (or `call_tool_action` `kanban.share_plan`), `hand_off`, `create_task` | The card's `url`; steps a person moved show in the next `share_plan` answer and in `list_handoffs` |
| **Notes** | What you wrote along the way that is not truth: a session log, meeting notes, research notes, a draft. | `write_note` (same key = same note; `append` adds under it) | — |
| **Capture** | Meetings and chats into the brain: a recording or a chat clip becomes decisions, tasks and the transcript, each point with its quote. | Never record yourself: a person records, and only in an organisation that allowed it. Read what a meeting left — the transcript in Notes, the cards on the board, the decisions in Context — and don't ingest the same meeting again. | Decisions as `decision` (`assumed`, with the quote) and insights as `customer_insight`; what its editor doubts waits on one review card for who recorded it |
| **AI-Chat** | Conversations between people and Epic Work's assistant. | Not a place for an agent's output. | — |
| **Mail** | The team's mailboxes. | Not for agents: to tell a colleague something, `notify`; mail to customers stays with the tool that sends it. | — |
| **Processes** | Automations that run on their own (a trigger, steps, a schedule). | When a manual step keeps coming back, propose a process with `hand_off`; don't build one yourself. | A failed run notifies its owner |
| **Calendar** | Agendas and invitations. | Put a date on a card (`due`) rather than an event in someone's calendar. | — |
| **Research** | Research runs and reports on organisations and markets. | Ask for one with `hand_off` (kind `investigation`). | Its conclusions belong in Context — land them as blocks |
| **Analytics** | Numbers from the site, search and campaigns. | Read them in the graph (analytics and KPI blocks) before you judge a change. | If a number is missing, name what to measure — never invent one |
| **CRM** | Contacts, companies and deals. | Facts about customers belong here, not in Context; a follow-up becomes a card with `hand_off`. | — |
| **Social** | The one publishing channel: posts go out per brand after approval. | Its source is the content in Context (`content_piece`, tone of voice); its pictures and reels come from Content once a post is chosen. Never post yourself. | Published posts come back as `content_piece`, learnings as `customer_insight` |
| **User** | Synthetic user tests on the prototype. | Ask for a run with `hand_off` when a flow needs testing. | Findings come back into Context as `customer_insight` (assumed) |
| **Content** | Pictures and reels in the house style, from the organisation's own templates: a format per network (feed, story, reel), the brand's colours and fonts from Context. Only the organisation's members see it, and only their own templates. | Never render yourself: Social asks for the picture or reel once a post is chosen, and a product's site asks with its own key. Keep the brand and the design system right in Context. A new template is asked for with `hand_off`, to the person the user names. | Nothing into Context; the files go with the post in Social |

## What the apps write into Context

Reading is wide, writing is narrow. An app of the suite writes only the
block types it produces, with its own identity (the changes feed shows
"Connected app · Epic Social"):

| App | Writes |
|---|---|
| Epic Social | `content_piece` (what was published), `customer_insight` (what was learned) |
| Epic User | `customer_insight` (what a test found) |
| Epic Work | `research_data` (a research report), `customer_insight` |
| Epic Capture | `decision` (`assumed`, with the quote that decided it), `customer_insight` (what a meeting showed) |

Epic Content writes nothing into Context: it reads the brand and makes files.

The tone of voice and the rest of the brand come only from Context — no app
keeps its own copy.

## Notifications the tools send themselves

You never need to announce these; each person can mute each kind.

- Kanban: put on a card, a comment, a card moved, due tomorrow, overdue, a
  plan that has not moved in a week.
- Context: cards waiting for someone not yet in Epic Work, the editors'
  weekly round found points, the AI budget at 80% or 100%.
- Research: research ready or failed. User: a test run finished or failed, a
  content check found pages to fix. Processes: a run failed.
- Social: posts waiting for approval, a post that failed, empty or full
  slots, an account that needs attention.
- Capture: points of a meeting waiting for review, a recording that could
  not be processed (both to who recorded it).
- Calendar: an invitation, an answer to one.

## Settings

One gear in every app opens one settings menu: *You* and *Organisation*
(account, members, roles, invites, tools, keys, AI budget) are Epic
Context's, then one heading per tool. The workspace's running app and who
may open it are the Prototype tool's page (App URL & access). Changing a
setting is a person's call: hand it off (kind `setting`) rather than
changing it yourself.
