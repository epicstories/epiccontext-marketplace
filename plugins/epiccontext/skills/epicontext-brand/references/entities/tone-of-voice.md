# Tone of Voice

The **brand's writing personality** — the consistent voice across landing pages, in-app copy, onboarding emails, error states, and the widget. Tone is what makes a sentence sound like *this brand* and not any other.

A real tone-of-voice block has **named voice attributes**, **do/don't pairs** that make the attributes operational, and **example rewrites** that a copywriter (or AI) can use to evaluate any sentence.

## Why most tone blocks are too thin

The classic failure: three adjectives ("friendly, professional, helpful") and nothing else. Adjectives are aspirational; without operational rules they don't change a single sentence. A real tone block lets an AI or copywriter rewrite a sentence and *know* it sounds right.

## The depth bar

| Section | Stub | Drafted |
|---|---|---|
| Voice attributes | "Friendly, professional." | 3–5 attributes with a one-line definition of what each means *for this brand*. |
| Do / Don't pairs | absent | Per attribute: 3 do/don't pairs that make it operational. |
| Example rewrites | absent | 5+ pairs: "weak phrasing → on-tone phrasing" with a one-line reason. |
| Voice in different contexts | absent | How tone shifts (or stays) across error states, onboarding, marketing, support. |
| Anti-voice | absent | What this brand never sounds like. |
| Cited references | absent | Brands we admire / try to sound like (or not). |

## Depth checklist (BEFORE writing)

1. **3–5 voice attributes** with definitions.
2. **Do/Don't pairs** — 3 per attribute.
3. **5+ example rewrites** — weak → strong with reason.
4. **Voice across contexts** named.
5. **Anti-voice** — 2+ things we never sound like.
6. **Linked vision + positioning** — tone descends from both.

## Push-back prompts (AFTER drafting)

- **"Could I evaluate a sentence with this?"** If no, the tone is decorative.
- **"Are the do/don't pairs operational?"** "Be clear, not vague" is not a pair. "Say 'we couldn't process your payment' not 'something went wrong'" is.
- **"Does the voice shift across contexts?"** Error states + marketing should not sound identical. Name the shift.
- **"What does this brand never sound like?"** Anti-voice filters wrong copy out.
- **"Does it agree with positioning?"** A premium-positioned brand with playful tone may be confused — flag.

## Evidence pool

- **Linked vision + positioning.**
- **Live copy in the app** (`app/`, marketing site, emails) — what's the actual current tone?
- **Brands we admire / dislike** — examples.

## Maturity gating

| Maturity | Requirements |
|---|---|
| **stub** | Scaffold default (three adjectives). |
| **drafted** | All checklist items + 5+ rewrites + ≥3 do/don't per attribute + anti-voice. ≥400 words. |
| **validated** | Drafted + ≥1 page of live copy aligned + ≥1 third-party reader test ("does this sound like the brand?") confirms. |

## Anti-patterns to refuse

- **The adjective-only tone.** No operational rules.
- **The everywhere-the-same tone.** No context shifts.
- **The aspirational tone.** Doesn't match the live copy in the app.
- **The voice-without-anti-voice tone.** No filter against drift.

## Output schema (markdown body)

```
### Voice attributes (3–5 with definitions)
### Do / Don't pairs (per attribute)
### Example rewrites (weak → strong + reason)
### Voice in different contexts
### Anti-voice
### References (admired + avoided)
```

## Required connections (graph-level)

A drafted `tone_of_voice` block must:

- Link **vision** + **positioning** (tone descends from them).
- Be referenced *by* the **messaging** block and at least one **content_page**.

Tone with no live copy aligned is aspirational, not operational.
