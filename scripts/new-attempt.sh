#!/usr/bin/env bash
# new-attempt.sh — create a new attempt folder
#
# Usage: scripts/new-attempt.sh <problem-id> <model-name>
#   <problem-id>  : 01-poincare | 02-riemann | 03-p-vs-np | 04-yang-mills
#                   05-navier-stokes | 06-hodge | 07-bsd
#   <model-name>  : model ID used. Example: claude-opus-4-7
#
# Behavior:
#  - Issues the next available A### ID.
#  - Copies attempts/_TEMPLATE to
#    attempts/<problem>/A###-<date>-<model>/.
#  - Auto-fills the id, problem, date, and model fields in meta.yaml.
set -euo pipefail

usage() {
  cat <<USAGE >&2
Usage: $0 <problem-id> <model-name>

  <problem-id>  required. one of:
                  01-poincare, 02-riemann, 03-p-vs-np,
                  04-yang-mills, 05-navier-stokes, 06-hodge, 07-bsd
  <model-name>  required. example: claude-opus-4-7
USAGE
  exit 2
}

[[ $# -eq 2 ]] || usage

PROBLEM="$1"
MODEL="$2"

ALLOWED=(01-poincare 02-riemann 03-p-vs-np 04-yang-mills 05-navier-stokes 06-hodge 07-bsd)
match=0
for p in "${ALLOWED[@]}"; do
  if [[ "$p" == "$PROBLEM" ]]; then match=1; break; fi
done
if [[ $match -eq 0 ]]; then
  echo "error: unknown problem-id '$PROBLEM'." >&2
  echo "allowed: ${ALLOWED[*]}" >&2
  exit 2
fi

if [[ -z "$MODEL" ]]; then
  echo "error: model-name is empty." >&2
  exit 2
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/attempts/_TEMPLATE"
TARGET_BASE="$REPO_ROOT/attempts/$PROBLEM"

if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "error: $TEMPLATE_DIR does not exist; repository is corrupted." >&2
  exit 1
fi

mkdir -p "$TARGET_BASE"

# Compute the next A### ID.
last=0
shopt -s nullglob
for d in "$TARGET_BASE"/A[0-9][0-9][0-9]-*; do
  base="$(basename "$d")"
  num="${base:1:3}"
  if [[ "$num" =~ ^[0-9]{3}$ ]]; then
    n=$((10#$num))
    if (( n > last )); then last=$n; fi
  fi
done
shopt -u nullglob
next=$((last + 1))
ID=$(printf "A%03d" "$next")

DATE="$(date -u +%Y-%m-%d)"
TARGET="$TARGET_BASE/${ID}-${DATE}-${MODEL}"

if [[ -e "$TARGET" ]]; then
  echo "error: target folder already exists: $TARGET" >&2
  exit 1
fi

cp -r "$TEMPLATE_DIR" "$TARGET"

META="$TARGET/meta.yaml"
# Fill meta.yaml automatically — replace TODO tokens.
# The date is quoted so PyYAML keeps it as a string (the schema requires
# `type: string`); without quoting it would deserialize as datetime.date.
python3 - "$META" "$ID" "$PROBLEM" "$DATE" "$MODEL" <<'PY'
import sys, pathlib
path, _id, prob, date, model = sys.argv[1:6]
p = pathlib.Path(path)
text = p.read_text(encoding='utf-8')
text = text.replace("id: TODO", f"id: {_id}", 1)
text = text.replace("problem: TODO", f"problem: {prob}", 1)
text = text.replace("date: TODO", f'date: "{date}"', 1)
text = text.replace("model: TODO", f"model: {model}", 1)
p.write_text(text, encoding='utf-8')
PY

echo "OK: new attempt created"
echo "  folder: $TARGET"
echo "  id:     $ID"
echo "  next:   fill in $TARGET/prompt.md, transcript.md, result.md"
