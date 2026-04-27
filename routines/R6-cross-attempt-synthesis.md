# R6 — Cross-attempt Synthesis

## 호출 방법

```
사용자: R6 <problem-id> [<window-days>]
```

`<window-days>` 생략 시 90.

## 입력

- 표적 문제 ID
- 분석 기간(일)

## 단계별 작업

1. `attempts/<problem>/`에서 기간 내 attempt 폴더 전수 수집.
2. 각 attempt의 `meta.yaml.outcome`, `key_insights`, `follow_ups`,
   `novel_bridges`를 모음.
3. 다음 패턴을 탐지:
   - **반복 막힘 패턴** — 동일 표현/위치에서 반복되는 보조정리 실패.
   - **수렴하는 인사이트** — 서로 다른 attempt에서 같은 객체·정리에 도달.
   - **잠재적 다리** — 두 attempt가 서로 다른 분야에서 같은 현상을 가리킴.
4. 패턴별로 1단락 요약 + 권고:
   - 신규 후보 승격 가능 여부
   - 신규 추측 등록 가능 여부
   - 다리 등록 가능 여부 (P02 호출 권고)
5. 동일 문제의 attempt 중 `no-progress` 5건 이상이면 자동으로 dormant 전환
   가능성을 제안 (확정은 사용자).

## 출력

- `analysis/cross-synthesis/<problem>-<date>.md`
- 발견된 패턴마다 issue 또는 PR 권고.

## 사용하는 prompts

- 선택: `P02-bridge-discovery` (잠재적 다리 발견 시).
