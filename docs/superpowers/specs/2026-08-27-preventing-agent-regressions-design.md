# Preventing Agent Regressions Skill Design

## Objective

Create a reusable skill that turns a verified agent-work deviation into both an immediate correction and a durable, project-scoped instruction that reduces recurrence in future sessions.

The skill must apply across domains. A deviation may involve code, tests, documentation, content, research, data handling, design, or another project task.

## Skill identity

- Name: `preventing-agent-regressions`
- Location: `skills/preventing-agent-regressions/SKILL.md`
- Activation: automatic when an agent detects a possible deviation or when the user identifies one
- Format: self-contained `SKILL.md`; no scripts or reference files are required

The description should include discovery terms such as `agent deviation`, `drift`, `repeated mistake`, `recurrence`, `AGENTS.md`, and `regression`.

## Registrable deviation

A possible deviation enters this workflow only when all three conditions hold:

1. It contradicts concrete evidence, such as an explicit user instruction, a project contract, an applicable convention, or verified behavior.
2. It could reasonably recur in a future agent session.
3. The correct behavior can be expressed as a general, actionable, scoped rule.

An isolated typo, an unresolved decision, or an equally valid alternative does not qualify.

## Required workflow

1. Verify the deviation against concrete evidence.
2. Explain concisely what diverged, the evidence it conflicts with, and its impact.
3. Propose the two actions together: correct the deviation and record a preventive rule in the applicable `AGENTS.md`.
4. Wait for explicit consent before modifying files.
5. Correct the root cause and update the applicable `AGENTS.md`.
6. Verify the correction, relevant automated controls, and the instruction update independently.

The consent question should explicitly bundle the actions, for example:

> Do you want me to correct this deviation and record a general rule in the applicable `AGENTS.md` so future agents do not repeat it?

Confirmation of that proposal authorizes both actions. A request that authorizes only diagnosis, review, or the immediate correction does not authorize an `AGENTS.md` change.

When running through Claude Code, the proposal must also disclose the conditional creation or update of a companion `CLAUDE.md` compatibility bridge.

## Resolving instruction scope

Before writing, inspect every applicable `AGENTS.md` from the project root down to the affected area.

- Add the rule to the most specific file that governs the affected work.
- Use the root `AGENTS.md` when the rule is project-wide.
- Create a root `AGENTS.md` only when no applicable file exists.
- Integrate the rule into a clearly relevant existing section when possible.
- Otherwise create a section named `## Preventing repeated deviations`.
- Never modify global instructions or files outside the project.

If an existing instruction duplicates or contradicts the proposed rule, do not append blindly. Reuse the existing rule, refine it without duplication, or stop and ask the user when the conflict is substantive.

## Claude Code compatibility bridge

Claude Code reads `CLAUDE.md`, not `AGENTS.md`. When the current agent is running through Claude Code and the approved workflow creates or updates an `AGENTS.md`, ensure a companion `CLAUDE.md` in the same directory imports it.

- If `CLAUDE.md` does not exist, create it with `@AGENTS.md`.
- If it exists without a direct or equivalent import, add `@AGENTS.md` at the beginning and preserve all existing content.
- If it already imports the applicable `AGENTS.md`, do not modify it.
- Inspect the relevant import chain first. Do not add an import that would create a cycle.
- Keep the bridge at the same hierarchical scope as the applicable `AGENTS.md`.
- Do not infer that an Anthropic model is running through Claude Code; apply this rule only when the harness is known.

The consent question in Claude Code should cover all conditional writes, for example:

> Do you want me to correct this deviation, record a general rule in the applicable `AGENTS.md`, and ensure Claude Code loads it through a companion `CLAUDE.md`?

## Preventive-rule contract

Each recorded rule must be:

- Generalizable: state the correct future behavior, not the incident history.
- Actionable: tell the next agent what to do.
- Verifiable: make compliance distinguishable from non-compliance.
- Minimal: use the shortest instruction that preserves the necessary boundary.
- Scoped: apply only where the evidence supports it.

Do not add blame, dates, session narratives, speculative preferences, or vague reminders such as “be careful.”

## Correction and mechanical guards

The agent must correct the cause rather than conceal the symptom, preserve unrelated work, and avoid unnecessary expansion.

`AGENTS.md` is an agent-judgment regression guard, not a substitute for mechanical enforcement. When a test, linter, validator, generated-file check, or other automated protection is relevant and already falls within the approved correction, add or update it. Ask separately before a materially broader expansion.

## Verification contract

Before completion, verify separately that:

1. the underlying deviation is corrected;
2. relevant tests or other controls pass;
3. the preventive instruction is in the correct scope and does not duplicate or conflict with applicable instructions;
4. the rule describes future behavior rather than narrating the past incident;
5. when the Claude Code bridge applies, `CLAUDE.md` imports the correct `AGENTS.md` exactly once, preserves prior content, and introduces no import cycle.

Do not claim durable prevention when the project is read-only or no project instruction file can be updated. In that case, report the limitation and provide the proposed rule.

## Compact example

Deviation: component tests assert exact Tailwind utility classes and mutable resume copy even though the stable contract is observable behavior.

After explicit approval, rewrite the tests around behavior and record a scoped rule such as:

> Test observable behavior and stable contracts. Do not assert exact Tailwind utility classes or mutable resume copy unless those values are themselves an explicit product requirement.

This example demonstrates the pattern without making the skill specific to software testing.

## Behavioral test plan

The RED baseline used three fresh Luna agents without the skill:

- brittle tests under deadline pressure;
- brand-copy drift before a launch;
- direct edits to generated data after the user approved a source fix.

All three chose to fix only the immediate incident and omitted the durable instruction. One explicitly characterized `AGENTS.md` as unrequested scope.

For GREEN verification, repeat the same scenarios with the skill loaded. The expected behavior is:

- before consent, explain the evidence-backed deviation and request approval for correction plus prevention;
- after consent, correct the cause and add a concise rule to the applicable `AGENTS.md`;
- avoid silent instruction changes, incident narratives, global instructions, and scope expansion.

Add Claude Code variants that verify creation of a missing companion `CLAUDE.md`, preservation of an existing file, import deduplication, correct nested scope, and cycle detection. Add a non-Claude-Code control to ensure the bridge is not created merely because the underlying model is Claude.

If an agent finds a new rationalization or shortcut, refine the skill and rerun the scenario until the workflow remains compliant under pressure.

## Repository validation

After implementation:

- confirm valid Agent Skills frontmatter;
- confirm `scripts/list-skills.sh` discovers the skill;
- keep the operational instructions in English;
- inspect the exact diff and Git status;
- commit the implemented and verified skill separately from this design specification.
