# Evidence Library — Product Group

Cited data points from trusted sources for product decisions: information architecture, content, feature prioritization, glossary discipline.

**Principle: only data from a trusted source, only when actually available.**

---

## Information architecture and findability

### EVD-PRD-001 — Tree testing reveals findability problems quantitatively
- **Claim:** Tree testing measures whether users can find content in a proposed IA structure. NN/g recommends 25-50 participants per tree test for stable results, more for stratified samples.
- **Source:** NN/g
- **Citation:** [NN/g — Tree Testing](https://www.nngroup.com/articles/tree-testing/)
- **Used in:** ia-node, decisions/ia-pattern

### EVD-PRD-002 — Card sorting builds IA from user mental models
- **Claim:** Card sorting (open or closed) reveals how users naturally group concepts. NN/g recommends 15+ participants per user group for card sorts.
- **Source:** NN/g
- **Citation:** [NN/g — Card Sorting](https://www.nngroup.com/articles/card-sorting-definitive-guide/)
- **Used in:** ia-node

### EVD-PRD-003 — Most websites have IA problems traceable to internal structure bias
- **Claim:** NN/g's research finds the most common IA failure pattern is structure organized by the company's departments rather than user tasks ("About Us / Products / Services / News" pattern).
- **Source:** NN/g
- **Citation:** [NN/g — Information Architecture](https://www.nngroup.com/articles/ia-vs-navigation/)
- **Used in:** ia-node

---

## Content and microcopy

### EVD-PRD-004 — Plain-language content improves task success
- **Claim:** Content written in plain language (active voice, common words, short sentences) measurably improves task completion across audiences. NN/g studies of government and corporate sites consistently show 50%+ improvements when complex content is rewritten in plain language.
- **Source:** NN/g; plain language research from PlainLanguage.gov (US federal)
- **Citation:** [NN/g — Plain Language](https://www.nngroup.com/articles/plain-language-experts/)
- **Used in:** content, glossary

### EVD-PRD-005 — Microcopy at decision moments measurably shifts behavior
- **Claim:** Small content changes at decision moments (button labels, error messages, empty states) can shift conversion meaningfully — often more than larger redesigns. Documented by MailChimp, Intercom, and others in practitioner case studies.
- **Source:** Practitioner research (Kinneret Yifrah, *Microcopy: The Complete Guide*); A/B testing case studies
- **Caveat:** Specific numbers are case-specific; treat as directional. Don't claim "+12% conversion" generically.
- **Used in:** content

### EVD-PRD-006 — Voice-and-tone consistency aids comprehension and trust
- **Claim:** Inconsistent voice across product surfaces (different sections sounding like different products) reduces user trust and slows comprehension. Documented in content design literature.
- **Source:** Content design field research (Erika Hall, Sarah Richards); Karen McGrane on cross-platform consistency
- **Citation:** Hall, *Conversational Design*; Richards, *Content Design*
- **Used in:** content

---

## Feature prioritization

### EVD-PRD-007 — Outcome-Driven Innovation feature scoring
- **Claim:** Ulwick's Opportunity Score = Importance + max(Importance - Satisfaction, 0). Scores >15 indicate underserved opportunities; >12 indicates moderate opportunity. Scores need ~150-200 respondents per JTBD for reliability.
- **Source:** Strategyn / Tony Ulwick
- **Citation:** [Strategyn — Outcome-Driven Innovation](https://strategyn.com/jobs-to-be-done/jobs-to-be-done-needs/)
- **Caveat:** ODI methodology comes from a commercial firm; treat scoring formulas as one valid approach among several.
- **Used in:** feature

### EVD-PRD-008 — Kano model categorizes features by satisfaction profile
- **Claim:** Kano model classifies features as Must-Be (expected, presence doesn't satisfy but absence dissatisfies), Performance (more is better), Attractive (delighters), Indifferent, or Reverse. Used to avoid over-investing in features with low satisfaction return.
- **Source:** Noriaki Kano (1984), reproduced widely in product literature
- **Citation:** Multiple — see Folkestad & Johansson (2002) for academic treatment
- **Used in:** feature, decisions/feature-or-setting

### EVD-PRD-009 — Most "MVP" feature lists ship far more than needed
- **Claim:** Empirical product research consistently finds MVPs ship with 30-50%+ features that go unused or have minimal impact. Tracked in usage analytics across many SaaS products.
- **Source:** Pendo, Mixpanel, Amplitude analytics aggregations; Marty Cagan writings
- **Citation:** Aggregated industry analytics; Cagan, *Inspired*
- **Caveat:** Specific percentages vary; the directional finding is consistent.
- **Used in:** feature

---

## Glossary and terminology discipline

### EVD-PRD-010 — Terminology inconsistency causes measurable comprehension cost
- **Claim:** When the same concept is referred to by different terms across a product (or different concepts share a term), users slow down or fail tasks. Documented in technical writing and content design literature.
- **Source:** Plain language research; ISO 9241-110 (dialogue principles, including "consistency")
- **Citation:** PlainLanguage.gov; ISO 9241-110:2020
- **Used in:** glossary, content

### EVD-PRD-011 — Localization done at content layer drifts; localization at glossary layer holds
- **Claim:** Products that translate string-by-string accumulate inconsistencies across locales (the same term rendered three different ways in three places). Products that bind translations at the glossary/term level maintain consistency.
- **Source:** Content design / localization field literature
- **Citation:** McGrane, *Content Strategy for Mobile*; LISA (Localization Industry Standards Association) materials
- **Used in:** content, glossary

### EVD-PRD-012 — Nielsen 10 Usability Heuristics
- **Pointer:** Jakob Nielsen's 10 general principles for interaction design — visibility of system status, match real world, user control, consistency, error prevention, recognition over recall, flexibility, minimalist design, error recovery, help & documentation. The most-cited usability framework in the field; foundation for heuristic evaluation.
- **Citation:** [10 Usability Heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/) (NN/g); originally Nielsen, J. (1994), *Heuristic evaluation*, in *Usability Inspection Methods*.
- **Used in:** feature, ia-node, content

### EVD-PRD-013 — Don Norman design principles
- **Pointer:** Foundational human-centered design principles: affordances, signifiers, feedback, mapping, constraints, conceptual models. Shapes how interaction designers think about the relationship between users, systems, and the world.
- **Citation:** Norman, D.A. (2013). *The Design of Everyday Things: Revised and Expanded Edition*. Basic Books.
- **Used in:** feature, ia-node, content

### EVD-PRD-014 — Krug "Don't Make Me Think" simplicity principle
- **Pointer:** First law of usability: don't make users think. Self-evident or self-explanatory interfaces. Also formalized lightweight usability testing (3-5 users, regular cadence, fix what you find) as a practitioner standard.
- **Citation:** Krug, S. (2014). *Don't Make Me Think, Revisited* (3rd ed.). New Riders. Krug, S. (2009). *Rocket Surgery Made Easy*.
- **Used in:** content, feature

---

## Trusted sources for this group

- **NN/g** — IA, card sorting, tree testing, content, microcopy, usability heuristics
- **Jakob Nielsen** — 10 Usability Heuristics (foundational evaluation framework)
- **Donald Norman** — *The Design of Everyday Things*; foundational interaction principles
- **Steve Krug** — *Don't Make Me Think*; lightweight usability testing
- **Donna Spencer** — *A Practical Guide to Information Architecture*
- **Abby Covert** — *How to Make Sense of Any Mess*
- **Peter Morville & Louis Rosenfeld** — *Information Architecture* (the polar bear book)
- **Erika Hall** — *Conversational Design*, *Just Enough Research*
- **Sarah Richards** — *Content Design*
- **Karen McGrane** — *Content Strategy for Mobile*
- **Ginny Redish** — *Letting Go of the Words*
- **Kinneret Yifrah** — *Microcopy: The Complete Guide*
- **Marty Cagan** — *Inspired* (feature definition and prioritization)
- **Tony Ulwick / Strategyn** — Outcome-Driven Innovation feature scoring (commercial interest)
- **Noriaki Kano** — Kano model for feature categorization
- **April Dunford** — *Obviously Awesome* (positioning)
- **Jeff Sauro & James Lewis** — *Quantifying the User Experience* (statistical UX research)

## What's NOT in this library

- Vendor-specific case study percentages without primary source verification
- Marketing claims dressed as research
- AI-generated statistics
- Numbers without primary attribution
