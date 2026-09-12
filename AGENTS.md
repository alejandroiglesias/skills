# Repository maintenance

- Keep `README.md` as the repository index. Whenever a skill under `skills/` is added, removed, or renamed, update the README's Skills table in the same change with its relative link and a brief, accurate description derived from its `SKILL.md`.
- Whenever a helper under `scripts/` is added, removed, renamed, or its behavior changes, update the README's Helper scripts section in the same change.
- Before completing documentation changes, run `./scripts/list-skills.sh` and confirm that every discovered skill appears exactly once in the README.
- For skills that change agent behavior, record a baseline without the skill and test the final version in independent contexts before installation; structural validation alone is insufficient.
