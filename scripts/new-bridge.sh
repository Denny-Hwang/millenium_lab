#!/usr/bin/env bash
# new-bridge.sh — create a new bridge document
#
# Usage: scripts/new-bridge.sh <slug>
#   <slug> in kebab-case (e.g., riemann-random-matrices)
set -euo pipefail

usage() {
  cat <<USAGE >&2
Usage: $0 <slug>
  slug   required. kebab-case. example: riemann-random-matrices
USAGE
  exit 2
}

[[ $# -eq 1 ]] || usage
SLUG="$1"

if [[ ! "$SLUG" =~ ^[a-z0-9]+(-[a-z0-9]+)+$ ]]; then
  echo "error: slug must be kebab-case (≥ 2 words). got: $SLUG" >&2
  exit 2
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BRIDGES_DIR="$REPO_ROOT/bridges"
TEMPLATE="$BRIDGES_DIR/_TEMPLATE.md"

[[ -f "$TEMPLATE" ]] || { echo "error: $TEMPLATE not found." >&2; exit 1; }

# Compute the next B-### ID.
last=0
shopt -s nullglob
for f in "$BRIDGES_DIR"/B-[0-9][0-9][0-9]-*.md; do
  base="$(basename "$f")"
  num="${base:2:3}"
  if [[ "$num" =~ ^[0-9]{3}$ ]]; then
    n=$((10#$num))
    if (( n > last )); then last=$n; fi
  fi
done
shopt -u nullglob
next=$((last + 1))
ID=$(printf "B-%03d" "$next")

TARGET="$BRIDGES_DIR/${ID}-${SLUG}.md"
[[ -e "$TARGET" ]] && { echo "error: target exists: $TARGET" >&2; exit 1; }

cp "$TEMPLATE" "$TARGET"

python3 - "$TARGET" "$ID" <<'PY'
import sys, pathlib
path, _id = sys.argv[1:3]
p = pathlib.Path(path)
t = p.read_text(encoding='utf-8')
t = t.replace("id: TODO", f"id: {_id}", 1)
p.write_text(t, encoding='utf-8')
PY

echo "OK: new bridge created"
echo "  file: $TARGET"
echo "  id:   $ID"
echo "  next: fill in the body and update bridges/_INDEX.md"
