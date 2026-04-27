# attempts/ — 시도 인덱스

본 인덱스는 모든 attempt를 한곳에 모아 보여줍니다. 본 파일은
`scripts/build-data.py`와 `scripts/update-dashboard.py`에 의해 **자동 갱신
대상**입니다. 직접 손으로 갱신할 필요는 없습니다(자동 갱신이 우선).

<!-- ATTEMPTS:BEGIN -->

| 시도 ID | 문제 | 날짜 | 모델 | Outcome | Verification |
|---------|------|------|------|---------|--------------|
| _empty_ | _empty_ | _empty_ | _empty_ | _empty_ | _empty_ |

<!-- ATTEMPTS:END -->

---

## 새 시도 만들기

```bash
scripts/new-attempt.sh <problem-id> <model-name>
```

자세한 절차는 [`../AGENTS.md`](../AGENTS.md) §2 와 [`_TEMPLATE/`](_TEMPLATE/)을
참조하세요.

## 디렉토리 컨벤션

```
attempts/
  <problem-id>/
    A001-2026-04-27-claude-opus-4-7/
      meta.yaml
      prompt.md
      transcript.md     ← 머지 후 동결
      result.md
      artifacts/
```
