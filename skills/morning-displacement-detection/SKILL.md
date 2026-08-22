---
name: morning-displacement-detection
description: Detect and flag displacement patterns during morning interviews. Use when reviewing proposed first actions against Weekly Note risks.
tags: [personal-os, morning, coaching, avoidance, displacement]
version: 1.0.0
---

# Morning Displacement Detection

## When to Use

After the user proposes their "first concrete action" in the morning interview, before accepting it, cross-check against the current Weekly Note.

## Detection Pattern

Look for these signals in the Weekly Note:

1. **`Not This Week` section** - If the proposed action appears here, it's explicitly excluded
2. **`Risks to Watch` section** - If the Weekly flagged this as a displacement risk
3. **Priority mismatch** - If the action is marked as "captured but not Top 3" or "optional block"
4. **"Volume-based easy win" framing** - User describes it as "tiki tiki," "small tasks," "build momentum," or "quick wins"

## Response Template

When detected, flag it directly:

```markdown
[Action name] aparece en la Weekly como [Not This Week / Riesgo / no Top 3].
¿Lo elegís como primera acción porque es la mejor movida, o porque se siente más liviana que [actual priority]?
```

## Example (June 16, 2026)

**User proposed:** "Start with Maps Agency messages - they're small volume tasks, tiki tiki"

**Weekly W25 context:**
- Not This Week: "Expandir Juana Casa, Trama Estudio, Maps Agency"
- Risks: "Que Trama Estudio / Maps Agency / nuevos frentes llenen la semana"
- Active Fronts: "Búsqueda laboral: 10 aplicaciones por día hábil"

**Flagged response:**
```markdown
Maps Agency aparece en la Weekly como "capturado, no Top 3" y en Riesgos como posible desplazamiento.
¿Lo elegís como primera acción porque es la mejor movida, o porque se siente más liviana que aplicaciones?
```

**Result:** User accepted correction immediately, chose applications first.

## Why This Matters

The most common displacement is picking tasks that feel productive (outreach, organizing, research) over harder but higher-priority actions (job applications, client deliverables, technical tests). The Weekly Note already captures these risks—use them.
