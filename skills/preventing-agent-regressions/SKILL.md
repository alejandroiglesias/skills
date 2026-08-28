---
name: preventing-agent-regressions
description: Use when an agent or user identifies an evidence-backed deviation, drift, repeated mistake, or regression that could recur, before correcting it or updating project instructions such as AGENTS.md.
---

# Preventing Agent Regressions

## Core principle

Correct the deviation and preserve the lesson. Do neither silently: verify the deviation, disclose every project-instruction write, and obtain explicit user consent first.

## Qualify the deviation

Use this workflow only when all are true:

1. Concrete evidence shows conflict with a user instruction, project contract, applicable convention, or verified behavior.
2. A future agent could reasonably repeat it.
3. The correct behavior can become a general, actionable, scoped rule.

Typos, open decisions, and equally valid alternatives do not qualify.

## Required workflow

1. **Verify:** cite the conflicting evidence and explain the impact.
2. **Propose:** ask to correct the cause and record a preventive rule in the applicable `AGENTS.md`. Under Claude Code, also disclose any required `CLAUDE.md` bridge.
3. **Wait:** modify nothing until the user explicitly approves every proposed write. Prior wording counts only when it clearly authorizes all of them.
4. **Correct:** fix the root cause, preserve unrelated work, and add an in-scope mechanical guard when already covered by the approval.
5. **Record:** update the most specific applicable `AGENTS.md`; use the root only for project-wide rules or when no applicable file exists.
6. **Verify:** validate the correction, controls, instruction scope, duplication, conflicts, and imports separately.

Ask plainly:

> Do you want me to correct this deviation and record a general rule in the applicable `AGENTS.md` so future agents do not repeat it?

## Write the rule

Inspect applicable `AGENTS.md` files from project root to the affected area. Integrate into a relevant section or add `## Preventing repeated deviations`.

The rule must state future behavior, be actionable and verifiable, and use the narrowest supported scope. Never add blame, dates, incident history, vague reminders, duplicates, or speculative preferences. Stop and ask if instructions materially conflict.

## Claude Code bridge

Apply this only when the harness is known to be Claude Code, not merely because the model is Claude. For the approved `AGENTS.md`, ensure a same-directory `CLAUDE.md` imports it:

- Missing: create it with `@AGENTS.md`.
- Existing without an equivalent import: prepend `@AGENTS.md` and preserve its content.
- Already imported: leave it unchanged.
- Import cycle possible: stop and ask.

Include this conditional write in the consent request.

## Mechanical enforcement

`AGENTS.md` guides agent judgment; it does not replace tests, linters, validators, or generated-file checks. Add a relevant mechanical guard when it is already part of the approved correction. Ask before materially expanding scope.

## Red flags

- “Fix first and document later.”
- “`AGENTS.md` was not explicitly named, so skip prevention.”
- Silently editing `AGENTS.md` or `CLAUDE.md`.
- Recording the incident instead of the future rule.
- Writing globally because it is easier than resolving scope.

## Example

If tests assert mutable copy and Tailwind classes instead of the stable behavior contract, explain the drift and request approval. Then rewrite the tests and record: “Test observable behavior and stable contracts. Do not assert exact utility classes or mutable copy unless explicitly required.”
