# Decision Tree: When to Flex the Voice

A consistent brand voice is the goal — but rigid application of a single voice across every context produces awkward, off-key copy. This tree decides when the voice should flex (channel, audience, moment) and when it should hold (regardless of pressure to deviate).

Voice should be recognizable across contexts. Tone within voice should adapt. The voice is the personality; the tone is what mood that personality is in.

## Start here

```
├─ Is this a high-stakes moment for the customer?
│   (e.g., error message, payment failure, account deletion, security issue)
│   └─ Tone: serious, calm, action-oriented; voice traits hold
│
├─ Is this a high-emotion moment?
│   (e.g., onboarding success, milestone, celebration)
│   └─ Tone: warmer, more enthusiastic; voice traits hold
│
├─ Is the audience meaningfully different?
│   (e.g., enterprise procurement vs. individual user, journalist vs. customer)
│   └─ Tone: shifts on formal/casual axis; vocabulary may shift; voice traits hold
│
├─ Is the channel constraining?
│   (e.g., 280 chars, push notification, in-app modal)
│   └─ Tone may shorten; voice traits compress, don't disappear
│
├─ Is there a regulatory or legal requirement?
│   (e.g., consent text, privacy policy, terms)
│   └─ Plain language remains; voice yields where law dictates
│
└─ Is someone pressuring you to "make it sound more professional"?
    └─ Hold the voice. Generic professionalism is the failure mode.
```

## When voice always flexes

**Crisis communications.** Whatever the brand voice, when something is genuinely wrong, the tone needs to be: clear, accountable, action-oriented. Casual or playful voices flex toward serious. Reserved voices flex toward direct acknowledgment.

**Error and failure states.** Even a playful brand should not make jokes when a user lost work. The voice still applies — but the *tone* in error states is consistently calm and helpful.

**Legal and regulatory.** GDPR consent, terms of service, privacy policies. The voice flexes toward clarity over personality. (Note: this doesn't mean *legalese* — plain-language legal is still on-brand for most modern brands.)

**Crisis-adjacent customer service.** A frustrated customer doesn't need wit. They need acknowledgment and resolution.

## When voice should NOT flex

**"Sound more professional" feedback.** Almost always means "sound more like every other brand." The whole point of having a voice is to not sound like every other brand. Push back.

**"Our enterprise customers expect formal language."** Enterprise buyers are humans. Formal-with-personality outperforms formal-without on perceived competence and trust. Resist the pressure to sand off the personality.

**"Just make it shorter."** Short copy still has voice. "Submit" vs "Send my request" vs "Let's go" — three voices, all 1-3 words.

**"Different writers, different voices."** Multiple writers should produce work that's recognizable as the same brand. If they don't, the voice system isn't enforced (see `../entities/tone-of-voice.md`).

**"Specific market we're entering."** Some voice choices may localize (humor, idioms), but the personality holds. McDonald's is still McDonald's whether the slogan is "I'm lovin' it" or its German equivalent.

## Channel-specific tone shifts

| Channel | Formal/Casual | Serious/Playful | Length | Notes |
|---------|--------------|-----------------|--------|-------|
| Long-form blog | Mid | Voice baseline | Long | Brand baseline applies fully |
| Email to clients | Mid-formal | Slightly more reserved | Medium | Warm-professional |
| Social (short) | More casual | More playful | Very short | Wit travels here |
| In-app microcopy | Casual | Functional | Tiny | Comprehension first |
| Push notifications | Casual | Functional | <50 chars | Action-oriented |
| Marketing site hero | Mid | Voice baseline | Short | Identity moment |
| Sales pitch | Mid-formal | Voice baseline | Variable | Confidence-forward |
| Press release | Formal | More reserved | Medium | Industry conventions |
| Legal/policy | Formal | Reserved | Long | Plain language remains |
| Error messages | Mid | Calm/serious | Short | Acknowledge, resolve, don't joke |
| Success messages | Mid-casual | Warmer | Short | Celebrate without overselling |

## Tone shifts by audience

| Audience | Adjustments |
|----------|-------------|
| Existing customers | Voice baseline; assume context they have |
| Prospects | Voice baseline; explain context they lack |
| Procurement | More formal; emphasize capability and reliability over personality |
| Decision-makers (CEO, etc.) | More direct; lead with outcomes |
| Engineers / technical | Technical depth allowed; jargon OK if shared |
| Press / journalists | Inverted pyramid; quotable; less personality more substance |
| Investors | Confident, specific, evidence-grounded; less playful |
| Internal team | Voice baseline applies; you're not exempt from your own voice |

## Common failure modes

**Voice abandonment under pressure.** First time a stakeholder says "this doesn't sound serious enough," the voice gets flattened. Now you have a brand voice that's never used.

**Voice rigidity.** The brand voice is "playful" so even the GDPR consent has a joke. Wrong moment.

**Channel inflation.** Started with 3 channels. Now have 12 channel overrides. The voice has fragmented into 12 sub-voices. Time to consolidate.

**Audience-as-excuse.** "Enterprise customers wouldn't get our voice." Often a stand-in for "I'm uncomfortable with the voice." Test the assumption with actual enterprise customers before flexing.

**Localization as voice rewrite.** Translating into a different language is fine; rewriting personality is not. Hire a voice-aware translator, not a generic one.

**Different mediums treated as different voices.** Video script reads like ad copy; ad copy reads like blog post; blog post reads like white paper. Same brand should have a recognizable through-line.

## Quick guide

| Situation | Decision |
|-----------|----------|
| Error message in playful brand | Tone: calm and helpful. Voice traits compress, don't disappear. |
| Press release | Tone: industry conventions. Voice still recognizable in word choice. |
| Push notification (<50 chars) | Tone: functional. One distinctive word can carry the voice. |
| Legal terms | Plain language; voice yields where law dictates exact phrasing. |
| Stakeholder asks "more professional" | Hold the voice. Show examples of similar brands using personality + professionalism. |
| Onboarding success | Tone: warmer than baseline. Lean into "we are enthusiastic" trait. |
| Pricing page | Tone: confident, specific. Voice baseline. |
| Crisis comms (outage, breach) | Tone: serious, accountable, action-oriented. Voice traits compress to honesty. |

## Sources

- [MailChimp Voice and Tone](https://styleguide.mailchimp.com/voice-and-tone/) — context-flexible voice exemplar (CC BY-NC 4.0)
- Nicole Fenton & Kate Kiefer Lee — *Nicely Said* (2014)
- Erika Hall — *Conversational Design* (2018)
- Anthropic Knowledge Work Plugins / brand-voice — context-aware enforcement
- David Ogilvy — *Confessions of an Advertising Man* (1963) — voice consistency at scale
- Eugene Schwartz — *Breakthrough Advertising* (1966) — five awareness stages affect tone

## Related

- `../entities/tone-of-voice.md` — operational voice rules (now in tone-of-voice)
- `../entities/tone-of-voice.md` — narrative voice description
- `../entities/messaging.md` — what's said (voice describes how it's said)
- `voice-register.md` — already-existing decision on register selection
