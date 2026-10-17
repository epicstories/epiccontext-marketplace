# Example: B2B SaaS Power User Persona

A research-backed B2B persona at *drafted* maturity. Use this as a starting point when adapting for B2B SaaS contexts where the user lives in the tool daily.

```yaml
id: persona-methodical-maya
type: persona
maturity: drafted
persona_type: qualitative
name: "Methodical Maya"
scope: "Used for: improving the daily-use surface of the analytics dashboard for power users"
one_line: "A senior analyst who lives in the tool 4-6 hours a day and treats it as her primary workspace, not a reference tool"

attitudes:
  - "Wants depth and control, not simplification"
  - "Trusts her own analysis more than the tool's recommendations"
  - "Resents UI changes that prioritize new users at her expense"

goals:
  - "Move from question to answer in under five minutes for routine queries"
  - "Build reusable analyses she can return to and share"
  - "Defend her conclusions with the underlying data exposed, not abstracted"

pain_points:
  - "Frequent UI updates break her muscle memory"
  - "Default views assume she's a beginner; she has to reconfigure every session"
  - "Sharing analyses with non-analysts requires a translation step the tool doesn't help with"

behaviors:
  - "Uses keyboard shortcuts heavily; rarely clicks through menus"
  - "Has 8-12 saved views and 20+ saved queries"
  - "Pins one screen and treats it as her home base"
  - "Reads release notes carefully before any update"

expectations:
  - "Power features stay where they are"
  - "Customization persists across sessions and devices"
  - "Advanced features are accessible without digging through onboarding flows"

context: "Lives in the dashboard during workdays. Often has it open alongside Slack, a SQL tool, and a spreadsheet. Frequently ends the day mid-analysis and resumes the next morning."

quotes:
  - source: research-2026-q1-interviews
    text: "Every time you redesign the homepage I lose 20 minutes finding things again. Just leave the power user surface alone."
  - source: research-2026-q1-interviews
    text: "I don't want suggestions. I want the data."

demographics_only_if_relevant:
  role: "Senior data analyst or analytics engineer"
  team_size: "Often a team of 1-3 in the analytics function"
  tenure_in_tool: "18+ months — past the learning curve"

evidence_sources: [research-2026-q1-interviews]
linked_jtbds: [jtbd-routine-analysis, jtbd-defensible-conclusions]
linked_journey_maps: [journey-daily-power-user-flow]
linked_competitors: [competitor-tableau, competitor-mode]
```

## Why this is "drafted" not "stub" or "validated"

**Drafted because:**
- Based on qualitative interviews (n≥5), explicitly cited
- Scope is narrow and specific (the daily-use surface)
- Behaviors and quotes trace to evidence
- Linked to JTBDs and journey

**Would become validated when:**
- Used in at least one design cycle
- Confirmed or refined by post-design research
- Updated based on at least one additional research source

**Would be a stub if:**
- Composed from product manager assumptions, no interviews
- Demographics-driven
- No quotes, no linked entities

## How to adapt this example

Things that travel to other B2B SaaS power-user personas:
- The "daily-use surface" framing as scope
- The pattern of muscle memory + customization + resistance to UI changes
- Power user uses keyboard shortcuts, has saved configurations
- Quotes that show resentment of features built for newer users
- Tenure in tool as a relevant demographic

Things specific to this example, change for your context:
- Analyst-specific behaviors (SQL, queries, saved views)
- The 4-6 hours/day usage pattern
- Specific competitor set

## Common adaptations

**For B2B SaaS where the persona is occasional, not daily:**
- Remove muscle memory complaint
- Add re-onboarding pain instead
- Behaviors shift to bookmarks and copying old reports

**For B2B SaaS where the persona is the buyer (not user):**
- Goals shift to ROI, vendor management, contract terms
- Pain points become procurement-related
- Quotes come from procurement and budget conversations

## Sources informing this example

- NN/g — *Personas Make Users Memorable*, *Just-Right Personas*
- EVD-USR-007 (3-6 personas per design context)
