# adversarial/ — 자체 반증 트랙

본 디렉토리는 본 저장소의 **자기 자신을 깨려는 노력**을 보관합니다. 헌장 §4.3에
따라, 어떤 후보도 적대적 검증 없이 외부로 나갈 수 없습니다.

## 하위 구조

```
adversarial/
  counterexample-search/      # 추측·후보의 결론에 대한 반례 후보 탐색
    <target-id>/              # 예: C-001-modular-equidistribution/, PC-002-...
      attempt-001/
        meta.yaml
        method.md
        results.md
        artifacts/
  proof-attacks/              # 후보 증명에 대한 의도적 공격
    <candidate-id>/           # 예: PC-002-rh-via-rmt/
      round-001/
        meta.yaml
        attack.md
        verdict.md
        artifacts/
```

## 작업 절차

### 반례 후보 탐색 (counterexample-search)

1. P06 프롬프트로 의사코드를 생성.
2. 의사코드를 `method.md`에 보존, 실행 결과는 `artifacts/`에 보존.
3. 종합 결과 `results.md`에 다음을 기록:
   - 결론: counterexample-found / strong-evidence-no-counterexample / inconclusive
   - 표적 추측·후보의 메타에 어떤 라벨 변화를 권고하는지

### 후보 공격 (proof-attacks)

1. P07 프롬프트(또는 사람 리뷰어)로 공격 라운드 수행.
2. 라운드 결과를 `verdict.md`에 기록 (survives / needs-patch / lethal).
3. 라운드 종료 시 해당 후보의 `candidates/PC-###/attacks.md`에 요약 행 추가.

## 누가 수행하는가

- 후보 작성자가 아닌 **다른 모델·다른 세션** 에이전트 또는 사람.
- 같은 후보를 한 사람·세션이 모두 수행한 경우, 다음 라운드는 다른 주체로
  강제됩니다.

## 메타

본 디렉토리의 메타데이터 스키마는 단계적으로 추가될 예정입니다.

> TODO: 추후 정밀 작성. 첫 후보가 등장하면 그에 맞춰 `attack-meta.schema.yaml`
> 추가를 검토.
