# Severity anchors

Models cluster every finding at 2–3 unless they have something to
compare against; published evaluations show severity from LLMs matching
experts on average only because both sit in the middle. Anchors fix that.
Each is a real finding from a real critique, with the three factors
filled in. Add one from every critique that produces a clear case, via
`propose_skill_delta`.

Factors: **Frequency** (how many users, how often) · **Impact** (how
hard to recover, what is lost) · **Persistence** (once, or every time).

## 4 — Catastrophe (fix before release)

- A primary action (save, pay, send) gives no feedback at all; users
  submit twice or assume failure. F: all · I: data loss / double payment ·
  P: every time.
- A destructive action (delete account, cancel order) has neither a
  confirmation nor an undo. F: few · I: irreversible · P: every time.
- Cancelling a subscription is harder than starting it, or an upsell is
  styled as the primary button of a payment flow (deceptive pattern,
  P6). F: all affected · I: money and trust · P: every time.
- Keyboard users are trapped in an overlay with no Esc and no focusable
  close. F: keyboard users · I: cannot continue · P: every time.

## 3 — Major (high priority)

- White text on the brand primary #FF727A at **2.65:1** on every primary
  button, link and stat figure (Yellowbello, 2026-10). F: all users, every
  page · I: legibility of the primary action, legal risk under EAA · P:
  every time. *Anchor for "one token, whole site".*
- The search field on a page whose stated job is "search a product" is
  not among the first three things seen; the hero has no action
  (Yellowbello home, P1/P7). F: all · I: primary task delayed · P: every
  visit.
- Primary navigation collapses into a hamburger on mobile with room to
  keep three items visible (P3; NN/g 2016 +15% task time). F: mobile
  users · I: findability · P: every time.
- Open/closed status badge with white text on success green at **1.8:1**
  (verify text colour) — status is functional information. F: all · I:
  wrong trip to a closed shop · P: every time.
- A signature animation of 600 ms on an action performed many times a
  day (P5). F: daily users · I: time, irritation · P: every time.

## 2 — Minor (low priority)

- Counts in the primary navigation ("Producten 589.002") that duplicate
  stat tiles lower on the page (P3/P7). F: all · I: noise in the first
  second · P: every visit.
- A sticky assistant pill covering the last card of every carousel
  (floor: obscured content). F: all · I: one card unreachable until
  scroll · P: every scroll position.
- A full-width CTA band in the brand colour carrying a secondary action
  (P5 decoration, P7). F: all · I: competes with the primary action · P:
  every visit.
- Twelve random "newest" products on a local-index home page that help
  nobody find anything (P3). F: all · I: three rows of attention spent ·
  P: every visit.
- A new card variant with its own 14 px padding and 10 px radius next
  to the system's 16/12 (P4, P9). F: all · I: unity · P: every time.
- Icon-only wishlist heart in the header with no label (floor:
  signifiers). F: some · I: feature unknown · P: every time.

## 1 — Cosmetic

- A footer block of four feature icons with no action (P3, P8). F: few
  scroll that far · I: none · P: every visit.
- Letter avatars mixed with real chain logos in a store list (P4). F:
  all · I: slight inconsistency · P: every time.
- "Gidsen 2" in the navigation — exposing a count of two undermines the
  item (P7, tone). F: all · I: none functional · P: every visit.
- An icon optically 1 px off its text baseline, unrecorded (P9). F: all ·
  I: none · P: every time.

## 0 — Not a problem (noted only when raised)

- A manual, non-rotating store carousel: Runyon's 1% applies to
  auto-rotating hero carousels, not to a swipeable row.
- NL notation already correct (3.513 / €199,00 / 09:00-18:00).
- Logo top-left linking home, search top-right: conventions met.

## How to use

Score each finding by picking the nearest anchor, then adjust with the
three factors: a 2 that hits every user on a primary task every time may
become a 3; a 3 on a rarely used admin screen may become a 2. Write the
factors next to the score so a human can disagree with the reasoning,
not just the number.
