# Product Strategy

The bet. **Where the project is going, who it's for, what mechanism creates the win, and what's being declined to focus the bet.** A strategy is not a vision and not a roadmap — it's the wager that connects the two.

A real strategy is something you could *disagree* with. If your strategy block can be read aloud at a stakeholder meeting and nobody can object to anything in it, it's not yet a strategy — it's a mission statement.

## Why most strategy blocks are too thin

The screenshot-pattern: three short sections labelled "Bet", "Mechanism", "Decline", each two or three bullets long, no quantification, no audience link, no assumption named, no falsification condition. That isn't a strategy — that's a slide title.

A strategy block has to do five jobs:
1. **Pick a wedge.** Name the segment + the mechanism. Specific enough to disagree with.
2. **Name what's declined.** Without exclusions, there's no focus and no strategy.
3. **State assumptions.** What must be true for this to work? List them and watch them.
4. **Connect to the model.** How does this bet generate value and capture some?
5. **Set the review cadence + falsification condition.** A strategy is reviewable, not eternal.

If any of the five is missing, the block is stub.

## The depth bar

| Section | Stub looks like | Drafted looks like |
|---|---|---|
| The Bet | "We will help users." | One sentence: "We [verb] [specific audience] by [mechanism] within [horizon]." Specific enough to be wrong. |
| Mechanism | "Better UX." | A named approach with 3–5 concrete components and what each contributes. "Multi-provider aggregation + per-store enrichment via Maps + Gemma LLM content motor" is a mechanism. "AI-powered" is not. |
| What We Decline | "We focus on core." | Named markets/segments/capabilities/business models we are NOT pursuing — and *why* each was set aside. Without this, you haven't focused, you've wished. |
| Key Assumptions | "It will work." | 3–7 named assumptions, each with a way to test/disprove and the trigger that would force a reread. |
| Audience | "SMEs / pros." | Linked primary persona + primary JTBD. If the strategy doesn't link a persona, the audience is abstract — fix this first. |
| Business Model Link | absent | One paragraph: how the bet creates value, how value is captured (price + channel + unit-economics direction). |
| Review Cadence | absent | Quarterly minimum. Named owner. Named event triggers for off-cycle review. |
| Falsification | absent | "We'll reverse this strategy if [observable evidence] shows up." Without this, the bet is unfalsifiable — which means it isn't a bet. |
| Competitive Frame | "We're different." | 2–3 named alternatives (link competitor blocks). What they bet on, why we're betting differently, where we'd be wrong. |
| Time Horizon | "Long-term." | Named horizon (12/24/36 months) and what the world has to look like for the bet to be in/out at the end of it. |

## The depth checklist (run BEFORE writing the block)

1. **The bet, one sentence.** "We win [segment] by [mechanism] within [horizon]." If you can't write this, no strategy yet.
2. **The wedge.** What is the *narrowest* group this works for first? Name it. Strategies that work for "everyone" work for no one.
3. **The mechanism — specific enough to disagree with.** What components make it real? Why does this combination work where its parts alone don't?
4. **What's declined.** At least 3 things you're not going to do — markets, capabilities, business models. Each with a one-line "why not".
5. **The 3–7 key assumptions.** What has to be true? For each, name the way to test it and the signal that would falsify it.
6. **The competitive frame.** Who's the strongest alternative? Why don't they already win? Why are we positioned to take this wedge?
7. **The audience link.** Primary persona + primary JTBD. Linked, not just named.
8. **The business model link.** How is value created and captured? (Subscription, affiliate, transactional, hybrid — and the unit-economics direction.)
9. **The time horizon.** What does success look like in 12 months? 24? 36?
10. **The falsification condition.** What evidence would force a strategy rewrite?
11. **The review cadence + owner.** Who watches this, how often?

## Push-back prompts (run AFTER drafting, as a critic pass on your own draft)

- **"Is the mechanism specific enough to disagree with?"** "AI-powered" / "platform" / "ecosystem" / "best-in-class" are not mechanisms. A mechanism names *what you build* and *how the parts combine*. If yours reads like a tagline, rewrite.
- **"What are we declining — really?"** If the decline section reads "we focus" without naming what we're NOT doing, it's not focus, it's wishful thinking. Force at least three named declines.
- **"Where's the competitor block?"** A strategy with no named alternative is operating in a vacuum. Walk the competitor blocks; pull the strongest two into the body.
- **"Who feels this in the first 12 months?"** If you can't name a persona that would *notice* the strategy working, the audience is abstract. Fix this before claiming drafted.
- **"What would a skeptical investor ask?"** Write down the three sharpest questions, then answer them in the body.
- **"Have I been here before?"** Check `references/decisions/` and prior strategy blocks. If your current bet contradicts a prior committed strategy, that's a deliberation — name it explicitly. Don't quietly overwrite.
- **"Is this a strategy or a roadmap?"** A strategy says *what we bet on and why*. A roadmap says *what we build when*. If your block reads like a sequence of features, it's a roadmap. Move it.

## Evidence pool — where to mine

- **Linked graph nodes:** primary persona + primary JTBD (the audience), competitor blocks (the alternatives), customer_insight blocks (the signals justifying the bet), business_model_canvas (the capture model).
- **Strategic-group-map** if present — your strategy should locate you on the map.
- **OGSM block** — the strategy is upstream of OGSM; the OGSM is how the strategy becomes measurable.
- **Prior strategy / decision blocks** — read the history before proposing a new bet. Strategy revisions are events, not silent edits.
- **External evidence:** market reports, competitor public statements, industry-shift signals. Cite them — paste the relevant line in the body with a URL.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default, untouched. Placeholder phrasing visible. |
| **drafted** | All 11 depth-checklist questions answered. ≥500 words in body. At least one push-back round done. Linked to: primary persona, primary JTBD, business_model_canvas (or OGSM), ≥2 competitors. |
| **validated** | Drafted + cited external evidence ≥3 sources. Owner named. Cadence named. Falsification condition specific enough that a junior team member could spot the trigger in the wild. |

## Push-back lines to use on yourself (or to surface to the user)

- *"Your mechanism could describe ten different products. Tighten it until it can only describe yours."*
- *"You declined nothing concrete. What are you NOT going to do that a less-focused team would?"*
- *"I see a competitor block (X) with a stronger wedge in your declared segment. How do you take share from them — or are you betting they'll stay where they are?"*
- *"This strategy block doesn't link to a persona. The audience is whoever the reader projects onto it. That's not a strategy, that's a Rorschach."*
- *"Have you written the falsification condition? Without it, you can't lose — which means you also can't win."*
- *"Are you sure this is `product_strategy`? If you're describing pricing + channels + key activities, you may be writing the business_model_canvas. If you're describing what to build when, you're writing the roadmap."*

## Anti-patterns to refuse

- **The everything-strategy.** "We serve SMEs, mid-market, and enterprise across NL, BE, and DE." Force a primary wedge.
- **The mechanism that isn't.** "AI-powered platform." Refuse and push back.
- **No decline.** Force at least 3 named exclusions.
- **No audience.** Force a linked persona.
- **No falsification.** Force a named condition that would reverse the bet.
- **Strategy as roadmap.** A list of upcoming features isn't a strategy. Move it to a roadmap block; rewrite this as the underlying bet.

## Output schema (markdown body)

```
### The Bet
### Mechanism
### What We Decline
### Key Assumptions
### Audience
### Business Model Link
### Competitive Frame
### Time Horizon
### Falsification — what would change our mind
### Review cadence & owner
```

## Required connections (graph-level)

A drafted `product_strategy_canvas` block must:

- Link the **primary persona** (Users group).
- Link the **primary JTBD**.
- Link the **business_model_canvas** OR an **OGSM** block.
- Link **≥2 competitor** blocks (the alternatives this bet is fighting).
- Be referenced *by* at least one `roadmap` or `feature` block (downstream — what the strategy is producing).

A strategy with no downstream references is a manifesto, not a strategy. Drift detection should flag it.
