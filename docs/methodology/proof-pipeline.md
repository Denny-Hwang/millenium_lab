# 증명 파이프라인 (Proof Pipeline)

본 문서는 한 줄짜리 가설이 어떻게 동료심사 통과 가능한 정식 증명으로 점진적
승격되는지를 단계별로 정의합니다. 각 단계는 저장소의 어떤 디렉토리·메타·검증
레벨과 1:1로 대응됩니다.

```
가설(idea)
  → 시도(attempt)            attempts/<problem>/A###-...
  → 후보(candidate)          candidates/PC-###-...
  → 형식화(formalization)    formalization/projects/<problem>/...
  → 적대적 검증(adversarial) adversarial/proof-attacks/<candidate>/
  → 외부 리뷰                 reviews/external/<candidate>/
  → 학술지 투고               reviews/publication-track/<candidate>/
  → 게재 (publication)
  → 2년 정착 (settlement)
```

각 단계에는 통과 기준(검증 레벨)과 산출물(메타·본문)이 정해져 있습니다.

---

## 단계 1 — 가설 (idea)

- 형식: 자유 노트, 개인 스크래치 또는 issue.
- 산출물 요건: 없음. 하지만 가설을 시도로 승격할 때는 다음을 명시해야 함.
  - 표적 문제 ID
  - 어느 5분야 패널의 어떤 인사이트에서 비롯되었는가
  - 기존 attempts와의 차이

가설이 한 줄로 압축된 후 [`prompts/P01-multi-perspective.md`](../../prompts/P01-multi-perspective.md)
필터를 통과해야 시도로 승격할 수 있습니다.

---

## 단계 2 — 시도 (attempt)

- 형식: `attempts/<problem>/A###-<date>-<model>/`
- 산출물:
  - `meta.yaml` (스키마: `schemas/attempt-meta.schema.yaml`)
  - `prompt.md` (사용한 표준 프롬프트의 ID와 입력 변수)
  - `transcript.md` (AI 대화 전문, **머지 후 동결**)
  - `result.md` (요약 + outcome 라벨 + 인사이트 + 후속 작업 제안)
  - `artifacts/` (그래프·계산 결과 등)
- 종료 조건: outcome 라벨 부여.
- 가능한 outcome: `no-progress`, `survey`, `flawed-attempt`, `partial-insight`,
  `novel-approach`. 이 단계에서는 `claimed-solution`/`peer-reviewable` 사용 불가.

시도 5건이 같은 문제에서 누적되면 R6(cross-attempt synthesis) 루틴이 자동
권고됩니다.

---

## 단계 3 — 후보 (candidate)

- 형식: `candidates/PC-###-<slug>/`
- 진입 조건:
  - 출처 attempt 1개 이상이 outcome `partial-insight`/`novel-approach`로 라벨됨.
  - 진입 PR에서 [`prompts/P03-lemma-extraction.md`](../../prompts/P03-lemma-extraction.md)
    실행 결과가 첨부됨.
- 산출물:
  - `meta.yaml` (스키마: `schemas/candidate-meta.schema.yaml`)
  - `claim.md`, `strategy.md`, `main-proof.md`, `gaps.md`, `attacks.md`
  - `lemmas/L##.md`, `lemmas/L##.lean`
  - `reviews/` (받은 리뷰 보존, 머지 후 동결)

검증 레벨 **L1**(자체 일관성)을 통과해야 후보로 등록됩니다.

---

## 단계 4 — 형식화 (formalization)

- 위치: `formalization/projects/<problem>/PC-###/`
- 산출물: 보조정리 단위 `.lean` 파일과 `lakefile.lean` 의존성 정리.
- 통과 기준:
  - 각 보조정리 빌드 통과.
  - 후보 메타의 `formalization_progress`가 갱신됨.
  - L3 통과 = "핵심 보조정리들이 빌드되며, 주요 정리의 자연어 증명에 대응됨".

---

## 단계 5 — 적대적 검증 (adversarial)

- 위치: `adversarial/proof-attacks/PC-###/`
- 행위:
  - 가정 약화 시도
  - 반례 후보 탐색 ([`prompts/P06-counterexample.md`](../../prompts/P06-counterexample.md))
  - 의도적 빈틈 탐지 ([`prompts/P05-gap-finder.md`](../../prompts/P05-gap-finder.md))
  - 적대적 리뷰 ([`prompts/P07-adversarial-review.md`](../../prompts/P07-adversarial-review.md))
- 통과 기준 (L4): 의도된 모든 공격이 실패하거나, 발견된 빈틈이 후보 수정으로
  닫혔음을 PR로 증명.

가능한 한 후보 작성자와 **다른 모델·다른 세션**의 에이전트가 공격을 수행합니다.

---

## 단계 6 — 외부 리뷰 (external review, L5)

- 위치: `reviews/external/PC-###/`
- 절차:
  - 메인테이너가 외부 전문가 ≥3인을 섭외.
  - 리뷰 요청서·자료 패키지 동결 후 송부.
  - 받은 리뷰 원본은 본인 동의 없이 수정·삭제 금지.
- 통과 기준: lethal flaw 보고 0건. 작은 빈틈은 후보로 회송하여 닫음.

---

## 단계 7 — 학술지 투고 (publication track, L6)

- 위치: `reviews/publication-track/PC-###/`
- 산출물:
  - 투고 PDF
  - 동료심사 라운드별 응답
  - 게재 결정 사본
- 통과 기준: CMI가 인정하는 권위 학술지에 **게재**.

본 단계의 어떤 송부도 인간 메인테이너 서명 PR을 거칩니다.

---

## 단계 8 — 2년 정착 (settlement, L7)

- 행위: 게재일로부터 24개월간 다음을 모니터링.
  - 본질적 반증
  - 핵심 보조정리에 대한 후속 인용에서의 공백 보고
  - errata 발생 여부
- 통과 기준: 24개월 무결. 메타 라벨 `peer-reviewable` 확정.

L7 통과 후에야 CMI 상금 청구 절차가 가능합니다(charter §6).

---

## 부록 — 단계 간 회송 규칙

- 후보 단계에서 lethal flaw 발견 → attempt 단계로 회송 가능 (`status: abandoned`).
- 형식화 단계에서 보조정리 결함 발견 → 후보 단계로 회송, 후보 메타의
  `gaps_known`에 기록.
- 외부 리뷰에서 빈틈 보고 → 적대적 검증 트랙으로 우회한 뒤 후보로 갱신.

회송은 부끄러움이 아니라 파이프라인의 정상 작동입니다.
