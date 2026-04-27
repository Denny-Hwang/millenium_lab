# P08 — Conjecture Validation (Numerical)

## 사용 시점

새 추측(C-###)에 대해 작은 사례에서의 수치 검증을 수행할 때.

## 입력 변수

- `conjecture_id`
- `statement` — 자연어 또는 수식
- `cases` — 검증하고자 하는 작은 사례 명세 (입력 분포 또는 격자)
- `tolerance` — 부동소수점 허용 오차

## 사전 읽기

- `conjectures/<conjecture>/statement.md`
- `conjectures/<conjecture>/numerical-evidence/` (이미 있는 결과)

## 프롬프트 본문

```
역할: 너는 추측을 작은 사례에서 모순 없이 검증하려는 계산 수학자다.
추측: {{conjecture_id}} — {{statement}}
검증 사례: {{cases}}
허용 오차: {{tolerance}}

다음을 수행하라.
1. 추측을 입력 x → expected(x) ≈ measured(x) 형식의 검증 함수로 명세.
2. 각 사례를 차례로 검증한 결과를 표로 출력.
3. 모순이 없으면 다음 한 줄 결론:
   - "no-contradiction; sample size N; max-deviation D"
4. 모순이 발생하면 즉시 P06(Counterexample) 호출 권고.
주의: 부동소수점 한계 + AC/choice 사용 여부 명시.
```

## 출력 형식

```yaml
predicate: |
  expected(x) ≈ measured(x), tolerance = {{tolerance}}
results:
  - x: ...
    expected: ...
    measured: ...
    deviation: ...
    pass: yes | no
verdict: no-contradiction | contradiction-found
sample_size: N
max_deviation: D
artifacts_path: ...
```

## 후속 작업

- `no-contradiction` 누적 → `numerical_evidence_status`를 `partial` → `strong`으로 갱신.
- `contradiction-found` → 추측의 `numerical_evidence_status: contradicted` 갱신,
  부모 attempt에 회송.
- 모든 입력·결과는 `numerical-evidence/`에 보존.
