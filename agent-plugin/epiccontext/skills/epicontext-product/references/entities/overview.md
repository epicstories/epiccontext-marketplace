# Product Overview

The product's **definitional document**. Not marketing copy, not a feature list, not an elevator pitch — a clear, opinionated statement of what the product *is*, who it's for, the problem it solves, the shift it represents, how it works, and what makes it durable.

A real product overview lets a new team member, an AI client, or a stakeholder finish reading and answer the same three questions the same way: *what does this product do, for whom, and why does it win?*

## Why most product overview blocks are too thin

Common failure modes:

- **One-line vision + one-line value prop, nothing else.** That's a placeholder, not an overview.
- **Marketing voice replacing definitional voice.** "We empower users to..." instead of "The product does X for Y by Z."
- **No mechanism.** The block tells you *what* but not *how* — leaving the reader unable to predict what the product would do in any concrete situation.
- **No audience link.** "For everyone who…" instead of a linked persona block.
- **No bounds.** The product has no edges, so feature creep is inevitable.
- **No comparable.** No mention of what already exists in the world that the product is positioned against.

A drafted overview is more like an essay than a form. The user's EpicContext one-pager is the gold standard — read it for the shape, not the content.

## The depth bar

A drafted product_overview has these sections substantively filled, in roughly this shape:

| Section | Stub looks like | Drafted looks like |
|---|---|---|
| What it is | "A SaaS app." | 2–3 paragraphs: definitional statement + who it's for + the audience-specific framing. |
| The problem it solves | "Users find X hard." | The current state (named surfaces, named cost), what's been tried and didn't stick, the named consequence of doing nothing. |
| The shift | absent | The conceptual reframe — what's different *in kind*, not in degree. "Not a faster spreadsheet — a graph that the application is a projection of." |
| How it works | "It uses AI." | 3–7 named mechanisms with what each contributes. Specific enough to disagree with. |
| Scaffold-to-specialized | absent | How a new user gets to value on day 1 and how the product gets sharper over months. |
| How users see it | "Web app." | The actual surfaces, their roles, their audiences. If there are multiple builds / surfaces / modes, name them. |
| Integrations & boundaries | absent | What it talks to, what it owns vs. references, where its API/MCP surface sits. |
| Why it's durable | "Defensible." | The compounding mechanism — data, skill base, network, switching cost. Honest, not aspirational. |
| The bet | absent | The wager: why this becomes the standard way of doing this work. |
| Bounds | absent | What it does NOT do. Three or more explicit non-goals. |
| Value Proposition | "Faster, better." | A single sentence: "[Product] gives [audience] [outcome] by [mechanism], unlike [alternative which has limitation]." |
| Differentiators | "Unique." | Named comparables + the specific wedge against each. Honest about what they do better. |

## The depth checklist (run BEFORE writing the block)

1. **The elevator line.** "[Product] gives [audience] [outcome] by [mechanism], unlike [alternative]." If you can't write this, no overview yet.
2. **The audience.** Linked primary persona block. Not "users" — a *named* persona.
3. **The shift.** What does this product reframe? What's different *in kind*?
4. **The mechanism.** 3–7 components, named, with what each contributes.
5. **The bounds.** Three things the product does NOT do (or explicitly declines).
6. **The alternative.** What people use today instead. Linked competitor blocks.
7. **The capability map.** 3–7 capability areas, each mapping to one or more features (linked).
8. **The scaffold-to-specialized story.** What happens minute 1, day 1, month 1, month 6?
9. **The durability argument.** What compounds over time that makes this hard to copy?
10. **The bet.** One paragraph: why this becomes the standard way to do this.
11. **The downstream connections.** Features, journey maps, KPIs that descend from this overview.

## Push-back prompts (run AFTER drafting, as a critic pass on your own draft)

- **"Could I find this overview about another product with two find-replaces?"** If yes, you wrote marketing copy. Add the specifics that only fit *this* product.
- **"Does the mechanism explain *how* the product wins?"** If the reader can't predict the product's behavior in a new situation from your mechanism description, the mechanism is too abstract.
- **"Did I name the alternative?"** A product without a stated alternative has no positioning. Walk competitor blocks; name the strongest 2.
- **"What evidence am I sitting on that I didn't use?"** Walk persona blocks (pain quotes), customer_insight blocks (signals), research blocks (study findings). Pull at least three pieces into the body.
- **"Is there a bound?"** A product without bounds will become any product. Name three things it does NOT do.
- **"Is the durability honest or aspirational?"** "Network effects" is aspirational unless you can name the network. "Data moat" is aspirational unless you can name the data. Downgrade aspirational claims to hypotheses with explicit "if proven, this becomes a moat".
- **"Length check."** A drafted product_overview body is rarely under 700 words and rarely above 2500. Below: compressed where you should have reasoned. Above: lost the reader; trim or split.
- **"Am I sure this is `product_overview` and not `positioning` or `vision`?"** Vision is *where we're heading* (Brand). Positioning is *how we're seen* relative to alternatives (Brand). Overview is *what the product is and how it works* (Product). If your draft is mostly about positioning, move it.

## Evidence pool — where to mine

- **Linked graph nodes:** primary persona (their pain quotes), primary JTBD (the job we're hired for), competitor blocks (what alternatives look like), feature blocks (the capabilities to map), strategy block (the bet — overview should agree).
- **Brand vision / positioning blocks** — the overview should not contradict them; if it does, name the conflict, don't paper over it.
- **Research blocks** — pull validated insights into the "problem it solves" section.
- **The repo:** README files, marketing site copy, prior pitch decks. Use them as ingredients, not as the answer.
- **Comparable products:** at least name the two most-likely "what the user would use otherwise". If unknown, that's the first research question.
- **This skill's `references/decisions/`** — prior overview iterations, named pivots, positioning notes.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default, untouched. Placeholder phrasing visible. |
| **drafted** | All 11 depth-checklist questions answered. ≥700 words in body. One push-back round done. No "Replace with..." text. Linked to: primary persona, primary JTBD, ≥2 competitors, ≥3 features. Agrees with the project's strategy block (if one exists). |
| **validated** | Drafted + ≥2 cited external sources (industry framing, comparable products), prior pitch validated with ≥1 customer or stakeholder, agrees with brand positioning. |

## Push-back lines to use on yourself (or to surface to the user)

- *"Your overview has no mechanism. Read your own draft — can you tell me how the product actually works? If no, the reader can't either."*
- *"You haven't named an alternative. What does the user use today? If 'nothing,' you're claiming a green-field — that's almost never true. Find the closest comparable and write against it."*
- *"This block links to zero features. The capability map is missing. Add it — without it, the overview is unanchored from what's actually being built."*
- *"I have evidence in research block X that contradicts your differentiator claim. Should we weaken the claim, drop it, or surface the tension?"*
- *"Your bet section is one line. The whole overview turns on whether this bet is real. Expand it — or admit you're not yet making one."*
- *"Are you sure this is `product_overview`? The first three paragraphs read like brand positioning. Either move them, or rebalance toward what the product *does*."*

## Anti-patterns to refuse

- **The mission-statement overview.** "We empower X to do Y." Refuse — that's a tagline. Force a definitional statement.
- **The feature-list overview.** Bullet list of features with no framing. Refuse — that's a backlog, not an overview.
- **The mechanism-free overview.** "It uses AI" / "It's a platform." Refuse — force named components.
- **The unboundable overview.** No "what it doesn't do" section. Force at least 3 non-goals.
- **The orphan overview.** Links to nothing — no persona, no features, no strategy. Force the connections before claiming drafted.
- **Cloned overview.** If you could swap the product name and use this for any project, it's not specialized.

## Output schema (markdown body)

```
### What it is
### The problem it solves
### The shift
### How it works
### Scaffold first, specialize over time
### How users see it (surfaces, audiences)
### Integrations & boundaries
### Why it's durable
### The bet
### Bounds (what we do NOT do)
### Value Proposition
### Differentiators
### Capability map
```

Structured fields (`vision`, `value_proposition`, `target_users_summary`, `key_features`, `differentiators`, `success_metrics_summary`) mirror the body's key sections. The body carries the depth; the structured fields carry one-paragraph summaries that the dashboard, runtime, and exports use as snippets.

## Required connections (graph-level)

A drafted `product_overview` block must:

- Link **personas_ref** to the primary persona (≥1).
- Link **features_ref** to the core features (≥3) — the capability map.
- Link **metrics_ref** to the success metrics (≥1) OR `north_star_ref`.
- Link **epics_ref** to the active epics implementing the vision (optional but recommended).
- Be referenced *by* the project's strategy block (`product_strategy_canvas`) and brand `positioning` block.

A product overview that doesn't link to features is a description of nothing. Drift detection should flag it.
