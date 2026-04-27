# P02 — Bridge Discovery (다리 탐색)

## 사용 시점

- P01의 결과 새 다리 후보가 식별됐을 때
- 또는 같은 표적 문제에서 attempts 5개 이상 누적 후 R6에서 분야 간 패턴이
  관찰됐을 때

## 입력 변수

- `${DOMAIN_A}`, `${DOMAIN_B}` — 두 분야 슬러그.
- `${PROBLEM_IDS}` — 본 다리가 영향을 줄 수 있는 표적 문제 ID 목록.
- `${CONTEXT_TRIGGER}` — 본 다리가 떠오른 출처(예: 어떤 attempt의 어떤 인사이트).

## 사전 읽기 파일

- `bridges/_INDEX.md`
- `bridges/_TEMPLATE.md`
- `docs/methodology/proof-pipeline.md`
- 관련 문제 디렉토리들의 `README.md`, `known-results.md`

## 프롬프트 본문

```
당신은 두 분야 ${DOMAIN_A}, ${DOMAIN_B} 사이의 가능한 다리를 발견·평가합니다.

맥락: ${CONTEXT_TRIGGER}.
연결 후보 문제: ${PROBLEM_IDS}.

다음 절차를 따르세요.

1. 두 분야가 공유하는 객체·언어·정리를 5개 후보로 나열.
2. 각 후보에 대해 maturity 라벨 부여:
   - established: 학계가 인정하는 알려진 연결.
   - emerging: 일부 그룹이 연구 중.
   - speculative: 가설적, 강한 증거 부재.
   - ai-discovered: 본 세션에서 처음 명시화된 가능성.
3. 가장 강한 후보 1개를 선택하고, 그 후보 위에서 본 표적 문제 ${PROBLEM_IDS}에
   기여 가능한 명제 또는 변환을 1~3개 제시.
4. 본 다리 위에서 즉시 깨질 수 있는 가능성(거짓 다리)을 1개 이상 제시.
5. 본 다리 등록 시 bridges/_TEMPLATE.md 의 6개 섹션 각각에 들어갈 내용을
   bullet point로 제시.

산출물은 마크다운, 5개 섹션 헤더 그대로.
```

## 출력 형식 명세

```markdown
## 1. 후보 5개
- 후보1 — 객체/언어/정리 설명
- ...

## 2. Maturity 라벨링
- 후보1: established/emerging/speculative/ai-discovered — 사유
- ...

## 3. 선택 후보 위의 명제/변환
- ...

## 4. 거짓 다리 가능성
- ...

## 5. _TEMPLATE.md 채울 내용
- 1. 왜 연결되는가: ...
- 2. 알려진 결과: ...
- 3. 막힌 지점: ...
- 4. 미개척 방향: ...
- 5. 본 저장소와의 연결: ...
- 6. 참고: ...
```

## 후속 작업

- 산출물이 충분히 구체적이면 `scripts/new-bridge.sh <slug>` 실행 후 산출물을
  새 다리 문서로 이전.
- maturity가 `speculative` 이상이면 후속 attempt에서 본 다리를 인용 가능.
