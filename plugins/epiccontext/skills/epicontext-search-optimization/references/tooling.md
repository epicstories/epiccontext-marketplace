# Tooling Landscape

What to pull from where. Prefer the existing MCP servers and the existing graph anchors (Yext AEO, the named MCP servers) — orchestrate across the **Marketing** and **Performance** groups rather than inventing a new data layer.

> **Distrust any vendor quoting fixed citation percentages or guaranteed citation lifts. Prefer tools that surface the actual cited URLs (actionable) over those that only output a visibility score.**

---

## SEO data (MCP-accessible)

| Tool | Cost | Use |
|---|---|---|
| **GSC / mcp-gsc** | free | Ground truth for clicks/impressions/position. **The single most important source. Use clicks as the primary KPI** (EVD-SO-028). |
| **DataForSEO** | paid API | SERP features, AIO detection, volumes, competitor data — best for programmatic audits. |
| **Ahrefs / Semrush** | paid | Backlinks, keywords, content, plus bolted-on AI-visibility modules (Ahrefs Brand Radar, Semrush AI Toolkit) — shallower than pure-plays but bundled into existing contracts. |
| **Bing Webmaster Tools MCP** | free | Bing index health — matters because Bing feeds ChatGPT (EVD-SO-020). |

## SEA data (MCP-accessible)

| Tool | Cost | Use |
|---|---|---|
| **Google Ads MCP** | free | Quality Score components, search terms, PMax channel/asset reports, conversions. |
| **Microsoft Advertising** | — | Bing paid; smaller volume; retail PMax equivalent less mature. |

## AI-visibility / AEO tools (new category, $300M+ raised 2025–26)

| Tool | Position | Notes |
|---|---|---|
| **Profound** | enterprise leader | ~$155M raised; entry ~$499/mo; deepest, includes crawler-level data; tracks up to 10 LLMs. |
| **Peec AI** | mid-market | accuracy via UI scraping (simulates real users); from ~€85/mo; $21M Series A Nov 2025. |
| **Otterly.AI** | most accessible | $29/mo Lite, 15 prompts, 4 engines; Gartner Cool Vendor 2025. |
| **Others** | — | Scrunch, Evertune, AthenaHQ, Bluefish, KIME, ZipTie, Brandlight, SE Ranking Visible, AirOps (free tier). |

**Honest notes:** most case studies are self-published; *tracked ≠ improved*; SMBs should start with a **one-time audit, not enterprise monitoring**; legacy SEO suites' AI modules are "good enough if you already pay for them."

---

## Consistency with the existing library

Build on the **Yext AEO anchor** (EVD-SO-019) and the named MCP servers (mcp-gsc, DataForSEO, Ahrefs, Semrush, Google Ads MCP, Bing Webmaster Tools MCP). Orchestrate across the existing **Marketing** group (channels / campaigns / content pieces) and **Performance** group (analytics / KPIs / feedback-AEO tracking) — the skill *reads from* and *writes recommendations into* those groups, it does not stand up its own data layer.
