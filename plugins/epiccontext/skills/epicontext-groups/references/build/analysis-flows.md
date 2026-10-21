# Analysis Flows — Build Group

## Flow 1: Diagnose

### A. Diagnose from the graph

Common Build diagnoses:

**Documentation-reality drift** — Architecture entity says one thing, the deployed code does another.
- Pull architecture entity. Walk through the actual codebase or production setup. Note divergences.
- Common drift sources: services added without architecture update; data flow changed; trust boundaries shifted.

**Design system not used** — Custom one-off components everywhere instead of system components.
- Pull design system entity. Inventory components in code (Product group). Cross-reference.
- Components built outside the system are drift candidates — either promote to system or refactor.

**Frontend-craft drift** — Performance budget exceeded, accessibility regressing, anti-patterns reappearing.
- Pull `tech-stack` entity (project_commitments block). Compare `performance_budget.targets` against current Lighthouse / RUM data.
- Compare accessibility commitment level against latest axe-core / manual audit.
- Walk `patterns_avoided` against recent PRs — has the team drifted back to listed anti-patterns?
- Common signal: marketing pages and app pages diverging in quality (tells you the patterns aren't shared).

**Backend-craft drift** — API contracts inconsistent, error semantics fragmented, auth checks missing a layer.
- Pull `tech-stack` entity (project_commitments block). Sample 10 endpoints; check error response shape consistency.
- Check auth model: is every endpoint covered by all the layers documented (route + RLS + app)?
- Run `EXPLAIN ANALYZE` on slow queries; compare against documented index strategy.
- Common signal: a new contributor added an endpoint that handles errors differently from the rest. Capture and reconcile.

**Decisions without ADRs** — Folklore accumulating about why things are the way they are.
- Pull all ADRs. Compare to the major architectural choices visible in the code.
- Major choices without an ADR are folklore-in-the-making. Capture before they're forgotten.

**Infrastructure scaling assumptions stale** — Documented capacity assumptions don't reflect current load.
- Pull infrastructure entity's `scaling_assumptions`. Check actual current load against assumptions.
- If actual load is meaningfully different, update assumptions and revisit bottleneck thinking.

**Legal entries past review date** — Law changes; entries don't.
- Pull legal entity. Check `last_reviewed` and `next_review`.
- Past review dates are immediate drift indicators.

### B. Diagnose from raw input

Inputs: code review, infrastructure audit, security review, compliance audit.

Process:
1. Extract candidate updates (new components, infrastructure changes, decisions made informally)
2. Compare against existing Build entities — what's documented, what isn't
3. Surface gaps between intent and reality

### Evidence-sufficiency gates

Before declaring a Build diagnosis:
- [ ] Multiple signals across multiple entities or code samples
- [ ] Tested against alternative explanation (drift vs. intentional change vs. measurement error)
- [ ] Connected to specific affected entities
- [ ] Recent enough to reflect current production state

## Flow 2: Summarize

Three audience formats:

**Internal:** Quick state check. Under 100 words. Current state, drift, next move.

**Team:** For engineering specifically. 200-350 words. State of the build, what's drifting, recommended remediation. Include the specific entities affected.

**Client:** Often goes to client engineering or technical leadership. 1-2 pages. State of the build at a level appropriate to the audience — abstract for non-technical, specific for technical. Always honest about what's documented vs. what's known but not yet captured.

## Flow 3: Recommend action

Default: recommend ONE action, explain why, name tradeoffs.

Build recommendations have ripple effects. Calibrated scale:

**Smallest — capture an existing decision as an ADR.** Documentation-only; describes what's already true.

**Medium — refactor to align with documentation.** Code change to match documented architecture or design system. Real work but contained.

**Larger — change architecture or stack.** Touches everything. Should generate its own ADR.

**Largest — full rewrite or vendor migration.** Multi-quarter, often multi-developer. Should rarely be the recommendation; usually the question is "do we really need this?"

Match recommendation size to evidence strength.

## Red Flags

**🚩 Recommending a "rewrite" from a few pain points.**
Stop. Rewrites are usually wrong. Most pain points are addressable within the existing architecture. Diagnose whether the architecture is actually the problem, or whether it's specific decisions, missing tests, or tech debt in specific areas.

**🚩 About to add a new dependency without checking against tech_stack rationale.**
Stop. Tech stack entries have rationale; new dependencies should align or generate a new ADR explaining why we're shifting.

**🚩 Vendor lock-in dismissed as "we can always migrate later".**
Stop. Migration costs are systematically underestimated. Lock-in is a real cost; flag it in the decision, not after.

**🚩 Architecture diagram updated without checking the code.**
Stop. Documentation drift goes both ways — sometimes the doc was right and the code drifted. Check.

**🚩 ADR being written for a decision already made and shipped without one.**
Stop. That's fine — backfilled ADRs are useful — but mark them as such. Don't pretend the ADR predated the decision.

**🚩 Legal entry updated without legal counsel review.**
Stop. The skill produces structure, not legal advice. For anything beyond stub maturity, named counsel review is required.

**🚩 Subprocessor added without DPA.**
Stop. GDPR Article 28 violation. Don't ship until DPA is signed.

**🚩 Design system component built outside the system "just for this feature".**
Stop. Either it's a one-off (justify why), or it's a system component (build it in the system). Don't accumulate "just for this" components.

**🚩 Performance budget exceeded but no one's flagging it.**
Stop. `tech-stack.project_commitments` documents a performance budget for a reason. If LCP, INP, or CLS targets are exceeded in production, that's a regression — either fix it or update the documented commitment with rationale. Don't silently let the budget become aspirational.

**🚩 Accessibility audit findings ignored or "deferred" indefinitely.**
Stop. WCAG 2.1 AA is not optional once committed (and the EU Accessibility Act made it legally required for many products from June 2025). "We'll fix it next sprint" repeated for six sprints is a red flag.

**🚩 New API endpoint introduced with different error shape than the rest.**
Stop. `tech-stack.project_commitments` documents the error semantics for a reason. Hyrum's Law: every shape clients see becomes contract. Conform to the existing pattern, or update the pattern with an ADR.

**🚩 Auth check in only one layer.**
Stop. `tech-stack.project_commitments` requires defense in depth (route + RLS + app-layer). A single layer is a single point of failure. If you're tempted to skip a layer "because the route guard already checks it," stop and reread the rationale.

**🚩 Hedging language about technical state.**
Stop. "The architecture might possibly need some adjustments" tells nobody anything. Be specific: "Service X has no monitoring; that's a gap."

**🚩 Recommendation that ignores the current team size.**
Stop. SRE practices that work at Google's scale don't apply to a 1-developer team. Match recommendations to operational capacity.

## When to refuse

- "Rewrite recommendation" requested without diagnosing whether the existing build is actually the problem
- Architecture changes recommended without an ADR being part of the recommendation
- Legal updates beyond stub level without legal counsel review
- Design system changes recommended without checking actual usage in code

Honest output: "Not enough evidence at this confidence level. Here's what we'd need: [list]."

---

## Cross-group considerations

Build-group signals (performance regressions, tech debt, security/legal exposure, accessibility gaps) often look "technical" but resolve in other groups — Strategy decides priority, Users decides severity, Product decides scope. See `epicontext-analysis/ANALYSIS.md` for the full method.

**Signals that typically originate here:**
- Performance regression (LCP, INP, CLS, bundle size)
- Tech debt accumulating in a specific area
- Accessibility audit findings
- Security or legal exposure surfaced
- Architecture decision overdue ("we keep working around X")

**Pull from these groups before judging:**
- **Strategy + Roadmap:** is fixing this on the roadmap, or are we treating it as background noise?
- **Users (persona, journey):** is this user-facing pain or hidden infrastructure? Different urgency.
- **Performance KPIs:** is the regression visible to users in metrics they care about?
- **Product (feature, IA):** which features depend on the affected area? Severity follows that traversal.
- **Legal:** does the issue create regulatory exposure (GDPR, accessibility law)? That changes urgency.

**Trade-off types specific to this group:**
- Fix now vs defer (tech debt as conscious choice, not accidental)
- Rewrite vs incremental (rewrites systematically underestimated — see `decisions/upgrade-vs-stay.md`)
- ADR vs Slack message (which decisions need persistent records — see `decisions/needs-an-adr.md`)
- Build vs buy vs partner (capability decisions cross into Strategy)
- Accept lock-in vs pay portability cost

**Default classification questions:**
- Is this user-facing pain, or hidden? (Different urgencies)
- Does the strategic roadmap accommodate the fix?
- Is there a regulatory or legal lens? (GDPR, EU Accessibility Act after June 2025, etc.)
- What's the cost of *not* fixing? (Sometimes the answer is genuinely "low" — that's OK if documented)
