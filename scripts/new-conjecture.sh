#!/usr/bin/env bash
# new-conjecture.sh — create a new conjecture folder
#
# Usage: scripts/new-conjecture.sh <problem-id> [<parent-attempt-id>]
set -euo pipefail

usage() {
  cat <<USAGE >&2
Usage: $0 <problem-id> [<parent-attempt-id>]
  problem-id        required. 01-poincare | 02-riemann | ... | 07-bsd
  parent-attempt-id optional. A### form (the script will prompt).
USAGE
  exit 2
}

[[ $# -ge 1 && $# -le 2 ]] || usage

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/conjectures/_TEMPLATE"
CONJ_DIR="$REPO_ROOT/conjectures"

PROBLEM="$1"
PARENT="${2:-}"

ALLOWED=(01-poincare 02-riemann 03-p-vs-np 04-yang-mills 05-navier-stokes 06-hodge 07-bsd)
match=0
for p in "${ALLOWED[@]}"; do
  if [[ "$p" == "$PROBLEM" ]]; then match=1; break; fi
done
if [[ $match -eq 0 ]]; then
  echo "error: unknown problem-id '$PROBLEM'." >&2
  exit 2
fi

if [[ -z "$PARENT" ]]; then
  read -r -p "Parent attempt id (A### or empty): " PARENT
fi
if [[ -n "$PARENT" && ! "$PARENT" =~ ^A[0-9]{3}$ ]]; then
  echo "error: invalid parent attempt id: $PARENT" >&2
  exit 2
fi

# Compute the next C-### ID.
last=0
shopt -s nullglob
for d in "$CONJ_DIR"/C-[0-9][0-9][0-9]-*; do
  base="$(basename "$d")"
  num="${base:2:3}"
  if [[ "$num" =~ ^[0-9]{3}$ ]]; then
    n=$((10#$num))
    if (( n > last )); then last=$n; fi
  fi
done
shopt -u nullglob
next=$((last + 1))
ID=$(printf "C-%03d" "$next")

read -r -p "Conjecture slug (short kebab-case): " SLUG
SLUG="${SLUG:-untitled}"
TARGET="$CONJ_DIR/${ID}-${SLUG}"
[[ -e "$TARGET" ]] && { echo "error: target exists: $TARGET" >&2; exit 1; }

cp -r "$TEMPLATE_DIR" "$TARGET"

DATE="$(date -u +%Y-%m-%d)"

cat > "$TARGET/meta.yaml" <<META
# conjecture meta — follows schemas/conjecture-meta.schema.yaml.
id: ${ID}
statement: |
  TODO: one-line statement.
parent_problem: ${PROBLEM}
parent_attempt: ${PARENT:-A000}
numerical_evidence_status: none
lean_status: none
references: []
META

if [[ -f "$TARGET/status.md" ]]; then
  python3 - "$TARGET/status.md" "$ID" "$PROBLEM" "$PARENT" "$DATE" <<'PY'
import sys, pathlib
path, _id, prob, parent, date = sys.argv[1:6]
p = pathlib.Path(path)
t = p.read_text(encoding='utf-8')
t = t.replace("id: TODO", f"id: {_id}", 1)
t = t.replace("parent_problem: TODO", f"parent_problem: {prob}", 1)
t = t.replace("parent_attempt: TODO", f"parent_attempt: {parent or 'A000'}", 1)
t = t.replace("last_updated: TODO", f'last_updated: "{date}"', 1)
t = t.replace("# Status — TODO", f"# Status — {_id}", 1)
t = t.replace("| TODO | none | none | registered |", f"| {date} | none | none | registered |", 1)
p.write_text(t, encoding='utf-8')
PY
fi

echo "OK: new conjecture created"
echo "  folder: $TARGET"
echo "  id: $ID  problem: $PROBLEM  parent: ${PARENT:-(none)}"
