---
name: implement-plan-with-subagents
description: Use when the user asks to execute an already-written development plan with worker and reviewer subagents in Codex.
---

# Implement Plan With Subagents

Execute the plan task by task. Follow the repository's `AGENTS.md` and the user's scope and approval boundaries. Do not treat a request to create a plan as authorization to implement it.

## Delegate and wait

1. Turn each ready plan task into a bounded worker assignment with the plan location, objective, relevant files, acceptance criteria, dependencies, verification, and scope boundaries. Choose `worker` or `worker-high` as the task warrants. Invoke the worker with `fork_turns: "none"`; include all necessary context in the initial message.
2. After dispatch, wait for the worker's completion notification. Do not poll status, inspect its files or progress, intervene, or start parallel work while it is running. Use event waits of at most 60 seconds; on timeout or an interim message, immediately wait again without a progress check. When the worker finishes, call `interrupt_agent` to mark it done; keep the agent available for follow-up.
3. **REQUIRED SUB-SKILL:** Use **Requesting Code Review**. Invoke a `reviewer` subagent with `fork_turns: "none"` and explicitly instruct it to use the **Code Review** skill. Supply the plan/task requirements, repository standards, what changed, the starting revision, and the exact review scope. Include working-tree and staged changes if the worker did not commit; do not create a commit merely to produce a review range. Ask for actionable findings with file/line evidence. Wait for its completion notification under the same passive-wait rule, then call `interrupt_agent`.
4. When the reviewer reports problems, send every finding to **the same worker** via `followup_task`, instructing it to use **Receiving Code Review** to verify each finding, fix supported issues or explain a technical disagreement, and report verification. Wait passively for completion. Send the result to **the same reviewer** via `followup_task` for a focused re-review. Repeat with these same agents until the task meets its acceptance criteria or a genuine decision is needed from the user.
5. Continue to the next task only after the reviewer has assessed the final state and the task meets its acceptance criteria. A withdrawn finding resolves that finding, but does not by itself approve the worker's correction. Report completed tasks, verification, unresolved findings, and any limits honestly. Never claim review or tests occurred without the agents' evidence.

The first invocation of each worker and reviewer is context-isolated. Follow-ups intentionally preserve that agent's task context. Review feedback is evidence to evaluate, not an instruction to expand the plan.
