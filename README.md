# Agent Skills Collection

Reusable skills for compatible coding agents. Each skill lives in its own directory below `skills/` and is discovered through its `SKILL.md` file.

## Skills

| Skill | What it is for |
| --- | --- |
| [`basic-memory-vault-access`](skills/basic-memory-vault-access/SKILL.md) | Routes all access to the user's Obsidian Second Brain through Basic Memory MCP, including verification and explicit fallback handling. |
| [`composition-first-architecture`](skills/composition-first-architecture/SKILL.md) | Guides architecture toward reusing, composing, and adapting mature components before building custom infrastructure. |
| [`eli5`](skills/eli5/SKILL.md) | Creates a simple, visual HTML explanation for someone with no prior knowledge of the topic. |
| [`morning`](skills/morning/SKILL.md) | Runs a context-aware morning interview and records priorities and direction in today's Obsidian Daily Note. |
| [`night`](skills/night/SKILL.md) | Runs an end-of-day interview that compares plans with outcomes and prepares a smoother start for tomorrow. |
| [`preventing-agent-regressions`](skills/preventing-agent-regressions/SKILL.md) | Turns verified, repeatable agent mistakes into corrected behavior and narrowly scoped project instructions. |
| [`weekly`](skills/weekly/SKILL.md) | Guides a weekly review, identifies patterns, defines the week's focus, and turns decisions into concrete tasks. |

## Repository layout

```text
AGENTS.md
README.md
skills/
  <skill-name>/
    SKILL.md
scripts/
  install.sh
  list-skills.sh
```

The repository is not limited to the skills that currently exist. Add a new `skills/<skill-name>/SKILL.md` directory and the CLI will discover it automatically.

## Helper scripts

| Script | Purpose |
| --- | --- |
| [`scripts/install.sh`](scripts/install.sh) | Installs skills from this checkout globally with the `skills` CLI and forwards any additional CLI arguments. |
| [`scripts/list-skills.sh`](scripts/list-skills.sh) | Prints a sorted list of every `SKILL.md` discovered under `skills/`, from any working directory. |

## Install

Node.js with `npx` is required.

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

The CLI manages agent-specific destinations. During interactive installation, choose symlinks to share one canonical installed copy across agents or copies for independent agent-specific files. Rerun the install command after adding or editing a local skill to refresh the installed version.

## List skills

List every discovered skill from any working directory:

```bash
./scripts/list-skills.sh
```

The output contains sorted repository-relative paths in the form `skills/<skill-name>/SKILL.md`.

## Create a skill

Create a directory containing a `SKILL.md` file:

```bash
mkdir -p skills/my-skill
touch skills/my-skill/SKILL.md
```

The file should contain valid Agent Skills frontmatter with at least `name` and `description`, followed by the instructions for the agent.

Add every new, renamed, or removed skill to the [Skills](#skills) table in the same change, then verify discovery with:

```bash
./scripts/list-skills.sh
```
