# scripts/ — 스캐폴딩·검증·대시보드 스크립트

| 스크립트 | 역할 | 기본 호출 |
|----------|------|-----------|
| [`new-attempt.sh`](new-attempt.sh) | 새 attempt 폴더 생성 | `scripts/new-attempt.sh <problem-id> <model-name>` |
| [`new-candidate.sh`](new-candidate.sh) | 새 candidate 폴더 생성 | `scripts/new-candidate.sh <attempt-id> [<attempt-id> ...]` |
| [`new-conjecture.sh`](new-conjecture.sh) | 새 conjecture 폴더 생성 | `scripts/new-conjecture.sh <problem-id>` |
| [`new-bridge.sh`](new-bridge.sh) | 새 bridge 문서 생성 | `scripts/new-bridge.sh <slug>` |
| [`validate-meta.py`](validate-meta.py) | 모든 meta.yaml 검증 | `python scripts/validate-meta.py` |
| [`update-dashboard.py`](update-dashboard.py) | README 진행 표 갱신 | `python scripts/update-dashboard.py [--check]` |
| [`build-data.py`](build-data.py) | 메타 → CSV 빌드 | `python scripts/build-data.py` |

## 종속성

- Bash 5+
- Python 3.10+
- PyPI: `pyyaml`, `jsonschema` (validate-meta.py 가 사용)

## 친절한 에러 메시지 정책

모든 스크립트는 인자 누락 시 `usage`를 출력하고 0이 아닌 종료 코드를 반환합니다.
스키마 위반 또는 ID 충돌 시 어떤 파일/필드가 문제인지를 한국어로 명시합니다.
