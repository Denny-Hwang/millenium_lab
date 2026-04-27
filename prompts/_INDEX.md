# prompts/ — 표준 프롬프트 라이브러리

본 디렉토리는 본 저장소에서 **공식적으로 사용 가능한 프롬프트의 단일 진실
원천**입니다. 인라인 변형은 금지이며, 새 변형이 필요하면 새로운 P##을
추가하는 PR을 먼저 만들어야 합니다.

## 사용 시점 매트릭스

| 단계 \ 의도 | 다관점 검토 | 다리 탐색 | 보조정리 | 형식화 | 빈틈 | 반례 | 적대적 | 추측 검증 |
|--------------|:-----------:|:---------:|:--------:|:------:|:----:|:----:|:------:|:---------:|
| 가설(idea)               | **P01**     | **P02**   |          |        |      |      |        |           |
| 시도(attempt) 진입        | **P01**     | P02       | (P03)    |        |      |      |        |           |
| 후보 승격 직전            |             |           | **P03**  |        |      |      |        |           |
| 후보(candidate) 작성      |             |           | P03      | **P04**| P05  |      |        |           |
| 적대적 검증(L4)           |             |           |          |        | **P05** | **P06** | **P07** |       |
| 추측 등록 시              |             |           |          |        |      |      |        | **P08**   |

별표는 권장 진입점, 괄호는 보조 사용입니다.

## 프롬프트 목록

| ID | 파일 | 용도 |
|----|------|------|
| P01 | [P01-multi-perspective.md](P01-multi-perspective.md) | 5분야 패널 강제 시뮬레이션 |
| P02 | [P02-bridge-discovery.md](P02-bridge-discovery.md) | 두 분야 사이 새 다리 탐색 |
| P03 | [P03-lemma-extraction.md](P03-lemma-extraction.md) | 자연어 증명에서 보조정리 추출 |
| P04 | [P04-formalization.md](P04-formalization.md) | 보조정리를 Lean 4로 변환 |
| P05 | [P05-gap-finder.md](P05-gap-finder.md) | 후보 증명의 빈틈 자동 탐지 |
| P06 | [P06-counterexample.md](P06-counterexample.md) | 추측의 반례 후보 계산 탐색 |
| P07 | [P07-adversarial-review.md](P07-adversarial-review.md) | 후보 증명에 대한 의도적 공격 |
| P08 | [P08-conjecture-validation.md](P08-conjecture-validation.md) | 작은 사례에서 추측 수치 검증 |

## 프롬프트 추가 PR 규약

- ID는 다음 사용 가능한 P##을 사용 (현재 P09 부터).
- 본 인덱스의 매트릭스도 함께 갱신.
- 같은 의도의 기존 프롬프트가 있다면 통합을 우선 검토.
