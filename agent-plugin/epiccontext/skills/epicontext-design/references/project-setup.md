# Project setup — where components live, and who guards the door

Two decisions every EpicContext project makes once, and then lives with.
Both were previously made by accident, which is how one client shipped a
design system nobody could see and another sat behind a shared password.

---

## 1. The design system is the product. Storybook is not.

**Do not stand up a Storybook for a new project.** It is a parts viewer;
what EpicContext sells is a system — variants, rules, tokens and anatomy
in one place, the way Material or Carbon read. The book is that. A
Storybook beside it is a second thing to build, deploy, protect and keep
in step.

There is a structural reason too, and it is the stronger one.

**A story is a second declaration of the component.**
`LotCard.stories.tsx` describes states the application itself never
uses. The moment someone changes the component and forgets the story,
the design system shows something the product is not. "Components are
1:1 with the application" becomes a promise instead of a fact.

**Use a registry the application itself imports.** One module maps a key
to the real component and its variants; the app imports it, and so does
the preview route. What the book renders is then literally the module
the product renders — 1:1 as a property, not a convention.

Both files are at https://www.epiccontext.com/templates/epiccontext-preview/README.md
(`registry.example.tsx`, `page.example.tsx`, `README.md`), ready to copy.
The template is React / Next.js App Router — one stack among several:

```
src/design-system/registry.tsx    # key → component + variants
src/app/__ec/preview/page.tsx     # renders one entry, by key, isolated
```

Other frameworks: same shape, ~30 lines — read `key` and `variant` from
the query, look them up in the registry, render.

The preview route lives in the project's own deploy — one build, one
origin. But it must sit **outside** the gate, and that is not a detail:

```
EPICCONTEXT_GATE_PUBLIC_PATHS=/__ec/preview/
```

A browser fetching a framed page does not send cookies with all of its
sub-resources — `@font-face` requests are anonymous by specification —
so a preview surface behind a session gate cannot render. This is a
property of framing, not of any particular tool: it applies to a preview
route, a Storybook, a Ladle, or anything else that serves the pixels.

Opening it costs little. The route renders components with fixed props;
it has no data, no session and no API. The app around it stays gated.

Confirm it in an incognito window before wiring any spec to it. "It
loads for me" is the check that let a whole chapter ship blank.

### What this asks of how you build

No preview tool rescues a component that needs three contexts and a live
API to render. The requirement is architectural and you want it anyway:

- Presentational components take **props**, never fetch.
- Data loading lives in the route or container above them.
- Every variant is reachable by props alone, not by application state.

A component you cannot render in isolation is one you cannot document,
test, or reuse. The preview requirement is not documentation overhead —
it is the design rule that makes the rest possible.

### What the book renders natively (no frame)

Most of a design-system page is *not* a live component, and this is
where the visual quality is won:

| Part | Source |
|---|---|
| Colour, type, spacing, tokens | The graph — rendered natively |
| Anatomy, with numbered callouts | `anatomy` on the spec |
| Specs tables (sizes, structure) | `specs` on the spec |
| Variants, side by side | `variants` → the preview route, in a grid |

The frame is one element on a page that is otherwise ours.

### Fields that make a spec visible

| Field | Why |
|---|---|
| `preview_url` | The component in isolation. **Always an absolute URL** to the publicly readable preview route. A path is refused, not repaired — see below. (`story_url` is the old name for this field and is still read.) |
| `variants` | `[{ name, preview_url, when?, group? }]` — one entry per state. `group` buckets a long list; LotCard has 24 and "Buyer" / "Seller" is the difference between a wall and a reference. |
| `anatomy` | `[{ name, description?, x?, y? }]` — x/y are percentages of the frame and draw the number on the component. |
| `group` | Functional group, so the chapter's navigation works. |

`check_project_health` flags a spec with no visible preview, one whose
`preview_url` is still a path, and one that declares variants but
renders none. If the report is clean, they are genuinely visible.

### Already have a Storybook?

**Keep it if it serves the team — the rules don't change, the source
does.** (Corrected 2026-09-30, Robert: several client projects run a
Storybook and that is fine.) An existing Storybook is a legitimate
preview source when the same rules hold:

- Every component still gets its `component_spec` — the book stays the
  documented system; Storybook is the workbench behind it.
- `preview_url` and each variant point at the story's own **public
  iframe URL** —
  `https://storybook.example.com/iframe.html?id=button--primary&viewMode=story`
  — absolute URLs, never paths, never behind Basic Auth (a browser
  refuses that prompt inside a cross-origin frame). `story_url` is
  still read as the legacy field name.
- What failed the first time was the **path/proxy mechanism, not
  Storybook**: fonts and module scripts fetch anonymously, so a
  proxied path answered them with a sign-in page (ADR-047). Nothing
  about a Storybook makes a path work; a public absolute story URL
  works fine.
- Known limit: the Spacing tab's measure reporter lives in the
  registry preview template, so Storybook-framed specs keep their
  measured `specs` tables as the source of numbers.

For a **new** project, still prefer the registry: one declaration
instead of two, no story files to drift. And migrating later stays
cheap — the stories are the inventory of states; move each set of
props into the registry, delete the story.

**Why a path fails, so nobody tries it again.** A path used to be
rewritten onto the project's prototype proxy. The proxy authenticates
with a session cookie, and a framed application does not send cookies
with all of its sub-resources. `@font-face` requests are made
anonymously by specification, so they arrive at the proxy with no
session, get redirected to sign-in, and the browser receives HTML where
it expected a font:

```
OTS parsing error: invalid sfntVersion: 1008813135
```

`1008813135` is `0x3C21444F` — the bytes `<!DO`. The same happens to any
sub-resource the browser fetches anonymously, and no amount of URL
rewriting changes it: the request is unauthenticated before it arrives.

Proxying remains right for a **private prototype embedded in the book**,
where the request is a top-level navigation carrying its cookie. It is
the wrong tool for an application's own asset graph.

---

## 2. Prototype access: the EpicContext gate, not Basic Auth

**Default to public.** Most prototypes do not need a password, and every
password is one more thing to rotate and leak.

**When it does need protecting, use the gate**
(https://www.epiccontext.com/templates/epiccontext-gate/README.md — the full file
is also in `epiccontext-gate.md` beside this one): one `middleware.js`
at the project root, `EPICCONTEXT_GATE_SECRET` in the environment.

- No secret → public, and the file does nothing. That is the switch.
- Secret set → the visitor signs in with the EpicContext account that
  already has the project, and lands in the prototype *with* its context
  a click away.

**Do not use Vercel Deployment Protection or Basic Auth.** A shared
password is one nobody rotates and that gets pasted into chat threads;
it tells you nothing about who looked; and it cannot be embedded — a
browser refuses a Basic-Auth prompt inside a cross-origin iframe, so a
Basic-Auth'd deploy silently breaks every component preview in the book.

Two gates in front of one door means the first one wins, so turn
Vercel's off when installing this one.

### Never port the extension bypass

The Storybook gate this grew out of skipped auth for anything ending in
`.js`, `.json` or `.css`. On a static Storybook that is defensible. On
an application it means every API route ending in `.json` serves
unauthenticated. The gate skips nothing by default — not by extension, not by path — and
`EPICCONTEXT_GATE_PUBLIC_PATHS` names an exception explicitly when one is
genuinely needed. EpicContext's own test suite pins that behaviour.
