---
name: night
description: Obsidian-assisted night interview that compares today's plan with what happened, captures wins/friction/tomorrow, and appends a concise Hermes Night Review.
version: 0.3.0
author: Alejandro García Iglesias
license: MIT
platforms: [macos]
metadata:
  hermes:
    tags: [personal-os, reflection, shutdown, obsidian, daily-review, interview-mode, voice-friendly]
    category: personal-os
---

# Night Review

## Purpose

Use this skill when the user invokes `/night`, wants to close the day, reflect on what happened, capture wins/friction/ideas/tomorrow, compare intention vs execution, or avoid losing the day’s learning.

The skill should behave like a short, context-aware evening interview. It should ask one question at a time, accept text or voice-transcribed answers, and persist the result in Obsidian.

The goal is not guilt or productivity scoring. The goal is closure, learning, and a smoother tomorrow.

## Core Principle

The night review should close loops, not open a new work session.

Start from today’s plan:

- today’s Daily Note
- morning priorities
- important tasks
- schedule
- `Hermes Morning Interview`
- any `Tomorrow` or carryovers brought into today
- calendar/Sunsama execution, if available

Hermes should gently notice omissions. If the user does not mention something that was marked important, ask about it without blame.

## Obsidian Access

Prefer using the existing `/obsidian` skill/tool for all Obsidian operations.

Use `/obsidian` to:

- find today’s Daily Note
- read today’s planned priorities and tasks
- find tomorrow’s Daily Note only if needed
- update or append to today’s note
- append the Hermes Night Review

Do not hardcode local paths in this skill.

If `/obsidian` cannot write to the note, return a copy-paste-ready Markdown block.

## Safety Rules

- Never overwrite user-written content.
- Prefer append-only updates unless updating an empty template section.
- If a section already contains user content, append under it or add a `Hermes Night Interview` section.
- If there is ambiguity, ask before replacing.
- Do not write the user’s personal reflections as if Hermes were the user.
- Keep the final Hermes feedback brief, practical, and pattern-aware.

## Interview Modes

At the beginning, infer or ask for a mode:

- `quick`: 3 questions, default if it is late or the user sounds tired
- `normal`: 5-6 questions, default when there is enough energy
- `deep`: 8-10 questions, only when the user asks for it

Accept control commands at any time:

- `skip`: skip the current question
- `short`: shorten the process
- `deeper`: ask one deeper follow-up
- `done`: synthesize and write the note now
- `cancel`: stop without writing

## Procedure

### 1. Gather context first

Before asking the first question, use `/obsidian` to read today’s Daily Note.

Extract only the useful context. Do not dump the entire note into the conversation.

Look especially for:

- `Top Priorities`
- `Important Tasks`
- `Schedule`
- `Hermes Morning Interview`
- `Thing to Avoid`
- `First Action`
- unchecked tasks
- notes/ideas already captured during the day

### 2. Start with intention vs reality

Open with a compact summary of what the user intended today.

Example:

```markdown
Hoy habías marcado como importante:
- búsqueda laboral
- Juana Casa
- Sales Check

Vamos a cerrar el día sin hacer juicio, sólo mirando qué pasó.
```

### 3. Ask one question at a time

Default normal flow:

1. What did you actually complete today, even if small?
2. What was missed, postponed, or avoided?
3. What drained you or pulled you off-center?
4. What gave energy or helped regulation?
5. Did any ideas, notes, or decisions appear that should be captured?
6. What should tomorrow inherit from today?

For quick mode:

1. What got done?
2. What matters for tomorrow?
3. What should you do now to shut down?

Do not fire all questions at once.

### 4. Ask context-aware follow-ups

If the user omits something previously marked important, ask gently.

Example:

```markdown
A la mañana Juana Casa figuraba como prioridad, pero no la nombraste.
¿La hiciste, quedó pendiente, perdió prioridad o hubo resistencia?
```

Offer categories:

- done
- not done but still important
- postponed intentionally
- deprioritized
- avoided/resistance
- no longer relevant

If something has appeared repeatedly across days, name the pattern briefly.

Example:

```markdown
Esto apareció varios días. ¿Querés convertirlo en un primer paso más chico para mañana o sacarlo de prioridad por ahora?
```

### 5. Distinguish sections clearly

When writing the Daily Note, use these meanings:

- `Wins`: what actually happened and deserves recognition
- `Problems / Friction`: what made execution harder
- `Ideas`: captured ideas, not commitments
- `Tomorrow`: things tomorrow should review or inherit
- `Hermes Night Interview`: synthesis and pattern mirror

Do not turn `Tomorrow` into a huge backlog. Keep it short.

### 6. Write to Obsidian

After the interview, use `/obsidian` to update today’s Daily Note.

If the template sections exist, update them safely. If safe section updates are not possible, append a structured block.

Always append a concise Hermes section:

```markdown
---

## Hermes Night Interview — YYYY-MM-DD HH:mm

### What Got Done
- 

### Missed / Avoided / Postponed
- 

### Friction
- 

### Ideas / Notes Captured
- 

### Tomorrow
- [ ] 

### Pattern Observed
- 

### First Action Tomorrow
- 

### Shutdown Suggestion
- 
```

`Pattern Observed` should be short: 1-3 bullets, pragmatic and consciousness-building.

Good style:

```markdown
- The main issue today was not lack of intention; it was late start + too many active fronts.
- Tomorrow should begin with one income-direct action before any IA exploration.
```

Avoid long essays.

### 7. Support shutdown

End with a concrete shutdown cue.

Examples:

- close laptop
- phone away
- brush teeth
- shower if needed
- 5 min silent meditation
- lights low
- sleep

If it is very late, prioritize sleep and make the review shorter.

## Output Format

After writing, respond briefly:

```markdown
Listo. Actualicé tu Daily Note y agregué el Hermes Night Interview.

Win principal: ...
Tomorrow: ...
Shutdown: ...
```

If writing fails, provide the exact Markdown block to paste.

## Pitfalls

- Do not make the night review feel like homework.
- Do not ask every possible question.
- Do not over-analyze at night.
- Do not let the user plan a new system at night; capture and close.
- Do not treat missed tasks as moral failure.
- Do not write a long motivational essay.
- Do not keep the user activated too late.
- Do not just output in terminal if Obsidian writing is available.

## Verification

Before finishing, verify that you have:

- read today’s Daily Note when available
- compared intention vs execution
- asked questions one at a time
- noticed important omissions gently
- captured wins/friction/tomorrow
- defined a first action for tomorrow
- suggested shutdown
- persisted the result in Obsidian or returned a paste-ready fallback
