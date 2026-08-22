# Multi-harness skills layout and linking

## Context

This repository currently stores skills below `personal-os/` and uses a root-level `install.sh` that copies or symlinks the whole directory into a Hermes-specific location. The repository is intended to grow beyond the initial morning, night, and weekly skills and should be consumable by multiple Agent Skills-compatible harnesses.

The target convention follows the useful parts of `mattpocock/skills`: a top-level `skills/` directory, one skill per child directory, discovery through `SKILL.md`, and a development script that links each skill into the local harness directories.

## Goals

- Rename `personal-os/` to `skills/`.
- Make each directory below `skills/` an independently discoverable skill.
- Replace the root installer with `scripts/link-skills.sh`, following Matt Pocock's simple development-linking model.
- Link all discovered skills directly into the standard destinations used by that model:
  - `~/.agents/skills`
  - `~/.claude/skills`
- Add `scripts/list-skills.sh` for local discovery.
- Update documentation to describe a generic agent-skills repository rather than a Hermes-only Personal OS repository.
- Preserve unrelated user changes already present in the working tree.

## Non-goals

- Do not add `package.json`, `.claude-plugin/plugin.json`, or release metadata merely to adapt Matt Pocock's plugin-version script.
- Do not hardcode the current seven skill names.
- Do not add new skills or change the content/metadata of existing skills as part of the layout migration.
- Do not automatically modify or remove existing user-managed installations outside the repository beyond the exact per-skill symlink targets explicitly managed by `link-skills.sh`.

## Design

### Repository layout

Move the existing skill directories unchanged:

```text
skills/
  <skill-name>/
    SKILL.md
scripts/
  link-skills.sh
  list-skills.sh
```

The existing `category: personal-os` values remain skill metadata and are not changed by the filesystem rename.

### `link-skills.sh`

The script resolves the repository root from its own location, discovers every `SKILL.md` below `skills/`, and treats each parent directory as one skill. It then creates a symlink for each skill under the destinations in a simple `DESTS` Bash array, matching Matt Pocock's script shape.

The script should:

- use strict Bash settings;
- work when invoked from any current working directory;
- support skill names discovered after the script was written;
- create missing destination directories;
- replace an existing exact per-skill target, including an old symlink, before linking;
- refuse to operate if a whole destination directory is a symlink into this repository, avoiding accidental writes into `skills/`;
- print each link it creates so the result is inspectable;
- use paths safely when the repository or home directory contains spaces;
- keep the destinations in one easily visible list that can be extended with one line when another harness is adopted.

This is intentionally a development-linking workflow, not a package manager or a release installer. A repository update followed by rerunning the script is the supported synchronization flow.

### `list-skills.sh`

The script resolves the repository root, searches for `SKILL.md` below `skills/`, and prints sorted repository-relative paths. It should not depend on the caller's current directory and should omit irrelevant `node_modules` paths if they appear later.

### Documentation

Rewrite the README to:

- use a generic repository title and description;
- document `skills/` and `scripts/`;
- show `./scripts/link-skills.sh` as the primary command;
- show the standard harness destinations used by `link-skills.sh`;
- document `list-skills.sh`;
- explain that all current and future skills are discovered automatically;
- remove Hermes-only wording and the old `install.sh`/`personal-os` paths.

## Verification

Verification will use a temporary `HOME` so the real user skill directories are not changed. The checks will cover:

1. `scripts/list-skills.sh` lists every current skill and no old `personal-os` path.
2. `scripts/link-skills.sh` creates one symlink per discovered skill in both temporary harness directories.
3. Symlink targets resolve to the repository's `skills/<name>` directories.
4. Re-running the link script is idempotent.
5. Shell syntax checks pass.
6. Git status confirms only intended repository files changed in addition to the user's pre-existing local changes.
