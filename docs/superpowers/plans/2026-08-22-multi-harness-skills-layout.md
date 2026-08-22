# Multi-harness skills layout Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rename the repository's skills directory, replace the agent-specific installer with a generic `npx skills` wrapper, and document discovery and installation for all supported agents.

**Architecture:** `skills/` is the single source tree, with one skill per child directory containing `SKILL.md`. `scripts/install.sh` resolves the repository root and delegates global, symlink-based or user-selected installation to `npx skills add`, forwarding extra CLI flags. `scripts/list-skills.sh` provides a local, sorted inventory without modifying installations.

**Tech Stack:** Bash, `npx skills` CLI, Markdown, Git.

## Global Constraints

- Preserve unrelated user changes already present in the working tree.
- Do not hardcode the current skill names.
- Do not add package/plugin release metadata.
- Keep installation global and let `npx skills` discover supported agents and destinations.
- When no extra arguments are passed, preserve the CLI's interactive skill/agent selection.
- Forward every extra argument passed to `scripts/install.sh` unchanged to `npx skills add`.
- Verify installation with a temporary `HOME`; do not modify the real user skill directories during tests.

---

### Task 1: Move the skill tree and installer

**Files:**
- Rename: `personal-os/` → `skills/`
- Rename: `install.sh` → `scripts/install.sh`
- Create: `scripts/`

**Interfaces:**
- Produces `skills/<skill-name>/SKILL.md` for every existing skill.
- Produces an executable installer path at `scripts/install.sh`.

- [ ] **Step 1: Move only the requested tracked/untracked skill files and installer**

Use filesystem moves from the repository root so the existing local modifications and untracked skills remain attached to their files:

```bash
mkdir -p scripts
mv personal-os skills
mv install.sh scripts/install.sh
```

- [ ] **Step 2: Confirm the moved tree contains all existing skills**

Run:

```bash
find skills -name SKILL.md -print | sort
test -x scripts/install.sh || chmod +x scripts/install.sh
```

Expected: every existing `SKILL.md` file is listed below `skills/`, and `scripts/install.sh` exists.

### Task 2: Replace installation behavior with the `npx skills` wrapper

**Files:**
- Modify: `scripts/install.sh`

**Interfaces:**
- Consumes: repository-relative invocation from any current working directory.
- Produces: `npx --yes skills add <repo-root> --global <forwarded-args>`.

- [ ] **Step 1: Replace the old agent-specific implementation**

The complete script should be:

```bash
#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

exec npx --yes skills add "$REPO" --global "$@"
```

This keeps the CLI interactive when no extra flags are supplied and forwards flags such as `--all`, `--skill morning`, `--agent codex`, and `--copy` unchanged.

- [ ] **Step 2: Check shell syntax and executable mode**

Run:

```bash
bash -n scripts/install.sh
test -x scripts/install.sh
```

Expected: both commands succeed.

### Task 3: Add local skill listing

**Files:**
- Create: `scripts/list-skills.sh`

**Interfaces:**
- Consumes: the repository layout resolved from the script location.
- Produces: sorted repository-relative paths to all `SKILL.md` files.

- [ ] **Step 1: Add the Matt Pocock-style listing script**

Create this executable script:

```bash
#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$REPO"
find skills -name SKILL.md -not -path '*/node_modules/*' -print | sort
```

After creating it, run `chmod +x scripts/list-skills.sh`.

- [ ] **Step 2: Verify it works outside the repository root**

Run:

```bash
(cd /tmp && /Users/alejandrogarciaiglesias/Development/skills/scripts/list-skills.sh)
```

Expected: sorted `skills/<name>/SKILL.md` paths, including every current skill and no `personal-os` path.

### Task 4: Rewrite generic documentation

**Files:**
- Modify: `README.md`

**Interfaces:**
- Documents `skills/`, `scripts/install.sh`, and `scripts/list-skills.sh`.
- Documents interactive installation and forwarded CLI examples.

- [ ] **Step 1: Replace agent-specific instructions**

Document the repository as a generic Agent Skills collection. Include these commands:

```bash
./scripts/install.sh
./scripts/install.sh --all
./scripts/install.sh --skill morning --agent codex
./scripts/install.sh --copy
./scripts/list-skills.sh
```

Explain that the first command opens `npx skills`' interactive selection, while extra flags are forwarded to the CLI. Explain that `--global` is applied by the wrapper and that the CLI manages supported agents and symlink/copy behavior.

- [ ] **Step 2: Remove obsolete paths and claims**

Remove references to `personal-os`, the root-level `install.sh`, legacy agent-specific commands, and the original three-skill limitation. State that all current and future directories below `skills/` are discovered through `SKILL.md`.

### Task 5: Verify the complete migration

**Files:**
- Test: `scripts/install.sh`, `scripts/list-skills.sh`, `README.md`, moved `skills/**`

- [ ] **Step 1: Verify source paths and references**

Run:

```bash
test ! -e personal-os
test ! -e install.sh
test -d skills
test -x scripts/install.sh
test -x scripts/list-skills.sh
if rg -n "personal-os|(^|[[:space:]`])\./install\.sh" README.md; then exit 1; fi
```

Expected: old filesystem paths are absent, the new scripts are executable, and the README has no obsolete agent-specific references.

- [ ] **Step 2: Verify argument forwarding without making an installation**

Create a temporary fake `npx` executable earlier in `PATH` that records its arguments, then run:

```bash
TEMP_DIR="$(mktemp -d)"
mkdir -p "$TEMP_DIR/bin"
cat > "$TEMP_DIR/bin/npx" <<'EOF'
#!/usr/bin/env bash
printf '%s\n' "$@" > "$FAKE_NPX_ARGS"
EOF
chmod +x "$TEMP_DIR/bin/npx"
FAKE_NPX_ARGS="$TEMP_DIR/args" PATH="$TEMP_DIR/bin:$PATH" scripts/install.sh --all --agent codex
```

Expected arguments include `--yes`, `skills`, `add`, the absolute repository path, `--global`, `--all`, `--agent`, and `codex`, in that order.

- [ ] **Step 3: Verify real local installation in an isolated home**

Use the installed `npx skills` CLI with a temporary `HOME` and one explicitly selected supported agent:

```bash
TEMP_HOME="$(mktemp -d)"
HOME="$TEMP_HOME" DISABLE_TELEMETRY=1 npx --yes skills add "$PWD" --global --agent codex --yes
find "$TEMP_HOME" -path '*/skills/*/SKILL.md' -print | sort
```

Expected: the command succeeds without touching the real home directory and creates the repository's discovered skill installations under the temporary Codex-compatible global location. The installation method may be copy or symlink depending on the flags used.

- [ ] **Step 4: Verify repeatability and final status**

Run the isolated installation command a second time, run `bash -n` on both scripts, and inspect:

```bash
git status --short --branch
git diff --stat
```

Expected: the second installation succeeds; shell syntax is valid; the diff contains only the requested migration/docs/scripts plus the pre-existing user changes, which must remain untouched.
