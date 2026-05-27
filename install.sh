#!/usr/bin/env bash
set -euo pipefail

MODE="copy"

usage() {
	cat <<'EOF'
Usage: ./install.sh [--copy|--symlink]

Options:
  --copy, -c      Copy the personal-os skills into ~/.hermes/skills/ (default)
  --symlink, -s   Symlink the personal-os skills into ~/.hermes/skills/
  --help, -h      Show this help message

Examples:
  ./install.sh
  ./install.sh --copy
  ./install.sh --symlink
EOF
}

while [[ $# -gt 0 ]]; do
	case "$1" in
		--copy|-c)
			MODE="copy"
			;;
		--symlink|-s)
			MODE="symlink"
			;;
		--help|-h)
			usage
			exit 0
			;;
		*)
			echo "Unknown option: $1" >&2
			usage
			exit 1
			;;
	esac
	shift
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/personal-os"
TARGET_DIR="$HOME/.hermes/skills"
TARGET="$TARGET_DIR/personal-os"

if [[ ! -d "$SOURCE" ]]; then
	echo "Could not find skills folder: $SOURCE" >&2
	exit 1
fi

mkdir -p "$TARGET_DIR"

if [[ -e "$TARGET" || -L "$TARGET" ]]; then
	rm -rf "$TARGET"
fi

if [[ "$MODE" == "symlink" ]]; then
	ln -s "$SOURCE" "$TARGET"
	echo "Symlinked personal-os skills into ~/.hermes/skills/"
	echo "Source: $SOURCE"
else
	cp -R "$SOURCE" "$TARGET"
	echo "Copied personal-os skills into ~/.hermes/skills/"
fi

echo ""
echo "Try:"
echo '  hermes skills list | grep -E "morning|night|weekly"'
