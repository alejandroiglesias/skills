---
name: conversation-recovery-workflows
description: Recover and process user requests that were dropped or only partially handled after model/provider/authentication failures, gateway interruptions, or session fragmentation.
version: 0.1.0
platforms: [macos, linux]
metadata:
  hermes:
    tags: [session-recovery, gateway, reminders, captures, personal-os]
    category: personal-os
    created_by: agent
---

# Conversation Recovery Workflows

Use this skill when Ale says a previous message failed, was not processed, got lost because of provider/model/auth issues, or asks to retry “lo último” / “todo lo otro”.

## Core principle

Recover the **set of missed actionable requests**, not just the single most recent message.

Ale often sends quick Telegram captures: links, reminders, Obsidian inbox items, and lightweight automations. If a provider/auth failure happened, several recent short sessions may each contain one unprocessed action.

## Workflow

1. Search/browse recent sessions around the failure window.
2. Prioritize sessions that are user-only, nearly empty, or have no useful assistant final response.
3. Read each candidate session enough to classify the request.
4. Batch the recovered items by action type:
   - reminders / cron jobs
   - Obsidian or Basic Memory inbox captures
   - recurring nudges / lightweight automations
   - setup/config follow-ups
5. Execute the recoverable actions now.
6. Report back with a concise checklist of what was recovered and what, if anything, still needs Ale’s input.

## Pitfalls

- Do not assume “lo último” means only the latest session. If Ale pushes back with “¿y todo lo otro?”, the recovery pass was too narrow.
- Do not treat setup-state failures as durable tool limitations. If a credential or provider was missing before but is now fixed, retry the original intent.
- Do not create large systems while recovering. Preserve the original scope: captures stay captures, reminders stay reminders, lightweight recurring nudges stay lightweight.
- When scheduling recovered reminders without an explicit time, choose a reasonable low-friction default and state it clearly.

## Response shape

Use Spanish if Ale wrote in Spanish.

```markdown
Listo — recuperé estas cosas:

- [x] Item A: acción tomada
- [x] Item B: acción tomada
- [ ] Item C: necesito X de vos
```

If only one item is found, say so explicitly: “Revisé el historial reciente y sólo encontré esto pendiente.”
