# Contributing to Millennium Lab

본 문서는 **사람 기여자**를 위한 안내입니다. AI 에이전트는 별도로
[`AGENTS.md`](AGENTS.md)와 [`CLAUDE.md`](CLAUDE.md)를 참조하세요.

---

## 0. 시작하기 전에

1. [`charter.md`](charter.md)를 한 번 통독하세요. 본 프로젝트의 목표/비목표/
   검증 기준에 동의하지 않는 기여는 머지될 수 없습니다.
2. 본 저장소는 **연구 산출물 저장소**이지 일반 SaaS 코드베이스가 아닙니다.
   기여 단위는 "기능"이 아니라 **시도(attempt)·후보(candidate)·다리(bridge)·
   추측(conjecture)**입니다.

---

## 1. 작업 흐름

```
fork & clone
  → 새 브랜치 (feature/<짧은 이름> 또는 attempt/<problem>/<slug>)
  → 스크립트로 폴더 생성
  → 메타·본문 작성
  → 로컬 검증 (validate-meta.py / lean build)
  → 커밋 (규약 준수)
  → push & PR
```

---

## 2. 커밋 메시지 규약

[`AGENTS.md` §5](AGENTS.md)의 규약을 그대로 따릅니다. 예:

```
attempt(02-riemann): A012 ζ-함수 영점의 random matrix 통계와의 정렬 검증
candidate(04-yang-mills): PC-003 mass gap 하한의 미세 조정 보조정리 갱신
chore(scaffold): bridges 영역 골격 추가
formal(05-navier-stokes): L07 보조정리 mathlib Real.norm 의존 정리
verify(L4): PC-002 가정 약화 시도 — survives
review(internal): PC-002 internal-review-001 — flag: gap at §3.2
```

---

## 3. PR 체크리스트

PR을 만들 때 [`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md)
의 모든 항목을 체크해 주세요. 핵심은 다음과 같습니다.

- [ ] `python scripts/validate-meta.py` 통과
- [ ] 변경된 영역의 `_INDEX.md` 또는 `README.md` 갱신
- [ ] (해당 시) Lean 빌드 로컬 통과
- [ ] (해당 시) outcome 라벨이 taxonomy 정의에 부합
- [ ] 커밋 메시지가 규약 준수
- [ ] 머지된 transcript/리뷰 수정 없음

---

## 4. 표적 문제 선택

`docs/problems/_INDEX.md`에서 status를 확인하세요.

- `solved-2003` — 참고용. 직접적 시도 머지는 불가.
- `not-started` — 가장 많은 표면적 진척이 가능.
- `active` — 진행 중. 기존 후보(`candidates/`)를 먼저 읽고 중복을 피하세요.
- `dormant` — 일정 기간 진척이 없어 휴면된 상태. 재기동은 별도 PR로 사유와
  함께 제안.

---

## 5. 형식화에 기여하기

[`formalization/README.md`](formalization/README.md)를 먼저 읽으세요.

- Lean 4 + mathlib을 사용합니다.
- 보조정리 단위로 PR을 작게 쪼개세요. 큰 PR은 리뷰가 어려워 머지가 늦어집니다.
- `formalization/shared/`에 들어가는 공통 인프라는 가능한 한 mathlib 컨벤션을
  따르세요.

---

## 6. 외부 리뷰 / 저널 트랙

외부 인사가 작성한 글은 메인테이너가 직접 추가합니다. 일반 기여자는 이
영역에 PR을 직접 만들지 않습니다.

---

## 7. 행동 규약

- 비판은 **아이디어와 증명**을 향합니다. 사람을 향하지 않습니다.
- 빈틈을 발견했다면 후보 작성자를 비난하지 말고, 빈틈을 명확히 기술하고
  적대적 검증 트랙으로 옮겨 주세요.
- AI 산출물도 사람의 산출물도 똑같은 검증 기준을 통과해야 합니다.

---

## 8. 라이선스

기여한 모든 산출물은 본 저장소의 라이선스([`LICENSE`](LICENSE))를 따른다는 데
동의한 것으로 간주합니다.
