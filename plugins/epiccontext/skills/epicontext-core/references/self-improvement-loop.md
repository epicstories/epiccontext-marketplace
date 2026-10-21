# Self-improvement loop — log friction as a skill delta

**This is the loop that makes the skill base get better over time.**
When you encounter any of the situations below, don't just power
through — **call `propose_skill_delta`** so a platform admin can review
it. Unlike project-graph writes (which are direct), skill contributions
go through a review queue, because they change every project at once.
Accepting a delta does not by itself change the skill: an admin then
commits it (`commit_skill_delta`), which stores it as an overlay that
`get_skill` applies on top of the base file. Only from that point do
other projects' agents see your lesson — and the skill files in the
repo stay unchanged until someone folds the overlay in.

## When to propose a skill delta

Propose one whenever you hit:

1. **Confusion or contradiction** — an entity reference, a decision doc,
   or an example says one thing; the schema gatekeeper, the live graph,
   or another part of the same skill says another. Append a clarifying
   note as `append` to the affected reference file.

2. **Missing example** — you needed a worked example for a pattern (e.g.
   "persona for an enterprise security buyer", "JTBD for a recurring
   service business") and the `references/examples/` folder didn't have
   one. After you produce it for the user, propose it as a new file via
   `operation: "create"`.

3. **Missing evidence** — you made a recommendation but couldn't cite
   anything from the group's `evidence.md` (e.g.
   `epicontext-groups/references/users/evidence.md`). If you do know a trustworthy
   source for the claim, propose an `append` to `evidence.md` with the
   citation. Use the existing format (`EVD-<GROUP>-<NUMBER>`,
   claim/source/citation/caveat/used-in).

4. **New pattern observed** — a recurring structure you've now seen in
   two or more projects (e.g. "every fintech persona we make ends up
   needing a compliance officer flag"; "every B2B SaaS roadmap ends up
   needing a procurement milestone"). Propose this as either an example
   or, if generalizable, a new decision in `references/decisions/`.

5. **Schema gatekeeper rejected something** — a write you made got
   rejected with `validation_issues` because the block type was wrong, a
   required field was missing, or a connection was invalid. Propose an `append`
   to the relevant skill's `entities/<entity>.md` noting the gotcha, so
   the next agent doesn't repeat it.

6. **Anti-pattern you almost fell into** — you started doing something
   the skill explicitly forbids, caught yourself (or the user caught
   you). Propose appending it to the entity's "Anti-patterns to refuse"
   list if it's not already there.

7. **Project data or insight that could strengthen evidence** — during
   normal project work you encounter something worth citing in the
   global evidence library: a customer interview that triangulates a
   known claim, a KPI result that validates (or contradicts) a
   methodology, a research paper / industry report the user
   referenced, an ADR whose trade-off generalises beyond this project.
   Propose an `append` to the relevant group's `evidence.md`
   (`epicontext-groups`, `references/<group>/evidence.md`)
   with the same `EVD-<GROUP>-NNN` format used by the seed entries.

   Two flavours of source, both valid:

   - **Publicly verifiable source** (book, paper, industry report,
     conference talk, named blog post). Cite normally. Strong evidence.
   - **Project observation** (in-house research, anonymised user
     interview, KPI result from one or more projects). Cite as
     "EpicContext field observation — N projects, <year>" and use the
     **Caveat** line to make the empirical base explicit. Weaker than
     peer-reviewed but valuable when it triangulates published claims
     or fills a gap.

   **Strip project-specific names before proposing.** "AuctionMaster saw
   +N% conversion" is not evidence; "B2B service businesses exposing a
   'live availability' signal saw conversion lift in field observations
   (n=3 projects, 2025–2026)" is. The global skill base must not leak
   client-identifying data.

   Use the `source_ref` field on `propose_skill_delta` to link back to
   the originating project block(s) so the admin can verify the
   abstraction during review.

## How to propose (the call)

```
propose_skill_delta(
  skill_name = "epicontext-<skill>",            // e.g. "epicontext-groups"
  reference_path = "references/<file>",         // e.g. "references/users/evidence.md"
                                                // or "references/users/examples/<new-file>.md"
  operation = "append" | "create",
  proposed_content = "<the new content, in the same style as the surrounding file>",
  rationale = "<why this generalises beyond the current project>",
  source = "ai_chat"
)
```

Important details:

- **Match the style of the surrounding file.** Open the target file via
  `get_skill` first, see what existing entries look like, mirror them.
- **Generalize.** Strip project-specific names before proposing. The
  global skill base shouldn't contain "AuctionMaster CRM" — it should
  contain the abstract pattern that includes that case.
- **One delta, one idea.** Don't bundle five unrelated lessons into one
  append. Multiple proposals are fine.
- **Rationale is mandatory in practice.** "I learned X from project Y,
  and the pattern matches Z other projects in this kind of context" is
  what makes the admin's review fast and the decision easy.

## What you should NOT propose as a skill delta

- Project-specific facts ("Acme's tone of voice is friendly"). Those
  belong in the project graph, not the global skill base.
- Personal opinions without evidence.
- Restatements of what the skill already says.
- Fixes to syntax / typos in this codebase (those are PRs, not skill
  deltas).
