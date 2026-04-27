# R2 — Result Classifier

## 호출 방법

```
사용자: R2 <attempt-folder>
```

## 입력

- `attempt-folder` — 예: `attempts/02-riemann/A012-2026-04-27-claude-opus-4-7/`

## 단계별 작업

1. 폴더의 `result.md`, `meta.yaml`, `transcript.md`(필요시)를 읽는다.
2. `docs/methodology/outcome-taxonomy.md`의 7개 라벨 정의를 참조.
3. 다음 결정 트리를 적용:
   - 새 인사이트도 없고 정리·요약도 없으면 → `no-progress`
   - 정리·요약은 잘 되었으나 새 진척 없음 → `survey`
   - 명백한 결함 (가정 위반, 순환 논리, 알려진 반례 무시) → `flawed-attempt`
   - 후속에 인용 가능한 부분 인사이트 → `partial-insight`
   - 기존 문헌에 명시적으로 없는 접근 → `novel-approach`
   - L6/L7 미통과 상태에서 `claimed-solution`/`peer-reviewable` 사용은 즉시 거부.
4. 후보 라벨 1개와 그 사유 1단락을 사용자에게 제시.
5. 사용자가 동의하면 `meta.yaml`의 `outcome` 필드를 갱신.

## 출력

- 후보 라벨 1개 + 사유 1단락.
- 동의 시 `meta.yaml` 갱신 PR.

## 사용하는 prompts

없음 (본 루틴은 메타 분류이지 모델 호출이 핵심이 아님).
