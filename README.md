# Hermes Personal OS Skills

This folder contains three Hermes skills:

- `/morning`
- `/night`
- `/weekly`

## Install

### Copy install

Copy the `personal-os` folder into your Hermes skills directory:

```bash
./install.sh
```

or explicitly:

```bash
./install.sh --copy
```

This copies the skills into:

```bash
~/.hermes/skills/personal-os
```

### Symlink install

For development, symlink the repo folder instead:

```bash
./install.sh --symlink
```

This creates:

```bash
~/.hermes/skills/personal-os -> ./personal-os
```

Use this if you want Hermes to use the latest local repo changes immediately after `git pull`, without copying the folder again.

## Check

```bash
hermes skills list | grep -E "morning|night|weekly"
```

To see whether the skills are copied or symlinked:

```bash
ls -la ~/.hermes/skills
readlink ~/.hermes/skills/personal-os
```

If `readlink` prints a path, it is symlinked. If it prints nothing, it is probably copied.

## Test

```bash
hermes chat -q "/morning Start my day"
hermes chat -q "/night Close my day"
hermes chat -q "/weekly Help me do my weekly review"
```
