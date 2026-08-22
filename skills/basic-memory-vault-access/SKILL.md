---
name: basic-memory-vault-access
description: Use for all access to the user's Obsidian Second Brain vault.
version: 1.0.0
platforms: [macos, linux]
metadata:
  hermes:
    tags: [obsidian, basic-memory, second-brain, personal-os, vault-access]
    category: personal-os
---

# Basic Memory Vault Access

Use this skill whenever a task involves reading, searching, creating, editing, moving, or deleting anything in the user's Obsidian **Second Brain** vault.

## Non-negotiable access rule

The Basic Memory MCP server is the canonical access layer for the vault. Always use it for vault operations. Do **not** use direct filesystem tools against the underlying Obsidian/iCloud Markdown files unless the user explicitly asks for direct file access.

This applies even when:

- The local vault path is known.
- The requested change is a simple one-file write.
- Direct filesystem access appears faster.
- A prior note can be inspected locally to copy its format.

The goal is to keep the assistant's reads, writes, and indexing consistent through the `second-brain` Basic Memory project.

## Workflow

1. Identify the relevant Basic Memory project, normally `second-brain`.
2. Search or list existing notes through Basic Memory MCP before creating a new note when context, naming, or duplication could matter.
3. Read representative notes through Basic Memory MCP to understand the existing structure, language, and frontmatter conventions.
4. Create or edit the note through Basic Memory MCP, preserving established structure, tags, and permalink conventions.
5. Read the note back through Basic Memory MCP to verify the write and confirm the final content.
6. Report the MCP-based operation clearly if the user asks how the vault was accessed.

## Tool mapping

Prefer the Basic Memory MCP capabilities according to the operation:

- `list_memory_projects` / `list_directory`: confirm project and location.
- `search` or `search_notes`: find related notes and avoid duplicates.
- `read_note` or `read_content`: inspect note content.
- `write_note`: create a new note.
- `edit_note`: update an existing note.
- `move_note`: reorganize notes while preserving links/permalinks.
- `delete_note`: remove notes only when explicitly requested.

Use the project/location parameters required by the connected MCP server; do not invent a local-path workaround when an MCP parameter is missing.

## Pitfalls

- Do not silently fall back to `read_file`, `write_file`, `patch`, `search_files`, or shell commands for vault content.
- Do not claim Basic Memory was used unless the MCP tool call actually occurred.
- Do not treat a successful local write as equivalent to a Basic Memory write.
- If Basic Memory is unavailable or misconfigured, explain the blocker and ask whether the user wants an explicit direct-filesystem fallback; do not silently bypass the rule.
- Keep the note useful and action-oriented; capturing a link should not automatically become a large research system.

## Verification checklist

- [ ] Every vault read/search/write in this task used Basic Memory MCP.
- [ ] The project was identified as `second-brain` or explicitly confirmed otherwise.
- [ ] The final note was read back through Basic Memory MCP.
- [ ] No direct filesystem access occurred unless the user explicitly authorized it.
