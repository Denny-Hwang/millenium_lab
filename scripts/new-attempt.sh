#!/usr/bin/env bash
# new-attempt.sh — 새 attempt 폴더 생성
#
# 사용법: scripts/new-attempt.sh <problem-id> <model-name>
#   <problem-id>  : 01-poincare | 02-riemann | 03-p-vs-np | 04-yang-mills
#                   05-navier-stokes | 06-hodge | 07-bsd
#   <model-name>  : 사용한 모델 ID. 예: claude-opus-4-7
#
# 동작:
#  - 다음 사용 가능한 A### ID 발급
#  - attempts/_TEMPLATE 을 attempts/<problem>/A###-<date>-<model>/ 로 복사
#  - meta.yaml 의 id, problem, date, model 필드를 자동 채움
set -euo pipefail

usage() {
  cat <<USAGE >&2
사용법: $0 <problem-id> <model-name>

  <problem-id>  필수. 다음 중 하나:
                  01-poincare, 02-riemann, 03-p-vs-np,
                  04-yang-mills, 05-navier-stokes, 06-hodge, 07-bsd
  <model-name>  필수. 예: claude-opus-4-7
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
  echo "오류: 알 수 없는 problem-id '$PROBLEM'." >&2
  echo "허용 값: ${ALLOWED[*]}" >&2
  exit 2
fi

if [[ -z "$MODEL" ]]; then
  echo "오류: model-name 이 비어있습니다." >&2
  exit 2
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/attempts/_TEMPLATE"
TARGET_BASE="$REPO_ROOT/attempts/$PROBLEM"

if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "오류: $TEMPLATE_DIR 가 존재하지 않습니다. 저장소가 손상되었습니다." >&2
  exit 1
fi

mkdir -p "$TARGET_BASE"

# 다음 A### ID 계산
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
  echo "오류: 대상 폴더가 이미 존재합니다: $TARGET" >&2
  exit 1
fi

cp -r "$TEMPLATE_DIR" "$TARGET"

META="$TARGET/meta.yaml"
# meta.yaml 자동 채움 — sed 로 TODO 토큰을 교체
python3 - "$META" "$ID" "$PROBLEM" "$DATE" "$MODEL" <<'PY'
import sys, pathlib
path, _id, prob, date, model = sys.argv[1:6]
p = pathlib.Path(path)
text = p.read_text(encoding='utf-8')
text = text.replace("id: TODO", f"id: {_id}", 1)
text = text.replace("problem: TODO", f"problem: {prob}", 1)
text = text.replace("date: TODO", f"date: {date}", 1)
text = text.replace("model: TODO", f"model: {model}", 1)
p.write_text(text, encoding='utf-8')
PY

echo "OK: 새 attempt 생성"
echo "  폴더: $TARGET"
echo "  ID:   $ID"
echo "  다음 단계: $TARGET/prompt.md, transcript.md, result.md 채우기"
