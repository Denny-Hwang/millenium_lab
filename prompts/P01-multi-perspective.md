# P01 — Multi-Perspective Panel (5분야 패널)

## 사용 시점

- 가설을 시도(attempt)로 승격하기 직전, 또는
- 시도 초반 30분 내에 한 번.

본 프롬프트는 단일 분야 시각의 함정을 깨기 위해 5개 분야의 패널을 강제합니다.
charter §4.1(통섭적 접근)의 의무 항목입니다.

## 입력 변수

- `${PROBLEM_ID}` — 표적 문제 (예: `02-riemann`).
- `${HYPOTHESIS}` — 한 줄 가설.
- `${PANEL_DOMAINS}` — 정확히 5개의 분야 슬러그 배열.
  예: `["analytic-number-theory", "random-matrix-theory", "operator-algebras",
        "dynamical-systems", "combinatorics"]`.
- `${KNOWN_BRIDGES}` — 본 문제에 이미 인용된 다리 ID 목록 (없으면 빈 배열).

## 사전 읽기 파일

- `charter.md`
- `docs/methodology/proof-pipeline.md`
- `docs/problems/${PROBLEM_ID}/README.md`
- `docs/problems/${PROBLEM_ID}/equivalent-forms.md`
- `docs/problems/${PROBLEM_ID}/known-results.md`
- `bridges/_INDEX.md`

## 프롬프트 본문

```
당신은 5명의 전문가 패널을 사회로서 진행합니다. 표적 문제는 ${PROBLEM_ID}이며,
가설은 다음과 같습니다.

  "${HYPOTHESIS}"

패널 구성: ${PANEL_DOMAINS}

규칙:
1. 각 분야를 한 사람의 전문가로 의인화하여, 각자 1차 견해를 1단락으로 진술하게
   하세요. 다른 분야의 인사이트를 '번역'한 표현을 우선합니다.
2. 다음으로 패널 사이의 충돌점을 정확히 3개 추출하세요.
3. 충돌점마다 그 충돌이 거짓 충돌(언어 차이)인지 진짜 충돌(사실 주장 차이)인지
   판정하세요.
4. 진짜 충돌마다, 다음 단계의 시도가 어떤 데이터/계산/정리를 확보하면 충돌을
   해소할 수 있는지 1줄로 제시하세요.
5. 마지막에 본 가설이 통섭적으로 견고한지 (multi-domain robustness) 1~5점
   척도로 채점하고, 그 점수의 근거를 1단락으로 제시하세요.
6. 이미 인용된 다리(${KNOWN_BRIDGES})를 본 가설이 어떻게 강화/약화하는지
   언급하세요.

산출물은 마크다운으로, 6개 섹션을 그대로 따릅니다.
```

## 출력 형식 명세

```markdown
## 1. 패널 1차 견해
### {도메인1}
...
### {도메인2}
...
(5개)

## 2. 충돌점 3개
- C1: ...
- C2: ...
- C3: ...

## 3. 충돌 종류 판정
- C1: 거짓/진짜 — 사유
- C2: ...
- C3: ...

## 4. 충돌 해소 데이터/계산/정리
- C1: ...
- C2: ...
- C3: ...

## 5. Multi-domain Robustness Score
- 점수: N/5
- 근거: ...

## 6. 기존 다리에 대한 함의
- B-###: 강화/약화 — 이유
```

## 후속 작업

- robustness ≥ 4 → attempt 승격 권장.
- robustness ≤ 2 → 가설 폐기 또는 재구성.
- 새 다리 후보가 식별되면 → P02 호출.
