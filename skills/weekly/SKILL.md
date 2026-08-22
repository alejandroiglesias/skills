---
name: weekly
description: Obsidian-assisted weekly interview that creates or updates the Weekly Note, defines Focus This Week, reads Daily Notes for patterns, extracts decisions, and prepares concrete weekly tasks.
version: 0.5.0
author: Alejandro García Iglesias
license: MIT
platforms: [macos]
metadata:
  hermes:
    tags: [personal-os, weekly-review, weekly-focus, reflection, planning, obsidian, interview-mode, voice-friendly]
    category: personal-os
---

# Weekly Review

## Purpose

Use this skill when the user invokes `/weekly`, wants to do the Sunday weekly review, create or update the Weekly Note, find patterns from the week, decide next week's focus, or convert reflection into concrete tasks.

The skill should behave like a guided weekly interview. It should ask one question at a time, accept text or voice-transcribed answers, use Obsidian context, and persist the result in the Weekly Note.

The goal is not productivity scoring. The goal is synthesis, direction, and a small number of clear decisions.

The weekly review must also be an evolutionary personal/professional reflection tool, not a superficial form. Avoid merely asking obvious status questions. Use lateral thinking to connect domains the user may not connect at first glance: money pressure, body/energy, romance/desire, fatherhood/logistics, creative/business impulses, avoidance loops, sleep, home environment, job search, client work, and identity. Turn patterns into insight, constraints, experiments, and actionable transformation.

## Core Principle

The Weekly Note is the live source of current focus.

Do not require a separate `Current Focus` note. A separate `Current Focus` note can become stale and should not be treated as the main source of truth.

If an `Operating Principles` note exists, use it only as stable background context, not as the live weekly focus.

The weekly review is a temporary focus contract:

> This is the game we are playing this week. At the end of the week, we review: continue, adjust, close, or pause.

The assistant should not replace the user's voice. The assistant should guide the review, notice patterns, ask about omissions, define `Focus This Week`, and append a concise synthesis.

## Obsidian Access

Prefer using the existing `/obsidian` skill/tool for all Obsidian operations.

Use `/obsidian` to:

- find or create the current Weekly Note
- find `Weekly Template`
- find Daily Notes from the current week
- find the previous Weekly Note when useful
- read the previous Weekly Note's `Focus This Week`
- optionally find `Operating Principles` if it exists
- read existing sections in the Weekly Note
- update matching sections when safe
- append the Weekly Interview

Do not hardcode local paths in this skill.

If `/obsidian` cannot write to the note, return a copy-paste-ready Markdown block.

## Safety Rules

- Never overwrite user-written content.
- Prefer append-only updates unless creating a new note from template or updating empty template sections.
- If a section already contains user content, append under it or add a `Weekly Interview` section.
- If there is ambiguity, ask before replacing.
- Do not write the user's personal reflections as if the assistant were the user.
- Keep the assistant's final feedback practical, concise, and pattern-aware.

## Interview Modes

At the beginning, infer or ask for a mode:

- `quick`: 5 questions, for low-energy reviews
- `normal`: 8 questions, default
- `deep`: 10-12 questions, only when the user asks for it

Accept control commands at any time:

- `skip`: skip the current question
- `short`: shorten the process
- `deeper`: ask one deeper follow-up
- `done`: synthesize and write the note now
- `cancel`: stop without writing

## Required Weekly Context

Before asking the first question, use `/obsidian` to gather context.

Look for:

1. Current Weekly Note.
2. Weekly Template.
3. Daily Notes from the current week.
4. Previous Weekly Note, especially `Focus This Week`.
5. Optional `Operating Principles`, only if available.

Read Daily Notes selectively. Do not summarize everything.

Extract patterns such as:

- repeated priorities
- repeatedly postponed items
- sleep/energy patterns
- anxiety or money pressure
- movement/training/meditation patterns
- family/child presence
- job applications and interviews
- client conversations
- active client work
- agency or service progress
- agency/ads/content progress
- technical practice
- rabbit holes or overplanning
- decisions that were made but not executed

## Preferred Weekly Template Sections

If the user's Weekly Template has these or similar sections, use them:

```markdown
#journal

## Focus This Week

### Main Focus
- 

### Active Fronts
- 

### Carryovers From Last Week
- 

### Not This Week
- 

### Success Criteria
- 

### Risks to Watch
- 

## What Actually Moved The Needle?
- 

## What Drained Me?
- 

## What Gave Me Energy?
- 

## Biggest Mistakes
- 

## Opportunities Emerging
- 

## Current Bottlenecks
- 

## What Should I Stop Doing?
- 

## Main Focus Next Week
- 

## Personal Notes
- 
```

If the template does not yet contain `Focus This Week`, add or append it during the weekly review.

If the exact headings differ, preserve the user's headings and map the answers into the closest matching sections.

## Focus This Week

Always define or update this section during `/weekly`.

Use this structure:

```markdown
## Focus This Week

### Main Focus
- 

### Active Fronts
- 

### Carryovers From Last Week
- 

### Not This Week
- 

### Success Criteria
- 

### Risks to Watch
- 
```

Meanings:

- `Main Focus`: the central game of the week.
- `Active Fronts`: projects or areas allowed to receive real work this week.
- `Carryovers From Last Week`: items that remain alive from the prior weekly focus or repeated Daily Notes.
- `Not This Week`: ideas or fronts to capture but not execute.
- `Success Criteria`: what would make the week feel successful.
- `Risks to Watch`: predictable traps, avoidance loops, energy risks, or context-switching risks.

The previous weekly focus should be reviewed explicitly.

Ask:

```markdown
Last week's focus was X.
Does it continue, change, narrow, pause, or close?
```

## Procedure

### 1. Gather context first

Use `/obsidian` to find or create the Weekly Note from the Weekly Template.

Then read the relevant Daily Notes for the week and the previous Weekly Note's `Focus This Week`, if available.

Do not overwhelm the user with raw context. Start with a small pattern preview.

Example:

```markdown
Before reviewing, I see 3 signals from the week:
- Job search appeared several times, but execution was not always consistent.
- Disrupted sleep seems to directly affect the morning.
- Active client work appears as a priority but still needs a concrete next step.
```

### 2. Review last week's focus

Before defining a new focus, review the previous weekly focus.

Ask one question at a time:

1. Did last week's main focus stay alive?
2. Which active fronts moved forward?
3. Which carryovers should remain alive?
4. Which fronts should be paused or marked `Not This Week`?

Do not assume that a carryover should continue. Ask whether it is still alive.

### 3. Ask one question at a time

Default normal flow:

1. How was the week personally? Energy, sleep, body, mood, anxiety, family.
2. What actually moved the needle?
3. What gave energy?
4. What drained energy?
5. What were the biggest mistakes or avoidances?
6. What opportunities are emerging?
7. What are the current bottlenecks?
8. What should stop or be reduced next week?
9. What should be the `Focus This Week` for next week?
10. What concrete tasks should become part of the weekly plan?

For quick mode:

1. What moved the needle?
2. What drained you?
3. What pattern matters most?
4. What is next week's focus?
5. What are the 3 concrete tasks?

Do not ask all questions at once.

### 4. Use context-aware follow-ups

After open answers, ask about important omissions.

Examples:

```markdown
Client work appeared in multiple Daily Notes, but I don't see a clear recorded advance.
Was the bottleneck clarity, time, resistance, or missing next step?
```

```markdown
Sleep came up several times. Do you want to treat sleep as a protected operational priority next week?
```

```markdown
An agency system appeared as an opportunity. Should it stay active this week or be contained inside its existing blocks?
```

Do not accuse. Ask to classify:

- moved forward
- still important
- postponed intentionally
- deprioritized
- avoided/resistance
- not for this week

### 5. Distinguish reflection from focus and decisions

The weekly note should preserve three layers:

1. `Focus This Week`: the live weekly focus contract.
2. User reflection, mapped to the Weekly Template.
3. Assistant synthesis, appended clearly below.

The user reflection may contain subjective language.

The assistant synthesis should be concise, strategic, and useful on Monday.

### 6. Extract Decisions for Next Week

Always include a `Decisions for Next Week` section.

Decisions should be:

- few
- clear
- concrete
- rereadable on Monday
- framed as commitments or constraints

Recommended number: 5-7 max.

Example:

```markdown
## Decisions for Next Week

- Prioritize direct income: job search + client work.
- Use the first useful block of the day for job search.
- Define the first concrete deliverable for a client project before expanding ideas further.
- Limit AI exploration to explicit, time-boxed blocks.
- Do not add new fronts this week. Capture ideas in Obsidian, but do not execute them.
- Protect sleep, training/climbing, and personal recovery time.
- Use the calendar as a scaffold, not a moral test.
```

### 7. Create Weekly Tasks

Always include a `Weekly Tasks` section.

These should be concrete tasks, not reflections.

Recommended number: 3-8 max.

Example:

```markdown
## Weekly Tasks

- [ ] Define the first concrete deliverable for a client project
- [ ] Write a minimum positioning statement for the studio/agency
- [ ] Apply to 3-5 jobs per business day
- [ ] Create a limited block for AI exploration
- [ ] Review personal expenses
```

### 8. Write to Obsidian

After the interview, use `/obsidian` to create or update the current Weekly Note.

If template sections exist and are empty, fill them from the interview.

If sections already contain user content, append under a new block instead of replacing.

Always append this concise review section:

```markdown
---

## Weekly Interview — YYYY-[W]ww

### Focus This Week

#### Main Focus
- 

#### Active Fronts
- 

#### Carryovers From Last Week
- 

#### Not This Week
- 

#### Success Criteria
- 

#### Risks to Watch
- 

### What Actually Moved the Needle
- 

### What Gave Energy
- 

### What Drained Energy
- 

### Patterns Observed
- 

### Avoidance / Procrastination
- 

### Bottlenecks
- 

### What to Stop or Reduce
- 

### Top 3 Priorities Next Week
1. 
2. 
3. 

### Protect
- 

### Suggested Calendar Adjustments
- 

---

## Decisions for Next Week
- 

## Weekly Tasks
- [ ] 
```

Keep the synthesis sharp. Do not write an essay unless the user asks.

## Definitions

### Do Not Add New Fronts

This means:

- capture new business ideas in Obsidian
- do not start executing them this week
- do not create a new revenue line before stabilizing the current ones

It does not mean:

- stop having ideas
- ignore opportunities
- kill creativity

It means:

> The new idea is captured, but it does not take the wheel.

Examples of new fronts to avoid unless explicitly chosen:

- a new AI side project
- a new SaaS
- a new agency/service unrelated to current focus
- a new automated system besides Map Agency
- a new content channel
- a new course/product unrelated to current focus

## Output Format

After writing, respond briefly in the user's language. Keep the summary labels in the same language as the user's response:

```markdown
Done. Created/updated the Weekly Note and added the Weekly Interview.

Focus this week: ...
Top priority: ...
Thing to reduce: ...
```

If writing fails, provide the exact Markdown block to paste.

## Pitfalls

- Do not make the weekly review feel like paperwork.
- Do not ask every question if the user is tired.
- Do not summarize the whole week as a long report.
- Do not redesign the whole system every week unless repeated evidence supports it.
- Do not add projects because the user is excited.
- Do not treat missed tasks as moral failure.
- Do not make next week too full.
- Do not ignore family/child blocks or recovery.
- Do not prescribe a more intense week after an anxious week by default.
- Do not call a clarity-heavy week unproductive.
- Do not pretend to have calendar access if unavailable.
- Do not just output in terminal if Obsidian writing is available.
- Do not depend on a stale `Current Focus` note.

## Verification

Before finishing, verify that you have:

- read the Weekly Note or created it from template
- reviewed the previous Weekly Focus when available
- reviewed relevant Daily Notes from the week when available
- asked questions one at a time
- asked context-aware follow-ups about omissions
- defined `Focus This Week`
- extracted patterns, not just tasks
- limited next week's priorities to 3
- included Decisions for Next Week
- included Weekly Tasks
- persisted the result in Obsidian or returned a paste-ready fallback
