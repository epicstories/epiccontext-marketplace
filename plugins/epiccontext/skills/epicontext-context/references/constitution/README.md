# Constitution Expert

*Part of `epicontext-context` (`references/constitution/README.md`), formerly the `epicontext-constitution` skill. Paths below are relative to the `epicontext-context` folder: for `get_skill`, put `epicontext-context/` in front.*

Owns the project's governing rules: `glossary` terms and `section_guide`
entries. These are the rules-of-the-house that bind every other block.

## When to use vs not

- **Use** when adding a domain term that needs a canonical definition
  across the project, or when a section needs its own local rules /
  AI-agent configuration captured.
- **Not** for architecture decisions — those are `decision` ADRs;
  load `epicontext-groups/references/build/methodologies/adr-workshop.md`.
- **Not** for strategic constraints — those are strategy entities;
  load `epicontext-groups` (strategy).

## Block types you own

- `glossary` — domain terms with real definitions (origin, source,
  used-in).
- `section_guide` — one per section: that section's local rules and
  AI-agent configuration.

## The discipline contract

Every constitution entity at maturity ≥ `drafted` must pass the six
norms in `epicontext-core/references/discipline.md`. Especially:
**every glossary term cites its origin** (research / founder /
industry — never invented) and **every section_guide names the rule
it enforces**, not vague guidance.

## Anti-patterns to refuse

- Placeholder definitions (`TBD`, `Replace with…`, "to be defined").
  A term without a real definition is worse than no term — it
  pretends to exist.
- Glossary terms unused anywhere in `content_page` bodies or other
  blocks. If nothing references it, ask: is this a real concept or a
  preference?
- Section guides that restate `epicontext-core` rules. Those are
  global; the section_guide is for what's specific to THIS section.

Inherit everything else from `epicontext-core` (workflow, the
write-with-a-reason contract, locks and the schema gatekeeper). Don't
restate.
