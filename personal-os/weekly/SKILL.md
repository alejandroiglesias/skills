---
name: weekly
description: Weekly review ritual for synthesis, personal reflection, strategic planning, bottleneck detection, action decisions, and appending a Hermes Weekly Synthesis to the Obsidian Weekly Note.
version: 0.3.0
author: Alejandro García Iglesias
license: MIT
platforms: [macos]
metadata:
  hermes:
    tags: [personal-os, weekly-review, reflection, planning, obsidian, sunsama, append-only]
    category: personal-os
---

# Weekly Review

## When to Use

Use this skill when the user invokes `/weekly`, asks to do the weekly review, asks what patterns appeared this week, asks what they have been procrastinating, or wants help planning the next week.

This skill is for the Sunday review and planning ritual.

It may also be used when the user wants to enrich an existing Obsidian Weekly Note with a Hermes synthesis.

## Purpose

The purpose of `/weekly` is:

- synthesis
- strategic reflection
- personal review
- pattern recognition
- bottleneck detection
- focus selection
- weekly planning
- decision extraction
- task handoff to Sunsama
- Weekly Note enrichment

The goal is NOT productivity scoring.

The goal is to help the user ask:

> What actually happened this week, what moved the needle, what drained me, what gave me energy, and what should next week protect?

The weekly review should turn reflection into a small number of clear decisions.

## Core Principle

The user's own Weekly Note is the primary source.

Hermes should act as a reflective mirror and synthesis layer.

Hermes should NOT replace the user's review.

Hermes should:

- preserve the user's voice
- enrich the weekly note
- extract patterns
- propose decisions
- convert decisions into concrete tasks
- avoid overwhelming the user
- never overwrite existing user content

## Operating Principles

- Be honest but compassionate.
- Separate personal reflection from operational planning.
- Do not turn the weekly review into a giant task list.
- Focus on patterns, not isolated failures.
- Identify what to stop doing.
- Identify what to double down on.
- Keep the next week realistic.
- Protect recovery and family time.
- Treat the system as an adaptive scaffold, not a prison.
- Prefer fewer, clearer priorities.
- Avoid productivity-grind language.
- Never treat missed tasks as moral failure.
- Do not create new projects unless the user explicitly asks.
- When the user is anxious, reduce scope.
- When the user is excited, preserve momentum without expanding the system too much.
- Prefer append-only behavior when writing to Obsidian.

## Required Context

Before reviewing, inspect or ask for:

1. Daily Notes from the week.
2. Current Weekly Note, if already created.
3. Current Focus.
4. Sunsama/calendar task completion, if available.
5. Important events from the week.
6. Known commitments for next week.
7. Any unresolved commitments from the prior weekly review.

If context is unavailable, ask the user to paste summaries or answer a few review questions.

If only partial context is available, clearly state what was available and what was missing.

If filesystem access is available, locate the current Weekly Note in the Obsidian vault.

Common possible paths:

```text
02 Weekly/YYYY-[W]ww.md
Weekly/YYYY-[W]ww.md
Journal/Weekly/YYYY-[W]ww.md
```

If the Weekly Note cannot be found, ask the user for the note path or return an append-ready Markdown block.

## Preferred Obsidian Structure

The Weekly Note should ideally contain:

```markdown
#journal

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

Hermes should append or propose adding sections below the user's own review.

Preferred append structure:

```markdown
---

## Hermes Weekly Synthesis — YYYY-[W]ww

...

---

## Decisions for Next Week
...

## Tasks to Send to Sunsama
...
```

## Procedure

### 1. Acknowledge Available Context

Start by briefly stating what context was used.

Example:

```markdown
Usé el contexto disponible:
- Weekly note: 2026-W19
- Daily notes: 2026-05-06, 2026-05-07, 2026-05-08
- Current Focus
- No tengo acceso directo confirmado a Sunsama/calendario
```

Keep this short.

### 2. Personal Review First

Look for:

- energy
- mood
- sleep
- body/training
- meditation
- family/child presence
- anxiety
- avoidance
- sense of direction
- financial pressure
- emotional conversations
- moments of clarity
- moments of fragmentation

This is not task management.

### 3. Operational Review Second

Look for:

- job applications
- interviews
- client outreach
- agency progress
- Juana Casa / active client progress
- Map Agency System progress
- content progress
- infoproduct progress
- technical practice
- follow-ups and proposals
- ads / agency visibility
- Sunsama/Obsidian/system progress

### 4. Detect Patterns

Identify:

- momentum drivers
- bottlenecks
- recurring avoidance
- overplanning
- rabbit holes
- late-night activation
- phone/social drift
- blocks that consistently work
- blocks that consistently fail
- anxiety triggers
- clarity triggers
- body/movement effects
- family/presence effects

### 5. Identify What Moved the Needle

Focus on:

- interviews
- job applications
- client conversations
- proposals
- concrete shipped assets
- technical fluency improvements
- meaningful personal/family alignment
- better structure
- clearer positioning
- first steps toward revenue

Avoid treating reflection as less valuable than output.

If organizing the system created real clarity, name that as progress while warning against endless optimization.

### 6. Identify Avoidance and Procrastination

Look especially for productive procrastination.

Examples:

- researching AI instead of applying to jobs
- refining systems instead of contacting leads
- polishing positioning instead of sending proposals
- reorganizing the calendar instead of doing the first task
- opening new business ideas instead of executing current ones
- working late and destroying the next morning

Separate:

- useful exploration
- avoidance disguised as useful exploration

### 7. Decide Next Week's Focus

Suggest:

- one main weekly focus
- up to three strategic priorities
- one thing to reduce
- one thing to protect
- one small experiment for the week, only if useful

The main focus should usually favor:

1. income-direct work
2. active client progress
3. health/sleep stability
4. clear execution over new ideas

### 8. Extract Decisions for Next Week

Always include this section.

The goal is to transform reflection into direction.

Decisions should be:

- few
- clear
- concrete
- easy to reread on Monday
- framed as commitments or constraints

Recommended number:

- 5 to 7 decisions max

Examples:

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

### 9. Create Tasks to Send to Sunsama

Always include this section.

These should be concrete tasks, not reflections.

Use checkboxes.

Recommended number:

- 3 to 8 tasks max

Example:

```markdown
## Tasks to Send to Sunsama

- [ ] Definir primera solución concreta para Juana Casa
- [ ] Escribir frase mínima de posicionamiento del estudio/agencia
- [ ] Aplicar a 3–5 trabajos por día hábil
- [ ] Crear bloque limitado para exploración IA
- [ ] Revisar gastos personales
```

### 10. Plan Lightly

Do not redesign the whole weekly structure unless needed.

Use the fixed weekly blocks as the skeleton.

Planning means:

- decide what goes inside each block
- adjust around real commitments
- choose top priorities
- leave buffers
- remove overload

Do not suggest changing recurring blocks unless repeated evidence shows they are failing.

### 11. Append to the Weekly Note

After generating the synthesis, append it to the current Weekly Note if filesystem access is available.

Use append-only behavior.

Do not overwrite or edit existing user content.

Append this structure:

```markdown
---

## Hermes Weekly Synthesis — YYYY-[W]ww

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

### Main Focus Next Week
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

If a `## Hermes Weekly Synthesis` section already exists:

- ask whether to append a new timestamped section
- or create a new subsection
- do not replace without explicit confirmation

## Output Format

Use this full structure when doing a complete weekly review:

```markdown
## Hermes Weekly Synthesis

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

### Main Focus Next Week
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
- 
- 

## Tasks to Send to Sunsama
- [ ] 
- [ ] 
- [ ] 
```

## Short Output Mode

If the user seems tired, anxious, or short on time, use this shorter structure:

```markdown
## Hermes Weekly Synthesis

### Main Pattern
- 

### What Moved the Needle
- 

### Main Bottleneck
- 

### Main Focus Next Week
- 

## Decisions for Next Week
- 
- 
- 

## Tasks to Send to Sunsama
- [ ] 
- [ ] 
- [ ] 
```

## Weekly Note Update

If the user asks to update or enrich the Weekly Note, suggest appending the full Hermes section.

Do not overwrite the user's own Weekly Note unless the user explicitly asks.

Prefer append-only behavior.

If direct file editing is available:

- append under a new `## Hermes Weekly Synthesis` section
- do not delete user content
- do not rewrite the user's original review
- if the section already exists, ask whether to replace it or create a new dated subsection

## Definitions

### "No sumar nuevos frentes"

This means:

- capture new business ideas in Obsidian
- do not start executing them this week
- do not create a new revenue line before stabilizing the current ones

It does NOT mean:

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

## Pitfalls

- Do not confuse Sunday personal review with Friday operational review.
- Do not redesign the whole system every week unless repeated evidence supports it.
- Do not add more projects just because the user is excited.
- Do not treat missed tasks as moral failure.
- Do not make the week too full.
- If the user has child/family blocks, protect them from productive work unless explicitly necessary.
- If the user is in high-dopamine planning mode, reduce scope.
- If the user had an anxious week, do not prescribe a more intense week as the default solution.
- If the user produced mostly clarity, do not call the week unproductive.
- If there is no Sunsama/calendar access, do not pretend there is.
- If daily notes are missing, mention the limitation.
- If the user's own review contradicts inferred patterns, give the user's own review priority.
- Do not overwrite the user's Weekly Note.
- Do not write the user's personal reflections for them.

## Verification

Before finishing, verify that the output includes:

- what moved the needle
- energy/drain patterns
- procrastination or avoidance pattern, if visible
- one main focus for next week
- three priorities max
- at least one thing to stop/reduce
- Decisions for Next Week
- Tasks to Send to Sunsama
- append-only Weekly Note behavior when filesystem access is available
