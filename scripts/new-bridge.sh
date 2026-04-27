#!/usr/bin/env bash
# new-bridge.sh — 새 bridge 문서 생성
#
# 사용법: scripts/new-bridge.sh <slug>
#   <slug> 는 kebab-case (예: riemann-random-matrices)
set -euo pipefail

usage() {
  cat <<USAGE >&2
사용법: $0 <slug>
  slug   필수. kebab-case. 예: riemann-random-matrices
USAGE
  exit 2
}

[[ $# -eq 1 ]] || usage
SLUG="$1"

if [[ ! "$SLUG" =~ ^[a-z0-9]+(-[a-z0-9]+)+$ ]]; then
  echo "오류: slug 는 kebab-case 여야 합니다(2개 단어 이상). 입력: $SLUG" >&2
  exit 2
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BRIDGES_DIR="$REPO_ROOT/bridges"
TEMPLATE="$BRIDGES_DIR/_TEMPLATE.md"

[[ -f "$TEMPLATE" ]] || { echo "오류: $TEMPLATE 이 없습니다." >&2; exit 1; }

# 다음 B-### 계산
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
[[ -e "$TARGET" ]] && { echo "오류: 대상 존재: $TARGET" >&2; exit 1; }

cp "$TEMPLATE" "$TARGET"

python3 - "$TARGET" "$ID" <<'PY'
import sys, pathlib
path, _id = sys.argv[1:3]
p = pathlib.Path(path)
t = p.read_text(encoding='utf-8')
t = t.replace("id: TODO", f"id: {_id}", 1)
p.write_text(t, encoding='utf-8')
PY

echo "OK: 새 bridge 생성"
echo "  파일: $TARGET"
echo "  ID:   $ID"
echo "  다음 단계: 본문 채우기 + bridges/_INDEX.md 갱신"
