# Prompt — 사용한 표준 프롬프트 기록

본 attempt에서 사용한 표준 프롬프트의 ID와 입력 변수, 그리고 모델에 실제로
넣은 최종 프롬프트의 사본을 보존합니다. 표준 프롬프트는
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md) 참조.

---

## 사용한 표준 프롬프트

- 프롬프트 ID: `P01-multi-perspective`
- 변형 여부: `none`
- 입력 변수:
  - `PROBLEM_ID`: `03-p-vs-np`
  - `HYPOTHESIS`: "P vs NP의 알려진 세 장벽(relativization, natural proofs,
    algebrization)을 동시에 우회하려면, GCT(geometric complexity theory)의
    representation-theoretic obstruction을 호몰로지적 회로 복잡도
    (homological circuit complexity)로 lift해야 하며, 이때 회로 다양체의
    sheaf cohomology 클래스가 분리의 증인(witness) 역할을 한다."
  - `PANEL_DOMAINS`: `["circuit-complexity", "geometric-complexity-theory",
    "communication-complexity", "homological-complexity",
    "quantum-complexity"]`
  - `KNOWN_BRIDGES`: `[]`  <!-- bridges/ 디렉토리는 본 시도 시점에 비어 있음 -->

## 사전 읽기 파일

- `charter.md` (§3, §4)
- `AGENTS.md`
- `docs/methodology/proof-pipeline.md`
- `docs/problems/03-p-vs-np/README.md`
- `docs/problems/03-p-vs-np/equivalent-forms.md` (placeholder 상태)
- `docs/problems/03-p-vs-np/known-results.md` (placeholder 상태)
- `bridges/_INDEX.md`

## 최종 프롬프트 사본

```text
당신은 5명의 전문가 패널을 사회로서 진행합니다. 표적 문제는 03-p-vs-np이며,
가설은 다음과 같습니다.

  "P vs NP의 알려진 세 장벽(relativization, natural proofs, algebrization)을
   동시에 우회하려면, GCT의 representation-theoretic obstruction을 호몰로지적
   회로 복잡도로 lift해야 하며, 이때 회로 다양체의 sheaf cohomology 클래스가
   분리의 증인 역할을 한다."

패널 구성: ["circuit-complexity", "geometric-complexity-theory",
            "communication-complexity", "homological-complexity",
            "quantum-complexity"]

규칙:
1. 각 분야를 한 사람의 전문가로 의인화하여, 각자 1차 견해를 1단락으로
   진술하게 하세요. 다른 분야의 인사이트를 '번역'한 표현을 우선합니다.
2. 다음으로 패널 사이의 충돌점을 정확히 3개 추출하세요.
3. 충돌점마다 그 충돌이 거짓 충돌(언어 차이)인지 진짜 충돌(사실 주장 차이)
   인지 판정하세요.
4. 진짜 충돌마다, 다음 단계의 시도가 어떤 데이터/계산/정리를 확보하면
   충돌을 해소할 수 있는지 1줄로 제시하세요.
5. 마지막에 본 가설이 통섭적으로 견고한지 (multi-domain robustness)
   1~5점 척도로 채점하고, 그 점수의 근거를 1단락으로 제시하세요.
6. 이미 인용된 다리([])를 본 가설이 어떻게 강화/약화하는지 언급하세요.

산출물은 마크다운으로, 6개 섹션을 그대로 따릅니다.
```

## TODO 마커

- `equivalent-forms.md`, `known-results.md`, `failed-approaches.md`가 모두
  placeholder 상태이므로, 본 attempt의 패널 출력은 모델 내부 지식에 의존합니다.
  → 후속 작업: 03-p-vs-np 표적 문서의 정밀화 PR이 선행되어야 attempt 품질이
  안정화됩니다.
