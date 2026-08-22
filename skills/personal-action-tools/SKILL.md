---
name: personal-action-tools
description: Translate personal reviews, weekly focus, and planning notes into small action-focused tools without turning them into productive procrastination.
version: 0.1.0
platforms: [macos, linux]
metadata:
  hermes:
    tags: [personal-os, weekly-review, tooling, anti-procrastination, job-search, outreach, obsidian]
    category: personal-os
---

# Personal Action Tools

Use this skill when Ale asks whether an agent can build a tool, automation, script, assistant, tracker, or workflow helper after a morning/night/weekly review, especially when the current focus is income, job search, outreach, sleep regulation, or avoiding productive procrastination.

## Core principle

The tool must help Ale **accionar**, not optimize the system.

Before suggesting or building anything, anchor the tool to the live Weekly Note:

- `Main Focus`
- `Success Criteria`
- `Risks to Watch`
- `Not This Week`
- `Tasks to Send to Sunsama`

If the tool does not directly increase this week's action, treat it as an idea to capture, not execute.

## Decision filter

A tool is allowed this week only if it passes all of these:

1. **Direct action:** It helps submit, send, respond, decide, sleep, train, or close something already selected.
2. **MVP scope:** It can be useful in one small version; no full platform, scraping empire, redesign, or dashboard-first build.
3. **Anti-rabbit-hole:** It has explicit limits: max hours, input/output shape, and what it will not do.
4. **Weekly alignment:** It supports the current weekly focus more than it opens a new front.
5. **Manual escape hatch:** If automation fails, Ale can still use the output manually.

## Recommended response shape

When Ale asks "¿hay alguna herramienta que podrías construir para ayudarme esta semana?":

1. Start with the constraint:
   - "Sí, pero esta semana la herramienta tiene que ayudar a accionar, no a optimizar el sistema."
2. Recommend **one primary MVP** aligned with the Weekly Note.
3. Offer at most **two secondary tools**, clearly lower priority.
4. For each tool, include:
   - objective
   - what Ale inputs
   - what agent/tool outputs
   - what it writes/logs, if anything
   - anti-procrastination boundary
5. End with a clear recommendation: which one to build first and why.

## Common MVP patterns

### Job Sprint MVP

Use when weekly focus includes aggressive job search.

Purpose: reduce friction between seeing a job and applying.

Inputs:
- pasted job post, URL, or rough role description

Outputs:
- quick fit: high / medium / low
- role type: frontend classic / product+design+impact / technical-eval-heavy / unclear
- why it expands or contracts Ale's energy
- tailored mini pitch
- recruiter/application message
- checklist for applying
- optional Obsidian log entry with company, role, URL, status, next action, date

Boundaries:
- no scraping-first system
- no perfect ATS dashboard
- no delaying applications until the tool is complete
- success is more/better applications today

### Outreach Batch Drafter

Use when weekly focus includes contacting already-collected leads.

Purpose: convert existing leads into sent messages.

Inputs:
- CSV/Markdown/list of existing leads
- offer/problem statement

Outputs:
- short personalized message per lead
- status: ready / sent / follow-up / skip
- optional log

Boundaries:
- do not collect more leads
- do not redesign the sales system
- timebox the batch (e.g. 2h)
- success is messages sent, not database elegance

### Night Cutoff Bot

Use when sleep is a key weekly risk.

Purpose: protect sleep from AI/tools/research loops.

Outputs:
- Telegram reminders around cutoff time
- short, non-moralizing shutdown prompt

Boundaries:
- no heavy sleep analytics by default
- no guilt-based tracking
- success is cutting the loop earlier, not perfect sleep

## Pitfalls

- Do not offer a broad automation roadmap when Ale is trying to stabilize income.
- Do not treat a useful system idea as automatically executable this week.
- Do not build a tool that requires many hours before producing action.
- Do not create lead generation if the bottleneck is sending to existing leads.
- Do not create a job-search scraper if the bottleneck is applying to roles already found.
- Do not let dashboards/counts replace the actual action they measure.

## Verification before building

- [ ] The tool maps to a current Weekly Note success criterion.
- [ ] It has a first usable version.
- [ ] It has an explicit anti-procrastination boundary.
- [ ] It produces an artifact Ale can use immediately.
- [ ] The next action after building is obvious and small.
