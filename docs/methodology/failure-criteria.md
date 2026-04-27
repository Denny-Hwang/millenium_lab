# Failure Criteria — 폐기와 휴면 전환 기준

본 문서는 후보(candidate)와 표적 문제(problem) 단위에서 **언제 폐기·휴면을
선언할 것인가**를 정의합니다. 명확한 기준이 없으면 우리는 가망 없는 후보에
무한히 매달리거나, 빠르게 포기해야 할 시점을 놓칠 수 있습니다.

---

## 1. 후보(candidate) 폐기 기준

다음 중 어느 하나가 성립하면 후보를 `status: abandoned`로 전환합니다.

### 1.1 lethal flaw 확정

- 적대적 검증(L4) 또는 외부 리뷰(L5)에서 **수정 불가능한 결함**이 확인됨.
  - 예: 핵심 보조정리에 알려진 반례.
  - 예: 사용된 가정이 본질적으로 위배되며, 가정 약화로도 우회 불가.

### 1.2 형식화 한계

- 핵심 보조정리가 6개월 이상 형식화 진척 0%에 머무름.
- 단, 형식화는 어렵지만 자연어 증명이 견고하고 외부 전문가가 동의하는 경우는
  예외(메인테이너 합의 필요).

### 1.3 출처 attempts 전부 회수

- 후보의 `origin_attempts` 모두가 `flawed-attempt` 또는 `no-progress`로 재라벨됨.

### 1.4 헌장 위반

- 후보가 CMI 공식 진술과 다른 명제를 풀고 있음이 명백.
- 우회 불가능한 절차 위반(예: AI 단독 외부 송부 시도).

---

## 2. 폐기된 후보의 처리

- 삭제 금지. `status: abandoned`로 갱신, `claim.md`에 폐기 사유 추가.
- `lessons-learned.md`(없으면 생성)에 다음을 기록:
  - 어디서 깨졌는가
  - 회피 가능했는가
  - 다른 후보에 같은 위험이 있는가
- 부산 추측이나 다리가 있다면 `conjectures/`·`bridges/`로 이전.

---

## 3. 표적 문제(problem)의 휴면(dormant) 전환

다음 조건이 모두 성립하면 `docs/problems/<problem>/status.md`에서
`active` → `dormant` 전환을 PR로 제안합니다.

### 3.1 정량 조건

- 최근 6개월간 새 attempt 수 ≤ 2.
- 활성 후보(`status: active`) 수 = 0.
- 6개월간 outcome `partial-insight`/`novel-approach` 0건.

### 3.2 정성 조건

- 마지막 R6(cross-attempt synthesis) 보고가 "동일 패턴 반복"을 강하게 시사.
- 외부 분야의 결정적 진척(예: 새 도구의 등장)을 기다리는 것이 합리적.

휴면은 **포기가 아닙니다.** 새 attempt는 언제든 재기동될 수 있으며, 휴면 PR
본문에는 재기동 트리거(예: 특정 도구의 가용성, 특정 보조정리의 해결)를
명시합니다.

---

## 4. 휴면 해제

- 새 attempt가 outcome `partial-insight` 이상으로 종료되면 자동으로 `active`
  복귀를 제안.
- 또는 외부 사건(다른 분야의 정리 발표 등)으로 메인테이너가 직접 PR 제출.

---

## 5. solved 전환

- L7 통과(2년 정착 완료) 후에만 `status: solved-<year>`로 전환 가능.
- 푸앵카레 추측은 본 저장소 활동과 무관하게 이미 `solved-2003`(Perelman).

---

## 6. 폐기·휴면 PR 규약

```
verify(close): PC-### abandoned — {핵심 사유}
problem(<id>): dormant transition — {조건 충족 요지}
problem(<id>): reactivate — {트리거}
```

PR 본문에는 정량·정성 조건 체크리스트와, 회수된 부산 자산(추측·다리)의
경로를 명시합니다.
