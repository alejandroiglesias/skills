# Multi-harness skills layout and linking

## Context

This repository currently stores skills below `personal-os/` and uses a root-level `install.sh` that copies or symlinks the whole directory into an agent-specific location. The repository is intended to grow beyond the initial morning, night, and weekly skills and should be consumable by multiple Agent Skills-compatible harnesses.

The target convention follows the useful parts of `mattpocock/skills`: a top-level `skills/` directory, one skill per child directory, discovery through `SKILL.md`, and a development script that links each skill into the local harness directories.

## Goals

- Rename `personal-os/` to `skills/`.
- Make each directory below `skills/` an independently discoverable skill.
- Move and rename the root installer to `scripts/install.sh`, using the local-path and multi-agent support of the `npx skills` CLI.
- Forward every argument passed to `scripts/install.sh` to `npx skills add`, so interactive use and explicit CLI flags share one entry point.
- Let `npx skills` discover supported installed agents and interactively choose skills, agents, and destinations instead of maintaining repository-specific lists.
- Add `scripts/list-skills.sh` for local discovery.
- Update documentation and skill instructions to describe a generic agent-skills repository rather than an agent-specific Personal OS repository.
- Preserve unrelated user changes already present in the working tree.

## Non-goals

- Do not add `package.json`, `.claude-plugin/plugin.json`, or release metadata merely to adapt Matt Pocock's plugin-version script.
- Do not hardcode the current seven skill names.
- Do not add new skills or change the content/metadata of existing skills as part of the layout migration.
- Do not automatically modify or remove existing user-managed installations outside the repository beyond the exact per-skill targets explicitly managed by `install.sh` through the CLI.

## Design

### Repository layout

Move the existing skill directories unchanged:

```text
skills/
  <skill-name>/
    SKILL.md
scripts/
  install.sh
  list-skills.sh
```

The existing `category: personal-os` values remain skill metadata and are not changed by the filesystem rename.

### `install.sh`

The script resolves the repository root from its own location and delegates installation to the `npx skills` CLI with the repository path as a local source. The CLI discovers valid skills and supported agents, then lets the user select which skills, agents, and installation method to use globally. Symlinks are the recommended interactive method; `--copy` requests independent copies.

The wrapper always supplies `--global`, skips only `npx`'s package-install confirmation, and forwards all remaining arguments unchanged:

```bash
exec npx --yes skills add "$REPO" --global "$@"
```

Examples include `./scripts/install.sh --all`, `./scripts/install.sh --skill morning --agent codex`, and `./scripts/install.sh --copy`.

The script should:

- use strict Bash settings;
- work when invoked from any current working directory;
- pass the repository path safely, including when it contains spaces;
- skip only the package-install confirmation from `npx` (`npx --yes`), while preserving the CLI's interactive selection flow when no extra flags are passed;
- request global installation (`--global`);
- forward every extra argument unchanged to `npx skills add`;
- leave destination discovery, symlink handling, and agent-specific paths to the CLI.

This is intentionally a small repository wrapper around the skills CLI, not a second package manager. A repository update followed by rerunning the script is the supported synchronization flow. Unsupported custom harnesses remain outside the CLI's automatic discovery and would require a future adapter.

### `list-skills.sh`

The script resolves the repository root, searches for `SKILL.md` below `skills/`, and prints sorted repository-relative paths. It should not depend on the caller's current directory and should omit irrelevant `node_modules` paths if they appear later.

### Documentation

Rewrite the README to:

- use a generic repository title and description;
- document `skills/` and `scripts/`;
- show `./scripts/install.sh` as the primary command;
- explain that `npx skills` discovers supported harnesses and lets the user choose skills and agents interactively;
- document `list-skills.sh`;
- explain that all current and future skills are discovered automatically;
- remove agent-specific wording and the old `install.sh`/`personal-os` paths.

## Verification

Verification will use a temporary `HOME` so the real user skill directories are not changed. The checks will cover:

1. `scripts/list-skills.sh` lists every current skill and no old `personal-os` path.
2. `scripts/install.sh` invokes `npx skills add` with the local repository and global scope while preserving interactive selection.
3. Extra arguments such as `--all` are forwarded unchanged to `npx skills add`.
4. In a controlled temporary home, an explicitly selected supported agent receives the expected symlink installation.
5. Re-running the install script is idempotent.
6. Shell syntax checks pass.
7. Git status confirms only intended repository files changed in addition to the user's pre-existing local changes.
