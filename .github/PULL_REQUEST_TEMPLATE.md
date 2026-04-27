<!--
PR 제목은 AGENTS.md §5 의 커밋 규약을 그대로 따른다. 예:
  attempt(02-riemann): A012 ζ-함수 영점의 random matrix 통계와의 정렬 검증
  candidate(04-yang-mills): PC-003 mass gap 하한 보조정리 갱신
  formal(05-navier-stokes): L07 mathlib Real.norm 의존 정리
  verify(L4): PC-002 가정 약화 시도 — survives
  chore(scaffold): {영역} 골격 추가

AI 에이전트가 만든 PR 은 본문 첫 줄에 [agent: <model-id>] 를 적는다.
-->

## 요약

TODO: 한 단락. 무엇이 왜 변경되었는지.

## 영향받은 영역

- [ ] root meta (README/AGENTS/CLAUDE/charter)
- [ ] docs/methodology
- [ ] docs/problems/<id>
- [ ] schemas/
- [ ] attempts/
- [ ] candidates/
- [ ] conjectures/
- [ ] bridges/
- [ ] prompts/
- [ ] routines/
- [ ] scripts/
- [ ] formalization/
- [ ] adversarial/
- [ ] reviews/
- [ ] analysis/
- [ ] .github/

## 검증 영향 (해당 시)

- [ ] L1 (자체 일관성)
- [ ] L2 (계산적 일치)
- [ ] L3 (형식 검증)
- [ ] L4 (적대적 검증)
- [ ] L5 (외부 리뷰)
- [ ] L6 (게재)
- [ ] L7 (2년 정착)

본 PR 은 어떤 검증 레벨도 새로 통과시키지 않는다면 위 모두 비워둡니다.

## 체크리스트

- [ ] `python scripts/validate-meta.py` 통과
- [ ] (해당 시) `lake build` 통과
- [ ] 변경된 영역의 `_INDEX.md` 또는 `README.md` 갱신
- [ ] 머지된 transcript / external 리뷰 / publication-track 미수정
- [ ] outcome 라벨이 taxonomy 정의에 부합 (claimed-solution / peer-reviewable 은 L6/L7 통과 후만)
- [ ] 커밋 메시지가 AGENTS.md §5 규약 준수

## 관련 ID

- attempts: A###
- candidates: PC-###
- conjectures: C-###
- bridges: B-###

## 비고

TODO
