# R5 — Weekly Report

## 호출 방법

```
사용자: R5 [<week-of-date>]
```

`<week-of-date>` 생략 시 오늘이 속한 주.

## 입력

- 주의 시작 일자 (월요일).

## 단계별 작업

1. `git log --since=<monday> --until=<sunday>`로 한 주의 커밋을 수집.
2. 다음 항목을 추출:
   - 새로 등록된 attempts (`attempt(...)` 커밋)
   - 새로 등록된/갱신된 candidates
   - 새 conjectures, 새 bridges
   - 형식화 진척 변화 (`formal(...)` 커밋)
   - 검증 레벨 통과/실패 (`verify(L#)`)
   - 외부/내부 리뷰 사건 (`review(...)`)
3. `docs/problems/_INDEX.md`의 status 변경 여부 점검.
4. `analysis/per-problem-progress.md`를 갱신할 후보 항목 추출.
5. 한국어 요약(섹션 5개): 진척 / 후퇴 / 새 발견 / 위험 / 다음 주 우선순위.
6. 결과를 `analysis/weekly/<YYYY-Www>.md`로 저장하고 PR 생성.

## 출력

- 한 개의 주간 보고 마크다운.
- 위험 항목이 있으면 GitHub issue 자동 생성 권고(사용자 승인 후 실행).

## 사용하는 prompts

- 없음. 본 루틴은 git/메타 합성이 핵심.
