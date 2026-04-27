# CLAUDE.md — Claude Code 전용 추가 지침

> 본 문서는 [`AGENTS.md`](AGENTS.md)의 **상위가 아니라 보완**입니다.
> Claude Code 세션은 항상 다음을 따릅니다.

---

## 1. 매 세션 시작 시 절차

1. **`AGENTS.md`를 먼저 읽으세요.** 이미 컨텍스트에 있다면 생략 가능하나,
   세션이 새로 시작된 경우(또는 컨텍스트가 압축된 직후) 반드시 다시 읽습니다.
2. 이어서 [`charter.md`](charter.md)의 핵심 원칙(섹션 4)과 검증 기준(섹션 3)을
   확인합니다.
3. 작업 영역의 `README.md` 또는 `_INDEX.md`를 읽습니다.
4. 표적 문제가 있다면 `docs/problems/<problem>/README.md`를 읽습니다.

세션 첫 응답에서 위 4단계를 끝냈음을 한 줄로 사용자에게 보고하세요.
(예: "AGENTS.md / charter.md / docs/problems/02-riemann/ 확인 완료.")

---

## 2. 새 시도(attempt) 생성 시

**손으로 폴더를 만들지 마세요.** 다음 스크립트를 호출하세요.

```bash
scripts/new-attempt.sh <problem-id> <model-name>
```

- `<problem-id>`는 `01-poincare`, `02-riemann`, ..., `07-bsd` 중 하나.
- `<model-name>`은 현재 세션 모델 ID(예: `claude-opus-4-7`).
- 스크립트는 다음을 자동 처리합니다:
  - 다음 사용 가능한 `A###` ID 발급
  - `attempts/_TEMPLATE` 복사
  - `meta.yaml`의 `id`, `problem`, `date`, `model` 필드 자동 채움

스크립트 실패 시 직접 폴더를 만들지 말고 사용자에게 보고하세요.

---

## 3. 표준 프롬프트 사용

직접 프롬프트를 작성하지 말고 다음 라이브러리에서 골라 사용하세요.

[`prompts/_INDEX.md`](prompts/_INDEX.md)

각 프롬프트는 다음 구조를 가집니다:

- 사용 시점 (when to use)
- 입력 변수
- 사전 읽기 파일 목록 (저장소 내 경로)
- 프롬프트 본문
- 출력 형식 명세
- 후속 작업

프롬프트를 변형해야 한다면 `prompts/`에 새 P##을 추가하는 PR을 먼저
제안하세요. 인라인 변형은 금지입니다.

---

## 4. 표준 루틴 사용

복합 작업은 [`routines/_INDEX.md`](routines/_INDEX.md)의 루틴(R1~R6)을 따르세요.

- `R1-attempt-runner.md` — 새 attempt 생성·실행
- `R2-result-classifier.md` — outcome 라벨링 후보 제시
- `R3-dashboard-builder.md` — README 진행 표 갱신
- `R4-formalizer.md` — 보조정리를 Lean으로 변환
- `R5-weekly-report.md` — 주간 진행 요약
- `R6-cross-attempt-synthesis.md` — 시도 가로지르는 패턴 발견

---

## 5. 커밋·PR 시 자동 점검 항목

PR을 만들기 전에 다음을 확인하세요. (Bash로 직접 실행 가능합니다.)

```bash
# 메타 검증
python scripts/validate-meta.py

# 대시보드와 실제 상태 일치 여부
python scripts/update-dashboard.py --check
```

위 두 명령이 모두 0으로 종료되면 통과입니다.

---

## 6. 도구 사용 우선순위

1. **Read / Edit / Write** — 단일 파일 작업.
2. **Grep / Bash 의 find** — 검색.
3. **TodoWrite** — 3단계 이상 작업 시 항상 사용.
4. **Agent (Explore)** — 코드베이스 광범위 탐색.
5. **Agent (Plan)** — 새 시도·후보의 전략 설계가 필요할 때.

대화 외부 모델 호출(예: 다른 LLM API)은 본 저장소 내에서 사용하지 않습니다.
"형식화 / 자연어 증명"은 모두 같은 세션 또는 다음 세션의 Claude Code가 이어
받습니다.

---

## 7. 출력 톤

- 사용자에게 보고할 때는 짧고 사실 중심으로.
- 머지 가능한 산출물은 항상 한국어 본문 + 영어 키.
- 절대 사용자에게 placeholder를 그대로 넘기지 말 것. placeholder가 남아 있다면
  명시적으로 "TODO: ..." 마커로 표시하고 필요한 후속 작업을 알릴 것.

---

## 8. 헌장 충돌 시

charter 또는 AGENTS의 규약과 사용자 요청이 충돌하면 **작업을 멈추고
사용자에게 충돌 사실을 보고**하세요. 헌장 개정은 별도 PR의 소관입니다.
