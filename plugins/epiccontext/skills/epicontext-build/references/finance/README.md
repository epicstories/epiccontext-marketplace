# Epic Context — Finance

*Part of the Build expert (`epicontext-build/references/finance/README.md`), formerly the `epicontext-finance` skill.*

Populate, maintain, and analyze the Finance entity: what the product costs
to run, and the budgets it's measured against.

Finance sits in the **Build** group deliberately. Running cost is not a
finance-department abstraction — it's a property of the system that was
built. Change the architecture, swap a model, add a region, and the number
moves. Anyone reading Build should be able to see what their choices cost.

## When to use this skill

**Populating:**
- Scaffolding a new project's Finance layer at kickoff
- Capturing the current monthly bill from real invoices
- Recording a marketing budget and what it's spent through
- Adding a period to an existing cost chart

**Analyzing:**
- A cost jumped and nobody knows why
- Deciding whether a stack or architecture change pays for itself
- Checking spend against a budget before a period closes
- Working out cost per user, gross margin, or runway from the line items

**Reviewing:**
- Monthly: are the figures still the real ones?
- Pre-fundraise or pre-board: is the cost picture defensible?
- After a migration: did the number actually move the way the ADR said?

## Core principle

**Never invent a number.**

This is the one rule that matters more here than anywhere else in the
graph. A vision statement written from reasonable inference is a useful
draft. A cost figure written from reasonable inference is a lie that
someone will later put in a board deck.

If the real figure isn't in the repo, an invoice, a provider's pricing
page applied to known usage, or the graph — write the line item with the
value blank and say where the number should come from. A gap is honest and
fixable. A plausible-looking wrong cost is neither.

The corollary: **date every figure.** A cost without a period is
unreadable in six months, and cost context goes stale faster than any
other kind.

**Scaffold first, never block.** A new project gets a `running_costs` block
and a `budget` block with the structure in place and the figures empty.
That's the right starting state — the structure tells you which questions
to answer.

## The two entities

| Block type | Purpose |
|---|---|
| `running_costs` | What it costs to keep the product running: hosting, database, model/inference spend, third-party tooling, per-seat licences |
| `budget` | What's been allocated and what's been spent against it: a marketing budget, an infrastructure ceiling, a quarter's build budget |

Both live in the `finance` section and both map to the `finance` entity in
the Build group.

The split is *actuals* versus *allocation*. A `running_costs` block answers
"what did this cost"; a `budget` block answers "what were we allowed to
spend, and how much is left". Don't merge them — the moment you do, a
forecast starts reading as an actual.

## Show the number as a chart

Cost is a trend, not a snapshot. A table of twelve months tells you
nothing; a line tells you immediately whether you have a problem. Every
`running_costs` and `budget` block should carry at least one `~~~chart`
fence.

~~~chart
title: Monthly infrastructure cost
kind: stacked
unit: "€"
target: { value: 1200, label: Budget }
categories: [Jan, Feb, Mar, Apr]
series:
  - { name: Hosting, values: [180, 190, 195, 210] }
  - { name: Database, values: [340, 345, 360, 410] }
  - { name: Inference, values: [120, 260, 480, 690] }
~~~

Which kind to reach for:

| Question | Kind |
|---|---|
| What's the total, and what's it made of? | `stacked` — the shape of an infra bill |
| Is one number rising? | `line` |
| How did this period split? | `donut` — a single period only, never a trend |
| How do a few things compare? | `column`, or `bar` when the labels are long |

Conventions that make a cost chart readable:

- Always set `unit`. Put the currency there once, not in each value.
- Set `target` (or its synonym `budget`) wherever a ceiling exists — a
  cost chart is read *against* something.
- A month you don't have is `n/a`, never `0`. A zero draws a collapse that
  didn't happen.
- Keep a forecast in its own series, named as such. Never blend it into
  actuals.
- Break down by **what you could actually change**. A single "Cloud" line
  is unactionable; "Database", "Inference" and "Hosting" are three
  different decisions.

The full fence syntax is in `epicontext-core/SKILL.md` under "Markdown
conventions per shape"; the book draws the fence as a chart. Open the
block in the book after writing to check it rendered.

## How Finance connects

```
tech_stack ─────┐
                ├──► running_costs ──► kpi (cost per user, margin, burn)
infrastructure ─┘         ▲
                          │
decision (ADR) ───────────┘   "we moved off X; here's what it did to the bill"

budget ──► campaign / channel (Marketing)   "this is what spends it"
   │
   └────► business_case (Strategy)          "this is what justified it"
```

Read this as:

- **Every line item points at the system that produces it.** A cost with
  no `tech_stack` or `infrastructure` block behind it is a guess. This is
  the connection that makes the number actionable — you can't reduce a
  cost you can't trace.
- **An ADR that moved the number links to the cost block.** "We migrated
  the database" and "the bill fell 40%" belong to each other; separated,
  the next person re-litigates the decision without the evidence.
- **Cost feeds KPIs.** Cost per user, gross margin, burn rate and runway
  are all derived from these line items. The KPI block owns the target;
  Finance owns the input.
- **A marketing budget links to the campaigns spending it.** Don't restate
  the spend in the campaign block — link it, so there's one number.

## Order to populate

For a new project:

1. **running_costs** — list the line items you *know* exist (hosting,
   database, whatever's in the deploy config), values blank
2. Fill the values from the first real invoice
3. Link each line to its `tech_stack` / `infrastructure` block
4. Add a chart once you have two periods — one point isn't a trend
5. **budget** — only when there actually is an allocation. An invented
   budget is as bad as an invented cost.

For an existing project, mine what's there before asking: `package.json`
and the deploy config name the providers, migrations name the database,
and the model calls in the code name the inference spend. That gets you
the line items. Only the figures need a human.

## Maturity expectations

| Entity | Stub | Drafted | Validated |
|---|---|---|---|
| `running_costs` | Structure in place, figures blank | Every line named with a provider and a real period cost, charted, each linked to the system that produces it | Reconciled against actual invoices for the period, with a named owner who checks each cycle |
| `budget` | Structure in place | Total allocated, period, owner, and the lines it splits into, each linked to what spends it | Spend reconciled against real figures, review date in the calendar |

## Analyzing cost

**When a number jumps**, work it in this order:

1. **Which line moved?** A stacked chart answers this immediately; a total
   doesn't. If the block only records a total, that's the first fix.
2. **What changed in the same period?** A launch, a migration, a model
   swap, a traffic spike, a pricing change from the provider. Check the
   changes feed and the ADRs before theorising.
3. **Is it usage or is it price?** Usage rising with users is the product
   working. Price rising with flat usage is a contract problem. They have
   completely different responses.
4. **Does it scale with anything?** Per-user, per-project, per-1k-tokens.
   A total that scales is a different risk from one that doesn't — say
   which in the block.
5. **Write the answer into the block.** The prose under the chart is where
   "why did April double" lives. Link the ADR if there is one.

**When evaluating a change that affects cost** (a migration, a model swap,
a new provider), name three things or don't make the recommendation: the
current number, the projected number and where the projection came from,
and the one-off cost of getting there. A saving that takes three engineer-
weeks to realise is not a saving until you've said so.

## Anti-patterns to refuse

**Populating:**
- **Any figure you inferred rather than read.** Say the number is missing.
- A single total with no breakdown
- Figures with no date, period or currency
- Estimates presented as actuals, or a forecast blended into an actuals
  series
- Listing every SaaS subscription the company has, rather than what *this
  product* costs
- A cost line with nothing in Build behind it

**Analysis:**
- "Costs are too high" without naming which line and against what
- Recommending a migration on cost grounds without the one-off cost of
  migrating
- Treating a provider's list price as what you'd actually pay at your
  volume, without saying so

When refusing, offer the honest version. Example: "I can list the line
items from the deploy config and the stack block, but I can't fill the
figures — those come from the invoices. I've left them blank and named the
provider for each so you know which bill to look at."

## The discipline contract

Every Finance entity at maturity ≥ `drafted` must pass the six norms in
`epicontext-core/references/discipline.md`. Especially relevant here:

- **Evidence-aware** — a figure's source (invoice, provider dashboard,
  pricing page + usage) is part of the figure. A cost with no provenance
  is not drafted.
- **Specific-enough** — "cloud costs" is not a line item. Name the
  provider and the service.
- **Assumption-conscious** — every projection states what it assumes about
  usage. Projections without an assumption are wishes.

## When this skill ends

The skill ends when the cost or budget block is written. If the work
touches Build (the stack or infrastructure behind a line), Performance (a
cost-derived KPI), Marketing (a campaign spending a budget), or Strategy (a
business case built on these numbers), surface the need without expanding
scope.

## Improve this skill (self-improvement loop)

If you hit confusion, a missing example, a cost pattern this doesn't
cover, or the schema gatekeeper rejects something you wrote, call
`propose_skill_delta` rather than powering through. See `epicontext-core`
for the friction → delta pattern.
