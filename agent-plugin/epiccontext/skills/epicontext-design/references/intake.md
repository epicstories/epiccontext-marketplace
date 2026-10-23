# The context intake — step 1

What to read from the graph before judging or generating, and which
principle each answer tunes. Never ask the user what the graph knows.

| Question | Read from | Tunes |
|---|---|---|
| Which direction are we moving to? | style cards (`brand_asset`, `asset_kind: style_card`), `brand_visual_identity` | P5, P6, step 0 |
| Who is this for, how expert? | `get_v3_entity entity=persona` | density, disclosure, language level |
| How often do they do this? (daily / weekly / once) | `journey_map`, `analytics` | P3 what may be left out, P5 how quiet the signature, P7 frequency-first hierarchy |
| Task screen or content page? | `journey_map` step, a node in the `ia_tree` | P7 task-first vs story-first; scanning standards |
| Device and platform mix? | `analytics` (Performance group), `tech_stack` | mobile/desktop blocks, native conventions |
| Intended experience and voice? | `positioning`, `tone_of_voice`, `brand_visual_identity` | P1, P2, P5 |
| What already exists? | `design_system`, `component_spec`s, `content_page` of this screen | P4 compose before inventing; step 7 drift |
| Which flow, how critical? (pay, sign-up, destructive) | `journey_map`, `feature` | floor: error prevention, confirmation; standards: forms |
| Locale and legal regime? (NL consumer, B2B, government) | project `overview`, `legal` | notation, accessibility law |

`get_briefing` (task type `ui-page` or `ui-component`) and
`get_context_pack` fetch most of this in one or two calls. Anything the
graph cannot answer is written down as an **assumption** in the output —
never filled in from general statistics without saying so.
