#!/usr/bin/env bash
# new-candidate.sh — create a new candidate folder
#
# Usage: scripts/new-candidate.sh <attempt-id> [<attempt-id> ...]
#  - At least one source attempt is required.
#  - Issues the next available candidates/PC-### ID.
#  - Copies candidates/_TEMPLATE.
#  - Fills id and origin_attempts in meta.yaml.
#  - Infers problem from the first attempt's problem.
set -euo pipefail

usage() {
  cat <<USAGE >&2
Usage: $0 <attempt-id> [<attempt-id> ...]
  attempt-id is in A### form, e.g. A012.
USAGE
  exit 2
}

[[ $# -ge 1 ]] || usage

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/candidates/_TEMPLATE"
CANDIDATES_DIR="$REPO_ROOT/candidates"

# Validate each attempt-id and extract the first attempt's problem.
FIRST_PROBLEM=""
for aid in "$@"; do
  if [[ ! "$aid" =~ ^A[0-9]{3}$ ]]; then
    echo "error: invalid attempt-id: $aid" >&2
    exit 2
  fi
  found=""
  while IFS= read -r d; do
    base="$(basename "$d")"
    if [[ "$base" =~ ^${aid}- ]]; then
      found="$d"
      break
    fi
  done < <(find "$REPO_ROOT/attempts" -mindepth 2 -maxdepth 2 -type d 2>/dev/null)
  if [[ -z "$found" ]]; then
    echo "error: could not find attempt $aid." >&2
    exit 1
  fi
  if [[ -z "$FIRST_PROBLEM" ]]; then
    FIRST_PROBLEM="$(basename "$(dirname "$found")")"
  fi
done

# Compute the next PC-### ID.
last=0
shopt -s nullglob
for d in "$CANDIDATES_DIR"/PC-[0-9][0-9][0-9]-*; do
  base="$(basename "$d")"
  num="${base:3:3}"
  if [[ "$num" =~ ^[0-9]{3}$ ]]; then
    n=$((10#$num))
    if (( n > last )); then last=$n; fi
  fi
done
shopt -u nullglob
next=$((last + 1))
ID=$(printf "PC-%03d" "$next")

read -r -p "Candidate slug (short kebab-case): " SLUG
SLUG="${SLUG:-untitled}"
TARGET="$CANDIDATES_DIR/${ID}-${SLUG}"
if [[ -e "$TARGET" ]]; then
  echo "error: target already exists: $TARGET" >&2
  exit 1
fi

cp -r "$TEMPLATE_DIR" "$TARGET"

# meta.yaml may not be in the template; create it fresh.
DATE="$(date -u +%Y-%m-%d)"
ORIGINS_YAML=""
for aid in "$@"; do
  ORIGINS_YAML+="
  - $aid"
done

cat > "$TARGET/meta.yaml" <<META
# candidate meta — follows schemas/candidate-meta.schema.yaml.
id: ${ID}
problem: ${FIRST_PROBLEM}
status: active
claim_summary: |
  TODO: one-line summary of the conclusion.
strategy_summary: |
  TODO: one-paragraph strategy.
lemma_count: 1
formalization_progress: 0
gaps_known: []
origin_attempts:${ORIGINS_YAML}
verification_status:
  L1: pending
  L2: n/a
  L3: n/a
  L4: n/a
  L5: n/a
  L6: n/a
  L7: n/a
META

# Fill last_updated in status.md.
if [[ -f "$TARGET/status.md" ]]; then
  python3 - "$TARGET/status.md" "$ID" "$DATE" <<'PY'
import sys, pathlib
path, _id, date = sys.argv[1:4]
p = pathlib.Path(path)
t = p.read_text(encoding='utf-8')
t = t.replace("id: TODO", f"id: {_id}", 1)
t = t.replace("last_updated: TODO", f'last_updated: "{date}"', 1)
t = t.replace("# Status — TODO", f"# Status — {_id}", 1)
t = t.replace("| TODO | active | candidate registered |", f"| {date} | active | candidate registered |", 1)
p.write_text(t, encoding='utf-8')
PY
fi

echo "OK: new candidate created"
echo "  folder: $TARGET"
echo "  id:     $ID"
echo "  problem: $FIRST_PROBLEM"
echo "  origin_attempts: $*"
