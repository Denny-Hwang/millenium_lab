# P05 — Gap Finder (빈틈 자동 탐지)

## 사용 시점

- 후보의 L1~L3 통과 직후, 외부 리뷰 송부 전.
- 또는 후보 작성자와 다른 모델·다른 세션에서 후보 본문을 읽고 빈틈을 사냥할 때.

## 입력 변수

- `${CANDIDATE_ID}` — 예: `PC-001`.
- `${MAIN_PROOF}` — `main-proof.md` 본문.
- `${LEMMAS}` — `lemmas/L##.md` 들의 본문 모음.
- `${CLAIM}` — `claim.md` 본문.
- `${STRATEGY}` — `strategy.md` 본문.

## 사전 읽기 파일

- `candidates/${CANDIDATE_ID}/` 전체
- `docs/methodology/verification-protocol.md`
- `docs/problems/<문제>/known-results.md`

## 프롬프트 본문

```
당신은 후보 ${CANDIDATE_ID}의 본문을 읽고 빈틈(gap)을 사냥하는 적대적
검토자입니다. 후보 작성자가 보지 못한 빈틈을 찾아내는 것이 임무입니다.

본문:
- claim: ${CLAIM}
- strategy: ${STRATEGY}
- main-proof: ${MAIN_PROOF}
- lemmas: ${LEMMAS}

규칙:
1. 다음 8가지 종류의 빈틈을 각각 검사하세요.
   a. 암묵 가정 — 본문에 명시되지 않았으나 결론에 본질적인 가정.
   b. 균일성 실패 — '충분히 큰 N에 대해' 같은 조건의 균일성.
   c. 차원/스케일 — 유한 차원 정리를 무한 차원에 적용.
   d. 정의역/공역 - 함수의 정의역이 닫혀 있지 않음.
   e. 측도 0 무시 — 측도 0 집합 위에서의 행동.
   f. 인용 정리 변형 — 인용된 외부 정리의 가정과 본문 가정의 불일치.
   g. 순환 논리 — 결론 또는 그 동치를 어디선가 사용.
   h. 예외 사례 — 이미 알려진 반례에 가까운 사례.
2. 각 빈틈에 대해:
   - 빈틈 ID (G001부터)
   - 위치 (파일·섹션·줄)
   - 종류 (위 8개 중)
   - 심각도 (minor/major/lethal)
   - 닫는 방법 후보 1~2개
3. 마지막에 이 후보를 외부 리뷰에 송부하기 전에 처리해야 할 빈틈 우선순위를
   3개로 압축.

산출물은 마크다운.
```

## 출력 형식 명세

```markdown
## 빈틈 목록

### G001 — {제목}
- 위치: ...
- 종류: ...
- 심각도: minor/major/lethal
- 닫는 방법: ...
(반복)

## 외부 리뷰 송부 전 우선순위
1. G0XX
2. G0XX
3. G0XX
```

## 후속 작업

- 산출물의 빈틈을 `candidates/${CANDIDATE_ID}/gaps.md`로 이전(중복 제거).
- lethal 빈틈이 발견되면 후보 status를 적대적 트랙으로 회송.
