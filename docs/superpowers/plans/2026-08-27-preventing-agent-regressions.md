# Preventing Agent Regressions Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add and behaviorally verify a portable skill that corrects evidence-backed agent deviations and records approved, scoped prevention rules for future agents.

**Architecture:** Implement one self-contained `SKILL.md` discovered by the repository's existing `skills/**/SKILL.md` convention. The skill defines a consent-gated state machine, hierarchical `AGENTS.md` resolution, optional mechanical guards, and a Claude Code compatibility bridge through `CLAUDE.md`. Behavioral tests use fresh Luna agents before and after loading the skill; repository checks remain dependency-free.

**Tech Stack:** Agent Skills Markdown/YAML, Bash validation, Git, Luna behavioral subagents

**Spec:** `docs/superpowers/specs/2026-08-27-preventing-agent-regressions-design.md`

## Global Constraints

- Operational skill instructions are written in English.
- The skill activates automatically for evidence-backed deviations or drift with recurrence risk.
- No project files change until the user explicitly approves the correction, the `AGENTS.md` rule, and any applicable `CLAUDE.md` bridge.
- Write to the most specific applicable project instruction scope; never modify global instructions.
- Keep the skill self-contained: no scripts or reference files.
- Preserve unrelated work and do not install validation dependencies.

---

### Task 1: Author the minimal discipline-enforcing skill

**Files:**
- Create: `skills/preventing-agent-regressions/SKILL.md`
- Read: `docs/superpowers/specs/2026-08-27-preventing-agent-regressions-design.md`

**Interfaces:**
- Consumes: the approved design and the documented RED result in which three Luna agents fixed only the immediate incident.
- Produces: a model-invocable Agent Skill named `preventing-agent-regressions` with no supporting-file dependencies.

- [ ] **Step 1: Confirm RED evidence still precedes implementation**

Read the design's `Behavioral test plan` section. Confirm that all three baseline agents chose immediate correction without durable prevention and that no `skills/preventing-agent-regressions/SKILL.md` exists.

Run:

```bash
test ! -e skills/preventing-agent-regressions/SKILL.md
```

Expected: exit status `0`.

- [ ] **Step 2: Create the minimal skill**

Create `skills/preventing-agent-regressions/SKILL.md` with this initial content:

```markdown
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
```

- [ ] **Step 3: Check size and frontmatter statically**

Run:

```bash
wc -w skills/preventing-agent-regressions/SKILL.md
sed -n '1,8p' skills/preventing-agent-regressions/SKILL.md
```

Expected: concise output with valid opening/closing YAML delimiters, exact skill name, and a description beginning with `Use when`.

---

### Task 2: Verify behavior under pressure and close loopholes

**Files:**
- Modify only if a test exposes a loophole: `skills/preventing-agent-regressions/SKILL.md`

**Interfaces:**
- Consumes: the initial `SKILL.md` from Task 1 and the three RED scenario prompts recorded in the design session.
- Produces: observed GREEN behavior across correction consent, durable prevention, and Claude Code compatibility cases.

- [ ] **Step 1: Run the three original scenarios with the skill loaded**

Dispatch fresh Luna agents with the complete `SKILL.md` and the original brittle-tests, brand-copy, and generated-data prompts. Require one explicit A/B/C/D choice and exact user-facing wording.

Expected:

- Before consent, choose the option that explains the deviation and requests approval for correction plus prevention.
- After consent that covered only correction, do not silently edit `AGENTS.md`; explicitly request the missing authorization.
- Never substitute an incident narrative or global instruction.

- [ ] **Step 2: Run five fresh-context consent micro-tests**

Use five independent Luna contexts with variations combining deadline, authority, sunk cost, and exhaustion. Score each response on these booleans:

```text
verified_evidence
disclosed_agents_write
waited_for_explicit_consent
avoided_silent_scope_expansion
```

Expected: all four values are `true` in all five responses.

- [ ] **Step 3: Run Claude Code compatibility variants**

Test these cases in fresh Luna contexts that are explicitly identified as Claude Code:

1. missing `CLAUDE.md` -> propose/create `@AGENTS.md` only after approval;
2. existing content without import -> prepend import and preserve content;
3. direct or equivalent existing import -> no duplicate;
4. nested `AGENTS.md` -> same-directory nested bridge;
5. detected import cycle -> stop and ask.

Run one control in a non-Claude-Code harness using a Claude model.

Expected: the bridge is handled correctly in cases 1–5 and omitted in the control.

- [ ] **Step 4: Refactor only against observed failures**

For every failing response, capture its exact rationalization, amend the smallest relevant section, and rerun the failed scenario in a fresh context. Do not add hypothetical rules unrelated to an observed failure.

Expected: no scenario retains a failing criterion and no new rationalization remains open.

---

### Task 3: Validate discovery and commit the verified skill

**Files:**
- Verify: `skills/preventing-agent-regressions/SKILL.md`
- Verify: `scripts/list-skills.sh`

**Interfaces:**
- Consumes: the behaviorally verified skill from Task 2.
- Produces: one clean implementation commit with a discoverable, portable skill.

- [ ] **Step 1: Run dependency-free structural validation**

Run:

```bash
test "$(sed -n '1p' skills/preventing-agent-regressions/SKILL.md)" = "---"
test "$(grep -c '^name: preventing-agent-regressions$' skills/preventing-agent-regressions/SKILL.md)" -eq 1
test "$(grep -c '^description: Use when' skills/preventing-agent-regressions/SKILL.md)" -eq 1
test "$(grep -c '^---$' skills/preventing-agent-regressions/SKILL.md)" -ge 2
```

Expected: every command exits `0`.

- [ ] **Step 2: Verify repository discovery**

Run:

```bash
./scripts/list-skills.sh
```

Expected: output includes `skills/preventing-agent-regressions/SKILL.md` exactly once.

- [ ] **Step 3: Inspect final quality and worktree state**

Run:

```bash
git diff --check
git diff -- skills/preventing-agent-regressions/SKILL.md
git status --short
```

Expected: no whitespace errors; only the planned skill is uncommitted.

- [ ] **Step 4: Commit the skill implementation**

Run:

```bash
git add skills/preventing-agent-regressions/SKILL.md
git commit -m "Add preventing agent regressions skill"
```

Expected: one commit containing the verified `SKILL.md`, separate from the design commits.
