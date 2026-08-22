# Agent Skills Collection

Reusable skills for compatible coding agents. Each skill lives in its own directory below `skills/` and is discovered through its `SKILL.md` file.

## Repository layout

```text
skills/
  <skill-name>/
    SKILL.md
scripts/
  install.sh
  list-skills.sh
```

The repository is not limited to the skills that currently exist. Add a new `skills/<skill-name>/SKILL.md` directory and the CLI will discover it automatically.

## Install

Run the wrapper without flags to let the `skills` CLI interactively choose which skills and agents to install globally:

```bash
./scripts/install.sh
```

The wrapper delegates to:

```bash
npx --yes skills add "$REPO" --global
```

`--global` is always applied by the wrapper. Every other argument is forwarded to `npx skills`, so you can use the CLI's non-interactive options when needed:

```bash
# Install every discovered skill to every supported agent
./scripts/install.sh --all

# Install one skill for one agent
./scripts/install.sh --skill morning --agent codex

# Copy files instead of using symlinks
./scripts/install.sh --copy
```

The CLI manages agent-specific destinations. During interactive installation, choose symlinks for a live connection to this repository or copies for independent files. If you add or edit a skill locally, rerun the install command to refresh the installation.

## List skills

List every discovered skill from any working directory:

```bash
./scripts/list-skills.sh
```

The output contains sorted repository-relative paths such as `skills/morning/SKILL.md`.

## Create a skill

Create a directory containing a `SKILL.md` file:

```bash
mkdir -p skills/my-skill
touch skills/my-skill/SKILL.md
```

The file should contain valid Agent Skills frontmatter with at least `name` and `description`, followed by the instructions for the agent.
