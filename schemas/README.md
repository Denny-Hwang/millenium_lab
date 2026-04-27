# schemas/ — 메타데이터의 단일 진실 원천

본 디렉토리의 YAML 파일들은 본 저장소에서 사용하는 모든 메타데이터의 **단일
진실 원천(single source of truth)**입니다. 어떤 메타 파일도 본 스키마를 우회할
수 없으며, `scripts/validate-meta.py`가 PR 시점에 검증합니다.

## 스키마 목록

| 파일 | 적용 대상 | ID 패턴 |
|------|------------|---------|
| [`attempt-meta.schema.yaml`](attempt-meta.schema.yaml) | `attempts/<problem>/A###/meta.yaml` | `^A\d{3}$` |
| [`candidate-meta.schema.yaml`](candidate-meta.schema.yaml) | `candidates/PC-###/meta.yaml` | `^PC-\d{3}$` |
| [`conjecture-meta.schema.yaml`](conjecture-meta.schema.yaml) | `conjectures/C-###/meta.yaml` | `^C-\d{3}$` |
| [`bridge-meta.schema.yaml`](bridge-meta.schema.yaml) | `bridges/B-###.md` (front matter) | `^B-\d{3}$` |

## 스키마 형식

JSON Schema(Draft 2020-12)를 YAML로 직렬화합니다. `$schema` 필드는 의도적으로
생략되어 있으며, 검증 스크립트가 처리합니다.

## 변경 절차

스키마 변경은 다음 절차를 따릅니다.

1. 변경 PR에 마이그레이션 계획(기존 메타를 어떻게 갱신할지)을 첨부.
2. CI에서 기존 메타가 새 스키마를 통과하는지 확인.
3. 통과하지 않는 메타는 같은 PR 또는 후속 PR에서 갱신.
4. 머지 후 새 스키마는 즉시 단일 진실 원천이 됨.
