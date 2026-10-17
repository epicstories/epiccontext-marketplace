# Decision Tree: Which IA pattern?

Picking a navigation/structural pattern. Wrong pattern makes content hard to find regardless of how good individual nodes are.

## Start here

**What kind of content/capability are users navigating?**

```
├─ Hierarchical: clear parent-child relationships, single home for each thing
│   → A. Hierarchical
│
├─ Faceted: items have multiple attributes, users filter rather than drill
│   → B. Faceted
│
├─ Hub-and-spoke: central dashboard connects to specialized areas
│   → C. Hub and spoke
│
├─ Flat: small content set, no real hierarchy
│   → D. Flat
│
└─ Mixed: different parts of the product have different patterns
    → E. Hybrid
```

---

## A. Hierarchical

**Best when:**
- Content has clear parent-child relationships (Categories → Subcategories → Items)
- Each item has one logical "home"
- Users build a mental map of the structure
- Most websites and many SaaS products

**Examples:** Documentation sites (Section → Topic → Article), e-commerce category trees, organization-chart-shaped content.

**Watch for:**
- Going too deep: primary tasks shouldn't be 4+ levels in
- Forcing items into one home when they belong in multiple (use faceted instead)

**Validation:** Tree test, walk personas through journeys

---

## B. Faceted

**Best when:**
- Items have multiple attributes that matter (price, color, size, location, date)
- Users want to filter and refine rather than drill
- The same item can be reached via multiple paths

**Examples:** E-commerce product listings, real estate searches, job boards, recipe sites.

**Watch for:**
- Faceted-when-hierarchical-would-do: small product lines don't need facets
- Filter overload: 15+ facets paralyzes users

**Validation:** Walk personas through their typical filtering behavior

---

## C. Hub and spoke

**Best when:**
- A central dashboard ties together specialized areas
- Users have a "home base" they return to
- Different surfaces serve different goals

**Examples:** SaaS dashboards (Home → Reports / Settings / Integrations / Team), banking apps (Accounts → each specific account flow), CRMs.

**Watch for:**
- Spoke-only behavior: if users go directly to spokes and never the hub, the hub adds friction
- Spokes that don't talk to each other when they should

**Validation:** Behavioral analytics on hub-vs-spoke entry points

---

## D. Flat

**Best when:**
- Small content set (< 7-10 items)
- No clear hierarchy
- Marketing sites, simple apps, single-purpose tools

**Examples:** Landing pages, simple booking apps, minimal product sites.

**Watch for:**
- Outgrowing flat: when content reaches 12+ items, flat becomes a wall of choices

**Validation:** Quick usability test, ensure users can find each item in under 30 seconds

---

## E. Hybrid

**Best when:**
- Different parts of the product have genuinely different access patterns
- The product has both a marketing surface and an authenticated app
- Some areas are hierarchical (settings, docs) while others are flat or faceted (search, dashboard)

**Examples:** SaaS products with marketing site (flat) + app dashboard (hub-spoke) + admin (hierarchical) + search (faceted).

**Watch for:**
- Inconsistency that confuses: hybrid is fine if intentional; bad if accidental
- Each pattern needs validation in its own context

---

## Quick selection guide

| Content shape | Pattern |
|---------------|---------|
| Tree-like, clear hierarchy | Hierarchical |
| Items with multiple attributes, filterable | Faceted |
| Dashboard + specialized areas | Hub and spoke |
| Small content set, no hierarchy | Flat |
| Different shapes in different areas | Hybrid |

## Wrong patterns produce predictable failures

- **Hierarchical when items should be faceted** → users frustrated by single-home limitations, content categorized arbitrarily
- **Faceted when hierarchical would do** → over-engineered, filter clutter
- **Flat when hierarchy would help** → wall-of-buttons, no orientation
- **Hub-spoke without a real hub** → just a confusing flat menu

## Common failure modes this tree prevents

- **Pattern by template** — copying the navigation pattern of a similar product without checking if the content shape matches
- **Pattern by team comfort** — designers default to what they've used before
- **Forcing one pattern across the whole product** — sometimes hybrid is genuinely correct
- **Skipping validation** — pattern decisions need persona walkthroughs at minimum, tree tests for major IA
