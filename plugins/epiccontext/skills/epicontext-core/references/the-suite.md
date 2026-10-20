# The suite — where each thing goes

Epic Context is the brain of a suite of tools: Kanban, Notes,
Notifications, Analytics, Social and more. You reach all of them through
this one connection; you never need another. You don't learn sixteen
tools — you learn where each kind of thing goes, and one verb for each.

## Five places, five verbs

| What you have | Where it goes | Verb |
|---|---|---|
| What is true: a decision, a feature, a persona, a rule | **Context** — the graph | `create_block` / `update_block`, with a reason |
| The plan of your work | **Kanban** — one card, a sub-card per step | `share_plan`: as soon as there is a plan, and again as steps start and finish |
| What is left for a person | **Kanban** and **Notifications** | `hand_off` (or `create_task` for one card) |
| What you wrote along the way: a session log, meeting notes, research notes, a draft | **Notes** | `write_note` |
| What someone must know, not do | **Notifications** | `notify` |

Numbers are read, not written: they are in the graph (analytics and KPI
blocks). A number you need and don't find is named as something to
measure — never invented.

`get_orientation` lists the tools the organisation has on, with one
line each on what it is for; `list_tool_actions` gives the same with the
actions of installed tools.

## Open what you touch, beside the chat

The person follows the work in the suite, not only in the chat. When your
client has a browser you can drive (Claude desktop's built-in browser,
Claude in Chrome), open there — in one tab, navigated to each new page:

| When | Open |
|---|---|
| You write a block | the `url` the write returns: its page in the book |
| You share a plan | the `url` share_plan returns: the card on the board |
| You change a component or a page | its page in the design system or its content page — the UI briefing names it on its first line |

Then say in the chat what changed. Without a browser, give the url. A
page that asks to sign in: the person signs in there once, never you.

## Every build has a plan

1. **As soon as you have a plan**, call `share_plan`: a title, the goal,
   the steps. Use the branch name as `key`.
2. **As you go**, call it again with the same `key` and the whole plan:
   a step that starts is `doing`, a finished one `done`. Send the whole
   plan each time — a step you leave out is cancelled.
3. **At the end**, send the final statuses, and `hand_off` what is left
   for people. The plan closes itself when every step is done.

A step that someone else does names them (`for`). People are found by
name or e-mail, never guessed — a name that fits nobody or two members is
refused with the candidates; ask the user.

A person can tick a sub-card off in Kanban. You see it in the next
`share_plan` answer and in `list_handoffs` — take it over instead of
setting it back.

## Notes, not truth

`write_note` is for what is worth keeping but is not a fact about the
product: what you did in a session, what was said in a meeting, what you
read. When something in a note turns out true — a decision, a learning —
write it to the graph as well (`create_block`, `log_learning`), and link
the note's key.

## Notifications

A notification asks one person's attention: who, what, why, a link. Use
`notify` for something they must know and not do (a report is ready, a
process is stuck); for something they must do, a card (`hand_off`). Never
notify someone about their own action, and never as status noise — what
changed is in the changes feed already.

The tools send their own notifications (a post that failed, a test run
that finished) and every kind can be muted. An agent never e-mails the
team.

## Each tool in one line

| Tool | Use it for |
|---|---|
| Context | What is true. Read before you work, write back with a reason. |
| Kanban | The planning: your plan (`share_plan`) and what is left for people (`hand_off`). |
| Notes | What you wrote along the way (`write_note`). |
| Notifications | What someone must know (`notify`). |
| Analytics | Numbers from the site, search and campaigns — read them in the graph before you judge a change. |
| Research | Research runs on organisations and markets — ask for one with `hand_off` (kind investigation). |
| Processes | Automations that run on their own — propose one with `hand_off` when a manual step keeps coming back. |
| CRM | Customers, companies, deals — customer facts belong there, not in Context. |
| Social | The one publishing channel — content pieces and tone of voice in Context are its source; never post yourself. |
| User | Synthetic user tests on the prototype — findings come back as insights. |
| Prototype | The running app of a workspace — point reviews and tests at it. |
| Mail, Calendar, Chat | People's mailboxes, agendas and conversations — not for an agent's output. |

An organisation may switch tools off; `get_orientation` shows which are
on. Without the suite, plans and hand-offs are kept in Epic Context and
`list_handoffs` shows them.
