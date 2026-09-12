---
name: workflow-retrospective
description: Use when a substantial multi-step task has just completed or the user requests a retrospective, especially after repeated clarification, changed assumptions, delegation, rework, or newly discovered working practices.
---

# Workflow Retrospective

## Core principle

Preserve durable lessons about **how the work was done**. Propose during closeout; persist only with approval.

## Qualify the retrospective

Run when requested. Otherwise require two signals: multiple decisions, iterations, or scope changes; repeated clarification; delegation, handoffs, interruption, or rework; recurring friction or an effective working practice.

Routine, one-step work without a reusable lesson needs only its normal closeout.

## Required workflow

1. **Reconstruct:** review intent, decisions, corrections, friction, recoveries, and helpful practices. Use evidence from the exchange.
2. **Distill:** keep reusable, behavior-changing lessons: what to repeat and what to improve. Route technical facts to project documentation.
3. **Propose:** before closure, present a short retrospective in the user's language. Lead with the main lesson and a few candidates. Connect each one's evidence, future behavior, and benefit. This is part of closing.
4. **Ask:** when a candidate passes the filter below, end with an explicit yes-or-no question about adding it to the applicable `AGENTS.md`. Under known Claude Code, disclose the conditional `CLAUDE.md` bridge below in the same request. Leave instructions unchanged until approval.
5. **Record after approval:** inspect applicable `AGENTS.md` files from root to affected area. Integrate the smallest rules at the narrowest valid scope. Ask before creating a missing `AGENTS.md`. Preserve unrelated instructions; avoid duplication and conflicts.
6. **Verify:** show the file changed and confirm the diff matches the approval. Commit or push only when separately requested.

Complete when every lesson links evidence to future behavior and instructions remain behind approval or match it exactly.

## AGENTS.md filter

A candidate belongs in `AGENTS.md` when a future agent can act on it at project scope. Write future behavior, not history. Exclude blame, transient details, unresolved preferences, and one-off discoveries.

## Claude Code bridge

Apply only when the harness is known to be Claude Code, not merely the model. For the approved `AGENTS.md`, inspect the same-directory `CLAUDE.md` import chain first. Create a missing bridge with `@AGENTS.md`; prepend that import to an existing file only when no equivalent import exists, preserving its content. Leave an existing import unchanged. Stop and ask if a cycle is possible. Perform only bridge writes disclosed in the consent request.

## Example

Preserve “Explain unfamiliar terms before using them to justify decisions” in `AGENTS.md`; put a vector dimension in technical documentation. Present both classifications, then ask before editing.

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Ending a substantial task because the user said “close it” | Include the brief retrospective in the closeout; persistent edits still wait for approval. |
| Updating `AGENTS.md` while Claude Code cannot discover it | Disclose, verify, and maintain the same-directory bridge. |
| Editing instructions immediately | Propose first, then record only what the user approves. |
