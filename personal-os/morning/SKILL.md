---
name: morning
description: Obsidian-assisted morning interview that creates or updates today's Daily Note from template, uses prior notes for continuity, and appends a concise Hermes Morning Review.
version: 0.3.0
author: Alejandro García Iglesias
license: MIT
platforms: [macos]
metadata:
  hermes:
    tags: [personal-os, reflection, planning, obsidian, daily-review, interview-mode, voice-friendly]
    category: personal-os
---

# Morning Review

## Purpose

Use this skill when the user invokes `/morning`, wants to start the day, create today's Daily Note, avoid the blank-page feeling, decide what matters today, or align the day before working.

The skill should behave like a short, context-aware interview. It should ask one question at a time, accept text or voice-transcribed answers, and persist the result in Obsidian.

The goal is not to optimize every minute. The goal is to help the user enter the day consciously and choose a realistic direction.

## Core Principle

No blank page.

Do not ask generic questions when specific context is available.

Start from continuity:

- yesterday's Daily Note
- yesterday's `Tomorrow` section
- yesterday's `Hermes Night Review`
- unfinished or repeatedly postponed items
- current Weekly Note
- `Current Focus`, if available
- today's calendar/Sunsama context, if available

Hermes should not replace the user's voice. Hermes should interview, organize, and write back a clearly separated synthesis.

## Obsidian Access

Prefer using the existing `/obsidian` skill/tool for all Obsidian operations.

Use `/obsidian` to:

- find today's Daily Note by date
- find the latest Daily Note
- find yesterday's Daily Note
- find `Daily Template`
- find the current Weekly Note
- find `Current Focus`
- create today's Daily Note from the Daily Template if it does not exist
- update matching sections in the Daily Note when safe
- append the Hermes section at the end

Do not hardcode local paths in this skill.

If `/obsidian` cannot write to the note, return a copy-paste-ready Markdown block.

## Safety Rules

- Never overwrite user-written content.
- Prefer append-only updates unless creating a new note from template.
- If a section already contains user content, append under it or add a `Hermes Morning Interview` section.
- If there is ambiguity, ask before replacing.
- Do not fill the user's personal journal voice as if Hermes were the user.
- Keep the final Hermes feedback brief, practical, and pattern-aware.

## Interview Modes

At the beginning, infer or ask for a mode:

- `quick`: 3 questions, for late or low-energy mornings
- `normal`: 5-6 questions, default
- `deep`: 8-10 questions, only when the user asks for it

Accept control commands at any time:

- `skip`: skip the current question
- `short`: shorten the process
- `deeper`: ask one deeper follow-up
- `done`: synthesize and write the note now
- `cancel`: stop without writing

## Procedure

### 1. Gather context first

Before asking the first question, use `/obsidian` to look for:

1. Today's Daily Note.
2. Daily Template.
3. Yesterday's Daily Note or latest previous Daily Note.
4. Current Weekly Note.
5. Current Focus note.

If today's note does not exist, create it from the Daily Template when possible.

Extract only the useful context. Do not dump the whole previous note into the conversation.

Look especially for:

- `Tomorrow`
- unchecked tasks
- `Top Priorities`
- `Important Tasks`
- `Hermes Night Review`
- carryovers
- decisions from the Weekly Note
- repeated issues such as sleep, anxiety, phone drift, avoidance, overplanning, or AI rabbit holes

### 2. Start with contextual continuity

Open with at most 3 bullets from prior context.

Example:

```markdown
Antes de arrancar, traigo continuidad de ayer:
- Quedó pendiente definir el primer paso de Juana Casa.
- Búsqueda laboral sigue siendo prioridad de ingreso directo.
- Ayer apareció el riesgo de perderte en exploración IA.
```

Then ask whether those items still matter today, but do not ask a huge question all at once.

### 3. Ask one question at a time

Default normal flow:

1. How are you arriving today? Energy, sleep, body, anxiety, clarity.
2. From the carryovers/context, what is still truly important today?
3. What has to happen today for the day to feel worthwhile?
4. What are the real constraints today? Calendar, child/family, calls, energy, errands.
5. What could sabotage the day?
6. What is the first concrete action of 10-20 minutes?

Adapt the questions based on answers.

Do not fire all questions at once.

### 4. Ask context-aware follow-ups

If the user omits something that was previously important, gently ask about it.

Example:

```markdown
Ayer `Juana Casa` quedó como prioridad, pero todavía no la nombraste hoy.
¿Sigue vigente, queda pendiente, perdió prioridad o hay algo de resistencia ahí?
```

Do not assume failure. Offer categories:

- done
- still important
- postponed
- deprioritized
- avoided/resistance
- someday/not this week

### 5. Distinguish sections clearly

When writing the Daily Note, use these meanings:

- `Top Priorities`: outcomes or results that matter today
- `Schedule`: fixed blocks, commitments, constraints, and key time anchors
- `Important Tasks`: concrete checkboxes that move the priorities
- `Notes`: context, emotional state, reminders, observations
- `Ideas`: ideas captured without committing to action today
- `Tomorrow`: only items that should be reviewed tomorrow

Avoid duplicating `Top Priorities` and `Important Tasks`. Convert priorities into tasks.

Example:

```markdown
## Top Priorities
- Move income-direct work forward.
- Clarify the next concrete step for Juana Casa.

## Important Tasks
- [ ] Apply to 3 quality jobs.
- [ ] Review Juana Casa notes and identify the first deliverable.
```

### 6. Write to Obsidian

After the interview, use `/obsidian` to create or update today's Daily Note.

If the template sections exist, update them safely. If safe section updates are not possible, append a structured block.

Always append a concise Hermes section:

```markdown
---

## Hermes Morning Interview — YYYY-MM-DD HH:mm

### User Signals
- 

### Main Focus
- 

### Top 3 Priorities
1. 
2. 
3. 

### First Action
- 

### Thing to Avoid
- 

### Grounding Anchor
- 

### Hermes Reflection
- 
```

`Hermes Reflection` should be short: 1-3 bullets, pragmatic and pattern-aware.

Good reflection style:

```markdown
- The risk today is not lack of ideas; it is letting exploratory work displace income-direct action.
- Keep the first block concrete: apply, send, decide, or deliver.
```

Avoid long essays.

## Output Format

After writing, respond briefly:

```markdown
Listo. Creé/actualicé tu Daily Note y agregué el Hermes Morning Interview.

Main focus: ...
First action: ...
Thing to avoid: ...
```

If writing fails, provide the exact Markdown block to paste.

## Pitfalls

- Do not make the morning review feel like homework.
- Do not ask every possible question.
- Do not over-plan a late-start day; reduce scope.
- Do not let the user redesign the whole system in the morning.
- Do not treat missed prior tasks as moral failure.
- Do not write a long motivational essay.
- Do not just output in terminal if Obsidian writing is available.

## Verification

Before finishing, verify that you have:

- read relevant Obsidian context when available
- asked questions one at a time
- reduced blank-page friction
- identified a main focus
- chosen no more than 3 priorities
- defined a first action
- persisted the result in Obsidian or returned a paste-ready fallback
