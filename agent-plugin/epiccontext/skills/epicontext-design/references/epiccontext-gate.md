# The EpicContext gate — installable copy

> Generated from the published template at
> https://www.epiccontext.com/templates/epiccontext-gate/middleware.js.
> Do not edit here; the two are kept identical, because a second copy of
> security code that can drift from the first is worse than no copy at all.

This file exists so an **agent** can install the gate. `get_skill` serves
markdown under a skill's references but cannot read the published templates,
so without this the answer to "protect this prototype" was "ask a human
to copy a file". What an agent is expected to install, an agent must be
able to read.

## Install

Write the file below to the project root as `middleware.js` (or
`proxy.js` on Next 16 where that convention is already in use), then set
`EPICCONTEXT_GATE_SECRET` in the deploy's environment to the secret from
the project's settings dialog.

**Replace an existing root middleware; never place this beside one.** A
project moving off Basic Auth — the case this file is written for —
usually already has a `middleware.ts` at the root. A deploy runs one of
them, and which one is not something to discover in production. Merge in
anything else the old file did.

**Turn off Vercel Deployment Protection / Basic Auth — but last.** Two
gates on one door means the first one wins and nobody reaches this one,
so the old protection does have to go. The order is not a detail: a
project that removed its Basic Auth variables first stood completely
open until the gate deployed, and nothing said so — the old middleware
had disabled itself, the new one did not exist yet, and every request
returned 200 exactly as a healthy public site does. Deploy the gate,
check from a signed-out browser that a protected page redirects, and
only then remove the old variables.

```js
/**
 * EpicContext gate — sign in with EpicContext to view this deploy.
 *
 * Drop this file at the root of any Vercel project (Next.js or not) as
 * `middleware.js`. It replaces Basic Auth on prototypes: instead of a
 * shared password nobody rotates, a viewer signs in with the
 * EpicContext account that already has access to the project — so they
 * land in the prototype *and* have the context beside it.
 *
 * ─── Optional by design ────────────────────────────────────────────
 * No `EPICCONTEXT_GATE_SECRET` set → the deploy is public and this file
 * does nothing. Set the secret → only EpicContext members get in.
 * That is the whole switch; there is no third state to reason about.
 *
 * ─── Flow ──────────────────────────────────────────────────────────
 * 1. No token → redirect to EpicContext, which checks the visitor is a
 *    member of the project and signs a short-lived token.
 * 2. EpicContext redirects back with `?ec_token=…`.
 * 3. This gate verifies the HMAC, sets an HttpOnly cookie, and strips
 *    the token from the URL.
 * 4. Later requests carry the cookie.
 *
 * ─── One rule worth reading before editing ─────────────────────────
 * Nothing bypasses this gate by default — not by extension, not by
 * path. The Storybook middleware it grew out of skipped anything ending
 * in `.js`, `.json` or `.css`; on an application that serves every
 * JSON API route unauthenticated. A later version skipped `/assets/`,
 * which on a Vite project is the entire built bundle.
 *
 * If a deploy genuinely needs a hole, name it explicitly in
 * `EPICCONTEXT_GATE_PUBLIC_PATHS`. Prefixes only.
 */

const COOKIE_NAME = "epiccontext_gate";
const COOKIE_MAX_AGE = 60 * 60 * 24; // 24 hours
const TOKEN_PARAM = "ec_token";

export const config = {
  matcher: ["/(.*)"],
};

function getSecret() {
  return (
    process.env.EPICCONTEXT_GATE_SECRET ||
    // Accepted for projects migrating from the Storybook-only gate.
    process.env.EPICCONTEXT_STORYBOOK_SECRET ||
    ""
  );
}

function getEpicContextUrl() {
  return process.env.EPICCONTEXT_URL || "https://epiccontext.com";
}

/**
 * Nothing is public by default.
 *
 * An earlier version let through `/_next/static/`, `/assets/` and `/sb-`
 * on the reasoning that they "must load for the redirect page to
 * render". That reasoning was wrong: the redirect goes to EpicContext,
 * a different origin, which serves its own assets. Nothing on the gated
 * deploy is needed to draw a page the gated deploy does not draw.
 *
 * And the holes were real. `/assets/` is where Vite puts the entire
 * built bundle, so on a Vite project that one line handed out the whole
 * application source to anyone with the URL. `/sb-` assumed Storybook
 * at the root. Both were reported from a live deploy.
 *
 * An authenticated visitor carries the cookie, so their asset requests
 * pass; an unauthenticated one is redirected before any asset is asked
 * for. Gating everything therefore costs a middleware invocation per
 * asset and nothing else.
 *
 * `EPICCONTEXT_GATE_PUBLIC_PATHS` is the escape hatch — a
 * comma-separated list of path prefixes — for the deploy that genuinely
 * needs one. Prefixes only; never extensions.
 */
function publicPrefixes() {
  const raw = process.env.EPICCONTEXT_GATE_PUBLIC_PATHS || "";
  return raw
    .split(",")
    .map((entry) => entry.trim())
    .filter((entry) => entry.startsWith("/"));
}

function isPublicPath(pathname) {
  return publicPrefixes().some((prefix) => pathname.startsWith(prefix));
}

function base64UrlDecode(value) {
  const padded = value + "=".repeat((4 - (value.length % 4)) % 4);
  return atob(padded.replace(/-/g, "+").replace(/_/g, "/"));
}

async function hmac(data, secret) {
  const encoder = new TextEncoder();
  const key = await crypto.subtle.importKey(
    "raw",
    encoder.encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"]
  );
  const signature = await crypto.subtle.sign("HMAC", key, encoder.encode(data));
  return btoa(String.fromCharCode(...new Uint8Array(signature)))
    .replace(/\+/g, "-")
    .replace(/\//g, "_")
    .replace(/=/g, "");
}

/**
 * Constant-time-ish comparison.
 *
 * `a === b` on a signature leaks length and first-difference position
 * through timing. The window is small over a network, and closing it
 * costs four lines.
 */
function safeEqual(a, b) {
  if (a.length !== b.length) return false;
  let diff = 0;
  for (let i = 0; i < a.length; i += 1) {
    diff |= a.charCodeAt(i) ^ b.charCodeAt(i);
  }
  return diff === 0;
}

async function verifyToken(token, secret) {
  const parts = token.split(".");
  if (parts.length !== 3) return { valid: false, error: "malformed token" };

  const [header, payload, signature] = parts;
  const expected = await hmac(`${header}.${payload}`, secret);
  if (!safeEqual(signature, expected)) {
    return { valid: false, error: "bad signature" };
  }

  let claims;
  try {
    claims = JSON.parse(base64UrlDecode(payload));
  } catch {
    return { valid: false, error: "unreadable payload" };
  }

  if (typeof claims.exp === "number" && claims.exp * 1000 < Date.now()) {
    return { valid: false, error: "expired" };
  }

  return { valid: true, claims };
}

function parseCookies(header) {
  if (!header) return {};
  return Object.fromEntries(
    header.split(";").map((pair) => {
      const [key, ...rest] = pair.trim().split("=");
      return [key, rest.join("=")];
    })
  );
}

function signInRedirect(request) {
  const target = new URL("/auth/gate", getEpicContextUrl());
  target.searchParams.set("redirect", request.url);
  return Response.redirect(target.toString(), 302);
}

export default async function middleware(request) {
  const url = new URL(request.url);

  const secret = getSecret();
  // Public deploy. The gate is installed but switched off, which is the
  // normal state for anything that does not need a password.
  if (!secret) return undefined;

  if (isPublicPath(url.pathname)) return undefined;

  const tokenFromUrl = url.searchParams.get(TOKEN_PARAM);
  const cookies = parseCookies(request.headers.get("cookie"));
  const token = tokenFromUrl || cookies[COOKIE_NAME];

  if (!token) return signInRedirect(request);

  const result = await verifyToken(token, secret);
  if (!result.valid) {
    // An expired or tampered token is not an error page — it is someone
    // who needs to sign in again. Send them where that happens.
    return signInRedirect(request);
  }

  // Fresh from the URL: store it and strip it, so the token never sits
  // in the address bar, in history, or in a shared link.
  if (tokenFromUrl) {
    const clean = new URL(request.url);
    clean.searchParams.delete(TOKEN_PARAM);
    const secure = url.protocol === "https:" ? "; Secure" : "";
    return new Response(null, {
      status: 302,
      headers: {
        Location: clean.toString(),
        "Set-Cookie": `${COOKIE_NAME}=${token}; Path=/; HttpOnly; SameSite=Lax; Max-Age=${COOKIE_MAX_AGE}${secure}`,
      },
    });
  }

  return undefined;
}
```

---

Sign in with EpicContext to view a deploy. One file, no framework
requirement, and off by default.

This replaces Basic Auth on prototypes. A shared password is a password
nobody rotates, that gets pasted into chat threads, and that tells you
nothing about who looked. This instead asks the visitor to sign in with
the EpicContext account that already has access to the project — so they
land in the prototype *and* have its context one click away, which is
the point of shipping the two together.

## Install

**Order matters. Do not remove the old protection first** — see step 5
before you start. A project that dropped its Basic Auth variables ahead
of the gate deploy stood completely open for a while, and nothing
announced it: the old middleware disabled itself, the new one did not
exist yet, and every request returned 200 exactly as a healthy public
site does.

1. Copy `middleware.js` to the root of the project (beside
   `package.json`). Next.js projects: rename to `proxy.js` if you are on
   Next 16 and already use that convention.

   **Replace an existing root middleware; never place this beside one.**
   A project moving off Basic Auth — which this file is meant to replace
   — usually already has a `middleware.ts` there. A deploy runs one, and
   which one is not something to discover in production. Merge the logic
   if the old file did anything else.
2. In EpicContext, open the project's settings and turn on **Require
   EpicContext sign-in**. It generates the secret.
3. Add that secret to the deploy as `EPICCONTEXT_GATE_SECRET`.
4. Deploy, and **verify from a signed-out browser** that a page you
   expect to be protected returns a redirect rather than content.
5. Only now turn off the old protection — Vercel Deployment Protection,
   Basic Auth, whatever the project had. Two gates in front of one door
   means the first one wins and nobody reaches this one, so the old one
   does have to go; it just goes last.

## Shared access without an account

A project can hand out one shared username/password for reviewers who
have no EpicContext account — the client's stakeholder, an external
developer. Set them in the project's **App URL & access** dialog
(the same fields that serve Basic-Auth-protected deploys), and the
gate's sign-in screen grows a second form: "or with project
credentials".

Both keys end in the same signed token, so this middleware stays a
single verifier and needs no change. The token records which key was
used (`via: "shared"`): a shared secret names no person, so the token
at least names the door. Members should still sign in — their token
names them, and they land in the prototype with its context a click
away.

This is NOT Basic Auth on the deploy. The deploy checks one thing —
the gate cookie. The credentials are checked by EpicContext, at the
gate, with a constant-time compare and a flat error.

## Making it public again

Remove `EPICCONTEXT_GATE_SECRET`. The gate stays installed and does
nothing. There is no third state to reason about: secret set means
members only, secret absent means public.

## What is and is not protected

**Nothing bypasses the gate by default.** Not by file extension, not by
path.

An earlier version of this file let through `/_next/static/`,
`/assets/`, `/sb-` and `/favicon`, on the reasoning that they "must load
for the sign-in redirect to render". That reasoning was wrong: the
redirect goes to EpicContext, a different origin that serves its own
assets. Nothing on the gated deploy is needed to draw a page the gated
deploy does not draw.

And the holes were real. `/assets/` is where Vite puts the entire built
bundle, so on a Vite project that one line handed out the whole
application source to anyone with the URL. `/sb-` assumed Storybook at
the root.

Extensions were never skipped, and that matters too: the Storybook gate
this grew out of let through anything ending in `.js`, `.json` or
`.css`. On a static Storybook that is defensible. On an application it
means every API route ending in `.json` serves without auth. If you port
rules from that file, bring neither list.

**If a deploy genuinely needs a hole**, name it in
`EPICCONTEXT_GATE_PUBLIC_PATHS` — a comma-separated list of path
prefixes, e.g. `/health,/public-docs/`. Prefixes only; never extensions.

An authenticated visitor carries the cookie, so their asset requests
pass. An unauthenticated one is redirected before any asset is asked
for. Gating everything therefore costs a middleware invocation per asset
and nothing else.

## Notes

- The cookie is HttpOnly, SameSite=Lax, 24 hours, and `Secure` over
  HTTPS. The token is stripped from the URL immediately, so it never
  lingers in history or in a link someone shares.
- An expired token redirects to sign-in rather than to an error page.
  Expiry is not a failure; it is a session ending.
- `EPICCONTEXT_URL` overrides the EpicContext origin for self-hosted
  installs. Defaults to `https://epiccontext.com`.
