# Attacks — 적대적 검증 기록

본 파일은 후보 자신을 깨려는 시도(adversarial attempts)와 그 결과를 기록합니다.
실제 공격 기록은 `../adversarial/proof-attacks/PC-###/`에 보존되며, 본 파일은
요약을 제공합니다.

---

## 공격 라운드

| 라운드 | 일자 | 공격자(모델/사람) | 공격 종류 | 결과 |
|--------|------|-------------------|-----------|------|
| 1 | TODO | TODO | TODO | TODO |

## 공격 종류

- **가정 약화** — 사용된 가정을 약화시켜도 결론이 살아남는가?
- **반례 후보 탐색** — [`../../prompts/P06-counterexample.md`](../../prompts/P06-counterexample.md)
- **빈틈 자동 탐지** — [`../../prompts/P05-gap-finder.md`](../../prompts/P05-gap-finder.md)
- **적대적 리뷰** — [`../../prompts/P07-adversarial-review.md`](../../prompts/P07-adversarial-review.md)

## L4 통과 조건

- 의도된 공격 ≥3종이 모두 실패하거나 빈틈 회송으로 닫혔음.
- 마지막 라운드는 후보 작성자와 다른 모델·다른 세션의 에이전트가 수행.
