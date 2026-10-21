# Evidence Library — Build Group

The Build group is more practitioner than research. Sources are heavier on engineering literature and standards than on peer-reviewed evidence.

---

### EVD-BLD-001 — ADRs prevent decision amnesia
- **Claim:** Architecture Decision Records (originally proposed by Michael Nygard, 2011) measurably reduce time-to-context for new contributors and prevent silent decision reversal. Adopted as standard practice across industry, popularized by ThoughtWorks Technology Radar.
- **Source:** Michael Nygard, "Documenting Architecture Decisions" (2011); ThoughtWorks Technology Radar entries on ADRs (2016+)
- **Citation:** [Nygard — Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
- **Used in:** adr, decisions/needs-an-adr

### EVD-BLD-002 — C4 Model for architecture diagrams
- **Claim:** Simon Brown's C4 model (Context, Containers, Components, Code) provides a consistent visual language for architecture across abstraction levels. Reduces ambiguity in architecture communication.
- **Source:** Simon Brown — *The C4 Model for Software Architecture*
- **Citation:** [C4 Model](https://c4model.com/)
- **Used in:** architecture

### EVD-BLD-002b — ISO/IEC/IEEE 42010 architecture description standard
- **Claim:** ISO/IEC/IEEE 42010:2022 (current edition) is the international standard for architecture descriptions of systems and software. Defines requirements on the structure and expression of an architecture description (AD), distinguishing between architecture (the thing) and the architecture description (the document). Originated as IEEE 1471:2000, fast-tracked to ISO as ISO/IEC 42010:2007, revised through 2011 and 2022 editions. The 42010:2022 standard suggests nine information items for ADRs in Appendix A.
- **Source:** ISO/IEC/IEEE 42010:2022 *Software, systems and enterprise — Architecture description*
- **Citation:** [ISO 42010:2022](https://www.iso.org/standard/74393.html); [iso-architecture.org](http://www.iso-architecture.org/ieee-1471/)
- **Used in:** architecture, adr

### EVD-BLD-003 — SRE practices reduce production incidents
- **Claim:** Google SRE practices — error budgets, SLIs/SLOs, incident response runbooks — measurably reduce both incident frequency and mean time to recovery when adopted with discipline. Documented across the SRE book series and industry adoption.
- **Source:** Google Site Reliability Engineering team — *Site Reliability Engineering* (2016) and follow-ups
- **Citation:** [SRE Book](https://sre.google/sre-book/table-of-contents/)
- **Caveat:** Full SRE practice is heavy for small teams; adapt principles, don't import wholesale.
- **Used in:** infrastructure

### EVD-BLD-004 — Design tokens enable scalable design systems
- **Claim:** Design tokens (atomic, named values for colors, typography, spacing) enable consistent application of design decisions across platforms and surfaces, and enable centralized changes (rebrand, theming) without touching individual components. The W3C Design Tokens Community Group reached its first stable specification in October 2025, providing a vendor-neutral format adopted by Style Dictionary, Tokens Studio, Figma, Sketch, Penpot, Framer, and others.
- **Source:** [Design Tokens Community Group W3C Specification](https://www.designtokens.org/) (stable as of 2025.10); originated at Salesforce design system team (Jon Levine, Jina Anne); Brad Frost — *Atomic Design* for component thinking
- **Citation:** [W3C Design Tokens Community Group](https://www.w3.org/community/design-tokens/); [Design Tokens specification reaches first stable version (Oct 2025)](https://www.w3.org/community/design-tokens/2025/10/28/design-tokens-specification-reaches-first-stable-version/)
- **Used in:** design-system

### EVD-BLD-005 — Vendor lock-in cost is usually underestimated
- **Claim:** Practitioner experience consistently shows that switching costs from established vendor relationships (databases, auth providers, hosting) are 2-5x higher than initially estimated. Migration projects routinely take longer and cost more than the budget for them.
- **Source:** Industry practitioner literature; Wardley Mapping guidance on vendor risk
- **Citation:** General — Simon Wardley's mapping work; ThoughtWorks Radar entries on vendor selection
- **Used in:** tech-stack, infrastructure, decisions/build-vs-buy-vs-partner (Strategy)

### EVD-BLD-006 — GDPR data inventory required for compliance
- **Claim:** GDPR Articles 30 and 35 require data processing inventories and impact assessments. Operational compliance (vs. just policy compliance) requires keeping these current with actual data handling.
- **Source:** GDPR official text; EDPB guidance; IAPP practitioner standards
- **Citation:** [GDPR Article 30](https://gdpr-info.eu/art-30-gdpr/)
- **Used in:** legal

### EVD-BLD-007 — Subprocessor DPAs required under GDPR
- **Claim:** Under GDPR Article 28, every subprocessor handling personal data on behalf of a controller must have a signed Data Processing Agreement. Missing DPAs are a direct compliance gap.
- **Source:** GDPR Article 28; EDPB guidance
- **Citation:** [GDPR Article 28](https://gdpr-info.eu/art-28-gdpr/)
- **Used in:** legal

### EVD-BLD-008 — React/Next.js performance rules (Vercel)
- **Pointer:** Vercel Engineering maintains 62+ rules across 8 categories (server caching, RSC serialization, parallel fetching, async, rendering, client-side optimization). Treat as canonical reference; consult before implementing patterns rather than restating here.
- **Citation:** [vercel-labs/agent-skills react-best-practices](https://github.com/vercel-labs/agent-skills/tree/main/skills/react-best-practices)
- **Caveat:** Applies only when the project is on React / Next.js. Some rules are Vercel-platform-specific (Fluid Compute, edge runtime); generalize the principle.
- **Used in:** tech-stack

### EVD-BLD-009 — Web Interface Guidelines (Vercel)
- **Pointer:** 100+ rules covering accessibility, interactions, state design, typography, and resilience. Used by Vercel internally; exposed as agent skill.
- **Citation:** [vercel.com/design/guidelines](https://vercel.com/design/guidelines); [vercel-labs/web-interface-guidelines](https://github.com/vercel-labs/web-interface-guidelines)
- **Used in:** tech-stack, design-system

### EVD-BLD-010 — Hyrum's Law and contract-first API design
- **Claim:** "With a sufficient number of users of an API, it does not matter what you promise in the contract; all observable behaviors of your system will be depended on by somebody." Implication: every observable behavior — including bugs and undocumented fields — becomes part of the contract once shipped. Contract-first design and explicit deprecation are required practices.
- **Source:** Hyrum Wright (Google); popularized in *Software Engineering at Google* (Winters, Manshreck, Wright, 2020)
- **Citation:** [hyrumslaw.com](https://www.hyrumslaw.com/); [Software Engineering at Google](https://abseil.io/resources/swe-book)
- **Used in:** tech-stack, adr

### EVD-BLD-011 — Distinctive frontend aesthetics over AI-generic defaults
- **Pointer:** AI models default to "safe" choices (Inter font, purple gradients, centered minimalism) that converge on a generic aesthetic. Anthropic's official frontend-design skill encodes the practice of committing to a clear conceptual direction and executing with precision.
- **Citation:** [anthropics/claude-code frontend-design SKILL.md](https://github.com/anthropics/claude-code/blob/main/plugins/frontend-design/skills/frontend-design/SKILL.md)
- **Used in:** tech-stack, design-system, brand

### EVD-BLD-012 — WCAG 2.1 / 2.2 AA as practical accessibility baseline
- **Claim:** WCAG 2.1 Level AA is the practical industry standard. Required by EU Accessibility Act (effective June 2025); referenced by US Section 508. Compliance covers keyboard navigation, screen reader compatibility, color contrast (4.5:1 body, 3:1 large/UI), focus management, semantic HTML, alt text, form labels.
- **Source:** W3C Web Accessibility Initiative
- **Citation:** [WCAG 2.1 Quick Reference](https://www.w3.org/WAI/WCAG21/quickref/); [WCAG 2.2 (Oct 2023)](https://www.w3.org/TR/WCAG22/)
- **Caveat:** Conformance ≠ usability. Pass AA, then test with real assistive tech users.
- **Used in:** tech-stack, design-system, legal

### EVD-BLD-013 — Postgres best practices (Supabase)
- **Pointer:** Supabase publishes Postgres patterns across 8 impact-prioritized categories: query performance, connection management, security/RLS, schema design, concurrency, data access, monitoring, advanced features. Includes incorrect/correct examples and EXPLAIN analysis.
- **Citation:** [supabase/agent-skills supabase-postgres-best-practices](https://github.com/supabase/agent-skills/tree/main/skills/supabase-postgres-best-practices)
- **Used in:** tech-stack, architecture

### EVD-BLD-014 — Design system ROI meta-analysis (productivity)
- **Claim:** Across the five canonical industry studies (Klüver 2019, Loomer 2016, Ray 2018, Slack 2019, Sparkbox annual surveys), design teams gain ~38% efficiency on average (range 31–50%) and development teams gain ~31% (range 20–47%) once a design system reaches maturity. Use the 30–50% productivity range as the defensible headline number, not the "671% ROI" figure that circulates from a single agency case.
- **Source:** Smashing Magazine — "One Formula To Rule Them All: The ROI Of A Design System" (2022), meta-analysis of five canonical studies. Replicated by Nielsen Norman Group and Forrester Total Economic Impact reports.
- **Citation:** [Smashing — ROI of a Design System (2022)](https://www.smashingmagazine.com/2022/12/roi-design-system/); InVision Design Maturity Model surveys; Sparkbox annual Design Systems Survey
- **Caveat:** Ramp-up is typically 6–12 months at ~20% of designer/dev time before full gains land. Year-2 positive ROI is conservative; compounding thereafter.
- **Used in:** design-system, decisions/in-graph-or-in-code

### EVD-BLD-015 — IBM Carbon case study (cost + speed)
- **Claim:** IBM's Carbon Design System team measured −75% design cost, −66% dev cost, and ~47% faster UI build time after adoption. The "47% faster" figure is the most-cited dev-side data point and the strongest single number to lead with in a stakeholder conversation.
- **Source:** IBM Carbon team — published case studies and design.ibm.com communications
- **Citation:** [IBM Carbon Design System](https://carbondesignsystem.com/); IBM design.com publications on Carbon ROI
- **Used in:** design-system
- **Caveat:** IBM's scale (thousands of products) makes adoption costs amortize across a larger base than most projects. Treat as upper-bound evidence, not target.

### EVD-BLD-016 — Salesforce Lightning case study (consistency + CSS reduction)
- **Claim:** Salesforce reported +60% productivity and −70% CSS volume after Lightning Design System adoption. The CSS-volume reduction is the most concrete artefact: it directly measures duplication eliminated by a token-and-component approach.
- **Source:** Salesforce Lightning Design System team
- **Citation:** [Salesforce Lightning Design System](https://www.lightningdesignsystem.com/); Salesforce engineering blog publications on Lightning ROI
- **Used in:** design-system

### EVD-BLD-017 — Reused components have lower defect density
- **Claim:** Empirical software engineering research consistently shows that reused, well-tested components carry measurably lower defect density than freshly written equivalents. Bugs found in a single source propagate as fixes to every consumer; bugs in duplicated markup require N-place corrections and routinely get missed. This is the engineering case for component-based architecture, distinct from the design-system-as-design-artefact case.
- **Source:** Mohagheghi, Conradi et al. — empirical studies on software reuse; Selby — defect density in reused vs. fresh code; broader CBSE (component-based software engineering) literature
- **Citation:** [ScienceDirect — Evaluation of impact of component-based architectures on software reusability](https://www.sciencedirect.com/) (search "component-based software reusability"); Mohagheghi & Conradi, *Empirical Studies of Software Reuse and of Open Source Software*
- **Used in:** design-system, architecture
- **Caveat:** Reuse without architectural discipline produces tight coupling, which negates the gains. "Components are independent units" is load-bearing for the defect-density result.

### EVD-BLD-018 — Cost of NOT having a design system
- **Claim:** Without a design system, an estimated 25–50% of design and dev time goes to rework, inconsistency fixes, and re-deciding problems already solved elsewhere. Accessibility becomes a per-screen audit liability instead of a per-component asset; brand inconsistency measurably affects conversion (trust → conversion). Onboarding cost scales with codebase entropy.
- **Source:** Brad Frost — *Atomic Design*; InVision Design Maturity Model report; Sparkbox Design Systems Survey commentary
- **Citation:** [Brad Frost — *Atomic Design*](https://atomicdesign.bradfrost.com/); InVision Design Maturity Model report
- **Used in:** design-system, decisions/in-graph-or-in-code

---

## Trusted sources

- **Michael Nygard** — ADRs (foundational)
- **Simon Brown** — C4 Model
- **ISO/IEC/IEEE 42010:2022** — international architecture description standard
- **Google SRE team** — *Site Reliability Engineering*
- **Software Engineering at Google** (Winters, Manshreck, Wright, 2020) — Hyrum's Law, code review norms, deprecation
- **Vercel Labs** — React/Next.js performance rules; Web Interface Guidelines
- **Vercel Design** — Web Interface Guidelines (UI patterns, accessibility, interactions)
- **Anthropic** — frontend-design skill (distinctive aesthetics)
- **Addy Osmani (Google)** — agent-skills repo (frontend-ui-engineering, api-and-interface-design)
- **Supabase** — Postgres best practices skill
- **W3C Web Accessibility Initiative** — WCAG 2.1/2.2 standards
- **W3C Design Tokens Community Group** — design tokens spec (stable Oct 2025)
- **Sandi Metz** — POODR; "wrong abstraction is worse than duplication"
- **Kent C. Dodds** — Epic React; component composition patterns
- **ThoughtWorks Technology Radar** — periodic stack guidance
- **Brad Frost** — *Atomic Design* — component thinking
- **Nielsen Norman Group** — "Design Systems 101" + ROI research
- **Smashing Magazine** — design system ROI meta-analysis (2022)
- **Mohagheghi & Conradi** — empirical studies on reuse and defect density (CBSE)
- **Reference design systems** — Shopify Polaris, IBM Carbon, Atlassian Design System, GOV.UK Design System, Google Material Design, Apple Human Interface Guidelines, Salesforce Lightning
- **Forrester Total Economic Impact** — periodic reports on design systems
- **InVision Design Maturity Model** + **Sparkbox Design Systems Survey** — annual practitioner data
- **Adam Wathan & Steve Schoger** — *Refactoring UI* — visual hierarchy and craft
- **Mark Richards & Neal Ford** — *Fundamentals of Software Architecture*
- **Sam Newman** — *Building Microservices*
- **Martin Fowler** — enterprise patterns
- **GDPR official text + EDPB guidance** — privacy compliance
- **IAPP** — privacy practitioner standards
- **OWASP** — security baselines (Top 10, etc.)
- **Vendor documentation** (always verify against current docs — Vercel, Supabase, etc.)
- **Simon Wardley** — Wardley Mapping (build vs. buy guidance)

## What's NOT in this library

- Marketing material from cloud providers
- Influencer / blogger opinions without primary source
- Stack popularity (Stack Overflow Developer Survey is interesting but not normative)
- AI-generated technical claims
