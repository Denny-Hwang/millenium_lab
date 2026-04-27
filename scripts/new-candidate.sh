#!/usr/bin/env bash
# new-candidate.sh — 새 candidate 폴더 생성
#
# 사용법: scripts/new-candidate.sh <attempt-id> [<attempt-id> ...]
#  - 출처 attempt 1개 이상 필요
#  - candidates/PC-### 의 다음 사용 가능 ID 발급
#  - candidates/_TEMPLATE 복사
#  - meta.yaml 의 id, origin_attempts 채움
#  - problem 은 첫 attempt 의 problem 에서 추론
set -euo pipefail

usage() {
  cat <<USAGE >&2
사용법: $0 <attempt-id> [<attempt-id> ...]
  attempt-id 는 A### 형식. 예: A012
USAGE
  exit 2
}

[[ $# -ge 1 ]] || usage

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/candidates/_TEMPLATE"
CANDIDATES_DIR="$REPO_ROOT/candidates"

# attempt-id 검증 + 첫 attempt 의 problem 추출
FIRST_PROBLEM=""
for aid in "$@"; do
  if [[ ! "$aid" =~ ^A[0-9]{3}$ ]]; then
    echo "오류: 잘못된 attempt-id: $aid" >&2
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
    echo "오류: attempt $aid 를 찾을 수 없습니다." >&2
    exit 1
  fi
  if [[ -z "$FIRST_PROBLEM" ]]; then
    FIRST_PROBLEM="$(basename "$(dirname "$found")")"
  fi
done

# 다음 PC-### 계산
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

read -r -p "후보 슬러그(짧은 kebab-case): " SLUG
SLUG="${SLUG:-untitled}"
TARGET="$CANDIDATES_DIR/${ID}-${SLUG}"
if [[ -e "$TARGET" ]]; then
  echo "오류: 대상이 이미 존재: $TARGET" >&2
  exit 1
fi

cp -r "$TEMPLATE_DIR" "$TARGET"

# meta.yaml 이 템플릿엔 없을 수 있으므로 새로 생성
DATE="$(date -u +%Y-%m-%d)"
ORIGINS_YAML=""
for aid in "$@"; do
  ORIGINS_YAML+="
  - $aid"
done

cat > "$TARGET/meta.yaml" <<META
# candidate meta — schemas/candidate-meta.schema.yaml 을 따른다.
id: ${ID}
problem: ${FIRST_PROBLEM}
status: active
claim_summary: |
  TODO: 한 줄 결론 요지.
strategy_summary: |
  TODO: 전략 한 단락.
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

# status.md 의 last_updated 채움
if [[ -f "$TARGET/status.md" ]]; then
  python3 - "$TARGET/status.md" "$ID" "$DATE" <<'PY'
import sys, pathlib
path, _id, date = sys.argv[1:4]
p = pathlib.Path(path)
t = p.read_text(encoding='utf-8')
t = t.replace("id: TODO", f"id: {_id}", 1)
t = t.replace("last_updated: TODO", f"last_updated: {date}", 1)
t = t.replace("# Status — TODO", f"# Status — {_id}", 1)
t = t.replace("| TODO | active | 후보 등록 |", f"| {date} | active | 후보 등록 |", 1)
p.write_text(t, encoding='utf-8')
PY
fi

echo "OK: 새 candidate 생성"
echo "  폴더: $TARGET"
echo "  ID:   $ID"
echo "  problem: $FIRST_PROBLEM"
echo "  origin_attempts: $*"
