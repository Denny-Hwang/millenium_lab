# P04 — Formalization (Lean 4 변환)

## 사용 시점

- P03가 산출한 보조정리 1개를 Lean 4 + mathlib으로 옮길 때.
- 또는 기존 Lean 파일에서 `sorry` 1개를 제거할 때.

본 프롬프트는 한 번에 **보조정리 1개**만 다룹니다. 여러 개를 한 번에 시도하지
마세요.

## 입력 변수

- `${LEMMA_ID}` — 예: `L05`.
- `${LEMMA_STATEMENT}` — 자연어 진술.
- `${LEMMA_DEPENDENCIES}` — 의존하는 보조정리/외부 정리 목록.
- `${TARGET_FILE}` — 대상 `.lean` 파일 경로 (예: `candidates/PC-001/lemmas/L05.lean`).

## 사전 읽기 파일

- `formalization/README.md`
- `${TARGET_FILE}` (이미 존재 시)
- 의존 보조정리들의 `.lean` 파일

## 프롬프트 본문

```
당신은 Lean 4 + mathlib 프로페셔널입니다. 다음 보조정리 1개를 Lean으로
형식화합니다.

보조정리 ID: ${LEMMA_ID}
진술: ${LEMMA_STATEMENT}
의존: ${LEMMA_DEPENDENCIES}
대상 파일: ${TARGET_FILE}

규칙:
1. import 절은 mathlib 상위 모듈 위주로 최소화.
2. 명제 선언은 `theorem ${LEMMA_ID} : ... := by ...` 형식.
3. 증명은 다음을 우선 시도:
   a. mathlib에 이미 있는 정리의 직접 적용.
   b. 의존 보조정리 호출.
   c. `decide`/`norm_num`/`simp`/`ring`/`linarith` 등 자동화.
   d. 그래도 막히면 명확히 `sorry`로 표시하고 그 이유를 주석으로 남김.
4. 한 줄짜리 자연어 주석으로 단계별 의도 설명.
5. 컴파일을 가정하지 말고, 사용한 mathlib 정리의 정확한 이름이 확실치 않으면
   추측하지 말고 'TODO: 정리 이름 확인 필요' 주석을 남길 것.
6. 가능하면 Mathlib namespace open을 명시.

산출물은 .lean 파일의 전체 내용 1개와, 그 아래에 다음 보고를 마크다운으로
첨부:
- 사용한 mathlib 정리 목록
- 남아 있는 sorry 와 그 이유
- 다음 단계 추천 (다른 보조정리, 자동화 강화, 의존 mathlib 정리 등)
```

## 출력 형식 명세

```text
-- file: ${TARGET_FILE}
import Mathlib...

namespace ...

theorem ${LEMMA_ID} : ... := by
  ...

end ...
```

```markdown
## 사용한 mathlib 정리
- ...

## 남아 있는 sorry
- 위치 ...: 사유 ...

## 다음 단계
- ...
```

## 후속 작업

- 산출 파일을 저장 후 `lake build`로 검증.
- 빌드 실패 시 P04를 다시 호출(같은 보조정리, 추가 정보로).
- 빌드 성공 시 후보 메타의 `formalization_progress` 갱신.
