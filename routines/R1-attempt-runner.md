# R1 — Attempt Runner

## 호출 방법

```
사용자: R1 <problem-id> <model-name> [<hypothesis>]
```

또는 자연어로 "02-riemann에 새 시도 시작해줘"와 같이 받아도 됩니다.

## 입력

- `problem` — 표적 문제 ID (예: `02-riemann`)
- `model` — 현재 세션 모델 ID (예: `claude-opus-4-7`)
- `hypothesis` — 한 단락 분량 가설 (생략 시 사용자에게 질의)

## 단계별 작업

1. AGENTS.md / charter.md (§3, §4) / `docs/problems/<problem>/README.md` 확인.
2. `prompts/P01-multi-perspective.md`를 적용. 결과의 `promote_to_attempt`가
   `no`이면 사용자에게 보고하고 종료.
3. `bash scripts/new-attempt.sh <problem> <model>` 실행. 새 폴더 경로를
   기억해 둔다.
4. 발급된 폴더의 `prompt.md`에 사용한 표준 프롬프트 ID와 입력 변수 기록.
5. 본 attempt의 본문 작업 수행. 필요시 P02 또는 P03을 호출.
6. 종료 시 `result.md` 작성:
   - 핵심 인사이트, 후속 작업, outcome 라벨 후보 1개.
7. `meta.yaml`의 다음 필드를 갱신:
   - `outcome`, `key_insights`, `follow_ups`, `references`, `novel_bridges`,
     `duration_minutes`, `verification_status` (적용 가능한 레벨만).
8. R2(Result Classifier)를 호출하여 outcome 라벨이 적절한지 검증.
9. PR 본문에 사용된 prompt ID와 outcome을 명시한 뒤 PR 생성.

## 출력

- 새 attempt 폴더 (전체 5개 파일)
- PR 1개 (커밋 메시지 규약: `attempt(<problem>): A### {요지}`)

## 사용하는 prompts

- 필수: `P01-multi-perspective`
- 선택: `P02-bridge-discovery`, `P03-lemma-extraction`
