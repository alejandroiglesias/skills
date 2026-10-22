#!/usr/bin/env bash
# Adapted from https://github.com/obra/superpowers/blob/main/tests/skill-size/test-skill-size.sh
# Measure bytes, which is stricter than characters for non-ASCII text.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
LIMIT=20000

failed=0
while IFS= read -r -d '' skill; do
  size=$(wc -c < "$skill" | tr -d '[:space:]')
  if ((size >= LIMIT)); then
    echo "FAIL: ${skill#"$REPO_ROOT"/} is $size bytes (limit: under $LIMIT)" >&2
    failed=1
  fi
done < <(find "$REPO_ROOT/skills" -name SKILL.md -not -path '*/node_modules/*' -type f -print0)

if ((failed)); then
  echo "Move content the skill only needs sometimes into its references/ directory." >&2
  exit 1
fi
echo "PASS: every SKILL.md is under $LIMIT bytes"
