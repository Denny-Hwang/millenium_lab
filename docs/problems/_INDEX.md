# 7대 밀레니엄 난제 — 진행 상태 인덱스

본 인덱스는 7개 표적 문제의 현재 status를 한눈에 보여줍니다. 표는
`scripts/update-dashboard.py`에 의해 자동 갱신될 수 있으나, 본 파일은
디렉토리 진입 가이드 역할도 하므로 사람이 손으로 갱신하는 것도 허용됩니다.
(상충 시 자동 갱신본이 우선합니다.)

> status 라벨 정의는 [`../methodology/outcome-taxonomy.md`](../methodology/outcome-taxonomy.md)와
> [`../methodology/failure-criteria.md`](../methodology/failure-criteria.md)를 참조.

<!-- PROBLEMS:BEGIN -->

| ID | 디렉토리 | 문제 | Status | 활성 후보 수 | 마지막 attempt |
|----|----------|------|--------|--------------|-----------------|
| 01 | [01-poincare](01-poincare/) | Poincaré Conjecture | solved-2003 | 0 | — |
| 02 | [02-riemann](02-riemann/) | Riemann Hypothesis | not-started | 0 | — |
| 03 | [03-p-vs-np](03-p-vs-np/) | P vs NP | not-started | 0 | — |
| 04 | [04-yang-mills](04-yang-mills/) | Yang–Mills Existence and Mass Gap | not-started | 0 | — |
| 05 | [05-navier-stokes](05-navier-stokes/) | Navier–Stokes Existence and Smoothness | not-started | 0 | — |
| 06 | [06-hodge](06-hodge/) | Hodge Conjecture | not-started | 0 | — |
| 07 | [07-bsd](07-bsd/) | Birch and Swinnerton-Dyer Conjecture | not-started | 0 | — |

<!-- PROBLEMS:END -->

---

## 가능한 status 값

- `solved-YYYY` — 외부에서 이미 해결된 문제(참고용).
- `not-started` — 아직 어떤 attempt도 머지되지 않음.
- `active` — 시도가 진행 중. 활성 후보가 있을 수 있음.
- `dormant` — 일정 기간 진척이 없어 휴면 상태(트리거 명시됨).

자세한 규칙은 [`../methodology/failure-criteria.md`](../methodology/failure-criteria.md).
