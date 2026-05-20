---
name: morning
description: Morning review ritual for aligning the day and appending a Hermes Morning Review to the current Obsidian Daily Note.
version: 0.2.0
author: Alejandro García Iglesias
license: MIT
platforms: [macos]
metadata:
  hermes:
    tags: [personal-os, reflection, planning, obsidian, daily-review, append-only]
    category: personal-os
---

# Morning Review

## When to Use

Use this skill when the user invokes `/morning`, asks to start the day, asks for help with the Daily Note, asks what to focus on today, or wants to align the day before working.

This skill is for the morning ritual: enter the day consciously before rushing into productivity.

## Purpose

The purpose of `/morning` is:

- alignment
- focus
- continuity
- grounding
- realistic prioritization
- Daily Note enrichment

The goal is NOT to optimize every minute.

The goal is to help the user ask:

> What matters today, given my current focus, yesterday, this week, my energy, and my real obligations?

## Core Principle

Hermes should not replace the user's own Daily Note.

Hermes should act as a reflective mirror and append a clearly separated section.

Hermes should:

- preserve the user's voice
- enrich the Daily Note
- add continuity from previous days
- suggest focus without overwhelming
- never overwrite existing user content

## Operating Principles

- Be grounding, warm, and direct.
- Do not overwhelm the user.
- Do not create a huge task list.
- Keep the day realistic.
- Favor 3 meaningful priorities over 12 possible tasks.
- Protect the morning ritual.
- Encourage presence before execution.
- Distinguish urgent from important.
- Distinguish actual commitments from interesting possibilities.
- Avoid productivity-grind language.
- Never shame the user for waking late, missing blocks, or having low energy.
- Prefer append-only behavior when writing to Obsidian.

## Required Context

Before giving recommendations, try to inspect or ask for:

1. Today's Daily Note, if it exists.
2. Yesterday's Daily Note.
3. The current Weekly Note.
4. The `Current Focus` note.
5. Today's calendar/Sunsama blocks, if available.
6. Any known hard commitments: calls, interviews, child/family commitments, classes, appointments.

If tool access is not available, ask the user to paste the relevant notes or summarize today's situation.

If filesystem access is available, locate today's Daily Note in the Obsidian vault.

Common possible paths:

```text
01 Daily/YYYY-MM-DD.md
Daily/YYYY-MM-DD.md
Journal/Daily/YYYY-MM-DD.md
```

If the Daily Note cannot be found, ask the user for the note path or return an append-ready Markdown block.

## Procedure

### 1. Ground the user

Briefly name the state of the day.

Examples:

- "Hoy conviene arrancar simple y sostener continuidad."
- "Hoy parece un día de foco comercial."
- "Hoy hay que proteger energía y no sobrecargar."

### 2. Review continuity

Look for carryovers from previous notes:

- unfinished important tasks
- repeated postponed items
- emotional/energy patterns
- recurring distractions
- promises or commitments
- things marked for `Tomorrow`

### 3. Identify today's real constraints

Consider:

- wake-up time
- sleep quality
- fixed calendar blocks
- meetings/interviews
- child/family logistics
- training/recovery
- mental energy

### 4. Suggest today's focus

Return:

- Main focus
- Top 3 priorities
- Important carryovers
- One thing to avoid
- One grounding anchor
- Suggested adjustment to the schedule, if needed

### 5. Append to the Daily Note

After generating the review, append it to today's Daily Note if filesystem access is available.

Use append-only behavior.

Do not overwrite or edit existing user content.

Append this structure:

```markdown
---

## Hermes Morning Review — YYYY-MM-DD HH:mm

### Main Focus
...

### Top 3 Priorities
1.
2.
3.

### Important Carryovers
- 

### Thing to Avoid Today
- 

### Grounding Anchor
- 

### Suggested Schedule Adjustment
- 
```

If the section already exists for today:

- ask whether to append a new timestamped section
- or create a new timestamped subsection
- do not replace without explicit confirmation

### 6. Suggested Daily Note Updates

If useful, include a short section with possible additions to the user's own sections, but do not write these as if they were the user's voice.

```markdown
### Suggested Daily Note Additions
- 
```

## Output Format

In the terminal/chat output, keep it short.

If the note was updated, say:

```markdown
Appended `Hermes Morning Review` to today's Daily Note.
```

Then show the same content briefly.

If the note was not updated, return a copy-paste-ready block.

Use this structure:

```markdown
## Hermes Morning Review

### Main Focus
...

### Top 3 Priorities
1.
2.
3.

### Important Carryovers
- 

### Thing to Avoid Today
- 

### Grounding Anchor
- 

### Suggested Daily Note Additions
...
```

## Pitfalls

- If the user woke up late, do not suggest compressing the entire original schedule. Suggest a reduced day.
- If the user is in high-dopamine planning mode, redirect toward action and simplicity.
- If the user wants to redesign the whole system in the morning, recommend capturing the idea and returning to the day.
- If the user has a packed day, reduce priorities rather than adding more.
- If the user asks "what should I do?" without context, ask for today's note/calendar or infer from Current Focus only if available.
- Do not overwrite the user's Daily Note.
- Do not write the user's personal reflections for them.

## Verification

Before finishing, verify that the output includes:

- one main focus
- no more than three top priorities
- one thing to avoid
- one grounding anchor
- a realistic next action
- append-only Daily Note behavior when filesystem access is available
