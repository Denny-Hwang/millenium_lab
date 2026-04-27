# P06 — Counterexample Search

## 사용 시점

추측 또는 후보의 결론에 대한 반례 후보를 계산적으로 탐색할 때.

## 입력 변수

- `target_id` — `C-###` 또는 `PC-###`
- `target_statement` — 자연어 진술
- `search_space_hint` — 탐색 공간 후보 (예: "discriminant ≤ 1e6 인 타원곡선")
- `budget_minutes` — 탐색 예산

## 사전 읽기

- 대상의 `statement.md` 또는 `claim.md`
- 같은 문제의 `failed-approaches.md`
- 가능한 경우 `attempts/.../artifacts/`의 기존 수치 데이터

## 프롬프트 본문

```
역할: 너는 반례를 찾으려는 계산 수학자다.
대상: {{target_id}} — {{target_statement}}
탐색 공간 힌트: {{search_space_hint}}
예산: {{budget_minutes}} 분

다음을 수행하라.
1. 진술을 검증 가능한 boolean predicate P(x)로 명세화.
   - 예: P(x) := ζ(s)=0 이고 Re(s)≠1/2 인 s가 존재.
2. 탐색 공간을 명확히 정의 (영역 + 분포 또는 격자).
3. {{budget_minutes}} 예산 안에 다음을 동작시키는 의사코드를 제시:
   - sample x → evaluate P(x) → log
4. 발견된 모든 반례 후보를 다음 형식으로 나열.
5. 반례가 없으면 그 자체를 보고 (강한 수치 증거).

주의:
- 부동소수점 한계로 인한 가짜 반례를 거를 검사 절차 명시.
- 재현 가능한 시드/입력을 명시.
```

## 출력 형식

```yaml
predicate: |
  ...
search_space: ...
algorithm_sketch: |
  ...
counterexample_candidates:
  - input: ...
    P_value: true | false
    sanity_checks: [...]
verdict: counterexample-found | strong-evidence-no-counterexample | inconclusive
```

## 후속 작업

- `counterexample-found` → 후보/추측의 `verification_status.L2`를 `fail`로
  갱신, 후보는 `abandoned` 검토.
- `strong-evidence-no-counterexample` → 추측의 `numerical_evidence_status`를
  `partial` 또는 `strong`으로 갱신.
- 입력·결과는 `artifacts/` 또는 `numerical-evidence/`에 보존.
