# Example — Blog post (hook, key message, voice, distribution, CEP)

A compact `content_piece` that borrows its hook from messaging, respects the brand voice, names its Category Entry Point, and is wired for distribution + search.

```yaml
type: content_page          # content_piece role
key: blog-onboarding-without-the-chaos
name: "Onboarding a new client without the chaos"
maturity: drafted
last_reviewed: 2026-06-19

campaign_ref: { blockKey: onboarding-mode-launch }
channels_ref: [{ blockKey: organic-search }, { blockKey: founder-linkedin }]
tone_of_voice_ref: { blockKey: tone-core }
messaging_ref: { blockKey: messaging-core }
features_ref: [{ blockKey: onboarding-mode }]

format: blog
target_cep: "when onboarding a new client"
hook: "The first week with a new client decides the whole project."   # borrowed from messaging
key_message: "Set up the project once, and nothing slips through."
dba_notes: "Lead colour + wordmark in hero image; founder first-person voice."
slug: /blog/onboarding-without-the-chaos
status: draft
```

**Why it's good:** the hook is borrowed from `messaging_framework` (not invented); it's written from the *situation* (the onboarding CEP), not a feature list; the voice traces to `tone_of_voice`; the `slug` lets the search skill treat it as the answer page for the onboarding keyword cluster, and the widget's "This page" panel can match it. Answer-first + a named source citation makes it citable in AI answers (Princeton GEO pattern).
