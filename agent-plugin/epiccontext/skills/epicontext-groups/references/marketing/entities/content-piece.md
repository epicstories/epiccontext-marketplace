# Entity — Content Piece

A concrete artefact: blog, video, ad, landing page, social post, email. Drafted under a campaign, distributed on channels, voiced by the brand, and — ideally — built to occupy one Category Entry Point.

## Required connections

| Ref | To | Why |
|---|---|---|
| `campaign_ref` | `campaign` | Orphaned content rarely performs; link a campaign or mark evergreen with a reason. |
| `channels_ref` | `channel[]` | Where it's distributed. |

Recommended: `tone_of_voice_ref` → `tone_of_voice`; `features_ref` → `feature[]`; `messaging_ref` → `messaging_framework` (borrow the hook, don't invent it).

## Key fields (in the body)

- `format` — blog / video / ad / landing / social / email.
- `hook` / `key_message` — **borrowed from `messaging_framework`**, tied to the piece's CEP.
- `target_cep` — the single Category Entry Point this piece occupies (one per execution). The piece reads from the *situation*, not the feature spec.
- `dba_notes` — which Distinctive Brand Assets it carries (so the CEP↔brand link compounds).
- `status` / `published_url`.

> A landing page that occupies a transactional CEP doubles as the SEO/SEA answer page for that CEP's keyword cluster (shared content lifts paid Quality Score). See `epicontext-groups/references/marketing/search-optimization/ceps-and-search.md`.

## Maturity bar

| Stub | Drafted | Validated |
|---|---|---|
| Title + format + hook | Key message from messaging, voice respects tone_of_voice, channels wired, target CEP named | Published + measured against campaign KPIs |

## Anti-patterns

- No `campaign_ref` and not marked evergreen-with-reason.
- Hook/value-prop invented here instead of borrowed from `messaging_framework`.
- Cheeky voice when `tone_of_voice` says formal (or vice versa).
- Briefed from a feature ("has Gantt charts") instead of a CEP situation ("while planning a big launch").

## Worked example (compact)

```yaml
type: content_page  # content_piece role
key: blog-onboarding-without-the-chaos
maturity: drafted
campaign_ref: { blockKey: designer-onboarding-push-q1 }
channels_ref: [{ blockKey: organic-search }, { blockKey: founder-linkedin }]
tone_of_voice_ref: { blockKey: tone-core }
messaging_ref: { blockKey: messaging-core }
format: blog
target_cep: "when a freelance designer onboards a new client"
hook: "The first week with a new client decides the whole project."
dba_notes: "Lead colour + wordmark in hero; founder voice."
status: draft
```
