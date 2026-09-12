---
name: workflow-retrospective
description: Use when a substantial multi-step task has just completed or the user requests a retrospective, especially after repeated clarification, changed assumptions, delegation, rework, or newly discovered working practices.
---

# Workflow Retrospective

## Core principle

Preserve durable lessons about **how the work was done**. The proposal belongs in the closeout; persistent project instructions require user approval.

## Qualify the retrospective

Run when the user asks, or when a completed task has at least two of these signals:

- several decisions, iterations, or scope changes;
- repeated clarification or corrected assumptions;
- delegation, handoffs, interruption, or substantial rework;
- recurring friction or a clearly effective working practice.

Routine, one-step work without a reusable lesson needs only its normal closeout.

## Required workflow

1. **Reconstruct:** review intent, decisions, user corrections, friction, recoveries, and helpful practices. Use evidence from the exchange.
2. **Distill:** keep reusable, behavior-changing lessons. Include what to repeat and what to improve. Separate workflow lessons from technical facts; route facts to project documentation.
3. **Propose:** before final closure, present a short retrospective in the user's language. Lead with the main lesson and a few candidate principles. For each, connect evidence, future behavior, and benefit. This is part of closing, not new implementation scope.
4. **Ask:** when a candidate passes the filter below, end with an explicit yes-or-no question about adding it to the applicable `AGENTS.md`. Ask even when the file's existence is unknown. Leave instructions unchanged until approval.
5. **Record after approval:** inspect applicable `AGENTS.md` files from root to affected area. Integrate the smallest future-facing rules at the narrowest valid scope. Ask before creating a missing file. Preserve unrelated instructions; avoid duplication and conflicts.
6. **Verify:** show the file changed and confirm the diff matches the approval. Commit or push only when separately requested.

Complete only when every retained lesson links evidence to future behavior and instructions remain behind an explicit approval question or match the approval exactly.

## AGENTS.md filter

A candidate belongs in `AGENTS.md` when a future agent can act on it and the project is the right scope. Write future behavior, not incident history. Exclude blame, transient details, unresolved preferences, and one-off discoveries.

## Example

Preserve “Explain unfamiliar domain terms before using them to justify decisions” as a collaboration rule. Put a vector dimension or benchmark result in technical documentation. Present both classifications, then ask before editing `AGENTS.md`.

## Common mistakes

| Mistake | Correction |
| --- | --- |
| Ending a substantial task because the user said “close it” | Include the brief retrospective in the closeout; persistent edits still wait for approval. |
| Producing a technical postmortem | Focus on how the collaboration and workflow should change or repeat. |
| Recording every observation | Keep only evidence-backed lessons that change future behavior. |
| Editing instructions immediately | Propose first, then record only what the user approves. |
