# reviews/ — 리뷰 트랙

본 디렉토리는 본 저장소의 **모든 리뷰 활동**을 보관합니다.

## 하위 구조

```
reviews/
  internal/             # 내부 리뷰 (저장소 메인테이너 또는 다른 에이전트)
    <candidate-id>/
      review-001.md
      ...
  external/             # 외부 전문가 비공식 리뷰 (L5)
    <candidate-id>/
      <reviewer-slug>/
        request.md
        review.md       ← 머지 후 동결
  publication-track/    # 학술지 투고 (L6)
    <candidate-id>/
      <journal-slug>/
        submission.pdf
        round-001/
          referee-A.md
          referee-B.md
          response.md
        decision.md     ← 게재 결정 사본
```

## 진입 규칙

- `external/` 와 `publication-track/` 는 인간 메인테이너 서명 없이 어떤
  에이전트도 추가할 수 없습니다.
- 머지된 외부 리뷰는 본인 동의 없이 수정·삭제 금지(헌장 §3, AGENTS.md §3).
- 본 디렉토리의 송부 자료(저널 투고 등)는 PR 본문에 다음을 모두 포함해야 함:
  - L1~L5 통과 증명
  - 형식화되지 않은 부분의 명시 목록
  - 송부 시점 후보 메타의 스냅샷

## 메타

본 디렉토리는 자체 메타 스키마를 정의하지 않습니다(외부 문서 보존이 주 목적).
필요한 정보는 후보 메타의 `publication` 필드에 담깁니다.

> TODO: 추후 정밀 작성. 첫 외부 리뷰 요청이 발생할 때 본 README에 절차의
> 구체 사례를 추가.
