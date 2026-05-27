---
name: weekly
description: Obsidian-assisted weekly interview that creates or updates the Weekly Note, defines Focus This Week, reads Daily Notes for patterns, extracts decisions, and prepares tasks for Sunsama.
version: 0.5.0
author: Alejandro García Iglesias
license: MIT
platforms: [macos]
metadata:
  hermes:
    tags: [personal-os, weekly-review, weekly-focus, reflection, planning, obsidian, sunsama, interview-mode, voice-friendly]
    category: personal-os
---

# Weekly Review

## Purpose

Use this skill when the user invokes `/weekly`, wants to do the Sunday weekly review, create or update the Weekly Note, find patterns from the week, decide next week's focus, or convert reflection into concrete tasks.

The skill should behave like a guided weekly interview. It should ask one question at a time, accept text or voice-transcribed answers, use Obsidian context, and persist the result in the Weekly Note.

The goal is not productivity scoring. The goal is synthesis, direction, and a small number of clear decisions.

## Core Principle

The Weekly Note is the live source of current focus.

Do not require a separate `Current Focus` note. A separate `Current Focus` note can become stale and should not be treated as the main source of truth.

If an `Operating Principles` note exists, use it only as stable background context, not as the live weekly focus.

The weekly review is a temporary focus contract:

> Esta semana estamos jugando este juego. Al final de la semana revisamos: ¿seguimos, ajustamos, cerramos o pausamos?

Hermes should not replace the user's voice. Hermes should guide the review, notice patterns, ask about omissions, define `Focus This Week`, and append a concise synthesis.

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
- append the Hermes Weekly Interview

Do not hardcode local paths in this skill.

If `/obsidian` cannot write to the note, return a copy-paste-ready Markdown block.

## Safety Rules

- Never overwrite user-written content.
- Prefer append-only updates unless creating a new note from template or updating empty template sections.
- If a section already contains user content, append under it or add a `Hermes Weekly Interview` section.
- If there is ambiguity, ask before replacing.
- Do not write the user's personal reflections as if Hermes were the user.
- Keep the final Hermes feedback practical, concise, and pattern-aware.

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
- Juana Casa / active client progress
- Map Agency System progress
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
La semana pasada el foco era X.
¿Sigue, cambia, se reduce, se pausa o se cierra?
```

## Procedure

### 1. Gather context first

Use `/obsidian` to find or create the Weekly Note from the Weekly Template.

Then read the relevant Daily Notes for the week and the previous Weekly Note's `Focus This Week`, if available.

Do not overwhelm the user with raw context. Start with a small pattern preview.

Example:

```markdown
Antes de revisar, veo 3 señales de la semana:
- Búsqueda laboral apareció varias veces, pero no siempre tuvo ejecución consistente.
- El sueño desordenado parece impactar directamente en la mañana.
- Juana Casa aparece como prioridad pero todavía necesita un próximo paso concreto.
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
10. What concrete tasks should go to Sunsama?

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
Juana Casa appeared in multiple Daily Notes, but I don't see a clear recorded advance.
Was the bottleneck clarity, time, resistance, or missing next step?
```

```markdown
Sleep came up several times. Do you want to treat sleep as a protected operational priority next week?
```

```markdown
Map Agency System appeared as an opportunity. Should it stay active this week or be contained inside its existing blocks?
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
3. Hermes synthesis, appended clearly below.

The user reflection may contain subjective language.

The Hermes synthesis should be concise, strategic, and useful on Monday.

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

- Priorizar ingreso directo: búsqueda laboral + Juana Casa/agencia.
- Usar el primer bloque útil del día para búsqueda laboral.
- Definir la primera solución concreta para Juana Casa antes de seguir expandiendo ideas.
- Limitar exploración IA a bloques explícitos y acotados.
- No sumar nuevos frentes esta semana. Capturar ideas en Obsidian, pero no ejecutarlas.
- Proteger sueño, entrenamiento/escalada y tiempo con Amir.
- Usar la agenda como scaffold, no como prueba moral.
```

### 7. Create Tasks to Send to Sunsama

Always include a `Tasks to Send to Sunsama` section.

These should be concrete tasks, not reflections.

Recommended number: 3-8 max.

Example:

```markdown
## Tasks to Send to Sunsama

- [ ] Definir primera solución concreta para Juana Casa
- [ ] Escribir frase mínima de posicionamiento del estudio/agencia
- [ ] Aplicar a 3-5 trabajos por día hábil
- [ ] Crear bloque limitado para exploración IA
- [ ] Revisar gastos personales
```

### 8. Write to Obsidian

After the interview, use `/obsidian` to create or update the current Weekly Note.

If template sections exist and are empty, fill them from the interview.

If sections already contain user content, append under a new block instead of replacing.

Always append this concise Hermes section:

```markdown
---

## Hermes Weekly Interview — YYYY-[W]ww

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

### Suggested Calendar/Sunsama Adjustments
- 

---

## Decisions for Next Week
- 

## Tasks to Send to Sunsama
- [ ] 
```

Keep the synthesis sharp. Do not write an essay unless the user asks.

## Definitions

### No sumar nuevos frentes

This means:

- capture new business ideas in Obsidian
- do not start executing them this week
- do not create a new revenue line before stabilizing the current ones

It does not mean:

- stop having ideas
- ignore opportunities
- kill creativity

It means:

> La idea nueva se guarda, pero no toma el volante.

Examples of new fronts to avoid unless explicitly chosen:

- Modelo IA + Cafecito
- a new SaaS
- a new agency/service unrelated to current focus
- a new automated system besides Map Agency
- a new content channel
- a new course/product unrelated to current focus

## Output Format

After writing, respond briefly:

```markdown
Listo. Creé/actualicé la Weekly Note y agregué el Hermes Weekly Interview.

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
- Do not pretend to have Sunsama/calendar access if unavailable.
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
- included Tasks to Send to Sunsama
- persisted the result in Obsidian or returned a paste-ready fallback
