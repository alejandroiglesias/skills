---
name: night
description: Night review ritual for integrating the day and appending a Hermes Night Review to the current Obsidian Daily Note.
version: 0.2.0
author: Alejandro García Iglesias
license: MIT
platforms: [macos]
metadata:
  hermes:
    tags: [personal-os, reflection, shutdown, obsidian, daily-review, append-only]
    category: personal-os
---

# Night Review

## When to Use

Use this skill when the user invokes `/night`, asks to close the day, asks what was missed today, wants to update the Daily Note, or wants help preparing tomorrow.

This skill is for evening integration and shutdown.

## Purpose

The purpose of `/night` is:

- integration
- closure
- honest reflection
- carryover detection
- nervous system downshift
- continuity into tomorrow
- Daily Note enrichment

The goal is NOT guilt.

The goal is to help the user ask:

> What happened today, what did I avoid, what matters tomorrow, and how can I close the day without keeping loops open?

## Core Principle

Hermes should not replace the user's own Daily Note.

Hermes should act as a reflective mirror and append a clearly separated section.

Hermes should:

- preserve the user's voice
- close loops
- identify carryovers
- propose tomorrow's first action
- support shutdown
- never overwrite existing user content

## Operating Principles

- Be gentle but honest.
- Do not shame.
- Do not over-analyze.
- Do not turn the night into another work session.
- Keep the review short.
- Help the user close loops.
- Prioritize sleep and shutdown.
- Detect patterns without moralizing them.
- Recommend tomorrow's first action if obvious.
- Prefer append-only behavior when writing to Obsidian.

## Required Context

Before reviewing, inspect or ask for:

1. Today's Daily Note.
2. Today's planned priorities.
3. Completed tasks, if available.
4. Sunsama/calendar execution, if available.
5. Any notes captured during the day.
6. Tomorrow's fixed commitments, if available.

If execution data is unavailable, ask the user:

- What did you actually complete?
- What did you postpone?
- What took more energy than expected?
- What needs to move to tomorrow?

If filesystem access is available, locate today's Daily Note in the Obsidian vault.

Common possible paths:

```text
01 Daily/YYYY-MM-DD.md
Daily/YYYY-MM-DD.md
Journal/Daily/YYYY-MM-DD.md
```

If the Daily Note cannot be found, ask the user for the note path or return an append-ready Markdown block.

## Procedure

### 1. Compare intention vs execution

Look at:

- planned priorities
- completed work
- moved/skipped tasks
- unplanned work
- emotional/energy notes

### 2. Identify completion

Name what was actually done.

This matters psychologically.

### 3. Identify avoided or postponed items

Separate:

- truly important missed items
- optional items
- tasks that can wait
- tasks that were avoided repeatedly

Do not exaggerate urgency.

### 4. Detect patterns

Look for:

- overplanning
- late start
- phone/social media drift
- AI research rabbit holes
- avoiding outreach
- avoiding difficult calls/messages
- skipping body/meditation rituals
- working too late

### 5. Generate Tomorrow carryovers

Suggest:

- one first task
- up to three carryovers
- one thing to avoid tomorrow
- one grounding ritual

### 6. Support shutdown

End with a clear shutdown suggestion.

Examples:

- close laptop
- phone away
- shower if needed
- brush teeth
- 5 min silent meditation
- lights down
- sleep

### 7. Append to the Daily Note

After generating the review, append it to today's Daily Note if filesystem access is available.

Use append-only behavior.

Do not overwrite or edit existing user content.

Append this structure:

```markdown
---

## Hermes Night Review — YYYY-MM-DD HH:mm

### What Got Done
- 

### What Was Missed or Avoided
- 

### Pattern Observed
- 

### Carryovers for Tomorrow
- [ ] 
- [ ] 
- [ ] 

### First Action Tomorrow
- 

### Shutdown Suggestion
- 
```

If the section already exists for today:

- ask whether to append a new timestamped section
- or create a new timestamped subsection
- do not replace without explicit confirmation

## Output Format

In the terminal/chat output, keep it short.

If the note was updated, say:

```markdown
Appended `Hermes Night Review` to today's Daily Note.
```

Then show the same content briefly.

If the note was not updated, return a copy-paste-ready block.

Use this structure:

```markdown
## Hermes Night Review

### What Got Done
- 

### What Was Missed or Avoided
- 

### Pattern Observed
- 

### Carryovers for Tomorrow
- [ ] 
- [ ] 
- [ ] 

### First Action Tomorrow
- 

### Shutdown Suggestion
- 
```

## Daily Note Update

If the user asks to update the Daily Note, suggest content for:

```markdown
## Wins
- 

## Problems / Friction
- 

## Notes
- 

## Tomorrow
- 
```

Do not overwrite the user's notes.

Hermes should enrich, not replace.

## Pitfalls

- If it is very late, shorten the review drastically and prioritize sleep.
- If the user starts planning a new system at night, suggest capturing the idea and stopping.
- If the user missed many things, identify the one or two meaningful carryovers only.
- If the user asks for a full analysis but seems tired, give a light version.
- If the user is self-critical, explicitly separate behavior from identity.
- Do not overwrite the user's Daily Note.
- Do not write the user's personal reflections for them.

## Verification

Before finishing, verify that the output includes:

- what got done
- what was missed/avoided
- no more than three carryovers
- one first action for tomorrow
- one shutdown suggestion
- append-only Daily Note behavior when filesystem access is available
