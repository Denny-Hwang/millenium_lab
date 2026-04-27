# P07 — Adversarial Review

## 사용 시점

후보 증명에 대한 의도적 공격. 가능한 한 후보 작성자와 **다른 모델·다른 세션**의
에이전트가 수행합니다.

## 입력 변수

- `candidate_id`
- `attack_kinds` — 다음 중 ≥3개:
  - `weaken_assumption`
  - `chain_lethal_lemma_failure`
  - `domain_swap`
  - `boundary_case`
  - `circular_reasoning_check`
  - `quantifier_alternation_check`

## 사전 읽기

- `candidates/<candidate>/claim.md`
- `candidates/<candidate>/strategy.md`
- `candidates/<candidate>/main-proof.md`
- `candidates/<candidate>/lemmas/`
- `candidates/<candidate>/gaps.md`
- `candidates/<candidate>/attacks.md` (이전 라운드)

## 프롬프트 본문

```
역할: 너는 후보 증명을 깨려는 적대적 리뷰어다. 너는 작성자가 아니다.
후보: {{candidate_id}}
공격 종류: {{attack_kinds}}

각 공격 종류에 대해 다음을 수행하라.
1. 공격의 정확한 시나리오 (어떤 가정을 어떻게 변형하는가).
2. 변형된 시나리오 하에서 후보의 어떤 단계가 어떻게 깨지는가.
3. 후보가 살아남는다면 그 이유를 한 단락으로 정당화.
4. 각 공격에 대해 한 줄 결론:
   - "survives" / "needs-patch:<patch-요지>" / "lethal:<요지>"

마지막에 라운드 종합 결론.
```

## 출력 형식

```yaml
attacks:
  - kind: weaken_assumption
    scenario: ...
    breakage: ...
    survival_argument: ...
    verdict: survives | needs-patch:... | lethal:...
round_verdict: pass | partial | fail
suggested_patches:
  - location: ...
    proposal: ...
```

## 후속 작업

- `attacks.md`에 본 라운드 기록 추가.
- `needs-patch`는 후보에 회송, `gaps.md`에 G### 추가.
- `lethal` 1건이라도 발생하면 후보 status `abandoned` 검토.
- `pass`라면 L4 통과 PR 작성.
